#RequireAdmin
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <File.au3>
#include <ScreenCapture.au3>
#include <WinAPI.au3>
#include <WinAPIEx.au3>
#include <WindowsConstants.au3>

#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WinAPIGdi.au3>
#include <WindowsConstants.au3>


;~ $handle=WinGetHandle('GetPixel - Pixel Color of background Window - AutoIt Example Scripts - AutoIt Forums - Google Chrome')
;~ $b=GetColor(8, 313,$handle)
;~ MsgBox(0,'',$b)
Func GetColor($iX,$iY,$WinHandle)

    _GDIPlus_Startup()

    Local $aPos = WinGetPos($WinHandle)
    $iWidth = $aPos[2]
    $iHeight = $aPos[3]
    Local $hDDC = _WinAPI_GetDC($WinHandle)
    Local $hCDC = _WinAPI_CreateCompatibleDC($hDDC)

    $hBMP = _WinAPI_CreateCompatibleBitmap($hDDC, $iWidth, $iHeight)


    _WinAPI_SelectObject($hCDC, $hBMP)
    DllCall("User32.dll", "int", "PrintWindow", "hwnd", $WinHandle, "hwnd", $hCDC, "int", 0)
    _WinAPI_BitBlt($hCDC, 0, 0, $iWidth, $iHeight, $hDDC, 0, 0, $__SCREENCAPTURECONSTANT_SRCCOPY)


     $BMP = _GDIPlus_BitmapCreateFromHBITMAP($hBMP)
     Local $aPixelColor = _GDIPlus_BitmapGetPixel($BMP, $iX, $iY)

    _WinAPI_ReleaseDC($WinHandle, $hDDC)
    _WinAPI_DeleteDC($hCDC)
    _WinAPI_DeleteObject($hBMP)
   _GDIPlus_ImageDispose($BMP)
    _GDIPlus_Shutdown()

    Return Hex($aPixelColor, 6)
EndFunc   ;==>GetColor

Func capture()
	$hWnd=WinGetHandle('recyclix.txt - Notepad')
	; Create GUI
	Local $iSize = WinGetPos($hWnd)
	Local $hForm = GUICreate('Test ' & StringReplace(@ScriptName, '.au3', '()'), $iSize[2], $iSize[3])
	Local $idPic = GUICtrlCreatePic('', 0, 0, $iSize[2], $iSize[3])
	Local $hPic = GUICtrlGetHandle($idPic)

	; Create bitmap
	Local $hDC = _WinAPI_GetDC($hPic)
	Local $hDestDC = _WinAPI_CreateCompatibleDC($hDC)
	Local $hBitmap = _WinAPI_CreateCompatibleBitmap($hDC, $iSize[2], $iSize[3])
	Local $hDestSv = _WinAPI_SelectObject($hDestDC, $hBitmap)
	Local $hSrcDC = _WinAPI_CreateCompatibleDC($hDC)
	Local $hBmp = _WinAPI_CreateCompatibleBitmap($hDC, $iSize[2], $iSize[3])
	Local $hSrcSv = _WinAPI_SelectObject($hSrcDC, $hBmp)
	_WinAPI_PrintWindow($hWnd, $hSrcDC)
	_WinAPI_BitBlt($hDestDC, 0, 0, $iSize[2], $iSize[3], $hSrcDC, 0, 0, $MERGECOPY)

	_WinAPI_ReleaseDC($hPic, $hDC)
	_WinAPI_SelectObject($hDestDC, $hDestSv)
	_WinAPI_SelectObject($hSrcDC, $hSrcSv)
	_WinAPI_DeleteDC($hDestDC)
	_WinAPI_DeleteDC($hSrcDC)
	_WinAPI_DeleteObject($hBmp)

	; Set bitmap to control
	_SendMessage($hPic, $STM_SETIMAGE, 0, $hBitmap)
	Local $hObj = _SendMessage($hPic, $STM_GETIMAGE)
	If $hObj <> $hBitmap Then
		_WinAPI_DeleteObject($hBitmap)
	EndIf

	_ScreenCapture_SaveImage(@ScriptDir & "\CaptureWindow.png", $hBitmap, False)
		ShellExecute(@ScriptDir & "\CaptureWindow.png")
	Exit
