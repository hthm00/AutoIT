#include <GDIPlus.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>




#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Cắt ảnh", 254, 163, 936, 18)
$Label1 = GUICtrlCreateLabel("Chọn ảnh:", 16, 16, 60, 17)
$Input1 = GUICtrlCreateInput("", 80, 16, 73, 21)
$Button1 = GUICtrlCreateButton("Choose", 160, 16, 75, 25)
$Button2 = GUICtrlCreateButton("Large", 16, 64, 75, 25)
$Button3 = GUICtrlCreateButton("xLarge", 16, 104, 75, 25)
$Button4 = GUICtrlCreateButton("Thumbnail1", 136, 104, 75, 25)
$Button5 = GUICtrlCreateButton("Thumbnail2", 136, 64, 75, 25)
$Label2 = GUICtrlCreateLabel("Auto By Minh Huỳnh", 16, 136, 204, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			$gdi_pngSrc=FileOpenDialog('Choose File',@DesktopDir,'Images (*.jpg;*.png)')
			GUICtrlSetData($Input1,$gdi_pngSrc)
		Case $Button2
			Local $x=521,$y=291
			chay($x,$y)
		Case $Button4
			Local $x=210,$y=280
			chay($x,$y)
		Case $Button5
			Local $x=210,$y=240
			chay($x,$y)
		Case $Button3
			Local $x=784,$y=350
			chay($x,$y)
	EndSwitch
WEnd





Func chay($x,$y)
	_GDIPlus_Startup()
	$gdi_pngSrc = GUICtrlRead($Input1)
	$gdi_hImage = _GDIPlus_ImageLoadFromFile($gdi_pngSrc)

	$gdi_imageWidth = _GDIPlus_ImageGetWidth($gdi_hImage)
	$gdi_imageHeight = _GDIPlus_ImageGetHeight($gdi_hImage)

	$gdi_hCenterImage = _GDIPlus_ImageResize($gdi_hImage,$x,$y)
	_GDIPlus_ImageSaveToFile($gdi_hCenterImage, @DesktopDir & "\ok.png")

	_WinAPI_DeleteObject($gdi_hCenterImage)
	_GDIPlus_ImageDispose($gdi_hImage)
	_GDIPlus_Shutdown()
EndFunc

