HotKeySet('{F4}','_exit')
HotKeySet('{F1}','chay')


While 1
WEnd

Func chay()
ControlClick('Audacity','','[Class:wxWindowNR; Instance:8]')
WinMinimizeAll()
EndFunc


Func _exit()
	WinMinimizeAllUndo()
	WinActivate('E:\Minh\AutoIT\Ghiamphongvan.au3 - SciTE')
	ControlClick('Audacity','','[Class:wxWindowNR; Instance:5]')
	WinSetState('E:\Minh\AutoIT\Ghiamphongvan.au3 - SciTE','',@SW_MINIMIZE)
;~ 	Exit
EndFunc