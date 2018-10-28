#include <GuiConstants.au3>
#include <GuiStatusbar.au3>

Global Const $DebugIt = 1
Global Const $WM_COMMAND = 0x0111

$main_GUI = GuiCreate("MyGUI", 460, 280,-1, -1)

$Edit_1 = GuiCtrlCreateEdit("Edit1", 10, 10, 360, 210)
$Input_2 = GuiCtrlCreateInput("Input2", 10, 230, 360, 20)
$List_3 = GuiCtrlCreateList("List3", 380, 10, 70, 240, BitOR($LBS_SORT, $LBS_NOINTEGRALHEIGHT, $LBS_NOTIFY, $WS_TABSTOP))
GUICtrlSetData($List_3,"item2")
$StatusBar1 = _GUICtrlStatusBarCreate($main_GUI, -1, "")
_GUICtrlStatusBarSetSimple($StatusBar1)

GuiSetState()
GUIRegisterMsg($WM_COMMAND, "MY_WM_COMMAND")

While 1
    $msg = GuiGetMsg()
    Select
    Case $msg = $GUI_EVENT_CLOSE
        ExitLoop
    Case Else
        ;;;
    EndSelect
WEnd
Exit

Func List_DoubleClick()
	;----------------------------------------------------------------------------------------------
	If $DebugIt Then	
		_DebugPrint ("$LBN_DBLCLK: " & GUICtrlRead($List_3))
		_GUICtrlStatusBarSetText($StatusBar1, "$LBN_DBLCLK: " & GUICtrlRead($List_3), $SB_SIMPLEID)
	EndIf
	;----------------------------------------------------------------------------------------------
EndFunc   ;==>ListView_DoubleClick

Func MY_WM_COMMAND($hWnd, $msg, $wParam, $lParam)
	Local $nNotifyCode = BitShift($wParam, 16)
	Local $nID = BitAND($wParam, 0xFFFF)
	Local $hCtrl = $lParam
	Local Const $LBN_ERRSPACE = (-2);
	Local Const $LBN_SELCHANGE = 1;
	Local Const $LBN_DBLCLK = 2;
	Local Const $LBN_SELCANCEL = 3;
	Local Const $LBN_SETFOCUS = 4;
	Local Const $LBN_KILLFOCUS = 5;

	Switch $nID
		Case $List_3
			Switch $nNotifyCode
				Case $LBN_ERRSPACE
					If $DebugIt Then	
						_DebugPrint ("$LBN_ERRSPACE")
						_GUICtrlStatusBarSetText($StatusBar1, "$LBN_ERRSPACE", $SB_SIMPLEID)
					EndIf
				Case $LBN_SELCHANGE
					If $DebugIt Then	
						_DebugPrint ("$LBN_SELCHANGE")
						_GUICtrlStatusBarSetText($StatusBar1, "$LBN_SELCHANGE", $SB_SIMPLEID)
					EndIf
				Case $LBN_SELCANCEL
					If $DebugIt Then	
						_DebugPrint ("$LBN_SELCANCEL")
						_GUICtrlStatusBarSetText($StatusBar1, "$LBN_SELCANCEL", $SB_SIMPLEID)
					EndIf
				Case $LBN_SETFOCUS
					If $DebugIt Then	
						_DebugPrint ("$LBN_SETFOCUS")
						_GUICtrlStatusBarSetText($StatusBar1, "$LBN_SETFOCUS", $SB_SIMPLEID)
					EndIf
				Case $LBN_KILLFOCUS
					If $DebugIt Then	
						_DebugPrint ("$LBN_KILLFOCUS")
						_GUICtrlStatusBarSetText($StatusBar1, "$LBN_KILLFOCUS", $SB_SIMPLEID)
					EndIf
				Case $LBN_DBLCLK
					List_DoubleClick()
			EndSwitch
	EndSwitch
	; Proceed the default Autoit3 internal message commands.
	; You also can complete let the line out.
	; !!! But only 'Return' (without any value) will not proceed
	; the default Autoit3-message in the future !!!
	Return $GUI_RUNDEFMSG
EndFunc   ;==>MY_WM_COMMAND

Func _DebugPrint($s_text)
    $s_text = StringReplace($s_text, @LF, @LF & "-->")
    ConsoleWrite("!===========================================================" & @LF & _
            "+===========================================================" & @LF & _
            "-->" & $s_text & @LF & _
            "+===========================================================" & @LF)
EndFunc   ;==>_DebugPrint
