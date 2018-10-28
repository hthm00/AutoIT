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
$Button1 = GUICtrlCreateButton("hotspotconnected", 8, 8, 75, 25)
$Button2 = GUICtrlCreateButton("hotspotdisconnected", 80, 8, 75, 25)
$Button3 = GUICtrlCreateButton("fb", 152, 8, 75, 25)
$Button4 = GUICtrlCreateButton("dangky", 224, 8, 75, 25)
$Button5 = GUICtrlCreateButton("nhapten", 8, 32, 75, 25)
$Button6 = GUICtrlCreateButton("free", 80, 32, 75, 25)
$Button7 = GUICtrlCreateButton("saipass", 152, 32, 75, 25)
$Button8 = GUICtrlCreateButton("loifb", 224, 32, 75, 25)
$Button9 = GUICtrlCreateButton("thongbao", 8, 56, 75, 25)
$Button10 = GUICtrlCreateButton("tieptuc", 80, 56, 75, 25)
$Button11 = GUICtrlCreateButton("home", 152, 56, 75, 25)
$Button12 = GUICtrlCreateButton("restore", 224, 56, 75, 25)
$Button13 = GUICtrlCreateButton("appdata", 8, 80, 75, 25)
$Button14 = GUICtrlCreateButton("restoring", 80, 80, 75, 25)
$Button15 = GUICtrlCreateButton("xong", 152, 80, 75, 25)
$Button16 = GUICtrlCreateButton("nhan", 224, 80, 75, 25)
$Button17 = GUICtrlCreateButton("nhanxong", 8, 104, 75, 25)
$Button18 = GUICtrlCreateButton("", 80, 104, 75, 25)
$Button19 = GUICtrlCreateButton("", 152, 104, 75, 25)
$Button20 = GUICtrlCreateButton("", 224, 104, 75, 25)
$Button21 = GUICtrlCreateButton("", 8, 128, 75, 25)
$Button22 = GUICtrlCreateButton("", 80, 128, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
$title=InputBox('','Tên cửa sổ','MEmu1')
WinMove($title,'',0,0)
;~ WinActivate('BlueStacks App Player')

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			chup(334, 133,353, 149,'hotspotconnected')
		Case $Button2
			chup(334, 133,353, 149,'hotspotdisconnected')
		Case $Button3
			chup(0,0,0,0,'fb');
		Case $Button4
			chup(0,0,0,0,'dangky');
		Case $Button5
			chup(28, 103,92, 117,'nhapten')
		Case $Button6
			chup(572, 88,663, 105,'free')
		Case $Button7
			chup(390, 327,574, 341,'saipass');
		Case $Button8
			chup(183, 127,245, 139,'loifb')
		Case $Button9
			chup(390, 327,574, 341,'thongbao')
		Case $Button10
			chup(571, 366,605, 387,'tieptuc')
		Case $Button11
			chup(317, 210,341, 225,'home')
		Case $Button12
			chup(551,308,561, 313,'restore')
		Case $Button13
			chup(554, 86,624, 102,'appdata')
		Case $Button14
			chup(81, 86,99, 100,'restoring')
		Case $Button15
			chup(272, 128,385, 144,'xong')
		Case $Button16
			chup(280, 169,317, 181,'nhan')
		Case $Button17
			chup(229, 169,429, 179,'nhanxong')
		Case $Button18
			chup(255, 316,261, 323,'8transfer1')
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