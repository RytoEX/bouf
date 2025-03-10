;
; NSIS Installer Script for OBS Studio, https://obsproject.com/
;
; This installer script is designed only for the release process
; of OBS Studio. It requires a lot of files to be in exactly the
; right places. If you're making a fork, it's strongly suggested
; that you make your own installer.
;
; If you choose to use this script anyway, be absolutely sure you
; have replaced every OBS specific check, whether process names,
; application names, files, registry entries, etc.
;
; To auto-install required Visual C++ components, download from
; https://support.microsoft.com/en-us/topic/the-latest-supported-visual-c-downloads-2647da03-1eea-4433-9aff-95f26a218cc0
; and copy to this directory (UI/installer/)
;
; This script also requires OBSInstallerUtils for additional
; functions. You can find it at
; https://github.com/notr1ch/OBSInstallerUtils

Unicode true
ManifestDPIAware true

; Define your application name
!define APPNAME "OBS Studio"

!ifndef APPVERSION
!define APPVERSION "28.0.0"
!define SHORTVERSION "28.0.0"
!endif

!define APPNAMEANDVERSION "${APPNAME} ${SHORTVERSION}"

; Additional script dependencies
!include WinVer.nsh
!include x64.nsh

; Search for plugins in working directory
!addplugindir .

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$PROGRAMFILES64\obs-studio"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "${BUILDDIR}\..\OBS-Studio-${SHORTVERSION}-Full-Installer-x64.exe"

; Use compression
SetCompressor /SOLID LZMA

; Need Admin
RequestExecutionLevel admin

; Modern interface settings
!include "MUI.nsh"

!define MUI_ICON "obs-studio.ico"
!define MUI_HEADERIMAGE_BITMAP "OBSHeader.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "OBSBanner.bmp"

!define MUI_ABORTWARNING
!define MUI_FINISHPAGE_TITLE "Completed Setup"
!define MUI_FINISHPAGE_RUN
!define MUI_FINISHPAGE_RUN_TEXT "Launch ${APPNAMEANDVERSION}"
!define MUI_FINISHPAGE_RUN_FUNCTION "LaunchOBS"
!define MUI_FINISHPAGE_SHOWREADME "https://github.com/obsproject/obs-studio/releases/${TAGVERSION}"
!define MUI_FINISHPAGE_SHOWREADME_TEXT "View Release Notes"
!define MUI_FINISHPAGE_SHOWREADME_NOTCHECKED
!define MUI_FINISHPAGE_LINK "New to OBS? Check out our 4-step Quickstart Guide."
!define MUI_FINISHPAGE_LINK_LOCATION "https://obsproject.com/kb/quick-start-guide"
!define MUI_FINISHPAGE_LINK_COLOR 000080

!define MUI_WELCOMEPAGE_TEXT "This setup will guide you through installing OBS Studio.\n\nIt is recommended that you close all other applications before starting, including OBS Studio. This will make it possible to update relevant files without having to reboot your computer.\n\nClick Next to continue."

!define MUI_PAGE_CUSTOMFUNCTION_LEAVE PreReqCheck

!define MUI_HEADERIMAGE
!define MUI_PAGE_HEADER_TEXT "License Information"
!define MUI_PAGE_HEADER_SUBTEXT "Please review the license terms before installing OBS Studio."
!define MUI_LICENSEPAGE_TEXT_TOP "Press Page Down or scroll to see the rest of the license."
!define MUI_LICENSEPAGE_TEXT_BOTTOM " "
!define MUI_LICENSEPAGE_BUTTON "&Next >"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "${BUILDDIR}\data\obs-studio\license\gplv2.txt"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!define MUI_COMPONENTSPAGE_TEXT_TOP "Check the components you want to uninstall. Keeping Settings unchecked is recommended."
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "Select components:"

;!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_COMPONENTS
!insertmacro MUI_UNPAGE_INSTFILES

; Set languages (first is default language)
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_RESERVEFILE_LANGDLL

