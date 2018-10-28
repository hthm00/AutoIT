#RequireAdmin
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
;~ 	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:1]','9999')
;~ 	Exit
Global $i,$ii, $time=0, $aa,$user, $pass, $win='BAO1',$lan=0,$nho,$Button1,$90
HotKeySet('{f4}','dung')
HotKeySet('{f2}','sam')
HotKeySet('{f1}','kim')
HotKeySet('{f3}','quy')
HotKeySet('{f6}','sieunhan')
HotKeySet('{f7}','sieukhien')
HotKeySet('{f8}','dinh')
;~ HotKeySet('{f9}','leo1')
HotKeySet('{f9}','battu')
;~ HotKeySet('{f10}','longcung')
HotKeySet('{f10}','autolongcung')
HotKeySet('{f11}','autokeynpc')
;~ HotKeySet('{f11}','longcung1')
;~ HotKeySet('{f4}','longcung2')
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			$key=1
	EndSwitch

WEnd

Func key()
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','211')
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:2]')
EndFunc
Func kim()
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','61')
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:2]')
EndFunc
Func quy()
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','15')
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:2]')
EndFunc
Func sieunhan()
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','10')
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:2]')
EndFunc
Func sieukhien()
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','156')
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:2]')
EndFunc
Func dinh()
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','197')
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','197')
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:2]')
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','')
EndFunc
Func dung()
	WinMove('BAO1','',0,0,806, 629)
	WinSetOnTop('BAO1','',0)
;~ 	Exit
	$i=False
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:3]')
EndFunc
Func dung1()
;~ 	$i=False
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:3]')
EndFunc
Func banhbeo()
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','')
	ControlClick('QB - BNB Plug','','[Class:TRadioButton; Instance:1]')
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:4]')
EndFunc
Func battu()
	ToolTip('Đang thực hiện bất tử...',0,0)
;~ 	$time=InputBox('','Nhập độ trễ'&@CRLF&'Mặc định là 0s'&@CRLF&'Máy nhanh thì để mặc định, máy chậm thì nhập 1 hoặc 2 hoặc ...',0)
	banhbeo()
	Sleep(4000+$time*1000)
	dung()
	ToolTip('Xong',0,0)
EndFunc
Func longcung()
;~ 	$time=InputBox('','Nhập độ trễ'&@CRLF&'Mặc định là 0s'&@CRLF&'Máy nhanh thì để mặc định, máy chậm thì nhập 1 hoặc 2 hoặc ...',0)
	longcung1()
	Sleep(4000+$time*1000)
	dung()
	longcung2()
	Sleep(7000+$time*1000)
	dung()
EndFunc
Func longcung1()
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','1')
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:1]','9999')
	ControlClick('QB - BNB Plug','','[Class:TRadioButton; Instance:1]')
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:4]')
EndFunc
Func longcung2()
	ControlClick('QB - BNB Plug','','[Class:TRadioButton; Instance:9]')
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','')
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:1]','9999')
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:4]')
EndFunc
Func autokeynpc()
	$Form1 = GUICreate("Key", 121,45 , 192, 124,0,0)
	$Button1 = GUICtrlCreateButton("Key", 16, 0, 91, 25)
;~ 	GUISetState(@SW_SHOW)
	WinMove('Key','',0,0)
	WinSetOnTop('Key','',1)
	$i=True
	WinMove('BAO1','',0,0,806/8, 629/8)
	WinSetOnTop('BAO1','',1)
	$nho=MsgBox(4,'','Bạn muốn nhỏ như thế này không?'&@CRLF&'Cân nhắc khi chọn No vì Auto chiếm màn hình')
	If $nho=7 Then
		WinMove('BAO1','',0,0,806, 629)
;~ 		WinSetOnTop('BAO1','',0)
	EndIf
