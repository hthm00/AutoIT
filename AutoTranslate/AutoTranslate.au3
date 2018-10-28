#include <IE.au3>
#include <GUIConstantsEx.au3>


Global $ie,$handle
HotKeySet('{f1}','_start')
HotKeySet('{f4}','_exit')
$start=False
$gui=GUICreate('Translate',200,25,@DesktopWidth-200,0)
$button1=GUICtrlCreateButton('Dịch',0,0,200,25)
GUISetState()
WinSetOnTop($gui,'',1)
While 1
	$msg=GUIGetMsg()
	Switch $msg
		Case $button1
			_start()
		Case $gui_event_close
			Exit
	EndSwitch
	Sleep(100)
WEnd
Func _start()
	$start=Not $start
	If $start=True Then
		GUICtrlSetData($button1,'Tắt')
		WinSetState($gui,'',@SW_HIDE)
		Sleep(500)
		$handle = WinGetHandle("")
		Send('^{c}')
		$ie=_IECreate('https://translate.google.com/#en/vi/'&ClipGet())
		_IEPropertySet($ie,'height',@DesktopHeight-20)
		_IEPropertySet($ie,'width',@DesktopWidth)
		_IEPropertySet($ie,'left',0)
		_IEPropertySet($ie,'top',0)
		WinSetState($gui,'',@SW_SHOW)
	Else
		_IEQuit($ie)
		GUICtrlSetData($button1,'Dịch')
		WinActivate($handle)
	EndIf
EndFunc
Func _exit()
	Exit
EndFunc