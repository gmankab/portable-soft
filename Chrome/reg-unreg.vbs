'Registers Google Chrome Portable with Default Programs or Default Apps in Windows
'chromeportable.vbs - created on May 20, 2019 by Ramesh Srinivasan, Winhelponline.com
'v1.1 13-Jun-2019 - Enclosed file name parameter in double-quotes.
'v1.2 10-Sep-2020 - Fixed ApplicationIcon path. And added other supported URL protocols.

Option Explicit
Dim sAction, sAppPath, objFile, oFSO, sbaseKey, sbaseKey2
Dim WshShell : Set WshShell = CreateObject("WScript.Shell") 
Dim oFS0 : Set oFSO = CreateObject("Scripting.FileSystemObject")

Set objFile = oFSO.GetFile(WScript.ScriptFullName)
sAppPath = oFSO.GetParentFolderName(objFile)
sAppPath = sAppPath & "\Chrome.exe"

If Not oFSO.FileExists (sAppPath) Then WScript.Quit
If InStr(" ", sAppPath) = 0 Then sAppPath = """" & sAppPath & """"

If WScript.Arguments.Count > 0 Then
   If UCase(Trim(WScript.Arguments(0))) = "-REG" Then Call RegisterChromePortable(sAppPath)
   If UCase(Trim(WScript.Arguments(0))) = "-UNREG" Then Call UnregisterChromePortable(sAppPath)
Else
   sAction = InputBox("Type REGISTER to add Chrome Portable to Default Apps. Type UNREGISTER to remove.", "Chrome Portable Registration", "REGISTER")
   If UCase(Trim(sAction)) = "REGISTER" Then Call RegisterChromePortable(sAppPath)
   If UCase(Trim(sAction)) = "UNREGISTER" Then Call UnregisterChromePortable(sAppPath)
End If

Sub RegisterChromePortable(sAppPath)
   sbaseKey = "HKCU\Software\"
   sbaseKey2 = sbaseKey & "Clients\StartmenuInternet\Google Chrome Portable\"
   
   WshShell.RegWrite sbaseKey & "RegisteredApplications\Google Chrome Portable", "Software\Clients\StartMenuInternet\Google Chrome Portable\Capabilities", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\ChromeHTML2\", "Chrome HTML Document", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\ChromeHTML2\AppUserModelId", "Chrome Portable", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\ChromeHTML2\Application\AppUserModelId", "Chrome Portable", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\ChromeHTML2\Application\ApplicationIcon", sAppPath & ",0", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\ChromeHTML2\Application\ApplicationName", "Google Chrome Portable", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\ChromeHTML2\Application\ApplicationDescription", "Access the internet", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\ChromeHTML2\Application\ApplicationCompany", "Google Inc.", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\ChromeHTML2\DefaultIcon\", sAppPath & ",0", "REG_SZ"
   WshShell.RegWrite sbaseKey & "Classes\ChromeHTML2\shell\open\command\", sAppPath & " -- " & """" & "%1" & """", "REG_SZ"
   
   WshShell.RegWrite sbaseKey2, "Google Chrome Portable Edition", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\ApplicationDescription", "Google Chrome Portable Edition", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\ApplicationIcon", sAppPath & ",0", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\ApplicationName", "Google Chrome Portable Edition", "REG_SZ"   
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.htm", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.html", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.shtml", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.xht", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.xhtml", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\FileAssociations\.webp", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\ftp", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\http", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\https", "ChromeHTML2", "REG_SZ"   
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\irc", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\mailto", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\mms", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\news", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\nntp", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\sms", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\smsto", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\tel", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\url", "ChromeHTML2", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "Capabilities\URLAssociations\webcal", "ChromeHTML2", "REG_SZ"  
   WshShell.RegWrite sbaseKey2 & "DefaultIcon\", sAppPath & ",0", "REG_SZ"
   WshShell.RegWrite sbaseKey2 & "shell\open\command\", sAppPath, "REG_SZ"

   'Launch Default Apps after registering Chrome Portable   
   WshShell.Run "control /name Microsoft.DefaultPrograms /page pageDefaultProgram"  
End Sub


Sub UnregisterChromePortable(sAppPath)
   sbaseKey = "HKCU\Software\"
   sbaseKey2 = "HKCU\Software\Clients\StartmenuInternet\Google Chrome Portable"   

   On Error Resume Next
   WshShell.RegDelete sbaseKey & "RegisteredApplications\Google Chrome Portable"
   On Error GoTo 0
   
   WshShell.Run "reg.exe delete " & sbaseKey & "Classes\ChromeHTML2" & " /f", 0
   WshShell.Run "reg.exe delete " & chr(34) & sbaseKey2 & chr(34) & " /f", 0
   
   'Launch Default Apps after unregistering Chrome Portable   
   WshShell.Run "control /name Microsoft.DefaultPrograms /page pageDefaultProgram"   
End Sub