;~ 	$time=InputBox('','Nhập độ trễ'&@CRLF&'Mặc định là 0s'&@CRLF&'Máy nhanh thì để mặc định, máy chậm thì nhập 1 hoặc 2 hoặc ...',0)
	While 1
		$key=0
		If $i=False Then
			ExitLoop
		EndIf
		WinMove('BAO1','',0,0)
		If Hex(PixelGetColor(25,70))='0000C3F4' Then
		ControlClick('QB - BNB Plug','','[Class:TRadioButton; Instance:5]')
		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:4]')
		Sleep(1000)
		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:3]')
		Sleep(21000+$time*1000)
		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:4]')
		Sleep(3000)
		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:3]')
;~ 		Sleep(2000+$time*1000)

;~ 		For $ii=1 To 750
;~ 			Sleep(10)
;~ 			$nMsg = GUIGetMsg()
;~ 				Switch $nMsg
;~ 					Case $GUI_EVENT_CLOSE
;~ 						Exit
;~ 					Case $Button1
;~ 						$key=1
;~ 						ExitLoop
;~ 				EndSwitch
;~ 		Next

;~ 		$key=MsgBox(0,'','Có key thì bấm ok. Ko có thì ko bấm, bảng tắt trong '&12+$time&'s',12+$time)
		Sleep(12000);0x00C3F4
		Else
			ControlClick('QB - BNB Plug','','[Class:TRadioButton; Instance:5]')
			ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:4]')
			Sleep(2000)
			ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:3]')
		EndIf;
		WinMove('BAO1','',0,0)
		If Hex(PixelGetColor(25,70))='0000C3F4' Then
		Else
			Sleep(6000)
		EndIf;00FF80C2 005F94BE
		ClipPut(Hex(PixelGetColor(25,70)))
		If Hex(PixelGetColor(25,70))='0000C3F4' Then
		ElseIf Hex(PixelGetColor(25,70))='00FF80C2' Then
			ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','72')
				ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:2]')
				Sleep(2000)
				ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','65')
				ControlClick('QB - BNB Plug','','[Class:TAdvGloswButton; Instance:2]')
					Opt("SendKeyDownDelay", 5000)
					ControlSend('BAO1','','','{down}')
					Opt("SendKeyDownDelay", 5)
				Sleep(18000)
		ElseIf Hex(PixelGetColor(25,70))='00439E1F' Then
				Sleep(42000)
		ElseIf Hex(PixelGetColor(101,69))='00676431' Then
;~ 				MsgBox(0,'','')
;~ 			Sleep(2000)
			ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','71')
			ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:2]')
			Sleep(2000)
			ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','68')
			ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:2]')
				Opt("SendKeyDownDelay", 5000)
				ControlSend('BAO1','','','{down}')
				Opt("SendKeyDownDelay", 5)
			Sleep(18000)
		Else
			Sleep(42000)
		EndIf


	WEnd
EndFunc

Func autolongcung()
	$i=True
	$user=InputBox('Tài khoản','')
	$pass=InputBox('Mật khẩu','','','*')
	$90=MsgBox(4,'','Bạn có nhiệm vụ Boomer Trở Lại (Đóng Tem) ko?')

;~ 	WinMove('BAO1','',0,0,806/8, 629/8)
;~ 	WinSetOnTop('BAO1','',1)
;~ 	$nho=MsgBox(4,'','Bạn muốn nhỏ như thế này không?'&@CRLF&'Cân nhắc khi chọn No vì Auto chiếm màn hình')
;~ 	If $nho=7 Then
;~ 		WinMove('BAO1','',0,0,806, 629)
;~ 	EndIf
	While 1
		If $i=False Then
			ExitLoop
		EndIf


		ToolTip('Đang đang nhập...'&@CRLF&'Nếu ko bị dis thì chờ khoảng 20s',0,0)
		ControlSend($win,'','',$user)
		Sleep(500)
		ControlSend($win,'','','{tab}')
		Sleep(500)
		ControlSend($win,'','',$pass)
		Sleep(500)
		ControlSend($win,'','','{enter}')
		Sleep(8000)
