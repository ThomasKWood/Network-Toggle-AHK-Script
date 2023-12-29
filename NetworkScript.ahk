; Network Adapter Toggle Script converted from AHK V1 to AHK V2 by Thomas Wood
; Original AHK V1 script by: https://www.reddit.com/user/CRlME/

; ! Before using this script, you must change the adapterName variable to the name of the adapter you wish to toggle. !

; Usage:
; Press Ctrl+F5 to disable the adapter
; Press Ctrl+F6 to enable the adapter

Persistent ; Prevent the script from exiting automatically.
#SingleInstance
SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.
SetKeyDelay 0
OnExit AppExit 

adapterName := "Ethernet" ; Change this to the name of the adapter you wish to toggle

; Admin Priv Check
if not A_IsAdmin
{	
	Run("*RunAs " A_ScriptFullPath) ; if not admin, relaunch script as admin
}

; Exit Hotkey
!+f4::
{
	ToolTip("EXITING", 0, 0)
	Sleep(2000)
    ToolTip(, 0, 0)
	ExitApp
}

^F5::Run("*RunAs " A_ComSpec " /c netsh interface set interface `"" . adapterName . "`" admin=disabled", , "Hide")

^F6::Run("*RunAs " A_ComSpec " /c netsh interface set interface `"" . adapterName . "`" admin=enabled", , "Hide")

; Exit Func Callback
AppExit(ExitReason, ExitCode)
{
    RunWait("*RunAs " A_ComSpec " /c netsh interface set interface `"" . adapterName . "`" admin=enabled", , "Hide")
}