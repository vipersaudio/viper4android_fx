
package com.vipercn.viper4android_v2.activity;

import android.util.Log;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;

class ShellCommand {

    private static Process sShellProcess;
    private static DataOutputStream sShellStdIn;
    private static DataInputStream sShellStdOut;
    private static DataInputStream sShellStdErr;

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

        Log.i("ViPER4Android_ShellCommand", "Shell closed");
    }


    public static int rootExecuteWithoutShell(String mExecutable) {
        if (mExecutable == null || mExecutable.equals("")) {
            return -65536;
        }

        Log.i("ViPER4Android_ShellCommand", "Root executing " + mExecutable + " ...");
        int exitValue = -65536;
        try {
            Process mProcess = Runtime.getRuntime().exec(new String[]{
                    "su", "-c", mExecutable
            });
            mProcess.waitFor();
            exitValue = mProcess.exitValue();
            mProcess.destroy();
        } catch (IOException e) {
            Log.i("ViPER4Android_ShellCommand", "IOException, msg = " + e.getMessage());
            return exitValue;
        } catch (InterruptedException e) {
            Log.i("ViPER4Android_ShellCommand", "InterruptedException, msg = " + e.getMessage());
            return exitValue;
        }
        Log.i("ViPER4Android_ShellCommand", "Program " + mExecutable + " returned " + exitValue);

        return exitValue;
    }

}
