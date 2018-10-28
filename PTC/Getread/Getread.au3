#RequireAdmin
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#include <ScreenCapture.au3>
#include <ImageSearch.au3>

Global $Input[13], $txt ='', $ok=1, $xx,$yy, $posx[5]=[861,877,877,893,893]
HotKeySet('{f3}','_exit')
Func _exit()
	Exit
EndFunc

Sleep(2000)
	_nhay()

;~ EndIf



Func _nhay()
	WinMove('GetRead -','',0,0,1005, 652)
	Local $fileanh=@ScriptDir&'\anh\ad.png', $xx,$yy
	Global $pos1=WinGetPos('GetRead -')
	While 1
		While 1
			Global $count=1
			While 1
				$return=_ImageSearchArea(@ScriptDir&'\anh\trangchu.png',0,$pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,$xx,$yy,0)
				If $return=1 Then
					_click(997-9, 631-9)
					$count=1
					ExitLoop
				EndIf
				$count+=1
				Sleep(600)
				If $count>=10 Then
					MsgBox(0,'','Quá giờ')
					Exit
				EndIf
			WEnd
			While 1
				$return=_ImageSearchArea(@ScriptDir&'\anh\docbao.png',0,$pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,$xx,$yy,50)
				If $return=1 Then
					_click($xx-$pos1[0],$yy-$pos1[1])
					$count=1
					ExitLoop
				Else
					$count+=1
					Sleep(300)
				EndIf
				If $count>=10 Then
					MsgBox(0,'','Quá giờ')
					Exit
				EndIf
			WEnd
			While 1
				$return=_ImageSearchArea(@ScriptDir&'\anh\trangchu.png',0,$pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,$xx,$yy,50)
				If $return=1 Then
					_click(997-9, 631-9)
					$count=1
					ExitLoop
				EndIf
				$count+=1
				Sleep(600)
				If $count>=10 Then
					MsgBox(0,'','Quá giờ')
					Exit
				EndIf
			WEnd
			While 1
				$return=_ImageSearchArea(@ScriptDir&'\anh\tieptuc.png',0,$pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,$xx,$yy,50)
				If $return=1 Then
					_click($xx-$pos1[0],$yy-$pos1[1])
					$count=1
					ExitLoop
				Else
					_click(997-9, 631-9)
					$count+=1
					Sleep(400)
				EndIf
				If $count>=10 Then
					MsgBox(0,'','Quá giờ')
					Exit
				EndIf
			WEnd
			Global $ii=0,$lan=0
			While 1
				$return=_ImageSearchArea(@ScriptDir&'\anh\trangchu.png',0,$pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,$xx,$yy,50)
				If $return=1 Then
					Sleep(800)
					_click(997-9, 631-9)
					$count=1
					$ii+=1
					Sleep(800)
					If $ii=1 Then
						_click($posx[Random(0,4,1)],205)
					ElseIf $ii=2 Then
						_click($posx[Random(0,4,1)],250)
					ElseIf $ii=3 Then
						_click($posx[Random(0,4,1)],294)
					ElseIf $ii=4 Then
						_click($posx[Random(0,4,1)],336)
					ElseIf $ii=5 Then
						_click($posx[Random(0,4,1)],382)
					ElseIf $ii=6 Then
						_click($posx[Random(0,4,1)],425)
						$lan+=1
					EndIf
					Sleep(500)
					If $ii=6 Then
						_click(997-9, 631-9)
						Sleep(400)
						_click(861, 472)
						$ii=0
					EndIf
					If $lan=2 Then
						ExitLoop
					EndIf
				EndIf
			WEnd
			While 1
				$return=_ImageSearchArea(@ScriptDir&'\anh\trangchu.png',0,$pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,$xx,$yy,50)
				If $return=1 Then
					_click(997-9, 631-9)
					$count=1
					ExitLoop
				EndIf
				$count+=1
				Sleep(600)
				If $count>=10 Then
					MsgBox(0,'','Quá giờ')
					Exit
				EndIf
			WEnd
			While 1
				$return=_ImageSearchArea(@ScriptDir&'\anh\tieptuc2.png',0,$pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,$xx,$yy,50)
				If $return=1 Then
					_click($xx-$pos1[0],$yy-$pos1[1])
					$count=1
					ExitLoop
				EndIf
				$count+=1
				Sleep(500)
				If $count>=60 Then
					MsgBox(0,'','Quá giờ')
					Exit
				EndIf
			WEnd
			While 1
				$return=_ImageSearchArea(@ScriptDir&'\anh\trangchu.png',0,$pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,$xx,$yy,50)
				If $return=1 Then
					_click(997-9, 631-9)
					$count=1
					ExitLoop
				EndIf
				$count+=1
				Sleep(600)
				If $count>=10 Then
					MsgBox(0,'','Quá giờ')
					Exit
				EndIf
			WEnd
			While 1
				$return=_ImageSearchArea(@ScriptDir&'\anh\xong.png',0,$pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,$xx,$yy,50)
				If $return=1 Then
					_click($xx-$pos1[0],$yy-$pos1[1])
					$count=1
					ExitLoop
				EndIf
				$count+=1
				Sleep(500)
				If $count>=40 Then
					MsgBox(0,'','Quá giờ')
					Exit
				EndIf
			WEnd
			Sleep(800)
			ExitLoop
		WEnd
	WEnd
EndFunc


Func _click($x,$y)
	ControlClick('GetRead -','','','left',1,$x-8,$y)
EndFunc

Func _send($text)
	ControlSend('GetRead -','','',$text)
EndFunc