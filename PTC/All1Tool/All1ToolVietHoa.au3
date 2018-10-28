
#RequireAdmin
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
;~ $Form1 = GUICreate("Form1", 876-15, 612-35, 400+5, 111+1)
$FButton1 = GUICreate("Tạo mới", 280, 28, 204, 109+31,$WS_POPUP);491, 140 204, 109, 31
$Button1 = GUICtrlCreateButton("Tạo mới", 0, 0, 280, 28)
GUICtrlSetBkColor(-1,'0xFF0000')
GUIRegisterMsg($WM_MOVE,"Follow")
;~ $Button2 = GUICtrlCreateButton("Options", 72, 8, 43, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd

;~ #include <GUIConstants.au3>
;~ #include <windowsconstants.au3>

;~ #region - GUI Create
;~ Global $Topx = 300,$Topy = 400,$extMsg
;~ Global $Plusx = 15, $Plusy = 70
;~ Global $gui1 = GUICreate("Parent GUI", 300, 300, $Topx, $Topy)
;~ GUISetState()
;~ Global $gui2 = GUICreate("child", 200, 250, $Topx + 15,$Topy + 70, $WS_POPUP)
;~ GUISetState()
;~ winsetontop($gui2,'',1)
;~ GUIRegisterMsg($WM_MOVE,"Follow")
;~ #endregion
;~ WinSetTrans($gui1,"",0)

;~ #region - GUI SelectLoop
;~ While 1
;~     $extMsg = GUIGetMsg(1)
;~     $msg = $extMsg[0]
;~     Switch $extMsg[1]
;~         Case $gui1
;~             Select
;~                 Case $msg = $GUI_EVENT_CLOSE
;~                     Exit

;~             EndSelect

;~     EndSwitch
;~ WEnd
;~ #endregion

;~ Func _API_SetLayeredWindowAttributes($hwnd, $i_transcolor, $Transparency = 255, $isColorRef = False)

;~     Local Const $AC_SRC_ALPHA = 1
;~     Local Const $ULW_ALPHA = 2
;~     Local Const $LWA_ALPHA = 0x2
;~     Local Const $LWA_COLORKEY = 0x1
;~     If Not $isColorRef Then
;~         $i_transcolor = Hex(String($i_transcolor), 6)
;~         $i_transcolor = Execute('0x00' & StringMid($i_transcolor, 5, 2) & StringMid($i_transcolor, 3, 2) & StringMid($i_transcolor, 1, 2))
;~     EndIf
;~     Local $Ret = DllCall("user32.dll", "int", "SetLayeredWindowAttributes", "hwnd", $hwnd, "long", $i_transcolor, "byte", $Transparency, "long", $LWA_COLORKEY + $LWA_ALPHA)
;~     Select
;~         Case @error
;~             Return SetError(@error, 0, 0)
;~         Case $Ret[0] = 0
;~             Return SetError(4, 0, 0)
;~         Case Else
;~             Return 1
;~     EndSelect
;~ EndFunc;==>_API_SetLayeredWindowAttributes

Func Follow($hWnd)
    Local $wp = WinGetPos('All1Tool (Version: 2.113) - ')
    If $hWnd = $gui1 then WinMove($gui2,"",$wp[0] + $Plusx, $wp[1] + $Plusy)

EndFunc