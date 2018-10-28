#RequireAdmin
;~ $a='Copyright Ownership 2016 : La-Link Share - Update Version-1.7'
;~ $b='Tên Tài Khoản:    Minh' &@CRLF& 'Nhốm:                Kekeke :))' &@CRLF&'Ngày Đăng Ký:   2016/08/06' &@CRLF&'Ngày Hết Hạng:  2020/08/06'
;~ ControlSetText($a,'','[CLASS:Edit; INSTANCE:4]',$b)


;~ WinSetTitle('cs2','','Boom')
;~ ControlEnable('BNB Plug v2.74','','[CLASS:TComboBox; INSTANCE:3]')
;~ ControlEnable('BNB Plug v2.74','','[CLASS:TEdit; INSTANCE:2]')
;~ Exit

HotKeySet('{f1}','boss')
;~ HotKeySet('{f1}','kim')
HotKeySet('{f3}','boss')
HotKeySet('{f4}','quy')
;~ HotKeySet('{f2}','sam')
;~ HotKeySet('{f6}','sk')
;~ HotKeySet('{f7}','trasua1')
HotKeySet('{f6}','mo')
HotKeySet('{f7}','tat')
HotKeySet('{f8}','trasua2')
HotKeySet('{f9}','vang')
;~ HotKeySet('{f7}','duong')
;~ HotKeySet('{f8}','la')
;~ HotKeySet('{f9}','hong')
;~ WinSetState('Fiddler Web Debugger','',@SW_SHOW)
;~ WinMove('Plug BETA 8-11-2016 - http://baobnb.com','',1000,0)
While 1
	If WinExists('ca') Then
		WinClose('ca')
	EndIf
;~ 	Sleep(200)
WEnd
Func kim()
	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','219')
	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvGlowButton; INSTANCE:2]')
EndFunc

Func boss()
	ControlClick('BNB PLUG 19/9/2016 - Create by Quốc Bảo','','[CLASS:TButton; INSTANCE:1]')
;~ 	Sleep(500)
;~ 	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvOfficeCheckBox; INSTANCE:1]')
EndFunc


Func quy()
	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','15')
	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvGlowButton; INSTANCE:2]')
EndFunc
Func sam()
	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','221')
	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvGlowButton; INSTANCE:2]')
EndFunc
Func mo()
	ControlClick('BOOMVN.ONLINE AUTO 1','','[CLASS:TButton; INSTANCE:4]')
EndFunc
Func tat()
	ControlClick('BOOMVN.ONLINE AUTO 1','','[CLASS:TButton; INSTANCE:3]')
EndFunc
Func trasua1()
	ToolTip('',0,0)
	ControlCommand('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvOfficeCheckBox; INSTANCE:12]','Check')
	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','22')
	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvGlowButton; INSTANCE:2]')
	Sleep(2000)
;~ 	ControlCommand('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvOfficeCheckBox; INSTANCE:12]','Check')
	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','23')
	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvGlowButton; INSTANCE:2]')
	Sleep(2000)
;~ 	ControlCommand('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvOfficeCheckBox; INSTANCE:12]','Check')
	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','24')
	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvGlowButton; INSTANCE:2]')
	Sleep(2000)
	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvOfficeCheckBox; INSTANCE:12]')
	ToolTip('Xongggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg',0,0)
EndFunc
Func trasua2()
	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','24')
	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TButton; INSTANCE:1]')
EndFunc
Func vang()
;~ 	MsgBox(0,'',ControlCommand('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvOfficeCheckBox; INSTANCE:12]','IsChecked',''))
;~ 	If ControlCommand('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvOfficeCheckBox; INSTANCE:12]','IsChecked','')=1 Then
;~ 		ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvOfficeCheckBox; INSTANCE:12]')
;~ 	EndIf
	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','61')
	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvGlowButton; INSTANCE:2]')
EndFunc
;~ Func duong()
;~ 	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','22')
;~ 	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvGlowButton; INSTANCE:2]')
;~ 	Sleep(2000)
;~ 	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','23')
;~ 	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvGlowButton; INSTANCE:2]')
;~ EndFunc
;~ Func la()
;~ 	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','23')
;~ 	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvGlowButton; INSTANCE:2]')
;~ 	Sleep(2000)
;~ 	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','24')
;~ 	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvGlowButton; INSTANCE:2]')
;~ EndFunc
;~ Func hong()
;~ 	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','24')
;~ 	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvGlowButton; INSTANCE:2]')
;~ 	Sleep(2000)
;~ 	ControlSetText('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvEdit; INSTANCE:2]','22')
;~ 	ControlClick('Plug BETA 8-11-2016 - http://baobnb.com','','[CLASS:TAdvGlowButton; INSTANCE:2]')
;~ EndFunc
Func post()
	ControlSend('cuaso1','','','{f5}')
EndFunc