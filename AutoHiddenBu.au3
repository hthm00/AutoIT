#RequireAdmin
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <ScreenCapture.au3>
#include <File.au3>

Global $i, $lan=1
HotKeySet('{f1}','hdc_left')
HotKeySet('{f2}','hdc_right')
HotKeySet('{f4}','dung')
HotKeySet('{f9}','_exit')
;~ $a=PixelSearch(401,500,1500,1500,'0x6B6C6B')
;~ MouseMove($a[0],$a[1])
;~ ClipPut($a[0]&' '&$a[1]);	19 63 401 500  404 63  787 501
;~ Exit
;~ $hGUI = GUICreate("HDC", 786-401,500-63, 401, 63, $WS_POPUP)
If RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM\bnb','bnb')='ae8hgf23heey861' Then
Else
	MsgBox('0','','Self Destruction','1')
	Exit
EndIf


While 1
	check()
	If $lan=1 Then
		ToolTip('F1: Trái - F2: Phải - F4: Dừng - F9: Exit'&@CRLF&'Auto By Minh Huỳnh',0,@DesktopHeight-80)
	EndIf
	$lan+=1
WEnd
Func hdc_right()
	check()
	$ten=InputBox('Nhập tên cửa sổ Boom','','Boom')
	$speed=InputBox('Speed','Chọn tốc độ nhanh chậm'&@CRLF&'Mặc định là 5','5')
	$i=True
	Do
		WinSetTitle($ten,'','AutoHidden - By Minh Huynh')
;~ 		WinSetTitle('Boom','','AutoHidden - By Minh Huynh')
	Until Not WinExists($ten)

		$hGUI = GUICreate("HDC-MH", 787-404,501-63+1, 404, 63, $WS_POPUP)
		$Pic = GUICtrlCreatePic('',0,0,787-404,501-63+1)

		WinMove('AutoHidden - By Minh Huynh','',0,0)
		GUISetState(@SW_SHOW)
		WinSetOnTop('HDC-MH','',1)
		WinActivate('AutoHidden - By Minh Huynh')
	Do
		WinMove('AutoHidden - By Minh Huynh','',0,0)
		_ScreenCapture_Capture('C:\ProgramData\Temp\hdc1.jpg',19,63,401,501)
		GUICtrlSetImage($Pic, "C:\ProgramData\Temp\hdc1.jpg")
		WinSetTrans('HDC-MH','',0)
		Sleep($speed*100)
		WinSetTrans('HDC-MH','',255)
;~ 		GUISetState(@SW_DISABLE)
;~ 		GUISetState(@SW_HIDE)
;~ 		GUIDelete($hGUI)
	Until $i=False
	If $i=False Then
		GUIDelete($hGUI)
	EndIf
EndFunc

Func hdc_left()
	check()
	$ten=InputBox('Nhập tên cửa sổ Boom','','Boom')
	$speed=InputBox('Speed','Chọn tốc độ nhanh chậm'&@CRLF&'Mặc định là 5','5')
	$i=True
	Do
		WinSetTitle($ten,'','AutoHidden - By Minh Huynh')
;~ 		WinSetTitle('Boom','','AutoHidden - By Minh Huynh')
	Until Not WinExists($ten)

		$hGUI = GUICreate("HDC-MH", 787-404+1,501-63+1, 19, 63, $WS_POPUP)
		$Pic = GUICtrlCreatePic('',0,0,787-404+1,501-63+1)

		WinMove('AutoHidden - By Minh Huynh','',0,0)
		WinActivate('AutoHidden - By Minh Huynh')
		GUISetState(@SW_SHOW)
		WinSetOnTop('HDC-MH','',1)
	Do
		WinMove('AutoHidden - By Minh Huynh','',0,0)
		_ScreenCapture_Capture('C:\ProgramData\Temp\hdc2.jpg',404,63,787,501)
		GUICtrlSetImage($Pic, "C:\ProgramData\Temp\hdc2.jpg")
		WinSetTrans('HDC-MH','',0)
		Sleep($speed*100)
		WinSetTrans('HDC-MH','',255)
;~ 		GUISetState(@SW_DISABLE)
;~ 		GUISetState(@SW_HIDE)
;~ 		GUIDelete($hGUI)
	Until $i=False
	If $i=False Then
		GUIDelete($hGUI)
	EndIf
EndFunc

Func dung()
	$i=False
	FileDelete('C:\ProgramData\Temp\hdc1.jpg')
	FileDelete('C:\ProgramData\Temp\hdc2.jpg')
	WinSetOnTop('AutoHidden - By Minh Huynh','',0)
EndFunc
Func check()
	If ProcessExists('ollydbg.exe') Then
		MsgBox(0,'','Phát hiện gian lận',1)
		_AutoDestroy()
	EndIf
EndFunc
Func _AutoDestroy()

    Do
        $destroFileTemp= "destroy.bat"
        $destroFileTemp = @MIN & @SEC & $destroFileTemp
    Until FileExists($destroFileTemp) = 0

    if @Compiled = 1 Then
        $file = FileOpen($destroFileTemp, 1)
;~         FileWriteLine($file, "pause")
        FileWriteLine($file, "del " & @ScriptFullPath)
        FileWriteLine($file, "del " & $destroFileTemp)
        FileClose($file)

        Run(@ScriptDir & "\" & $destroFileTemp,'',@SW_HIDE);$s_Command & $s_Mask & '"', @WorkingDir, @SW_HIDE, 2+4)@ComSpec & "/c " &
        Exit
    EndIf
EndFunc
Func _exit()
	Exit
EndFunc