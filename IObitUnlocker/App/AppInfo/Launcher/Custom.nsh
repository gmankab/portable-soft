!define UPDATE   `${APPDIR}\update.ini`
!define 32       `${APPDIR}\32`
!define 64       `${APPDIR}\64`
!define INI      `${SET}\Main.ini`
!define DEFINI   `${DEFDATA}\settings\Main.ini`
!define IOBit    `${SET}\IObitUnlocker.ini`
!define DEFIOBit `${DEFDATA}\settings\IObitUnlocker.ini`
!define REGSVR   `$SYSDIR\regsvr32.exe`
!define SC       `$SYSDIR\sc.exe`
!define CLSID    `SOFTWARE\Classes\CLSID\{410BF280-86EF-4E0F-8279-EC5848546AD3}\InprocServer32`
!define DLL      `${APPDIR}\IObitUnlockerExtension.dll`
!define 32DLL    `${32}\IObitUnlockerExtension,1.dll`
!define 64DLL    `${64}\IObitUnlockerExtension,2.dll`
!define LOCALSYS `$SYSDIR\IObitUnlocker.sys`
!define SYS      `${APPDIR}\IObitUnlocker.sys`
!define SYS1     `${32}\IObitUnlocker,1.sys`
!define SYS2     `${32}\IObitUnlocker,2.sys`
!define SYS3     `${32}\IObitUnlocker,3.sys`
!define SYS4     `${32}\IObitUnlocker,4.sys`
!define SYS5     `${64}\IObitUnlocker,5.sys`
!define SYS6     `${64}\IObitUnlocker,6.sys`
!define SYS7     `${64}\IObitUnlocker,7.sys`
!define CALL0    `kernel32::Wow64EnableWow64FsRedirection(i0)`
!define CALL1    `Kernel32::SetEnvironmentVariable(t, t) i("PortableApps.comLocaleID", "$0").r0`
!define CALL2    `Kernel32::SetEnvironmentVariable(t, t) i("PAL:LanguageCustom", "$0").r0`
!define CALL3    `"${SC}" create IObitUnlocker binpath= "${LOCALSYS}" type= kernel start= demand`
!define CALL4    `"${SC}" description IObitUnlocker "File driver for IObitUnlocker"`
!define CALL5    `"${SC}" start IObitUnlocker`
!define CALL6    `"${SC}" stop IObitUnlocker`
!define CALL7    `"${SC}" delete IObitUnlocker`
!define CALL8    `Shell32::SHChangeNotify(i ${SHCNE_ASSOCCHANGED}, i ${SHCNF_IDLIST}, i 0, i 0)`
!define CALL9    `Ole32::CoFreeUnusedLibraries()`
!define CALL10   `"${REGSVR}" /u /s "$0"`
!define CALL11   `"${REGSVR}" /s "${DLL}"`
!define CALL12   `"${REGSVR}" /u /s "${DLL}"`
!define CALL13   `"${REGSVR}" /s "$0"`
!define CALL14   `"${SC}" create IObitUnlocker binpath= "$0" type= kernel start= demand`

!ifndef SHCNE_ASSOCCHANGED
	!define SHCNE_ASSOCCHANGED 0x08000000
!endif
!ifndef SHCNF_IDLIST
	!define SHCNF_IDLIST 0x0000
!endif

Function _GetLCID
	!macro GetLCID _VAL _RETURN
		Push ${_VAL}
		Call _GetLCID
		Pop ${_RETURN}
	!macroend
	!define GetLCID `!insertmacro GetLCID`
	Exch $0
	StrCmp $0 Arabic 0 +3
	StrCpy $0 1025
		Goto EndLCID
	StrCmp $0 Czech 0 +3
	StrCpy $0 1029
		Goto EndLCID
	StrCmp $0 Danish 0 +3
	StrCpy $0 1030
		Goto EndLCID
	StrCmp $0 Dutch 0 +3
	StrCpy $0 1043
		Goto EndLCID
	StrCmp $0 English 0 +3
	StrCpy $0 1033
		Goto EndLCID
	StrCmp $0 Finnish 0 +3
	StrCpy $0 1035
		Goto EndLCID
	StrCmp $0 German 0 +3
	StrCpy $0 1031
		Goto EndLCID
	StrCmp $0 Hungarian 0 +3
	StrCpy $0 1038
		Goto EndLCID
	StrCmp $0 Italian 0 +3
	StrCpy $0 1040
		Goto EndLCID
	StrCmp $0 Japanese 0 +3
	StrCpy $0 1041
		Goto EndLCID
	StrCmp $0 Polish 0 +3
	StrCpy $0 1045
		Goto EndLCID
	StrCmp $0 Russian 0 +3
	StrCpy $0 1049
		Goto EndLCID
	StrCmp $0 ChineseSimp 0 +3
	StrCpy $0 2052
		Goto EndLCID
	StrCmp $0 Spanish 0 +3
	StrCpy $0 1034
		Goto EndLCID
	StrCmp $0 Swedish 0 +3
	StrCpy $0 1053
		Goto EndLCID
	StrCmp $0 ChineseTrad 0 +3
	StrCpy $0 1028
		Goto EndLCID
	StrCmp $0 Turkish 0 +3
	StrCpy $0 1055
		Goto +2
	StrCpy $0 1033
	EndLCID:
	Exch $0
