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

public class ShellCommand
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

		// Replace all unvisiable chars to '.'
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

	public static boolean OpenSysShell(boolean bReopen)
	{
		Log.i("ViPER4Android_ShellCommand", "Open shell, reopen = " + bReopen);

		if (m_bShellOpened && !bReopen)
		{
			Log.i("ViPER4Android_ShellCommand", "Shell already opened");
			return true;
		}
		else if (m_bShellOpened && bReopen)
		{
			Log.i("ViPER4Android_ShellCommand", "Close current shell");
			CloseShell();
		}

		try
		{
			Log.i("ViPER4Android_ShellCommand", "Starting system shell");
			m_psShellProcess = Runtime.getRuntime().exec("sh");  /* Maybe we should parse init.rc to find out the $PATH */
		}
		catch (IOException ioe)
		{
			Log.i("ViPER4Android_ShellCommand", "Start system shell failed, msg = " + ioe.getMessage());
			m_psShellProcess = null;
			m_doShellStdIn = null;
			m_diShellStdOut = null;
			m_diShellStdErr = null;
			m_bShellOpened = false;
			return false;
		}

		Log.i("ViPER4Android_ShellCommand", "Fetching shell stdin, stdout and stderr");
		m_doShellStdIn = new DataOutputStream(m_psShellProcess.getOutputStream());
		m_diShellStdOut = new DataInputStream(m_psShellProcess.getInputStream());
		m_diShellStdErr = new DataInputStream(m_psShellProcess.getErrorStream());
		try
		{
			Log.i("ViPER4Android_ShellCommand", "Performing shell banner and query id, timeout = 20 secs");
			m_doShellStdIn.writeBytes("echo \"Enter ViPER's System Shell\"\n");
			m_doShellStdIn.writeBytes("id\n");
			m_doShellStdIn.flush();

			boolean bGotResult = false;
			for (int nWaitCount = 0; nWaitCount < 200; nWaitCount++)
			{
				String[] szStdOut = GetStdOut();
				if (szStdOut != null) bGotResult = true;
				String[] szStdErr = GetStdErr();
				if (szStdErr != null) bGotResult = true;
				if (bGotResult)
				{
					if (szStdOut != null)
						for (int i = 0; i < szStdOut.length; i++)
							Log.i("ViPER4Android_ShellCommand", "stdout: " + szStdOut[i]);
					if (szStdErr != null)
						for (int i = 0; i < szStdErr.length; i++)
							Log.i("ViPER4Android_ShellCommand", "stderr: " + szStdErr[i]);
					break;
				}

				SystemClock.sleep(100);
				Log.i("ViPER4Android_ShellCommand", ((nWaitCount + 1) * 100) + " ms waited, still no result");
			}

			if (!bGotResult)
			{
				Log.i("ViPER4Android_ShellCommand", "Wait system shell timeout");
				CloseShell();
				return false;
			}
		}
		catch (IOException ioe)
		{
			Log.i("ViPER4Android_ShellCommand", "IOException, msg = " + ioe.getMessage());
			CloseShell();
			return false;
		}

		ClearStdOutAndErr();
		m_bShellOpened = true;

		return true;
	}

	public static boolean OpenRootShell(boolean bReopen)
	{
		Log.i("ViPER4Android_ShellCommand", "Open shell, reopen = " + bReopen);

		if (m_bShellOpened && !bReopen)
		{
			Log.i("ViPER4Android_ShellCommand", "Shell already opened");
			return true;
		}
		else if (m_bShellOpened && bReopen)
		{
			Log.i("ViPER4Android_ShellCommand", "Close current shell");
			CloseShell();
		}

		try
		{
			Log.i("ViPER4Android_ShellCommand", "Starting su shell");
			m_psShellProcess = Runtime.getRuntime().exec("su");  /* Maybe we should parse init.rc to find out the $PATH */
		}
		catch (IOException ioe)
		{
			Log.i("ViPER4Android_ShellCommand", "Start su shell failed, msg = " + ioe.getMessage());
			m_psShellProcess = null;
			m_doShellStdIn = null;
			m_diShellStdOut = null;
			m_diShellStdErr = null;
			m_bShellOpened = false;
			return false;
		}

		Log.i("ViPER4Android_ShellCommand", "Fetching shell stdin, stdout and stderr");
		m_doShellStdIn = new DataOutputStream(m_psShellProcess.getOutputStream());
		m_diShellStdOut = new DataInputStream(m_psShellProcess.getInputStream());
		m_diShellStdErr = new DataInputStream(m_psShellProcess.getErrorStream());
		try
		{
			Log.i("ViPER4Android_ShellCommand", "Performing shell banner and query id, timeout = 20 secs");
			m_doShellStdIn.writeBytes("echo \"Enter ViPER's Root Shell\"\n");
			m_doShellStdIn.writeBytes("id\n");
			m_doShellStdIn.flush();

			boolean bGotResult = false, bAccessGiven = false;
			for (int nWaitCount = 0; nWaitCount < 200; nWaitCount++)
			{
				String[] szStdOut = GetStdOut();
				if (szStdOut != null)
				{
					for (int i = 0; i < szStdOut.length; i++)
					{
						Log.i("ViPER4Android_ShellCommand", "stdout: " + szStdOut[i]);
						if (szStdOut[i].contains("uid"))
						{
							Log.i("ViPER4Android_ShellCommand", "Got result");
							if (szStdOut[i].contains("uid=0"))
							{
								bGotResult = true;
								bAccessGiven = true;
								break;
							}
							else
							{
								bGotResult = true;
								bAccessGiven = false;
								break;
							}
						}
					}
				}
				String[] szStdErr = GetStdErr();
				if (szStdErr != null)
				{
					for (int i = 0; i < szStdErr.length; i++)
					{
						Log.i("ViPER4Android_ShellCommand", "stderr: " + szStdErr[i]);
						if (szStdErr[i].contains("uid"))
						{
							Log.i("ViPER4Android_ShellCommand", "Got result");
							if (szStdErr[i].contains("uid=0"))
							{
								bGotResult = true;
								bAccessGiven = true;
								break;
							}
							else
							{
								bGotResult = true;
								bAccessGiven = false;
								break;
							}
						}
					}
				}
				if (bGotResult) break;

				SystemClock.sleep(100);
				Log.i("ViPER4Android_ShellCommand", ((nWaitCount + 1) * 100) + " ms waited, still no result");
			}

			if (bGotResult && !bAccessGiven)
			{
				Log.i("ViPER4Android_ShellCommand", "Acquire root permission failed");
				CloseShell();
				return false;
			}
			if (!bGotResult)
			{
				Log.i("ViPER4Android_ShellCommand", "Acquire root permission timeout");
				CloseShell();
				return false;
			}
		}
		catch (IOException ioe)
		{
			Log.i("ViPER4Android_ShellCommand", "IOException, msg = " + ioe.getMessage());
			CloseShell();
			return false;
		}

		ClearStdOutAndErr();
		m_bShellOpened = true;

		return true;
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

	public static boolean SendShellCommand(String szCommand, float nMaxWaitSeconds)
	{
		Log.i("ViPER4Android_ShellCommand", "Sending shell \"" + szCommand + "\", wait " + nMaxWaitSeconds + " seconds");

		if (!m_bShellOpened) return false;
		if (m_doShellStdIn == null) return false;
		if (m_diShellStdOut == null) return false;
		if (m_diShellStdErr == null) return false;

		ClearStdOutAndErr();
		try
		{
			int nOldCount = 0;
			try { nOldCount = m_diShellStdOut.available() + m_diShellStdErr.available(); }
			catch (IOException ioe) { nOldCount = 0; }
			m_doShellStdIn.writeBytes(szCommand + "\n");
			m_doShellStdIn.flush();
			for (int nWaitCount = 0; nWaitCount <= Math.round(nMaxWaitSeconds * 10); nWaitCount++)
			{
				int nCurrCount = 0;
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

		String[] szStdOut = GetStdOut();
		if (szStdOut != null)
		{
			for (int i = 0; i < szStdOut.length; i++)
				Log.i("ViPER4Android_ShellCommand(stdout)", szStdOut[i]);
		}
		String[] szStdErr = GetStdErr();
		if (szStdErr != null)
		{
			for (int i = 0; i < szStdErr.length; i++)
				Log.i("ViPER4Android_ShellCommand(stderr)", szStdErr[i]);
		}

		return true;
	}

	public static boolean SendShellCommandPreserveOut(String szCommand, float nMaxWaitSeconds)
	{
		Log.i("ViPER4Android_ShellCommand", "Sending shell \"" + szCommand + "\", wait " + nMaxWaitSeconds + " seconds");

		if (!m_bShellOpened) return false;
		if (m_doShellStdIn == null) return false;
		if (m_diShellStdOut == null) return false;
		if (m_diShellStdErr == null) return false;

		ClearStdOutAndErr();
		try
		{
			int nOldCount = 0;
			try { nOldCount = m_diShellStdOut.available() + m_diShellStdErr.available(); }
			catch (IOException ioe) { nOldCount = 0; }
			m_doShellStdIn.writeBytes(szCommand + "\n");
			m_doShellStdIn.flush();
			for (int nWaitCount = 0; nWaitCount <= Math.round(nMaxWaitSeconds * 10); nWaitCount++)
			{
				int nCurrCount = 0;
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

	public static int GetLastReturnValue()
	{
		ClearStdOutAndErr();
		/* Lets print the last command's exit value to stdout */
		if (!SendShellCommandPreserveOut("echo $?", 1.0f)) return -65536;
		String[] szStdOut = GetStdOut();
		if (szStdOut != null)
		{
			int nRetValue = -65536;
			for (int i = 0; i < szStdOut.length; i++)
			{
				try { nRetValue = Integer.parseInt(szStdOut[i].trim()); }
				catch (NumberFormatException nfe) { continue; }
			}
			return nRetValue;
		}
		else return -65536;
	}

	public static int ExecuteWithoutShell(String szExecutable, File fDirectory)
	{
		if (szExecutable == null) return -65536;
		if (szExecutable.equals("")) return -65536;

		Log.i("ViPER4Android_ShellCommand", "Executing " + szExecutable + " ...");
		int nExitValue = -65536;
		try
		{
			Process psProg = Runtime.getRuntime().exec(szExecutable, null, fDirectory);
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

	public static int RootExecuteWithoutShell(String szExecutable, File fDirectory)
	{
		if (szExecutable == null) return -65536;
		if (szExecutable.equals("")) return -65536;

		Log.i("ViPER4Android_ShellCommand", "Root executing " + szExecutable + " ...");
		int nExitValue = -65536;
		try
		{
			Process psProg = Runtime.getRuntime().exec(new String[] {"su", "-c", szExecutable}, null, fDirectory);
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
