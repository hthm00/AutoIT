#RequireAdmin
;~ WinWait('codeNQB.txt - Notepad')

;~ Exit
HotKeySet('{f4}','_exit')
Global $open[3],$name[3],$login[3]
$open[1]=False
$open[2]=False
$name[1]=False
$name[2]=False
$login[1]=False
$login[2]=False
Opt('WinTitleMatchMode',3)
While 1
	Opt('WinTitleMatchMode',3)
	While 2
		ProcessClose('iexplore.exe')
		If ProcessExists('iexplore.exe') Then
		Else
			ExitLoop
		EndIf
	WEnd
	For $i=1 To 2
		$win='cuaso'&$i
		If WinExists($win) Then
			$open[$i]=True
			$name[$i]=True
			$login[$i]=True
		EndIf
	Next

	For $i=1 To 2
		$win='cuaso'&$i
		If $open[$i]=False and Not WinExists($win) Then
;~ 			ControlClick('Auto Update','','[Class:TButton; Instance:2]')
			Run('E:\Programs\Boom\ca.exe')
			WinWait('BOOMVN.ONLINE AUTO')
			Sleep(1000)
			WinSetTitle('BOOMVN.ONLINE AUTO','','BOOMVN.ONLINE AUTO '&$i)
			If WinExists('cuaso1') Or WinExists('cuaso2') Then
			Else
				Sleep(20000)
			EndIf

			$open[$i]=True
		EndIf
	Next

	For $i=1 To 2
		$win='cuaso'&$i
		If $name[$i]=False and WinExists('Boom') Then
			WinSetTitle('Boom','','cuaso'&$i)
			$name[$i]=True
		EndIf
	Next

	If WinExists('Crazy Arcade Client') Or WinExists('CrashDlg') Then
		WinClose('Crazy Arcade Client')
		WinClose('CrashDlg')

		For $i=1 To 2
			$win='cuaso'&$i
			If Not WinExists($win) Then
				$open[$i]=False
				$name[$i]=False
				$login[$i]=False
			EndIf
		Next
	EndIf


	For $i=1 To 2
		$win='cuaso'&$i
		If WinExists($win) And $login[$i]=False Then
;~ 			Sleep(5000)
			ControlClick($win,'','','left',1,30,30)
			If $i=1 Then
;~ 				ControlSend($win,'','','^{a}')
				Sleep(2000)
				ControlSend($win,'','','piggy176')
				ControlSend($win,'','','{tab}')
				ControlSend($win,'','','ngoc1761')
				ControlSend($win,'','','{enter}')

;~ 				Sleep(6000)
;~ 				WinWait('BOOMVN.ONLINE AUTO')
				Sleep(5000)
;~ 				WinSetTitle('BOOMVN.ONLINE AUTO','','BOOMVN.ONLINE AUTO 1')
				ControlClick($win,'','','left',1,567-2, 553-23)
				ControlClick($win,'','','left',1,477-2, 452-23)
				Sleep(5000)
				ControlClick($win,'','','left',1,610-2, 525-23)
				Sleep(500)
				ControlClick($win,'','','left',1,660-2, 529-23)
				Sleep(1500)
				ControlClick($win,'','','left',1,434-2, 539-23)
				Sleep(500)
				ControlClick($win,'','','left',1,466-2, 539-23)
				Sleep(500)

				ControlClick('BOOMVN.ONLINE AUTO 1','','[CLASS:TRadioButton; INSTANCE:3]')
				Sleep(500)
				ControlClick('BOOMVN.ONLINE AUTO 1','','[CLASS:TRadioButton; INSTANCE:16]')
				Sleep(500)
				ControlClick('BOOMVN.ONLINE AUTO 1','','[CLASS:TButton; INSTANCE:4]')
				Sleep(500)
;~ 				ControlClick('QB - BNB Plug 1','','[Class:TRadioButton; Instance:9]')
;~ 				Sleep(500)
;~ 				ControlSetText('QB - BNB Plug 1','','[Class:TAdvEdit; Instance:2]','61')
;~ 				Sleep(500)
;~ 				ControlSetText('QB - BNB Plug 1','','[Class:TAdvEdit; Instance:1]',$win)
;~ 				Sleep(500)
;~ 				ControlClick('QB - BNB Plug 1','','[Class:TAdvGlowButton; Instance:4]')


				$login[$i]=True
			ElseIf $i=2 Then
				Sleep(2000)
;~ 				ControlSend($win,'','','^{a}')
				ControlSend($win,'','','p3p3pun')
				ControlSend($win,'','','{tab}')
				ControlSend($win,'','','hotgirl')
				ControlSend($win,'','','{enter}')

;~ 				Sleep(10000)
;~ 				WinWait('BOOMVN.ONLINE AUTO')
				Sleep(5000)
;~ 				WinSetTitle('BOOMVN.ONLINE AUTO','','BOOMVN.ONLINE AUTO 2')
				ControlClick($win,'','','left',1,567-2, 553-23)
				ControlClick($win,'','','left',1,477-2, 452-23)
				Sleep(5000)
				ControlClick($win,'','','left',1,610-2, 525-23)
				Sleep(500)
				ControlClick($win,'','','left',1,660-2, 529-23)
				Sleep(1500)
				ControlClick($win,'','','left',1,434-2, 539-23)
				Sleep(500)
				ControlClick($win,'','','left',1,466-2, 539-23)
				Sleep(500)

				ControlClick('BOOMVN.ONLINE AUTO 2','','[CLASS:TRadioButton; INSTANCE:3]')
				Sleep(500)
				ControlClick('BOOMVN.ONLINE AUTO 2','','[CLASS:TRadioButton; INSTANCE:16]')
				Sleep(500)
				ControlClick('BOOMVN.ONLINE AUTO 2','','[CLASS:TButton; INSTANCE:4]')
				Sleep(500)
;~ 				ControlClick('QB - BNB Plug 2','','[Class:TRadioButton; Instance:9]')
;~ 				Sleep(500)
;~ 				ControlSetText('QB - BNB Plug 2','','[Class:TAdvEdit; Instance:2]','61')
;~ 				Sleep(500)
;~ 				ControlSetText('QB - BNB Plug 2','','[Class:TAdvEdit; Instance:1]',$win)
;~ 				Sleep(500)
;~ 				ControlClick('QB - BNB Plug 2','','[Class:TAdvGlowButton; Instance:4]')
				$login[$i]=True
			EndIf
		EndIf
	Next

	If WinExists('cuaso1') And WinExists('cuaso2') And WinExists('Boom') Then
		WinClose('Boom')
	EndIf
	Opt('WinTitleMatchMode',1)
WEnd
Func _exit()
	Exit
EndFunc