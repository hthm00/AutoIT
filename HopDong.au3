#RequireAdmin

#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>

Global $Radio[9], $j, $t = 1

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("HỢP ĐỒNG CẤU KẾT", 490, 359, 237, 110)
$Label1 = GUICtrlCreateLabel("HỢP ĐỒNG RÀNG BUỘC MỐI QUAN HỆ", 148, 24, 360, 17)
$Label2 = GUICtrlCreateLabel("T và m sẽ bên nhau mỗi khi ốm đau và hạnh phúc.", 36, 72, 200, 35)
GUIStartGroup()
$Radio[1] = GUICtrlCreateRadio("Có", 36, 108, 57, 17)
$Radio[2] = GUICtrlCreateRadio("Không", 124, 108, 85, 17)
$Label3 = GUICtrlCreateLabel("T và m sẽ thể hiện là đứa partner ngoan ngoãn.", 36, 156, 200, 35)
GUIStartGroup()
$Radio[3] = GUICtrlCreateRadio("Có", 36, 192, 69, 17)
$Radio[4] = GUICtrlCreateRadio("Không", 124, 192, 77, 17)
$Label4 = GUICtrlCreateLabel("Huỳnh Tư Hoàng Minh", 36, 264, 200, 35)
$Label5 = GUICtrlCreateLabel("T và m sẽ thể hiện sự quan tâm, lo lắng và tôn trọng lẫn nhau.", 264, 72, 200, 35)
GUIStartGroup()
$Radio[5] = GUICtrlCreateRadio("Có", 264, 108, 57, 17)
$Radio[6] = GUICtrlCreateRadio("Không", 352, 108, 85, 17)
$Label6 = GUICtrlCreateLabel("T và m sẽ vì nhau mà cố gắng để hướng đến tương lai tốt đẹp hơn.", 264, 156, 200, 35)
GUIStartGroup()
$Radio[7] = GUICtrlCreateRadio("Có", 264, 192, 57, 17)
$Radio[8] = GUICtrlCreateRadio("Không", 352, 192, 85, 17)
$Checkbox1 = GUICtrlCreateCheckbox("Đã ký.", 36, 292, 97, 17)
GUICtrlSetState(-1, $GUI_CHECKED +$Gui_Disable)
$Label7 = GUICtrlCreateLabel("Lê Bá Trâm Anh", 264, 264, 200, 17)
$Checkbox2 = GUICtrlCreateCheckbox("Đã ký.", 264, 292, 97, 17)
$Button1 = GUICtrlCreateButton("Xong", 168, 316, 75, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###
If FileExists(@ScriptDir & "setss.txt") Then
	For $i = 2 To 8 Step 2
		GUICtrlSetState($Radio[$i],$Gui_Disable)
		GUICtrlSetState($Radio[$i-1],$Gui_Disable)
		GUICtrlSetState($Radio[$i-1], $GUI_CHECKED)
	Next
	GUICtrlSetState($Checkbox2,$GUI_CHECKED)
	GUICtrlSetState($Checkbox2,$Gui_Disable)
EndIf
While 1

	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			If FileExists(@ScriptDir & "setss.txt") Then
				Exit
			EndIf
			MsgBox(0,'','Tắt cc.')
		Case $Radio[2]
			$j += 1
			show($j)
			GUICtrlSetState($Radio[2], $gui_unchecked)
		Case $Radio[4]
			$j += 1
			show($j)
			GUICtrlSetState($Radio[4], $gui_unchecked)
		Case $Radio[6]
			$j += 1
			show($j)
			GUICtrlSetState($Radio[6], $gui_unchecked)
		Case $Radio[8]
			$j += 1
			show($j)
			GUICtrlSetState($Radio[8], $gui_unchecked)
		Case $Button1
			$t = True
			For $i = 1 To 8 Step 2
				If GUICtrlRead($Radio[$i]) = 4 Or GUICtrlRead($Checkbox2) = 4 Then
					$t = 0
					ExitLoop
				EndIf
			Next
			If $t = 1 Then
				MsgBox(0,'','Ký rồi thì có trách nhiệm đi nhé vì t với m còn chung đường dài dài đấy!')
				_FileCreate(@ScriptDir & "setss.txt")
				Exit
			EndIf

	EndSwitch
WEnd

Func show($a)
	Switch $a
		Case 1
			MsgBox(0,'','Mắc gì k đồng tình?')
		Case 2
			MsgBox(0,'','M láo :<')
		Case 3
			MsgBox(0,'','Ý kiến gì?')
		Case 4
			MsgBox(0,'','Lộn xộn.')
		Case 5
			MsgBox(0,'','Lại láo!')
		Case 6
			MsgBox(0,'','Ko hài lòng cũng phải hài lòng.')
		Case 7
			MsgBox(0,'','S m dámmm.')
		Case 8
			MsgBox(0,'','Có cho tao.')
		Case 9
			MsgBox(0,'','M như cc.')
		Case 10
			MsgBox(0,'','M dám bấm không lần nữa đi.')
		Case Else
			For $i = 2 To 8 Step 2
				GUICtrlSetState($Radio[$i],$Gui_Disable)
				GUICtrlSetState($Radio[$i-1],$Gui_Disable)
				GUICtrlSetState($Radio[$i-1], $GUI_CHECKED)
			Next
	EndSwitch

EndFunc
