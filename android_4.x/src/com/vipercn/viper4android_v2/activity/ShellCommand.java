
package com.vipercn.viper4android_v2.activity;

import android.util.Log;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

class ShellCommand {

    private static Process sShellProcess = null;
    private static DataOutputStream sShellStdIn = null;
    private static DataInputStream sShellStdOut = null;
    private static DataInputStream sShellStdErr = null;
    private static boolean sShellOpened = false;

    private static String byteToString(byte[] baByteArray) {
        if (baByteArray == null)
            return null;
        try {
            String szResult = new String(baByteArray, "ASCII");
            szResult = String.copyValueOf(szResult.toCharArray(), 0, baByteArray.length);
            return szResult;
        } catch (UnsupportedEncodingException e) {
            return null;
        }
    }

    private static String[] byteArrayToStringArray(byte[] baByteArray, int nDataLength) {
        if (baByteArray == null)
            return null;
        if (nDataLength <= 0)
            return null;
        if (nDataLength > baByteArray.length)
            return null;

        // Replace all invisible chars to '.'
        for (int i = 0; i < nDataLength; i++) {
            if ((baByteArray[i] == 0x0D) || (baByteArray[i] == 0x0A)) {
                baByteArray[i] = 0;
                continue;
            }
            if (baByteArray[i] < 0x20) {
                baByteArray[i] = 0x2E;
            }
            if (baByteArray[i] > 0x7E) {
                baByteArray[i] = 0x2E;
            }
        }

        // Split and convert to string
        List<String> lstString = new ArrayList<String>();
        for (int i = 0; i < nDataLength; i++) {
            if (baByteArray[i] == 0) {
                continue;
            }
            int nBlockLength = -1;
            for (int j = i + 1; j < nDataLength; j++) {
                if (baByteArray[j] == 0) {
                    nBlockLength = j - i;
                    break;
                }
            }
            if (nBlockLength == -1) {
                nBlockLength = nDataLength - i;
            }
            byte[] baBlockData = new byte[nBlockLength];
            System.arraycopy(baByteArray, i, baBlockData, 0, nBlockLength);
            lstString.add(byteToString(baBlockData));
            i += nBlockLength;
        }

        if (lstString.size() <= 0) {
            return null;
        }
        String[] szResult = new String[lstString.size()];
        lstString.toArray(szResult);
        return szResult;
    }

    private static String[] getStdOut() {
        if (sShellStdOut == null)
            return null;
        try {
            if (sShellStdOut.available() <= 0)
                return null;
        } catch (IOException ioe) {
            return null;
        }

        byte[] baDataOut = null;
        int nDataLength = 0;
        try {
            while (sShellStdOut.available() > 0) {
                byte[] baData = new byte[1024];
                int nReadCount = sShellStdOut.read(baData);
                if (nReadCount == -1)
                    break;
                // Realloc
                {
                    int nCurrentSize = 0;
                    if (baDataOut != null) {
                        nCurrentSize = baDataOut.length;
                    }
                    byte[] baNewDataOut = new byte[nCurrentSize + nReadCount];
                    if (baDataOut != null) {
                        System.arraycopy(baDataOut, 0, baNewDataOut, 0, nCurrentSize);
                    }
                    System.arraycopy(baData, 0, baNewDataOut, nCurrentSize, nReadCount);
                    baDataOut = baNewDataOut;
                    nDataLength += nReadCount;
                }
            }
        } catch (IOException ioe) {
            Log.i("ViPER4Android_ShellCommand", "IOException, msg = " + ioe.getMessage());
        }
        Log.i("ViPER4Android_ShellCommand", "Standard output read " + nDataLength + " bytes");

        return byteArrayToStringArray(baDataOut, nDataLength);
    }

