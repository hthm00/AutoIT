#RequireAdmin
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>

Global $Input[13], $txt ='', $ok=1


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