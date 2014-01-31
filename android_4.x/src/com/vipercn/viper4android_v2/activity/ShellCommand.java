package com.vipercn.viper4android_v2.activity;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import android.os.SystemClock;
import android.util.Log;

class ShellCommand
{
	private static Process m_psShellProcess = null;
	private static DataOutputStream m_doShellStdIn = null;
	private static DataInputStream m_diShellStdOut = null;
	private static DataInputStream m_diShellStdErr = null;
	private static boolean m_bShellOpened = false;

	private static String ByteToString(byte[] baByteArray)
	{
		if (baByteArray == null) return null;
		try
		{
			String szResult = new String(baByteArray, "ASCII");
			szResult = String.copyValueOf(szResult.toCharArray(), 0, baByteArray.length);
			return szResult;
		}
		catch (UnsupportedEncodingException e)
		{
			return null;
		}
	}

	private static String[] ByteArrayToStringArray(byte[] baByteArray, int nDataLength)
	{
		if (baByteArray == null) return null;
		if (nDataLength <= 0) return null;
		if (nDataLength > baByteArray.length) return null;

		// Replace all unvisible chars to '.'
		for (int i = 0; i < nDataLength; i++)
		{
			if ((baByteArray[i] == 0x0D) || (baByteArray[i] == 0x0A))
			{
				baByteArray[i] = 0;
				continue;
			}
			if (baByteArray[i] < 0x20) baByteArray[i] = 0x2E;
			if (baByteArray[i] > 0x7E) baByteArray[i] = 0x2E;
		}

		// Split and convert to string
		List<String> lstString = new ArrayList<String>();
		for (int i = 0; i < nDataLength; i++)
		{
			if (baByteArray[i] == 0) continue;
			int nBlockLength = -1;
			for (int j = i + 1; j < nDataLength; j++)
			{
				if (baByteArray[j] == 0)
				{
					nBlockLength = j - i;
					break;
				}
			}
			if (nBlockLength == -1) nBlockLength = nDataLength - i;
			byte[] baBlockData = new byte[nBlockLength];
			System.arraycopy(baByteArray, i, baBlockData, 0, nBlockLength);
			lstString.add(ByteToString(baBlockData));
			i += nBlockLength;
		}

		if (lstString.size() <= 0) return null;
		String[] szResult = new String[lstString.size()];
		lstString.toArray(szResult);
		return szResult;
	}

	private static String[] GetStdOut()
	{
		if (m_diShellStdOut == null) return null;
		try { if (m_diShellStdOut.available() <= 0) return null; }
		catch (IOException ioe) { return null; }

		byte[] baDataOut = null;
		int nDataLength = 0;
		try
		{
			while (m_diShellStdOut.available() > 0)
			{
				byte[] baData = new byte[1024];
				int nReadCount = m_diShellStdOut.read(baData);
				if (nReadCount == -1) break;
				// Realloc
				{
					int nCurrentSize = 0;
					if (baDataOut != null) nCurrentSize = baDataOut.length;
					byte[] baNewDataOut = new byte[nCurrentSize + nReadCount];
					if (baDataOut != null)
						System.arraycopy(baDataOut, 0, baNewDataOut, 0, nCurrentSize);
					System.arraycopy(baData, 0, baNewDataOut, nCurrentSize, nReadCount);
					baDataOut = baNewDataOut;
					nDataLength += nReadCount;
				}
			}
		}
		catch (IOException ioe) { Log.i("ViPER4Android_ShellCommand", "IOException, msg = " + ioe.getMessage()); }
		Log.i("ViPER4Android_ShellCommand", "Standard output read " + nDataLength + " bytes");

		return ByteArrayToStringArray(baDataOut, nDataLength);
	}

	private static String[] GetStdErr()
	{
		if (m_diShellStdErr == null) return null;
		try { if (m_diShellStdErr.available() <= 0) return null; }
		catch (IOException ioe) { return null; }

		byte[] baDataOut = null;
		int nDataLength = 0;
		try
		{
			while (m_diShellStdErr.available() > 0)
			{
				byte[] baData = new byte[1024];
				int nReadCount = m_diShellStdErr.read(baData);
				if (nReadCount == -1) break;
				// Realloc
				{
					int nCurrentSize = 0;
					if (baDataOut != null) nCurrentSize = baDataOut.length;
					byte[] baNewDataOut = new byte[nCurrentSize + nReadCount];
					if (baDataOut != null)
						System.arraycopy(baDataOut, 0, baNewDataOut, 0, nCurrentSize);
					System.arraycopy(baData, 0, baNewDataOut, nCurrentSize, nReadCount);
					baDataOut = baNewDataOut;
					nDataLength += nReadCount;
				}
			}
		}
		catch (IOException ioe) { Log.i("ViPER4Android_ShellCommand", "IOException, msg = " + ioe.getMessage()); }
		Log.i("ViPER4Android_ShellCommand", "Standard error read " + nDataLength + " bytes");

		return ByteArrayToStringArray(baDataOut, nDataLength);
	}

