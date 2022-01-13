Option Explicit

Dim objWshShell
Dim strPath

Set objWshShell = WScript.CreateObject("WScript.Shell")

With WScript.CreateObject("Scripting.FileSystemObject")
	strPath = WScript.CreateObject("WScript.Shell").ExpandEnvironmentStrings("Data\roaming\xregistry.bin")
	
	If .FileExists(strPath) Then
		.DeleteFile strPath, True
	End If
End With

objWshShell.Run "SmoothScroll.exe"