${SegmentFile}

${Segment.OnInit}
	; Borrowed the following from PAL 2.2, Remove on release of PAL 2.2
		; Work out if it's 64-bit or 32-bit
	System::Call kernel32::GetCurrentProcess()i.s
	System::Call kernel32::IsWow64Process(is,*i.r0)
	${If} $0 == 0
		StrCpy $Bits 32
		${SetEnvironmentVariablesPath} LocalCTAppDir "$APPDATA\cherrytree"
	${Else}
		StrCpy $Bits 64
		${SetEnvironmentVariablesPath} LocalCTAppDir "$LOCALAPPDATA\cherrytree"
	${EndIf}
!macroend

${SegmentPre}
	ReadEnvStr $0 "PortableApps.comLocaleName"
	ReadEnvStr $1 "PortableApps.comLocaleName_INTERNAL"
	
	
	${If} $0 != ""
	${AndIf} $0 == $1		
		;Only do language switching with the platform
		ReadEnvStr $0 PAL:LanguageCustom
			  		
		ClearErrors
		FileOpen $1 "$EXEDIR\Data\cherrytree\lang" r
		IfErrors write
		FileRead $1 $2
		FileClose $1
		
		${If} $0 != $2
			write:
			FileOpen $3 "$EXEDIR\Data\cherrytree\lang" w
			IfErrors done
			FileWrite $3 $0
			FileClose $3
		${EndIf}
		
		done:
	${EndIf}
!macroend

${SegmentPost}
	;Clean up the malfunctioning dbus process
	${GetProcessPID} "dbus-daemon.exe" $0
	${GetProcessPath} $0 $1
	${If} $1 == "$EXEDIR\App\CherryTree\bin\dbus-daemon.exe"
		${TerminateProcess} $0 $2
	${EndIf}
!macroend