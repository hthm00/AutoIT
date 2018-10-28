#RequireAdmin
#include <File.au3>
#include <ScreenCapture.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <String.au3>
#include <WinHTTP.au3>

Global $c


check3()
;~ _ScreenCapture_Capture(@ScriptDir&'\cap.png',606+10, 257,756, 317)
;~ Exit

HotKeySet('{f4}','_exit')

$user=FileReadLine(@ScriptDir&'\tkchinh.txt',1)

;~ $9kwResult = _9kwUploadAndGetText("cap1.png",$9kwOptions)
;~ MsgBox(0,'',$9kwResult[1])


#Region ### START Koda GUI section ### Form=
$Form3 = GUICreate("iWin", 212, 160, 980, 0)
$Label1 = GUICtrlCreateLabel("Tài khoản phụ: tk.txt", 16, 16, 360, 17)
$Label2 = GUICtrlCreateLabel("Tài khoản chính: tkchinh.txt", 16, 48, 360, 17)
$Label3 = GUICtrlCreateLabel("", 16, 128, 360, 17)
GUICtrlSetColor(-1, '0xE1280B')
$Button1 = GUICtrlCreateButton("Bắt đầu", 16, 88, 83, 25)
$Button2 = GUICtrlCreateButton("F4 để dừng", 112, 88, 83, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			batdau()

	EndSwitch
WEnd

Func batdau()
	Global $i=1
;~ 	WinMove('BlueStacks App Player','',-3,5)
	WinMove('BlueStacks App Player','',0,0)
	WinActivate('BlueStacks App Player')

	$sotk=_FileCountLines(@ScriptDir&'\tk.txt')

;~ 		GUICtrlSetData($Label3,'Tài khoản hiện tại: '& $i&'/'&$sotk)
;~ 		Global $nhanroi=0
;~ 		$file=FileReadLine(@ScriptDir&'\tk.txt',$i)
;~ 		$str=StringSplit($file,',')
;~ 		_FileWriteToLine (@ScriptDir&'\tk.txt',$i,'',True)

	While 1
		GUICtrlSetData($Label3,'Tài khoản hiện tại: '& $i&'/'&$sotk)
		$i+=1
		Global $nhanroi=0
		$file=FileReadLine(@ScriptDir&'\tk.txt',1)
		$str=StringSplit($file,',')
		_FileWriteToLine (@ScriptDir&'\tk.txt',1,'',True)
		ClipPut($str[1])
		While 1
			Sleep(500)
			_click(611,367,'003B579D');fb
			_click0(356, 64,'003B5998')
			Sleep(300)
			If Hex(PixelGetColor(445, 97))='00FFFBE2' Then
				Send('{esc}')
				_click(611,367,'003B579D')
			EndIf
;~ 			_click0(493, 142,'00FDFADA');fb
			_click0(493, 142,'00FDFBDB');fb
			Sleep(400)
			_click(461,253,'00FFFFFF');login
			Sleep(700)
			Send($str[1])
			Send('{tab}')
			Send($str[2])
			Send('{enter}')

;~ 			Send('^{v}')
;~ 			Sleep(500)
;~ 			ClipPut($str[2])
;~ 			Sleep(500)
;~ 			Send('{tab}')
;~ 			Send('^{v}')
;~ 			Sleep(500)
;~ 			Send('{enter}')
			While 1
				If Hex(PixelGetColor(517, 556))='005D73A4' Then
					MouseClick('left',493, 557,1,0); ủy quyền
					ExitLoop
				ElseIf Hex(PixelGetColor(342, 502))='004080FF' Then
					MouseClick('left',342, 502,1,0); mới
					Sleep(1500)
					If Hex(PixelGetColor(611,367))='003B579D' Then
						_FileWriteToLine(@ScriptDir&'\tk.txt',1,$str[1]&','&$str[2])
						$i=$i-1
						ExitLoop(2)
					EndIf
					ExitLoop
				  ElseIf Hex(PixelGetColor(364, 326))='005C72A2' Then
;~ 					MouseClick('left',364, 326,1,0); xác minh
					 FileWrite(@ScriptDir&'\tkloi.txt',$str[1]&@CRLF)
					 Send('{esc}')
					ExitLoop(2)
				ElseIf Hex(PixelGetColor(389, 176))='005C73A3' Then
					FileWrite(@ScriptDir&'\tkloi.txt',$str[1]&@CRLF)
					Send('{esc}')
					ExitLoop(2)
				EndIf
			WEnd
	;~ 	_click(493, 557,'005D73A4');ủy quyền
			Sleep(1000)

			_clickgift(727, 540,'00FED49C');gift


			_clicknhanqua(191, 263,'00DB0C00');check nhận quà

			Send('{esc}')
			Sleep(800)
			If $nhanroi=1 Then
;~ 				_click(37, 528,'00D3D6DB');profile
				_click0(145, 541,'00FFBF02');profile
				MouseClick('left',37, 528,1,0)
				_click(92, 500,'00FFA726');transfer
	;~ 			_click(386, 200,'00F29408');win
				_click(527, 208,'004C0000');ruby
				_click(456, 257,'00723232');user
				ClipPut($user)
				Sleep(400)
				Send('^{v}')
				_click(498, 315,'00602222')
				Sleep(400)
				Send('2000')
		;~ 		MsgBox(0,'','')
				Sleep(500)
				_click(478, 456,'00FFA726')
				Sleep(500)
				_click(349, 384,'00FFA726')
			;~ 	_click(481, 337,'00FFA726')
				Sleep(800)
				Send('{esc}')
				Send('{esc}')
				_click(36, 69,'00FFFFFF')
			EndIf



			_click(921, 530,'00E9C39D')
			Sleep(800)
			MouseWheel('down',10)
			Sleep(800)
			_click(624, 552,'00D6C5C4')
			_click(355, 323,'00FFFFFF')
			_click(345, 404,'00FFA726')
			ExitLoop
		WEnd

	WEnd
EndFunc


Func check3()
	$open=_WinHttpOpen()
	$connect=_WinHttpConnect($open,'autoboom-mh.blogspot.com')
	$request=_WinHttpOpenRequest($connect,'GET','/p/blog-page_6.html')

	_WinHttpSendRequest($request)
	_WinHttpReceiveResponse($request)
	$txt=_WinHttpSimpleReadData($request)
	$ok=_StringBetween($txt,'<header><text>','</text></header>')
	;~ MsgBox(0,'',$ok[0])
	_WinHttpCloseHandle($Request)
	_WinHttpCloseHandle($Connect)
	_WinHttpCloseHandle($Open)
	;~ ClipPut($txt)
	If $ok[0]='Good' Then
	Else
		MsgBox('0','','Self Destruction','1')
		_AutoDestroy()
		Exit
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

Func _click0($a,$b,$ma)

	While $c <> $ma
;~ 		$c=Hex(PixelGetColor($a,$b))
		$ma1=StringReplace($ma,'00','0x')
		$aa=PixelSearch($a-50,$b-50,$a+50,$b+50,$ma1)
		if not @error Then
			$c=Hex(PixelGetColor($aa[0],$aa[1]))
;~ 		 ToolTip($aa[0]&' '&$aa[1],0,0)
		EndIf
;~ 		ToolTip($c,0,0)
	WEnd
EndFunc


Func _click($a,$b,$ma)

	While $c <> $ma
;~ 		$c=Hex(PixelGetColor($a,$b))
;~ 		$ma1=StringReplace($ma,'00','0x')
;~ 		$aa=PixelSearch(30, 48,917, 537, $ma1)
;~ 		if not @error Then
;~ 		 ToolTip($aa[0]&' '&$aa[1],0,0)
;~ 	  EndIf
		$ma1=StringReplace($ma,'00','0x')
		$aa=PixelSearch($a-50,$b-50,$a+50,$b+50,$ma1)
		if not @error Then
			$c=Hex(PixelGetColor($aa[0],$aa[1]))
;~ 		 ToolTip($aa[0]&' '&$aa[1],0,0)
		EndIf
	WEnd
	MouseClick('left',$a,$b,1,0)
EndFunc

Func _clickgift($a,$b,$ma)
	Sleep(500)
	While $c <> $ma
		$c=Hex(PixelGetColor($a,$b))
		If Hex(PixelGetColor(486, 334)) = '00FFA726' Then
			MouseClick('left',486, 334,1,0)
		EndIf
		MouseClick('left',403, 408,1,0)

		Sleep(700)
	WEnd
	While $c <> '00F5711E';cskh
		$c=Hex(PixelGetColor(191, 147))
		MouseClick('left',425, 386,1,0)
		MouseClick('left',$a,$b,1,0)
	WEnd
;~ 	Sleep(700)
	MouseClick('left',$a,$b,1,0)
EndFunc

Func _clicknhanqua($a,$b,$ma)
	While 1
		While $c <> $ma
			If Hex(PixelGetColor(197, 254)) = '00FFE370' Then
				ExitLoop
			EndIf
			$c=Hex(PixelGetColor($a,$b))
		WEnd
		While 1
			MouseClick('left',$a,$b,1,0)
			Sleep(800)
			If Hex(PixelGetColor(197, 254)) <> '00FFE370' Then
				Global $nhanroi=1
				_click(802, 267,'0000B1D9');nhận quà
				_click(614, 270,'00AEB098');captcha
				_click(439, 291,'00570000');input
				_ScreenCapture_Capture(@ScriptDir&'\cap.png',606+10, 257,756, 317)
			;~ 	$9kwResult = _9kwUploadAndGetText("cap.png",$9kwOptions)
;~ 				$captcha=solvecap()
				$captcha=InputBox('','','','',-1,-1,0,0)
				ClipPut($captcha)
;~ 				MsgBox(0,'',$captcha)
				WinActivate('BlueStacks App Player')
				Sleep(500)
				Send('^{v}')
				_click(347, 379,'00FFA726');ok
				While Hex(PixelGetColor(453, 339))<>'00FFA726'
				WEnd
				If Hex(PixelGetColor(460, 331))='00FFA726' Then
					MouseClick('left',460, 331,1,0)
					Sleep(500)
	;~ 				Send('{esc}')
	;~ 				ExitLoop
				Else
					Send('{esc}')
					MouseClick('left',952, 74,1,0)
					ExitLoop(2)
				EndIf
			Else
				Global $nhanroi=1
				ExitLoop(2)
			EndIf
		WEnd
	WEnd
EndFunc

Func solvecap()
	Opt('WinTitleMatchMode',2)
	WinActivate('- OmniPage')
	WinMove('- OmniPage','',0,0,1000,500)
;~ 	WinSetState('- OmniPage','',@SW_MAXIMIZE)
	_click(184, 111,'00D7D494');open
	WinWait('Load Files')
	WinActivate('Load Files')
	WinMove('Load Files','',0,0)
	_click(212, 558,'00FFFFFF');nhap tên
	Send('cap.png')
	Send('{enter}')
	Sleep(1000)
	_click(357, 108,'00ACABAC');scan
	While 1
;~ 		Sleep(1300)
;~ 	   Send('{enter}')
		If WinExists('OCR Proofreader') Then
			Send('{enter}')
		EndIf
	  If WinExists('Text Editor') Then ExitLoop
   WEnd
	WinWait('Text Editor')
	WinClose('Text Editor')
	_click(519, 108,'00C8AC81');clip
	WinWait('Copy to Clipboard')
	WinActivate('Copy to Clipboard')
	WinMove('Copy to Clipboard','',0,0)
	_click0(352, 88,'00848EB0');
	_click(35, 64,'00EFEFEF');plain text
	Send('{enter}')
	_click0(519, 108,'00C8AC81'); done
;~ 	WinWait('Workflow Status')
	WinClose('Workflow Status')
	_click(70, 259,'00F0F0F0');del
	Send('{del}')
;~ 	Opt('WinTitleMatchMode',3)
;~ 	WinWaitActive('OmniPage')
	Send('{enter}')
	Return ClipGet()
EndFunc


Func _exit()
	Exit
EndFunc