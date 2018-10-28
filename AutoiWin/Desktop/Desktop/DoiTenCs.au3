#RequireAdmin
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form2 = GUICreate("Đổi tên CS", 244, 52, 302, 218)
$Input1 = GUICtrlCreateInput("MEmu 2.9.2 - MEmu", 8, 16, 57, 21)
$Input2 = GUICtrlCreateInput("cs1", 96, 16, 57, 21)
$Label1 = GUICtrlCreateLabel(">", 72, 19, 12, 17)
$Button1 = GUICtrlCreateButton("Đổi", 160, 16, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			WinSetTitle(GUICtrlRead($Input1),'',GUICtrlRead($Input2))

	EndSwitch
WEnd