Function PreReqCheck
	${if} ${RunningX64}
	${Else}
		IfSilent +1 +3
			SetErrorLevel 3
			Quit
		MessageBox MB_OK|MB_ICONSTOP "${APPNAME} is not compatible with your operating system's architecture."
	${EndIf}
	; Abort on 8.1 or lower

	${If} ${AtLeastWin10}
	${Else}
		IfSilent +1 +3
			SetErrorLevel 3
			Quit
		MessageBox MB_OK|MB_ICONSTOP "${APPNAME} requires Windows 10 or higher and cannot be installed on this version of Windows."
		Quit
	${EndIf}

	; DirectX Version Check
	ClearErrors
	GetDLLVersion "D3DCompiler_33.dll" $R0 $R1
	IfErrors dxMissing33 dxOK
	dxMissing33:
	ClearErrors
	GetDLLVersion "D3DCompiler_34.dll" $R0 $R1
	IfErrors dxMissing34 dxOK
	dxMissing34:
	ClearErrors
	GetDLLVersion "D3DCompiler_35.dll" $R0 $R1
	IfErrors dxMissing35 dxOK
	dxMissing35:
	ClearErrors
	GetDLLVersion "D3DCompiler_36.dll" $R0 $R1
	IfErrors dxMissing36 dxOK
	dxMissing36:
	ClearErrors
	GetDLLVersion "D3DCompiler_37.dll" $R0 $R1
	IfErrors dxMissing37 dxOK
	dxMissing37:
	ClearErrors
	GetDLLVersion "D3DCompiler_38.dll" $R0 $R1
	IfErrors dxMissing38 dxOK
	dxMissing38:
	ClearErrors
	GetDLLVersion "D3DCompiler_39.dll" $R0 $R1
	IfErrors dxMissing39 dxOK
	dxMissing39:
	ClearErrors
	GetDLLVersion "D3DCompiler_40.dll" $R0 $R1
	IfErrors dxMissing40 dxOK
	dxMissing40:
	ClearErrors
	GetDLLVersion "D3DCompiler_41.dll" $R0 $R1
	IfErrors dxMissing41 dxOK
	dxMissing41:
	ClearErrors
	GetDLLVersion "D3DCompiler_42.dll" $R0 $R1
	IfErrors dxMissing42 dxOK
	dxMissing42:
	ClearErrors
	GetDLLVersion "D3DCompiler_43.dll" $R0 $R1
	IfErrors dxMissing43 dxOK
	dxMissing43:
	ClearErrors
	GetDLLVersion "D3DCompiler_47.dll" $R0 $R1
	IfErrors dxMissing47 dxOK
	dxMissing47:
	ClearErrors
	GetDLLVersion "D3DCompiler_49.dll" $R0 $R1
	IfErrors dxMissing49 dxOK
	dxMissing49:
	IfSilent +1 +3
		SetErrorLevel 4
		Quit
	MessageBox MB_YESNO|MB_ICONEXCLAMATION "Your system is missing DirectX components that ${APPNAME} requires. Would you like to download them?" IDYES dxtrue IDNO dxfalse
	dxtrue:
		ExecShell "open" "https://obsproject.com/go/dxwebsetup"
	dxfalse:
	Quit
	dxOK:
	ClearErrors

	; Check previous instance
	check32BitRunning:
	OBSInstallerUtils::IsProcessRunning "obs32.exe"
	IntCmp $R0 1 0 notRunning1
		IfSilent +1 +3
			SetErrorLevel 5
			Quit
		MessageBox MB_RETRYCANCEL|MB_ICONEXCLAMATION "${APPNAME} is already running. Please close it first before installing a new version." /SD IDCANCEL IDRETRY check32BitRunning
		Quit
	notRunning1:

	${if} ${RunningX64}
		check64BitRunning:
		OBSInstallerUtils::IsProcessRunning "obs64.exe"
		IntCmp $R0 1 0 notRunning2
			IfSilent +1 +3
				SetErrorLevel 5
				Quit
			MessageBox MB_RETRYCANCEL|MB_ICONEXCLAMATION "${APPNAME} is already running. Please close it first before installing a new version." /SD IDCANCEL IDRETRY check64BitRunning
			Quit
		notRunning2:
	${endif}
FunctionEnd

Var dllFilesInUse

Function checkDLLs
	OBSInstallerUtils::ResetInUseFileChecks
	OBSInstallerUtils::AddInUseFileCheck "$INSTDIR\bin\64bit\avutil-57.dll"
	OBSInstallerUtils::AddInUseFileCheck "$INSTDIR\bin\64bit\swscale-6.dll"
	OBSInstallerUtils::AddInUseFileCheck "$INSTDIR\data\obs-plugins\win-capture\graphics-hook32.dll"
	OBSInstallerUtils::AddInUseFileCheck "$INSTDIR\data\obs-plugins\win-capture\graphics-hook64.dll"
	OBSInstallerUtils::AddInUseFileCheck "$INSTDIR\data\obs-plugins\win-dshow\obs-virtualcam-module32.dll"
	OBSInstallerUtils::AddInUseFileCheck "$INSTDIR\data\obs-plugins\win-dshow\obs-virtualcam-module64.dll"
	OBSInstallerUtils::AddInUseFileCheck "$APPDATA\obs-studio-hook\graphics-hook32.dll"
	OBSInstallerUtils::AddInUseFileCheck "$APPDATA\obs-studio-hook\graphics-hook64.dll"
	OBSInstallerUtils::GetAppNameForInUseFiles
	StrCpy $dllFilesInUse "$R0"
FunctionEnd

