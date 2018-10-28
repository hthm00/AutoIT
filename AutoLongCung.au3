#RequireAdmin
WinMove('BAO1','',0,0,806, 629)
WinSetOnTop('BAO1','',0)
;~ MsgBox(0,'',Hex(PixelGetColor(25,70)))
;~ 	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:1]','9999')
;~ Sleep(1000)
;~ Send
;~ 	Exit


Global $i, $time=0, $user, $pass, $win='BAO1'
HotKeySet('{f1}','autolongcung')
HotKeySet('{f4}','dung1')
While 1
	Sleep(500)
WEnd
Func dung()
;~ 	$i=False
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:3]')
EndFunc
Func dung1()
	$i=False
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:3]')
EndFunc
Func autolongcung()
	$i=True
	$user=InputBox('Tài khoản','')
	$pass=InputBox('Mật khẩu','','','*')
	While 1
		If $i=False Then
			ExitLoop
		EndIf
		ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:1]','9999')
		ControlClick('QB - BNB Plug','','[Class:TRadioButton; Instance:3]')
		ControlClick('QB - BNB Plug','','[Class:TRadioButton; Instance:3]')
		Sleep(500)
		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:4]')
		Sleep(5000)
		dung()
		ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','')
		ControlClick('QB - BNB Plug','','[Class:TRadioButton; Instance:1]')
		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:4]')
		Sleep(3000)
		dung()
		If WinExists('ca') Then WinClose('ca')
		ControlClick('QB - BNB Plug','','[Class:TRadioButton; Instance:3]')
		Sleep(125000)
		MsgBox(0,'','')
		ControlSend('BAO1','','','{enter}')
		ControlSend($win,'','',$user)
		Sleep(500)
		ControlSend($win,'','','{tab}')
		Sleep(500)
		ControlSend($win,'','',$pass)
		Sleep(500)
		ControlSend($win,'','','{enter}')
		Sleep(8000)
		ControlClick($win,'','','left',1,567-2, 553-23)
		ControlClick($win,'','','left',1,477-2, 452-23)
		Sleep(8000)
		ControlClick($win,'','','left',1,726-2, 575-24)
		Sleep(500)
		ControlClick($win,'','','left',1,719-2, 198-23)
		Sleep(500)
		ControlSend($win,'','','{enter}')
		Sleep(1000)
;~ 		Sleep(500)
;~ 		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:4]')
;~ 		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:2]')
;~ 		Sleep(50000)
;~ 		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:3]')
;~ 		Sleep(30000)
	WEnd
EndFunc

Func _exit()
	Exit
EndFunc