EndFunc

Func MemoryReadPixel($x, $y, $handle)
   Local $hDC
   Local $iColor
   Local $sColor

   $hDC = _WinAPI_GetWindowDC($handle)
   $iColor = DllCall("gdi32.dll", "int", "GetPixel", "int", $hDC, "int", $x, "int", $y)
   $sColor = Hex($iColor[0], 6)
   _WinAPI_ReleaseDC($handle, $hDC)

   Return Hex("0x" & StringRight($sColor, 2) & StringMid($sColor, 3, 2) & StringLeft($sColor, 2))
EndFunc   ;==>MemoryReadPixel

;~ DllCall("ImageSearchDll.dll", "str", "ImageSearchExt", "int", $iLeft, "int", $iTop, "int", $iRight, "int", $iBottom, "int", $iTolerance, "ptr", $hHbitmapImageToFind, "ptr", $hHbitmapImageToSearch)



Global $Input[13], $txt ='', $ok=1
HotKeySet('{f4}','_exit')
Func _exit()
	Exit
EndFunc
;~ _adprize()

$a=MsgBox($MB_YESNO,'','Tự tìm ads?')
If $a=6 Then
	_nhay()
EndIf

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
	Global $pos1=WinGetPos('NeoBux - The Innovation')
	While 1
		While 1
			$return=PixelSearch($pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,'0x0E9EE4')
			If Not @error Then
				ExitLoop
			EndIf
		WEnd
		Sleep(Random(100,1500,1))
		_click($return[0],$return[1])
;~ 		MouseMove($return[0]+20,$return[1]+20,0)
		Sleep(1000)
		WinActivate('NeoBux - The Innovation')
		_Send('{enter}')
		Sleep(2000)
	WEnd
EndFunc


Func _nhay()
	Global $pos1=WinGetPos('NeoBux - View Advertisements')
	While 1
		Local $count=1, $count1=1
		While 1
;~ 			$return=PixelSearch(0,0,@DesktopWidth,@DesktopHeight,'0xFFEC12')
			$return=PixelSearch($pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,'0xFFC100')
			$error1=@error
			$return1=PixelSearch($pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,'0xFCEA57')
			$error2=@error

			If $error1<>1 Then
				_click($return[0],$return[1])
				ExitLoop
			ElseIf $error2<>1 Then
				_click($return1[0],$return1[1])
				ExitLoop
			Else
				$count+=1
				Sleep(150)
			EndIf
			If $count>=10 Then
				WinActivate('NeoBux - View Advertisements')
				_Send('{space}');546, 108  0x0E9EE4
				Sleep(800)
			EndIf
		WEnd
;~ 		MouseClick('left',$return[0],$return[1],1,10)

		While 1
			$return=PixelSearch($pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,'0xFF0000')
			If Not @error Then
				ExitLoop
			Else
				$count1+=1
				Sleep(150)
			EndIf
			If $count1>=10 Then
				_Send('+{space}')
				Sleep(800)
			EndIf
		WEnd
;~ 		Sleep(1000)
;~ 		MouseClick('left',$return[0],$return[1],1,10)
		Sleep(900)
		_click($return[0],$return[1])
		Sleep(2000)
		While 1
			$return=PixelSearch($pos1[0],$pos1[1],$pos1[2]+$pos1[0]-10,$pos1[3]+$pos1[1]-12,'0xF49A0E')
			If Not @error Then
				ExitLoop
			EndIf
		WEnd
;~ 		Sleep(1000)
;~ 		MouseClick('left',$return[0],$return[1],1,10)
		Sleep(500)
		_click($return[0],$return[1])
		Sleep(1300)
	WEnd
EndFunc

Func _click($x,$y)
	ControlClick('NeoBux','','','left',1,$x-$pos1[0]-8,$y-$pos1[1])
EndFunc

Func _send($text)
	ControlSend('NeoBux','','',$text)
EndFunc

