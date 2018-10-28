#RequireAdmin
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#include <ScreenCapture.au3>
#include <ImageSearch.au3>

Global $Input[13], $txt ='', $ok=1, $xx,$yy
HotKeySet('{f3}','_exit')
Func _exit()
	Exit
EndFunc

;~ HotKeySet('{f1}','chup')
;~ Local $i=50
;~ While 1
;~ 	Sleep(50)
;~ WEnd
;~ Func chup()
;~ 	_ScreenCapture_Capture(@ScriptDir&'\anh\'&$i&'.jpg',360,74,409,123)
;~ 	_ScreenCapture_Capture(@ScriptDir&'\anh\'&$i+1&'.jpg',410,74,459,123)
;~ 	_ScreenCapture_Capture(@ScriptDir&'\anh\'&$i+2&'.jpg',429,74,478,123)
;~ 	_ScreenCapture_Capture(@ScriptDir&'\anh\'&$i+3&'.jpg',510,74,559,123)
;~ 	_ScreenCapture_Capture(@ScriptDir&'\anh\'&$i+4&'.jpg',529,74,578,123)
;~ 	_ScreenCapture_Capture(@ScriptDir&'\anh\'&$i+5&'.jpg',610,74,659,123)
;~ 	$i=$i+6
;~ EndFunc

;~ Sleep(2000)
;~ grid()
;~ Exit
;~ $a=MsgBox($MB_YESNO,'','Tự tìm ads?')
;~ If $a=6 Then
	_nhay()

;~ EndIf

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("NeobuxAutoClick", 254, 280, 196, 126)
$Label1 = GUICtrlCreateLabel("Row (y)", 16, 32, 36, 17)
$Label2 = GUICtrlCreateLabel("Column (x)", 27, 16, 55, 17)
$Input[1] = GUICtrlCreateInput("", 80, 16, 25, 21)
$Input[2] = GUICtrlCreateInput("", 112, 16, 25, 21)
$Input[3] = GUICtrlCreateInput("", 144, 16, 25, 21)
$Input[4] = GUICtrlCreateInput("", 176, 16, 25, 21)
$Input[5] = GUICtrlCreateInput("", 208, 16, 25, 21)
$Input[6] = GUICtrlCreateInput("", 16, 56, 25, 21)
$Input[7] = GUICtrlCreateInput("", 16, 88, 25, 21)
$Input[8] = GUICtrlCreateInput("", 16, 120, 25, 21)
$Input[9] = GUICtrlCreateInput("", 16, 152, 25, 21)
$Input[10] = GUICtrlCreateInput("", 16, 184, 25, 21)
$Input[11] = GUICtrlCreateInput("", 16, 216, 25, 21)
$Input[12] = GUICtrlCreateInput("", 16, 248, 25, 21)
$Button1 = GUICtrlCreateButton("Save", 168, 96, 75, 25)
$Button2 = GUICtrlCreateButton("Start", 168, 136, 75, 25)
$Label3 = GUICtrlCreateLabel("Position:", 88, 64, 40, 17)
$Input13 = GUICtrlCreateInput("", 142, 64, 33, 21)
$Input14 = GUICtrlCreateInput("", 198, 64, 33, 21)
$Label4 = GUICtrlCreateLabel("x=", 132, 64, 10, 17)
$Label5 = GUICtrlCreateLabel("y=", 184, 64, 10, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

If FileExists(@ScriptDir&'\settings.txt') Then
	$str=StringSplit(FileRead(@ScriptDir&'\settings.txt'),',')
	For $i=1 To 12
		GUICtrlSetData($Input[$i],$str[$i])
	Next
EndIf

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			If FileExists(@ScriptDir&'\settings.txt')=0 Then
				_FileCreate(@ScriptDir&'\settings.txt')
			EndIf
			$file=FileOpen(@ScriptDir&'\settings.txt',2)
			For $i=1 To 12
				If $i=12 Then
					$txt&=GUICtrlRead($Input[$i])
				Else
					$txt&=GUICtrlRead($Input[$i])&','
				EndIf
			Next
			FileWrite($file,$txt)
		Case $Button2
			_start()
	EndSwitch
	$pos=WinGetPos('NeobuxAutoClick')
	If GUICtrlRead($Input13) <> $pos[0] Then
		GUICtrlSetData($Input13,$pos[0])
	EndIf
	If GUICtrlRead($Input14) <> $pos[1] Then
		GUICtrlSetData($Input14,$pos[1])
	EndIf
WEnd

Func _start()
	For $i=6 To 12
		$y=GUICtrlRead($Input[$i])
		If $y='' Then
			ExitLoop
		EndIf
		For $ii= 1 To 5
			$x=GUICtrlRead($Input[$ii])
			If $x='' Then
				ExitLoop
			EndIf
			MouseClick('left',$x,$y,1,10)
			While 1
				$return=PixelSearch(0,0,@DesktopWidth,@DesktopHeight,'0xFF0000')
				If Not @error Then
					ExitLoop
				EndIf
			WEnd
			Sleep(1000)
			MouseClick('left',$return[0],$return[1],1,10)
			While 1
				$return=PixelSearch(0,0,@DesktopWidth,@DesktopHeight,'0xF49A0E')
				If Not @error Then
					ExitLoop
				EndIf
			WEnd
			Sleep(1000)
			MouseClick('left',$return[0],$return[1],1,10)
			Sleep(1000)
		Next
	Next

EndFunc

Func _adprize()
	While 1
		While 1
			$return=PixelSearch(0,0,@DesktopWidth,@DesktopHeight,'0x0E9EE4')
			If Not @error Then
				ExitLoop
			EndIf
		WEnd
		Sleep(Random(100,1500,1))
		MouseClick('left',$return[0],$return[1],1,10)
		Sleep(1000)
		Send('{enter}')
		MouseMove(0,0,0)
	WEnd
EndFunc


Func _nhay()
	Local $fileanh=@ScriptDir&'\anh\ad.png', $xx,$yy
	Global $pos1=WinGetPos('Cheap advertising online')
	While 1
		While 1
			Local $count=1, $count1=1
			While 1
	;~ 			$return=_ImageSearchArea($fileanh,0,0,0,@DesktopWidth,@DesktopHeight,$xx,$yy,0)
				$return=PixelSearch($pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,'0x15C3F2')
				If Not @error Then
					_click($return[0],$return[1])
				Else
					$return1=PixelSearch($pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,'0xA796CB')
					If Not @error Then
						_click($return1[0],$return1[1])
					EndIf
				EndIf
				If Not @error Then ;0x15C3F2
					ExitLoop
				Else
					$count+=1
					Sleep(150)
				EndIf
				If $count>=10 Then
					WinActivate('Cheap advertising online')
					_Send('{space}');546, 108  0x0E9EE4
					Sleep(800)
				EndIf
			WEnd

			While 1
				$return=_ImageSearchArea(@ScriptDir&'\anh\captcha.png',0,$pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,$xx,$yy,0)
				$return1=_ImageSearchArea(@ScriptDir&'\anh\captcha1.png',0,$pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,$xx,$yy,0)
				If $return=1 Or $return1=1 Then
					_quet()
					ExitLoop
				Else
					$count1+=1
					Sleep(500)
				EndIf
				If $count1>=60 Then
;~ 					_Send('^{w}')
					_click(425, 319)
					ExitLoop(2)
				EndIf
			WEnd
			While 1
				$return=PixelSearch($pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,'0x9DCE10')
				If Not @error Then
;~ 					_Send('^{w}')
;~ 					WinActivate('Cheap advertising online')
					_click(423, 32)
					MouseMove(423+$pos1[0],32+$pos[1])
					ExitLoop
				EndIf
			WEnd
			Sleep(800)
			ExitLoop
		WEnd
	WEnd
EndFunc

Func _quet()
	Local $xong=0
	For $i=1 To 10
		$anh=@ScriptDir&'\upside\'&$i&'.jpg'
;~ 		$return=_ImageSearchArea($anh,0,317, 46,704, 160,$xx,$yy,100)
		$return=_ImageSearchArea($anh,0,$pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,$xx,$yy,100)
		If $return=1 Then
			_click($xx+Random(10,40,1),$yy+Random(10,40,1))
			$xong=1
			ExitLoop
		EndIf
	Next
	If $xong=0 Then
		MsgBox(0,'','Ko giải đc captcha')
	EndIf
EndFunc

Func grid()
	Global $pos1=WinGetPos('Cheap advertising online')
	For $i=4 To 25
		Send('^{t}')
		Send('http://www.dimondclix.com/clixgrid.php?do=surf&x=1&y='&$i)
		Send('{enter}')
		While 1
			$return=PixelSearch($pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,'0x9DCE10')
			If Not @error Then
				_Send('^{w}')
				ExitLoop
			EndIf
		WEnd
	Next
EndFunc

Func _click($x,$y)
	ControlClick('Cheap advertising online','','','left',1,$x-$pos1[0]-8,$y-$pos1[1])
EndFunc

Func _send($text)
	ControlSend('Cheap advertising online','','',$text)
EndFunc