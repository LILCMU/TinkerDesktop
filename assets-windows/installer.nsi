!include "MUI2.nsh"

Name "Tinker"
BrandingText "aluxian.com"

# set the icon
!define MUI_ICON "icon.ico"

# define the resulting installer's name:
OutFile "..\dist\TinkerSetup.exe"

# set the installation directory
InstallDir "$PROGRAMFILES\Tinker\"

# app dialogs
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_INSTFILES

!define MUI_FINISHPAGE_RUN_TEXT "Start Tinker"
!define MUI_FINISHPAGE_RUN "$INSTDIR\Tinker.exe"

!insertmacro MUI_PAGE_FINISH
!insertmacro MUI_LANGUAGE "English"

# default section start
Section

  # delete the installed files
  RMDir /r $INSTDIR

  # define the path to which the installer should install
  SetOutPath $INSTDIR

  # specify the files to go in the output path
  File /r ..\build\Tinker\win32\*

  # create the uninstaller
  WriteUninstaller "$INSTDIR\Uninstall Tinker.exe"

  # create shortcuts in the start menu and on the desktop
  CreateShortCut "$SMPROGRAMS\Tinker.lnk" "$INSTDIR\Tinker.exe"
  CreateShortCut "$SMPROGRAMS\Uninstall Tinker.lnk" "$INSTDIR\Uninstall Tinker.exe"
  CreateShortCut "$DESKTOP\Tinker.lnk" "$INSTDIR\Tinker.exe"

SectionEnd

# create a section to define what the uninstaller does
Section "Uninstall"

  # delete the installed files
  RMDir /r $INSTDIR

  # delete the shortcuts
  Delete "$SMPROGRAMS\Tinker.lnk"
  Delete "$SMPROGRAMS\Uninstall Tinker.lnk"
  Delete "$DESKTOP\Tinker.lnk"

SectionEnd
