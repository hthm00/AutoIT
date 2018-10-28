#RequireAdmin
#include <File.au3>
#include <ScreenCapture.au3>
#include <String.au3>
#include <ImageSearch.au3>
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

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

WinMove('BlueStacks App Player','',0,0)
;~ WinActivate('BlueStacks App Player')

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			chup(601, 342,618, 393,'1fb')
		Case $Button2
			chup(448, 108,516, 169,'2login')
		Case $Button3
			chup(0,0,0,0,'2loi1');
		Case $Button4
			chup(0,0,0,0,'2loi2');
		Case $Button5
			chup(28, 103,92, 117,'2loi3')
		Case $Button6
			chup(572, 88,663, 105,'2loi4')
		Case $Button7
			chup(390, 327,574, 341,'2ok1');
		Case $Button8
			chup(139, 159,155, 172,'2ok2')
		Case $Button9
			chup(390, 327,574, 341,'2ok3')
		Case $Button10
			chup(571, 366,605, 387,'3notice1')
		Case $Button11
			chup(465, 353,500, 373,'3notice2')
		Case $Button12
			chup(723, 518,746, 534,'4gift')
		Case $Button13
			chup(809, 254,924, 283,'5nhanqua')
		Case $Button14
			chup(177, 248,208, 278,'5nhanqua1')
		Case $Button15
			chup(379, 197,587, 228,'6captcha')
		Case $Button16
			chup(391, 280,460, 300,'7captchaerror')
		Case $Button17
			chup(291, 278,499, 299,'7captchaok')
		Case $Button18
			chup(317, 541,330, 553,'8transfer1')
		Case $Button19
			chup(103, 485,189, 509,'9transfer2')
		Case $Button20
			chup(385, 127,585, 157,'10transferruby')
		Case $Button21
			chup(894, 520,921, 529,'11logout1')
		Case $Button22
			chup(498, 536,523, 566,'12logout2')

	EndSwitch
WEnd

Func chup($x,$y,$x1,$y1,$name)
	_ScreenCapture_Capture(@ScriptDir&'\anh\'&$name&'.png',$x,$y,$x1,$y1,False)
EndFunc