#RequireAdmin
;13256102
HotKeySet('{f4}','_exit')
While 1
WinActivate('cuaso2')
MouseClick('left',669, 345,1,1)
;~ WinActivate('cuaso1')
MouseClick('left',840, 342,1,1)
Sleep(15000)
WinActivate('cuaso1')
MouseClick('left',854, 609,1,1)
Sleep(500)
WinActivate('cuaso2')
MouseClick('left',745, 610,1,1)
Sleep(5000)
MouseClick('left',444, 435,1,1)
WinActivate('cuaso1')
MouseClick('left',561, 435,1,1)

WinActivate('cuaso2')
MouseClick('left',669, 345,1,1)
;~ WinActivate('cuaso1')
MouseClick('left',840, 342,1,1)
Sleep(15000)
WinActivate('cuaso2')
MouseClick('left',745, 610,1,1)
Sleep(500)
WinActivate('cuaso1')
MouseClick('left',854, 609,1,1)
Sleep(5000)
MouseClick('left',444, 435,1,1)
WinActivate('cuaso1')
MouseClick('left',561, 435,1,1)



WEnd

Func _exit()
	Exit
EndFunc