#RequireAdmin

HotKeySet('{f4}','_exit')

While 1
	WinSetTitle('QB - BNB Plug','','QB - BNB Plug 1')
;~ 	ControlSetText('QB - BNB Plug 1','','[Class:TAdvEdit; Instance:3]','61')
;~ 	ControlClick('cuaso1','','','left',1,744-2, 69-23)
;~ 	Sleep(1000)
;~ 	ControlClick('cuaso1','','','left',1,610-2, 549-23)

;~ 	ControlClick('QB - BNB Plug 1','','[Class:TAdvGlowButton; Instance:4]')
;~ 	Sleep(4000)
;~ 	ControlClick('QB - BNB Plug 1','','[Class:TAdvGlowButton; Instance:3]')

;~ 	Sleep(1000)
	ControlClick('QB - BNB Plug 1','','[Class:TAdvGlowButton; Instance:2]')


	For $a=42 To 602 Step 40
		For $b=83 To 563 Step 40
			MouseMove($a-2,$b-23,1)
;~ 			ControlClick('QB - BNB Plug 1','','[Class:TAdvGlowButton; Instance:2]')
			Sleep(50)
		Next
	Next
;~ 	For $a=18 To 498 Step 40
;~ 		For $b=79 To 639 Step 40
;~ 			MouseMove($a-2,$b-23,1)
;~ 			Sleep(50)
;~ 		Next
;~ 	Next

WEnd




Func _exit()
	Exit
EndFunc