FunctionEnd
Function _GetLNG
	!macro GetLNG _VAL _RETURN
		Push ${_VAL}
		Call _GetLNG
		Pop ${_RETURN}
	!macroend
	!define GetLNG `!insertmacro GetLNG`
	Exch $0
	${IfThen} $0 = 1025 ${|} StrCpy $0 Arabic ${|}
	${IfThen} $0 = 1029 ${|} StrCpy $0 Czech ${|}
	${IfThen} $0 = 1030 ${|} StrCpy $0 Danish ${|}
	${IfThen} $0 = 1043 ${|} StrCpy $0 Dutch ${|}
	${IfThen} $0 = 1033 ${|} StrCpy $0 English ${|}
	${IfThen} $0 = 1035 ${|} StrCpy $0 Finnish ${|}
	${IfThen} $0 = 1031 ${|} StrCpy $0 German ${|}
	${IfThen} $0 = 1038 ${|} StrCpy $0 Hungarian ${|}
	${IfThen} $0 = 1040 ${|} StrCpy $0 Italian ${|}
	${IfThen} $0 = 1041 ${|} StrCpy $0 Japanese ${|}
	${IfThen} $0 = 1045 ${|} StrCpy $0 Polish ${|}
	${IfThen} $0 = 1049 ${|} StrCpy $0 Russian ${|}
	${IfThen} $0 = 2052 ${|} StrCpy $0 ChineseSimp ${|}
	${IfThen} $0 = 1034 ${|} StrCpy $0 Spanish ${|}
	${IfThen} $0 = 1053 ${|} StrCpy $0 Swedish ${|}
	${IfThen} $0 = 1028 ${|} StrCpy $0 ChineseTrad ${|}
	${IfThen} $0 = 1055 ${|} StrCpy $0 Turkish ${|}
	Exch $0
FunctionEnd
Function _CloseWindow
	!macro CloseWindow _CLASS _TITLE
		Push `${_TITLE}`
		Push `${_CLASS}`
		Call _CloseWindow
	!macroend
	!define CloseWindow `!insertmacro CloseWindow`
	Exch $0
	Exch
	Exch $1
	Push $2
	Find:
	FindWindow $2 `$0` `$1`
	IntCmp $2 0 END 0 0
	IsWindow $2 0 END
	System::Call `user32::PostMessage(i,i,i,i) i($2,0x0010,0,0)`
	Sleep 100
	Goto Find
	END:
	Pop $2
	Pop $1
	Pop $0
FunctionEnd

${SegmentFile}
${Segment.onInit}
	Push $0
	${IsWOW64} $0
	${If} $0 != 0
		System::Call `${CALL0}`
	${EndIf}
	Pop $0
!macroend

!macro CustomOS
	Push $0
	${If} ${IsNT}
		${IfNot} ${AtLeastWinXP}
			StrCpy $0 `Windows XP`
			MessageBox MB_OK|MB_ICONSTOP|MB_TOPMOST `$(MINREQ)`
			Call Unload
			Quit
		${EndIf}
	${Else}
		StrCpy $0 `Windows XP`
		MessageBox MB_OK|MB_ICONSTOP|MB_TOPMOST `$(MINREQ)`
		Call Unload
		Quit
	${EndIf}
	Pop $0
!macroend

!macro CustomLang
	Push $0
	${If} ${FileExists} `${INI}`
		${ConfigRead} `${INI}` Language= $0
	${Else}
		${ConfigRead} `${DEFINI}` Language= $0
	${EndIf}
	${GetLCID} $0 $0
	${Switch} $0
		!insertmacro LanguageCases
		StrCpy $LANGUAGE $0
		System::Call `${CALL1}`
		${Break}
	${EndSwitch}
	Pop $0
!macroend

!macro CustomLangInit
	Push $0
	ReadEnvStr $0 PortableApps.comLocaleID
	${GetLNG} $0 $0
	System::Call `${CALL2}`
	Pop $0
!macroend