;~ 		ControlClick($win,'','','left',1,567-2, 553-23)
		ControlClick($win,'','','left',1,477-2, 452-23)
		Sleep(8000)

;~ 		Sleep(500)
;~ 		ControlSend($win,'','','^{a}')
;~ 		Sleep(500)
;~ 		ControlSend($win,'','','{del}')
		Sleep(500)
		ControlSend($win,'','','{enter}')
		Sleep(1000)
		If $90=6 Then
			ControlClick($win,'','','left',1,726-2, 575-24)
			Sleep(500)
			ControlClick($win,'','','left',1,719-2, 198-23)
		EndIf
		Sleep(500)
		ControlClick($win,'','','left',1,584-2, 612-24)
		Sleep(500)
		ControlClick($win,'','','left',1,591-2, 257-24)
		Sleep(500)
		ControlClick($win,'','','left',1,255-2, 448-24)
		Sleep(2000)
		ControlSend($win,'','','{enter}')
		Sleep(500)
		ControlSend($win,'','','{enter}')
		Sleep(500)
		ControlSend($win,'','','{enter}')
		Sleep(500)
		ControlSend($win,'','','{enter}')
		Sleep(500)
		ControlSend($win,'','','{enter}')
		Sleep(500)
		ControlClick($win,'','','left',1,91-2, 161-24)
		Sleep(500)
		ControlClick($win,'','','left',1,511-2, 193-24)
		Sleep(1000)

		ToolTip('Đang Auto Long Cung...'&$lan&' màn'&@CRLF&'Nếu bị lỗi cứ để auto chạy hồi sẽ hết',0,0)
		ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:1]','9999')
		ControlClick('QB - BNB Plug','','[Class:TRadioButton; Instance:3]')
		ControlClick('QB - BNB Plug','','[Class:TRadioButton; Instance:3]')
		Sleep(500)
		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:4]')
		Sleep(9000)
		dung1()
		ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','')
		ControlClick('QB - BNB Plug','','[Class:TRadioButton; Instance:1]')
		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:4]')
		Sleep(4000)
		dung1()
		If WinExists('ca') Then WinClose('ca')
		ControlClick('QB - BNB Plug','','[Class:TRadioButton; Instance:3]')
		Sleep(70000)
		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:4]')
		Sleep(68000)
		dung1()
;~ 		MsgBox(0,'','')
		ControlSend('BAO1','','','{enter}')
		Sleep(500)
		ControlClick($win,'','','left',1,702-2, 612-24)
		Sleep(500)
		ControlSend('BAO1','','','{enter}')
		Sleep(500)
		ControlClick($win,'','','left',1,119-2, 612-24)
		Sleep(500)
		ControlSend('BAO1','','','{enter}')
		Sleep(500)
		ControlClick($win,'','','left',1,91-2, 612-24)
		Sleep(500)
		ControlSend('BAO1','','','{enter}')
		Sleep(500)
		ControlClick($win,'','','left',1,119-2, 612-24)
		Sleep(500)
		ControlSend('BAO1','','','{enter}')
		Sleep(500)
		ControlClick($win,'','','left',1,119-2, 612-24)
		Sleep(500)
		ControlClick($win,'','','left',1,119-2, 612-24)
		$lan+=1
;~ 		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:4]')
;~ 		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:2]')
;~ 		Sleep(50000)
;~ 		ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:3]')
;~ 		Sleep(30000)
	WEnd
EndFunc
Func sam()
	ControlSetText('QB - BNB Plug','','[Class:TAdvEdit; Instance:3]','221')
	ControlClick('QB - BNB Plug','','[Class:TAdvGlowButton; Instance:2]')
EndFunc

;~ Func leo1()
;~ 	leo()
;~ 	Sleep(500)
;~ 	dinh()
;~ EndFunc
Func _exit()
	Exit
EndFunc