	private static void ClearStdOutAndErr()
	{
		if (m_diShellStdOut != null)
		{
			Log.i("ViPER4Android_ShellCommand", "Flushing standard output ...");
			try
			{
				while (m_diShellStdOut.available() > 0)
				{
					if (m_diShellStdOut.read() == -1)
						break;
				}
			}
			catch (IOException e) {}
		}
		if (m_diShellStdErr != null)
		{
			Log.i("ViPER4Android_ShellCommand", "Flushing standard error ...");
			try
			{
				while (m_diShellStdErr.available() > 0)
				{
					if (m_diShellStdErr.read() == -1)
						break;
				}
			}
			catch (IOException e) {}
		}
	}

	public static void CloseShell()
	{
		if (m_doShellStdIn != null)
		{
			Log.i("ViPER4Android_ShellCommand", "Closing shell stdandard input");
			try
			{
				m_doShellStdIn.writeBytes("exit\n");
				m_doShellStdIn.flush();
				m_doShellStdIn.close();
			}
			catch (IOException ioe) { Log.i("ViPER4Android_ShellCommand", "Close shell stdandard input failed, msg = " + ioe.getMessage()); }
			m_doShellStdIn = null;
		}
		ClearStdOutAndErr();
		if (m_diShellStdOut != null)
		{
			Log.i("ViPER4Android_ShellCommand", "Closing shell stdandard output");
			try { m_diShellStdOut.close(); }
			catch (IOException ioe) { Log.i("ViPER4Android_ShellCommand", "Close shell stdandard output failed, msg = " + ioe.getMessage()); }
			m_diShellStdOut = null;
		}
		if (m_diShellStdErr != null)
		{
			Log.i("ViPER4Android_ShellCommand", "Closing shell stdandard error");
			try { m_diShellStdErr.close(); }
			catch (IOException ioe) { Log.i("ViPER4Android_ShellCommand", "Close shell stdandard error failed, msg = " + ioe.getMessage()); }
			m_diShellStdErr = null;
		}
		if (m_psShellProcess != null)
		{
			try
			{
				Log.i("ViPER4Android_ShellCommand", "Waiting for shell exit");
				m_psShellProcess.waitFor();
			}
			catch (InterruptedException ie)
			{ Log.i("ViPER4Android_ShellCommand", "Wait for shell exit failed, msg = " + ie.getMessage()); }
			Log.i("ViPER4Android_ShellCommand", "Closing shell");
			m_psShellProcess.destroy();
			m_psShellProcess = null;
		}

		m_bShellOpened = false;
		Log.i("ViPER4Android_ShellCommand", "Shell closed");
	}

	private static boolean SendShellCommandPreserveOut(String szCommand, float nMaxWaitSeconds)
	{
		Log.i("ViPER4Android_ShellCommand", "Sending shell \"" + szCommand + "\", wait " + nMaxWaitSeconds + " seconds");

		if (!m_bShellOpened) return false;
		if (m_doShellStdIn == null) return false;
		if (m_diShellStdOut == null) return false;
		if (m_diShellStdErr == null) return false;

		ClearStdOutAndErr();
		try
		{
			int nOldCount;
			try { nOldCount = m_diShellStdOut.available() + m_diShellStdErr.available(); }
			catch (IOException ioe) { nOldCount = 0; }
			m_doShellStdIn.writeBytes(szCommand + "\n");
			m_doShellStdIn.flush();
			for (int nWaitCount = 0; nWaitCount <= Math.round(nMaxWaitSeconds * 10); nWaitCount++)
			{
				int nCurrCount;
				try { nCurrCount = m_diShellStdOut.available() + m_diShellStdErr.available(); }
				catch (IOException ioe) { nCurrCount = 0; }
				Log.i("ViPER4Android_ShellCommand", "Waiting for command return, idx = " + nWaitCount + ", old = " + nOldCount + ", curr = " + nCurrCount);
				if (nCurrCount != nOldCount)
				{
					Log.i("ViPER4Android_ShellCommand", "Command returned");
					break;
				}
				SystemClock.sleep(100);
			}
		}
		catch (IOException ioe)
		{
			Log.i("ViPER4Android_ShellCommand", "Send shell failed, msg = " + ioe.getMessage());
			return false;
		}

		return true;
	}

    public static int RootExecuteWithoutShell(String szExecutable)
    {
        if (szExecutable == null || szExecutable.equals("")) return -65536;

        Log.i("ViPER4Android_ShellCommand", "Root executing " + szExecutable + " ...");
        int nExitValue = -65536;
        try
        {
            Process psProg = Runtime.getRuntime().exec(new String[] {"su", "-c", szExecutable});
            psProg.waitFor();
            nExitValue = psProg.exitValue();
            psProg.destroy();
        }
        catch (IOException e)
        {
            Log.i("ViPER4Android_ShellCommand", "IOException, msg = " + e.getMessage());
            return nExitValue;
        }
        catch (InterruptedException e)
        {
            Log.i("ViPER4Android_ShellCommand", "InterruptedException, msg = " + e.getMessage());
            return nExitValue;
        }
        Log.i("ViPER4Android_ShellCommand", "Program " + szExecutable + " returned " + nExitValue);

        return nExitValue;
    }

}