${SegmentInit}
	Push $0
	${IsWOW64} $0
	${If} $0 = 0
		Delete `${DLL}`
		CopyFiles /SILENT `${32DLL}` `${DLL}`
		${If} ${AtMostWin2003}
			Delete `${SYS}`
			CopyFiles /SILENT `${SYS1}` `${SYS}`
		${ElseIf} ${AtMostWinVista}
			Delete `${SYS}`
			CopyFiles /SILENT `${SYS2}` `${SYS}`
		${ElseIf} ${AtMostWin7}
			Delete `${SYS}`
			CopyFiles /SILENT `${SYS3}` `${SYS}`
		${ElseIf} ${AtMostWin8}
			Delete `${SYS}`
			CopyFiles /SILENT `${SYS4}` `${SYS}`
		${EndIf}
	${Else}
		Delete `${DLL}`
		CopyFiles /SILENT `${64DLL}` `${DLL}`
		${If} ${AtMostWinVista}
			Delete `${SYS}`
			CopyFiles /SILENT `${SYS5}` `${SYS}`
		${ElseIf} ${AtMostWin7}
			Delete `${SYS}`
			CopyFiles /SILENT `${SYS6}` `${SYS}`
		${ElseIf} ${AtMostWin8}
			Delete `${SYS}`
			CopyFiles /SILENT `${SYS7}` `${SYS}`
		${EndIf}
	${EndIf}
	Pop $0
!macroend

!macro CustomInit
	IfFileExists `${INI}` +2
	CopyFiles /SILENT `${DEFINI}` `${INI}`
	IfFileExists `${IOBit}` +2
	CopyFiles /SILENT `${DEFIOBit}` `${IOBit}`
!macroend

${SegmentPrePrimary}
	Push $0
	${IsWOW64} $0
	${If} $0 = 0
		ReadRegStr $0 HKLM `${CLSID}` ""
	${Else}
		SetRegView 64
		ReadRegStr $0 HKLM `${CLSID}` ""
		SetRegView LastUsed
	${EndIf}
	${If} $0 != ""
	${AndIf} ${FileExists} `$0`
		ClearErrors
		UnRegDLL `$0`
		${If} ${Errors}
			nsExec::Exec `${CALL10}`
		${EndIf}
		${WriteRuntimeData} PortableApps.comLauncher ShellExtension `$0`
	${EndIf}
	ReadRegStr $0 HKLM `SYSTEM\CurrentControlSet\services\IObitUnlocker` ImagePath
	${If} $0 != ""
	${AndIf} ${FileExists} `$0`
		${WriteRuntimeData} PortableApps.comLauncher Service `$0`
		nsExec::Exec `${CALL6}`
		nsExec::Exec `${CALL7}`
	${EndIf}
	Pop $0
!macroend

!macro CustomPreDLL
	Push $0
	ClearErrors
	RegDLL `${DLL}`
	${If} ${Errors}
		nsExec::Exec `${CALL11}`
	${EndIf}
	CopyFiles /SILENT `${SYS}` `$SYSDIR`
	nsExec::Exec `${CALL3}`
	nsExec::Exec `${CALL4}`
	nsExec::Exec `${CALL5}`
	Pop $0
!macroend

!macro CustomPreFileWrite
	${GetTime} `${UPDATE}` L $0 $1 $2 $3 $4 $5 $6
	${ConfigWrite} `${UPDATE}` Lastupdate= `$1/$0/$2 $4:$5:$6` $0
!macroend

!macro CustomPostDLL
	Push $0
	ClearErrors
	UnRegDLL `${DLL}`
	${If} ${Errors}
		nsExec::Exec `${CALL12}`
	${EndIf}
	nsExec::Exec `${CALL6}`
	nsExec::Exec `${CALL7}`
	System::Call `${CALL8}`
	System::Call `${CALL9}`
	Pop $0
!macroend

${SegmentPostPrimary}
	Push $0
	${ReadRuntimeData} $0 PortableApps.comLauncher ShellExtension
	${If} $0 != ""
		ClearErrors
		RegDLL `$0`
		${If} ${Errors}
			nsExec::Exec `${CALL13}`
		${EndIf}
	${EndIf}
	${ReadRuntimeData} $0 PortableApps.comLauncher Service
	${If} $0 != ""
		nsExec::Exec `${CALL14}`
		nsExec::Exec `${CALL4}`
		nsExec::Exec `${CALL5}`
	${EndIf}
	Pop $0
!macroend

!macro CustomUnload
	Push $0
	ClearErrors
	Delete `${LOCALSYS}`
	${If} ${Errors}
		SetFileAttributes `${LOCALSYS}` NORMAL
		Delete `${LOCALSYS}`
		GetTempFileName $0
		Rename `${LOCALSYS}` `$TEMP\$0`
		${If} ${FileExists} `${LOCALSYS}`
			${CloseWindow} `CabinetWClass` ""
			Delete `${LOCALSYS}`
			GetTempFileName $0
			Rename `${LOCALSYS}` `$TEMP\$0`
		${EndIf}
	${EndIf}
	${ReadUserConfig} $0 RunningFromUSB
	${If} $0 == true
		ClearErrors
		Delete `${DLL}`
		Delete `${SYS}`
		${If} ${Errors}
			${CloseWindow} `CabinetWClass` ""
			Delete `${DLL}`
			Delete `${SYS}`
		${EndIf}
	${EndIf}
	Pop $0
!macroend