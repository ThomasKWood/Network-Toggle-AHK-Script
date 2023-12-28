; Network Adapter Toggle Script converted from AHK V1 to AHK V2 by Thomas Wood
; Original AHK V1 script by: https://www.reddit.com/user/CRlME/

; ! Before using this script, you must change the adapterName variable to the name of the adapter you wish to toggle. !

; Usage:
; Press Ctrl+F5 to disable the adapter
; Press Ctrl+F6 to enable the adapter

SendMode "Input"
SetWorkingDir A_ScriptDir
SetKeyDelay 0

adapterName := "Ethernet" ; Change this to the name of the adapter you wish to toggle

^F5::Run("*RunAs " A_ComSpec " /c netsh interface set interface `"" . adapterName . "`" admin=disabled", , "Hide")

^F6::Run("*RunAs " A_ComSpec " /c netsh interface set interface `"" . adapterName . "`" admin=enabled", , "Hide")