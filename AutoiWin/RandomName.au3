#RequireAdmin
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#Region ### START Koda GUI section ### Form=
$Form4 = GUICreate("Name", 226, 56, 1114, 1)
$Button1 = GUICtrlCreateButton("F1 / OK", 8, 16, 115, 25)
$Label1 = GUICtrlCreateLabel("", 136, 24, 76, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

HotKeySet('{f1}','chay')
HotKeySet('{f2}','paste')
HotKeySet('{f3}','email')
HotKeySet('{f4}','fb')
HotKeySet('{f6}','pass')
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			chay()

	EndSwitch
WEnd


Func fb()
	ClipPut('fb.com')
	Send('^{v}')
	Send('{enter}')
EndFunc
Func pass()
	ClipPut('123465')
	Send('^{v}')
EndFunc
Func email()
;~ 	ClipPut('https://mytemp.email/2')
	ClipPut('https://10minutemail.net/')
	Send('^{v}')
	Send('{enter}')
EndFunc
Func chay()
	$max=_FileCountLines(@ScriptDir&'\name.txt')
	$b=FileReadLine(@ScriptDir&'\name.txt',Random(0,$max,1))
	GUICtrlSetData($Label1,$b)
	ClipPut($b)
	Send('^{v}')
EndFunc
Func paste()
	Send('^{v}')
EndFunc
