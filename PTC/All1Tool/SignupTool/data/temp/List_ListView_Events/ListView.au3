; Events - ListView
#include <GuiConstants.au3>;Inclusion file for the GUI interface controls
#include <GuiListView.au3>
#include <GuiStatusbar.au3>

Global $ListView
Global Const $WM_NOTIFY = 0x004E
Global Const $DebugIt = 1

;ListView Events
Global Const $NM_FIRST = 0
Global Const $NM_LAST = (-99)
Global Const $NM_OUTOFMEMORY = ($NM_FIRST - 1)
Global Const $NM_CLICK = ($NM_FIRST - 2)
Global Const $NM_DBLCLK = ($NM_FIRST - 3)

Opt("WinTitleMatchMode", 2)

$main_GUI = GUICreate("GuiRegisterMsg Test", 225, 400, 300, 10, BitOR($WS_THICKFRAME, $WS_SIZEBOX))

$ListView = GUICtrlCreateListView("Entry Name|Category", 5, 75, 195, 280, BitOR($LVS_SORTASCENDING, $LVS_SINGLESEL))
_GUICtrlListViewSetColumnWidth ($ListView, 0, 100)
_GUICtrlListViewSetColumnWidth ($ListView, 1, 100)
GUICtrlSendMsg($ListView, $LVM_SETEXTENDEDLISTVIEWSTYLE, $LVS_EX_GRIDLINES, $LVS_EX_GRIDLINES)
GUICtrlSendMsg($ListView, $LVM_SETEXTENDEDLISTVIEWSTYLE, $LVS_EX_FULLROWSELECT, $LVS_EX_FULLROWSELECT)
GUICtrlCreateListViewItem("Name 1|Category 1", $ListView)
GUICtrlCreateListViewItem("Name 2|Category 2", $ListView)
$StatusBar1 = _GUICtrlStatusBarCreate($main_GUI, -1, "")
_GUICtrlStatusBarSetSimple($StatusBar1)

GUISetState()

;Register WM_NOTIFY  events
GUIRegisterMsg($WM_NOTIFY, "WM_Notify_Events")

While 1

   $msg = GUIGetMsg()

   Switch $msg

    ;-----------------------------------------------------------------------------------------
    ;This case statement exits and updates code if needed
      Case $GUI_EVENT_CLOSE
         Exit


       ;-----------------------------------------------------------------------------------------
       ;put all the misc. stuff here
		Case Else
			;;;
   EndSwitch
WEnd

Func ListView_Click()
	;----------------------------------------------------------------------------------------------
	If $DebugIt Then
		_DebugPrint ("$NM_CLICK")
		_GUICtrlStatusBarSetText($StatusBar1, "$NM_CLICK", $SB_SIMPLEID)
	EndIf
	;----------------------------------------------------------------------------------------------
EndFunc   ;==>ListView_Click

Func ListView_DoubleClick()
	;----------------------------------------------------------------------------------------------
	If $DebugIt Then
		_DebugPrint ("$NM_DBLCLK")
		_GUICtrlStatusBarSetText($StatusBar1, "$NM_DBLCLK", $SB_SIMPLEID)
	EndIf
	;----------------------------------------------------------------------------------------------
	MsgBox(0,"Double Clicked", _GUICtrlListViewGetItemText ($ListView, _GUICtrlListViewGetSelectedIndices($ListView)))
EndFunc   ;==>ListView_DoubleClick

;
; WM_NOTIFY event handler
Func WM_Notify_Events($hWndGUI, $MsgID, $wParam, $lParam)
	#forceref $hWndGUI, $MsgID, $wParam
	Local $tagNMHDR, $event, $hwndFrom, $code
	$tagNMHDR = DllStructCreate("int;int;int", $lParam) ;NMHDR (hwndFrom, idFrom, code)
	If @error Then Return
	$event = DllStructGetData($tagNMHDR, 3)
	Select
	Case $wParam = $ListView
		Select
			Case $event = $NM_CLICK
				ListView_Click ()
			Case $event = $NM_DBLCLK
				ListView_DoubleClick ()
			EndSelect
	EndSelect
	; Proceed the default Autoit3 internal message commands.
	; You also can complete let the line out.
	; !!! But only 'Return' (without any value) will not proceed
	; the default Autoit3-message in the future !!!
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_Notify_Events

Func _DebugPrint($s_text)
    $s_text = StringReplace($s_text, @LF, @LF & "-->")
    ConsoleWrite("!===========================================================" & @LF & _
            "+===========================================================" & @LF & _
            "-->" & $s_text & @LF & _
            "+===========================================================" & @LF)
EndFunc   ;==>_DebugPrint