Function checkFilesInUse
	retryFileChecks:
	Call checkDLLs
	StrCmp $dllFilesInUse "" dllsNotInUse
	IfSilent +1 +3
		SetErrorLevel 6
		Quit
	MessageBox MB_RETRYCANCEL|MB_ICONEXCLAMATION "OBS files are being used by the following applications:$\r$\n$\r$\n$dllFilesInUse$\r$\nPlease close these applications to continue setup." /SD IDCANCEL IDRETRY retryFileChecks
	Quit

	dllsNotInUse:
FunctionEnd

Function LaunchOBS
	Exec '"$WINDIR\explorer.exe" "$SMPROGRAMS\OBS Studio.lnk"'
FunctionEnd

Section "OBS Studio" SecCore
	SetShellVarContext all

	Call checkFilesInUse

	; Set Section properties
	SectionIn RO
	SetOverwrite on
	AllowSkipFiles off

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR"

	File /r "${BUILDDIR}\data"

	SetOutPath "$INSTDIR\bin"
	Delete "$INSTDIR\bin\64bit\Qt5*.*"
	File /r "${BUILDDIR}\bin\64bit"
	SetOutPath "$INSTDIR\obs-plugins"
	Delete "$INSTDIR\obs-plugins\64bit\decklink-ouput*.*"
	Delete "$INSTDIR\obs-plugins\64bit\win-decklink*.*"
	Delete "$INSTDIR\obs-plugins\64bit\win-mf*.*"
	File /r "${BUILDDIR}\obs-plugins\64bit"

	; 64 bit Visual Studio 2022 runtime check
	ClearErrors
	SetOutPath "$PLUGINSDIR"
	File check_for_64bit_visual_studio_2022_runtimes.exe
	ExecWait "$PLUGINSDIR\check_for_64bit_visual_studio_2022_runtimes.exe" $R0
	Delete "$PLUGINSDIR\check_for_64bit_visual_studio_2022_runtimes.exe"
	IntCmp $R0 126 vs2022Missing_64 vs2022OK_64
	vs2022Missing_64:
		File VC_redist.x64.exe
		ExecWait '"$PLUGINSDIR\VC_redist.x64.exe" /quiet /norestart'
		Delete "$PLUGINSDIR\VC_redist.x64.exe"
	vs2022OK_64:
	ClearErrors

	# ----------------------------

	SetShellVarContext all

	SetOutPath "$INSTDIR"
	File /r "${BUILDDIR}\data"
	SetOutPath "$INSTDIR\obs-plugins"
	OBSInstallerUtils::KillProcess "32bit\obs-browser-page.exe"
	${if} ${RunningX64}
		OBSInstallerUtils::KillProcess "64bit\obs-browser-page.exe"
	${endif}
	File /r "${BUILDDIR}\obs-plugins\64bit"
	SetOutPath "$INSTDIR\bin\64bit"

	# ----------------------------
	# Copy game capture files to ProgramData
	SetOutPath "$APPDATA\obs-studio-hook"
	File "${BUILDDIR}\data\obs-plugins\win-capture\graphics-hook32.dll"
	File "${BUILDDIR}\data\obs-plugins\win-capture\graphics-hook64.dll"
	File "${BUILDDIR}\data\obs-plugins\win-capture\obs-vulkan32.json"
	File "${BUILDDIR}\data\obs-plugins\win-capture\obs-vulkan64.json"
	OBSInstallerUtils::AddAllApplicationPackages "$APPDATA\obs-studio-hook"

	WriteUninstaller "$INSTDIR\uninstall.exe"

	SetOutPath "$INSTDIR\bin\64bit"
	CreateShortCut "$DESKTOP\OBS Studio.lnk" "$INSTDIR\bin\64bit\obs64.exe"

	SetOutPath "$INSTDIR\bin\64bit"
	CreateShortCut "$SMPROGRAMS\OBS Studio.lnk" "$INSTDIR\bin\64bit\obs64.exe"

	; Delete old Start Menu shortcuts if installing upon an older version
	Delete "$SMPROGRAMS\OBS Studio\OBS Studio (64bit).lnk"
	Delete "$SMPROGRAMS\OBS Studio\Uninstall.lnk"
	RMDir "$SMPROGRAMS\OBS Studio"
SectionEnd

