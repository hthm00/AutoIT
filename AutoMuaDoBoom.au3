#RequireAdmin
HotKeySet('{F4}','_exit')
;~ HotKeySet('{F1}','ok')
;~ WinSetTitle($ten,'','B2')
;~ WinSetTitle('B2','','Boom')
;~ ;Kris Lam
;~ Exit
Opt('WinTitleMatchMode',3)
ToolTip('F4: exit - Auto By Minh Huynh',0,0)
$ten=InputBox('Tên cửa sổ','Nhập tên cửa sổ','cuaso1')
$vitri=InputBox('Vị trí','Nhập vị trí NSMM: 1-4','')
;~ Func ok()
;~ 	ControlClick('[CLASS:Txgold]','','[CLASS:TButton; INSTANCE:1]')

;~ EndFunc

While 1
	If WinExists('ca') Then
		WinClose('ca')
	EndIf

	ControlSend($ten,'','','{enter}')
	Sleep(10000)
	ControlSend($ten,'','','{f5}')
	Sleep(10000)
;~ 	ControlSend('B1','','','{enter}')
;~ 	Sleep(2000)
;~ 	ControlSend('B1','','','{f5}')
;~ 	Sleep(2000)
;~ 	ControlSend('B2','','','{enter}')
;~ 	Sleep(2000)
;~ 	ControlSend('B2','','','{f5}')
;~ 	Sleep(2000)
WEnd

While 1
;~    MouseClick('left',226, 348,1,0)
;~    MouseClick('left',280, 471,1,0)
;~    MouseClick('left',406, 425,1,0)

;~ 	ControlClick('BAO1','','','left',1,226-2, 348-23)
;~ 	ControlClick('BAO1','','','left',1,280-2, 471-23)
;~ 	ControlClick('BAO1','','','left',1,401-2, 416-23)

;~
;~    MouseClick('left',333, 433,1,0)
;~    MouseClick('left',377, 433,1,0)
ControlClick($ten,'','','left',1,666-2, 609-23)
Sleep(1500)
If $vitri=1 Then
ControlClick($ten,'','','left',6,482-2, 441-23)
Sleep(700)
ElseIf $vitri=2 Then
ControlClick($ten,'','','left',6,558-2, 441-23)
Sleep(700)
ElseIf $vitri=3 Then
ControlClick($ten,'','','left',6,626-2, 441-23)
Sleep(700)
ElseIf $vitri=4 Then
ControlClick($ten,'','','left',6,698-2, 441-23)
Sleep(700)
Else
	MsgBox(0,'','Lỗi')
	Exit
EndIf
For $i=1 To 45
	ControlClick($ten,'','','left',1,333-2, 433-23)
	ControlClick($ten,'','','left',1,377-2, 433-23)
	Sleep(70)
Next
Sleep(2000)
ControlSend($ten,'','','{enter}')
Sleep(100)
ControlSend($ten,'','','{enter}')
Sleep(100)
ControlSend($ten,'','','{enter}')
Sleep(100)
ControlSend($ten,'','','{enter}')
Sleep(100)
ControlClick($ten,'','','left',1,310-2, 547-23)
Sleep(700)
ControlSend($ten,'','','{enter}')
Sleep(100)
ControlSend($ten,'','','{enter}')
Sleep(100)
ControlSend($ten,'','','{enter}')
Sleep(100)
ControlSend($ten,'','','{enter}')
Sleep(100)
ControlClick($ten,'','','left',1,282-2, 613-23)
Sleep(1500)
ControlClick($ten,'','','left',1,675-2, 102-23)
Sleep(700)
ControlClick($ten,'','','left',1,153-2, 189-23)
Sleep(200)
ControlClick($ten,'','','left',1,222-2, 193-23)
Sleep(200)
ControlClick($ten,'','','left',1,146-2, 254-23)
Sleep(200)
ControlClick($ten,'','','left',1,225-2, 254-23)
Sleep(200)
ControlClick($ten,'','','left',1,153-2, 323-23)
Sleep(200)
ControlClick($ten,'','','left',1,224-2, 320-23)
Sleep(200)
ControlClick($ten,'','','left',1,418-2, 427-23)
Sleep(3500)
ControlClick($ten,'','','left',1,400-2, 442-23)
Sleep(700)
ControlClick($ten,'','','left',1,712-2, 69-23)
Sleep(700)





;~    MouseClick('left',227, 350,1,0)
;~    Sleep(250)
;~    MouseClick('left',392, 474,1,0)
;~     Sleep(250)
;~    Send('p3p3pun')
;~     Sleep(250)
;~    Send('{Tab}')
;~     Sleep(250)
;~    Send('{Tab}')
;~     Sleep(250)
;~    Send('-1882000-')
;~     Sleep(250)
;~    Send('{Enter}')
;~    Sleep(250)
;~    Send('{Enter}')
;~    Sleep(250)
;~    MouseClick('left',406, 425,1,0)
;~    MouseClick('left',406, 425,1,0)
WEnd
Func _exit()
   Exit
EndFunc