    private static String[] getStdErr() {
        if (sShellStdErr == null)
            return null;
        try {
            if (sShellStdErr.available() <= 0)
                return null;
        } catch (IOException ioe) {
            return null;
        }

        byte[] baDataOut = null;
        int nDataLength = 0;
        try {
            while (sShellStdErr.available() > 0) {
                byte[] baData = new byte[1024];
                int nReadCount = sShellStdErr.read(baData);
                if (nReadCount == -1)
                    break;
                // Realloc
                {
                    int nCurrentSize = 0;
                    if (baDataOut != null) {
                        nCurrentSize = baDataOut.length;
                    }
                    byte[] baNewDataOut = new byte[nCurrentSize + nReadCount];
                    if (baDataOut != null) {
                        System.arraycopy(baDataOut, 0, baNewDataOut, 0, nCurrentSize);
                    }
                    System.arraycopy(baData, 0, baNewDataOut, nCurrentSize, nReadCount);
                    baDataOut = baNewDataOut;
                    nDataLength += nReadCount;
                }
            }
        } catch (IOException ioe) {
            Log.i("ViPER4Android_ShellCommand", "IOException, msg = " + ioe.getMessage());
        }
        Log.i("ViPER4Android_ShellCommand", "Standard error read " + nDataLength + " bytes");

        return byteArrayToStringArray(baDataOut, nDataLength);
    }

    private static void clearStdOutAndErr() {
        if (sShellStdOut != null) {
            Log.i("ViPER4Android_ShellCommand", "Flushing standard output ...");
            try {
                while (sShellStdOut.available() > 0) {
                    if (sShellStdOut.read() == -1)
                        break;
                }
            } catch (IOException e) {
            }
        }
        if (sShellStdErr != null) {
            Log.i("ViPER4Android_ShellCommand", "Flushing standard error ...");
            try {
                while (sShellStdErr.available() > 0) {
                    if (sShellStdErr.read() == -1)
                        break;
                }
            } catch (IOException e) {
            }
        }
    }

    public static void closeShell() {
        if (sShellStdIn != null) {
            Log.i("ViPER4Android_ShellCommand", "Closing shell stdandard input");
            try {
                sShellStdIn.writeBytes("exit\n");
                sShellStdIn.flush();
                sShellStdIn.close();
            } catch (IOException ioe) {
                Log.i("ViPER4Android_ShellCommand", "Close shell stdandard input failed, msg = "
                        + ioe.getMessage());
            }
            sShellStdIn = null;
        }
        clearStdOutAndErr();
        if (sShellStdOut != null) {
            Log.i("ViPER4Android_ShellCommand", "Closing shell stdandard output");
            try {
                sShellStdOut.close();
            } catch (IOException ioe) {
                Log.i("ViPER4Android_ShellCommand", "Close shell stdandard output failed,"
                        + "msg = " + ioe.getMessage());
            }
            sShellStdOut = null;
        }
        if (sShellStdErr != null) {
            Log.i("ViPER4Android_ShellCommand", "Closing shell stdandard error");
            try {
                sShellStdErr.close();
            } catch (IOException ioe) {
                Log.i("ViPER4Android_ShellCommand", "Close shell stdandard error failed, msg = "
                        + ioe.getMessage());
            }
            sShellStdErr = null;
        }
        if (sShellProcess != null) {
            try {
                Log.i("ViPER4Android_ShellCommand", "Waiting for shell exit");
                sShellProcess.waitFor();
            } catch (InterruptedException ie) {
                Log.i("ViPER4Android_ShellCommand", "Wait for shell exit failed, msg = " + ie.getMessage());
            }
            Log.i("ViPER4Android_ShellCommand", "Closing shell");
            sShellProcess.destroy();
            sShellProcess = null;
        }

        sShellOpened = false;
        Log.i("ViPER4Android_ShellCommand", "Shell closed");
    }


    public static int rootExecuteWithoutShell(String szExecutable) {
        if (szExecutable == null || szExecutable.equals("")) {
            return -65536;
        }

        Log.i("ViPER4Android_ShellCommand", "Root executing " + szExecutable + " ...");
        int nExitValue = -65536;
        try {
            Process psProg = Runtime.getRuntime().exec(new String[]{
                    "su", "-c", szExecutable
            });
            psProg.waitFor();
            nExitValue = psProg.exitValue();
            psProg.destroy();
        } catch (IOException e) {
            Log.i("ViPER4Android_ShellCommand", "IOException, msg = " + e.getMessage());
            return nExitValue;
        } catch (InterruptedException e) {
            Log.i("ViPER4Android_ShellCommand", "InterruptedException, msg = " + e.getMessage());
            return nExitValue;
        }
        Log.i("ViPER4Android_ShellCommand", "Program " + szExecutable + " returned " + nExitValue);

        return nExitValue;
    }

}