Section -FinishSection

	SetShellVarContext all

	# ---------------------------------------
	# 64bit vulkan hook registry stuff

	${if} ${RunningX64}
		SetRegView 64
		WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"

		ClearErrors
		DeleteRegValue HKCU "Software\Khronos\Vulkan\ImplicitLayers" "$APPDATA\obs-studio-hook\obs-vulkan64.json"
		ClearErrors
		WriteRegDWORD HKLM "Software\Khronos\Vulkan\ImplicitLayers" "$APPDATA\obs-studio-hook\obs-vulkan64.json" 0
	${endif}

	# ---------------------------------------
	# 32bit vulkan hook registry stuff

	SetRegView 32
	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"

	ClearErrors
	DeleteRegValue HKCU "Software\Khronos\Vulkan\ImplicitLayers" "$APPDATA\obs-studio-hook\obs-vulkan32.json"
	ClearErrors
	WriteRegDWORD HKLM "Software\Khronos\Vulkan\ImplicitLayers" "$APPDATA\obs-studio-hook\obs-vulkan32.json" 0

	# ---------------------------------------
	# Register virtual camera dlls

	Exec '"$SYSDIR\regsvr32.exe" /s "$INSTDIR\data\obs-plugins\win-dshow\obs-virtualcam-module32.dll"'
	${if} ${RunningX64}
		Exec '"$SYSDIR\regsvr32.exe" /s "$INSTDIR\data\obs-plugins\win-dshow\obs-virtualcam-module64.dll"'
	${endif}

	# ---------------------------------------
    # Clear shader cache
	RMDir /r "$APPDATA\obs-studio\shader-cache"

	# ---------------------------------------

	ClearErrors
	SetRegView default

	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "ProductID" "d16d2409-3151-4331-a9b1-dfd8cf3f0d9c"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayIcon" "$INSTDIR\bin\64bit\obs64.exe"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "Publisher" "OBS Project"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "HelpLink" "https://obsproject.com"
	WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayVersion" "${APPVERSION}"

SectionEnd

; Modern install component descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${SecCore} "Core OBS Studio files"
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;Uninstall section
Section "un.${APPNAME} App Files" UninstallSection1

	SectionIn RO

	; Remove hook files, shader cache, and vulkan registry
	SetShellVarContext all

	RMDir /r "$APPDATA\obs-studio\shader-cache"
	RMDir /r "$APPDATA\obs-studio-hook"

	SetRegView 32
	DeleteRegValue HKCU "Software\Khronos\Vulkan\ImplicitLayers" "$APPDATA\obs-studio-hook\obs-vulkan32.json"
	DeleteRegValue HKLM "Software\Khronos\Vulkan\ImplicitLayers" "$APPDATA\obs-studio-hook\obs-vulkan32.json"
	${if} ${RunningX64}
		SetRegView 64
		DeleteRegValue HKCU "Software\Khronos\Vulkan\ImplicitLayers" "$APPDATA\obs-studio-hook\obs-vulkan64.json"
		DeleteRegValue HKLM "Software\Khronos\Vulkan\ImplicitLayers" "$APPDATA\obs-studio-hook\obs-vulkan64.json"
	${endif}
	SetRegView default
	SetShellVarContext current
	ClearErrors

	; Unregister virtual camera dlls
	Exec '"$SYSDIR\regsvr32.exe" /u /s "$INSTDIR\data\obs-plugins\win-dshow\obs-virtualcam-module32.dll"'
	${if} ${RunningX64}
		Exec '"$SYSDIR\regsvr32.exe" /u /s "$INSTDIR\data\obs-plugins\win-dshow\obs-virtualcam-module64.dll"'
	${endif}

	; Remove from registry...
	DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
	DeleteRegKey HKLM "SOFTWARE\${APPNAME}"

	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
	SetShellVarContext all
	Delete "$DESKTOP\OBS Studio.lnk"
	Delete "$SMPROGRAMS\OBS Studio\OBS Studio (32bit).lnk"
	Delete "$SMPROGRAMS\OBS Studio\Uninstall.lnk"
	${if} ${RunningX64}
		Delete "$SMPROGRAMS\OBS Studio\OBS Studio (64bit).lnk"
		Delete "$SMPROGRAMS\OBS Studio.lnk"
	${endif}
	SetShellVarContext current

	; Clean up OBS Studio
	RMDir /r "$INSTDIR\bin"
	RMDir /r "$INSTDIR\data"
	RMDir /r "$INSTDIR\obs-plugins"
	RMDir "$INSTDIR"

	; Remove remaining directories
	RMDir "$SMPROGRAMS\OBS Studio"
	RMDir "$INSTDIR\OBS Studio"
SectionEnd

Section /o "un.Settings, Scenes, etc." UninstallSection2
	RMDir /r "$APPDATA\obs-studio"
SectionEnd

!insertmacro MUI_UNFUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${UninstallSection1} "Remove the OBS program files."
	!insertmacro MUI_DESCRIPTION_TEXT ${UninstallSection2} "Removes all settings, scenes, sources, profiles, log files, and other application data.$\r$\n$\r$\nTHIS CANNOT BE UNDONE."
!insertmacro MUI_UNFUNCTION_DESCRIPTION_END

; Version information
VIProductVersion "${APPVERSION}.0"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${APPNAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "OBS Project"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "(C) 2012-2021"
; FileDescription is what shows in the UAC elevation prompt when signed
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${APPNAME} Installer"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${APPVERSION}"

; eof
