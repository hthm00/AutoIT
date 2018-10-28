#RequireAdmin

HotKeySet('{f4}','_exit')

hyprmx()

Func hyprmx()
	WinActivate('Now Exploring great content! - Mozilla Firefox (Private Browsing)')
	MouseClick('left',109, 195,1,0)
	Sleep(200)
	MouseClick('left',982, 166,1,0)
	MouseClick('left',982, 166,1,0)
EndFunc


Func adbistro()
	WinMove('AdBistro','',374, 6,772, 433)
	While 1
		WinActivate('AdBistro')
		Sleep(200)
		MouseClick('left',444, 219,1,0)
		Sleep(2000)
		WinActivate('AdBistro')
		MouseClick('left',1068, 105,1,0)
		Sleep(200)
		MouseClick('left',891, 202,1,0)
		Sleep(200)
		MouseClick('left',1137, 107,1,0)
		Sleep(200)
		WinActivate('haha')
		WinSetTitle('Mozilla Firefox (Private Browsing)','','haha')
		WinActivate('haha')
		WinMove('haha','',0,0)
		Sleep(200)
		MouseClick('left',246, 514,1,0)
		Sleep(200)
	WEnd
EndFunc


Func _exit()
	Exit
EndFunc