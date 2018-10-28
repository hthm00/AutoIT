#include <Misc.au3>
#RequireAdmin
HotKeySet('{F3}','_exit')
HotKeySet('{LSHIFT}','_hide')
HotKeySet('{RSHIFT}','_hide')
While 1
   If _IsPressed(02) Or _IsPressed(10) Then
	  WinSetState('Boom','',@SW_HIDE)
   ElseIf _IsPressed(04) Then
	  WinSetState('Boom','',@SW_SHOW)
   EndIf
WEnd

Func _exit()
   WinClose('Boom')
EndFunc

Func _hide()
   WinSetState('Boom','',@SW_HIDE)
EndFunc