#RequireAdmin
#include <File.au3>
#include <ScreenCapture.au3>
#include <String.au3>
#include <ImageSearch.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
;~ $title='MEmu 2.9.2 - MEmu'
;~ ControlClick($title,'','','left',1,672, 87)
;~ WinMove($title,'',0,0,698,338)
;~ ControlSend($title','','','!a')
;~ Exit
#Region ### START Koda GUI section ### Form=
$Form2 = GUICreate("Chụp ảnh", 307, 164, 961, 174)
$Button1 = GUICtrlCreateButton("1fb", 8, 8, 75, 25)
$Button2 = GUICtrlCreateButton("2login", 80, 8, 75, 25)
$Button3 = GUICtrlCreateButton("2loi1", 152, 8, 75, 25)
$Button4 = GUICtrlCreateButton("2loi2", 224, 8, 75, 25)
$Button5 = GUICtrlCreateButton("2loi3", 8, 32, 75, 25)
$Button6 = GUICtrlCreateButton("2loi4", 80, 32, 75, 25)
$Button7 = GUICtrlCreateButton("2ok1", 152, 32, 75, 25)
$Button8 = GUICtrlCreateButton("2ok2", 224, 32, 75, 25)
$Button9 = GUICtrlCreateButton("2ok3", 8, 56, 75, 25)
$Button10 = GUICtrlCreateButton("3notice1", 80, 56, 75, 25)
$Button11 = GUICtrlCreateButton("3notice2", 152, 56, 75, 25)
$Button12 = GUICtrlCreateButton("4gift", 224, 56, 75, 25)
$Button13 = GUICtrlCreateButton("5nhanqua", 8, 80, 75, 25)
$Button14 = GUICtrlCreateButton("5nhanqua1", 80, 80, 75, 25)
$Button15 = GUICtrlCreateButton("6captcha", 152, 80, 75, 25)
$Button16 = GUICtrlCreateButton("7captchaerror", 224, 80, 75, 25)
$Button17 = GUICtrlCreateButton("7captchaok", 8, 104, 75, 25)
$Button18 = GUICtrlCreateButton("8transfer1", 80, 104, 75, 25)
$Button19 = GUICtrlCreateButton("9transfer2", 152, 104, 75, 25)
$Button20 = GUICtrlCreateButton("10transferruby", 224, 104, 75, 25)
$Button21 = GUICtrlCreateButton("11logout1", 8, 128, 75, 25)
$Button22 = GUICtrlCreateButton("12logout2", 80, 128, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
$title=InputBox('','Tên cửa sổ','MEmu 2.9.2 - MEmu')
;~ WinMove($title,'',0,0)
;~ WinActivate('BlueStacks App Player')
$pos=WinGetPos($title)


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			chup(418, 171,424, 183,'1fb')
		Case $Button2
			chup(301, 103,361, 162,'2login')
		Case $Button3
			chup(88, 100,261, 112,'2loi1');
		Case $Button4
			chup(432, 84,476, 95,'2loi2');
		Case $Button5
			chup(87, 98,140, 110,'2loi3')
		Case $Button6
			chup(523, 88,571, 99,'2loi4')
		Case $Button7
			chup(390, 327,574, 341,'2ok1');
		Case $Button8
			chup(201, 250,261, 265,'2ok2')
		Case $Button9
			chup(245, 198,410, 210,'2ok3')
		Case $Button10
			chup(393, 210,413, 223,'3notice1')
		Case $Button11
			chup(317, 212,339, 224,'3notice2')
		Case $Button12
			chup(551,308,561, 313,'4gift')
		Case $Button13
			chup(555, 87,624, 107,'5nhanqua')
		Case $Button14
			chup(124, 73,157, 88,'5nhanqua1')
		Case $Button15
			chup(272, 128,385, 144,'6captcha')
		Case $Button16
			chup(280, 169,317, 181,'7captchaerror')
		Case $Button17
			chup(229, 169,429, 179,'7captchaok')
		Case $Button18
			chup(255, 316,261, 323,'8transfer1')
		Case $Button19
			chup(77, 248,122, 262,'9transfer2')
		Case $Button20
			chup(278, 76,380, 89,'10transferruby')
		Case $Button21
			chup(629, 310,635, 317,'11logout1')
		Case $Button22
			chup(336, 309,345, 319,'12logout2')

	EndSwitch
WEnd

Func chup($x,$y,$x1,$y1,$name)
	_ScreenCapture_Capture(@ScriptDir&'\anh\'&$name&'.png',$x+$pos[0],$y+$pos[1],$x1,$y1,False)
	_ScreenCapture_Capture(@ScriptDir&'\anhgoc\'&$name&'.png',0,0,-1,-1,False)
EndFunc