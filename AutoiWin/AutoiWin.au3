#RequireAdmin
#include <File.au3>
#include <ScreenCapture.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <WinHTTP.au3>
#include <String.au3>
#include <ImageSearch.au3>

Global $c,$x=0,$y=0,$2login,$2loi1,$2loi2,$2loi3,$2loi4,$2ok1,$2ok2,$3notice1,$4gift,$5nhanqua1,$6captcha,$7captchaok,$8transfer1,$9transfer2,$10transferruby,$11logout1,$12logout2

check3()


HotKeySet('{f4}','_exit')

$haha=InputBox('','Số giây muốn dừng:',2)

$user=FileReadLine(@ScriptDir&'\tkchinh.txt',1)



#Region ### START Koda GUI section ### Form=
$Form3 = GUICreate("iWin", 212, 160, 980, 0)
$Label1 = GUICtrlCreateLabel("Tài khoản phụ: tk.txt", 16, 16, 360, 17)
$Label2 = GUICtrlCreateLabel("Tài khoản chính: tkchinh.txt"&@CRLF&"Tắt unikey trước khi auto", 16, 48, 360, 30)
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
	Global $i=1,$str[10]
	WinMove('BlueStacks App Player','',0,0)
	WinActivate('BlueStacks App Player')

	$sotk=_FileCountLines(@ScriptDir&'\tk.txt')


	While 1
		Global $c,$x=0,$y=0,$2login=2,$2loi1=2,$2loi2=2,$2loi3=2,$2loi4=2,$2ok1=2,$2ok2=2,$2ok3=2,$3notice1=2,$3notice2=2,$3notice3=2,$4gift=2,$5nhanqua1=2,$6captcha=2,$7captchaok=2,$7captchaerror=2,$8transfer1=2,$9transfer2=2,$10transferruby=2,$10tf_2=2,$11logout1=2,$12logout2=2
		GUICtrlSetData($Label3,'Tài khoản hiện tại: '& $i&'/'&$sotk)
		$i+=1
		Global $nhanroi=0
;~ 		$file=FileReadLine(@ScriptDir&'\tk.txt',1)
;~ 		$str=StringSplit($file,',')
		$str[1]=FileReadLine(@ScriptDir&'\tk.txt',1)
		$str[2]=FileReadLine(@ScriptDir&'\pass.txt',1)
		_FileWriteToLine (@ScriptDir&'\tk.txt',1,'',True)
		While 1
			$1=tim('','','1fb.png')
			If $1=1  Then
				$2loi2=0
				$2login=0
				Sleep(700)
				MouseClick('left',618, 374,1,0)
				Sleep(800)
			EndIf
			If $2loi2=0 Then
				$2=tim('', '','2loi2.png')
				If $2=1 And $2loi2=0 Then
					Send('{esc}')
					$2login=0
					$2loi1=1
					$2loi2=1
					$2loi3=1
					$2loi4=1
	;~ 				ExitLoop
				EndIf
			EndIf
			If $2login=0 Then
				$2=tim(362, 253,'2login.png')
				ClipPut($str[1])
				If $2=1 And $2login=0 Then
					Send('^{v}')
					Sleep(500)
					ClipPut($str[2])
					MouseClick('left',396, 292,1,0)
					Sleep(500)
	;~ 				Send('{tab}')
					Send('^{v}')
					Sleep(500)
					MouseClick('left',466, 333,1,0)
	;~ 				Send('{enter}')
					Sleep(1300)
	;~ 				$2login=1
					$2loi1=0
					$2loi3=0
					$2loi4=0
					$2ok1=0
					$2ok2=0
					$2ok3=0
	;~ 				MsgBox(0,'','')
	;~ 				checklogin()
				EndIf
			EndIf
			;==================================

			;=================================
;~ 			$2=tim(688, 554,'2ok1.png')
;~ 			If $2=1 And $2ok1=0 Then
;~ 				$2login=0
;~ 				$2ok1=1
;~ 				$3notice1=0
;~ 				$3notice2=0
;~ 				$4gift=0
;~ 			EndIf
;~ 			$2=tim(688, 554,'2ok3.png')
;~ 			If $2=1 And $2ok3=0 Then
;~ 				$2login=0
;~ 				$2ok3=1
;~ 				$3notice1=0
;~ 				$3notice2=0
;~ 				$4gift=0
;~ 			EndIf
;~ 			$2=tim(301, 509,'2ok2.png')
;~ 			If $2=1 And $2ok2=0 Then
;~ 				$2login=0
;~ 				$2ok2=1
;~ 				$3notice1=0
;~ 				$3notice2=0
;~ 				$3notice3=0
;~ 				$4gift=0
;~ 			EndIf
			;====================================
			If $2loi1=0 Then
				$2=tim('', '','2loi1.png')
				If $2=1 And $2loi1=0 Then
					Send('{esc}')
					$2login=0
					$2loi1=1
					$2loi2=1
					$2loi3=1
					$2loi4=1
					ExitLoop
				EndIf
			EndIf
			If $2loi3=0 Then
				$2=tim('', '','2loi3.png')
				If $2=1 And $2loi3=0 Then
					Send('{esc}')
					$2login=0
					$2loi1=1
					$2loi2=1
					$2loi3=1
					$2loi4=1
					ExitLoop
				EndIf
			EndIf
			If $2loi4=0 Then
				$2=tim('', '','2loi4.png')
				If $2=1 And $2loi4=0 Then
					Send('{esc}')
					$2login=0
					$2loi1=1
					$2loi2=1
					$2loi3=1
					$2loi4=1
					ExitLoop
				EndIf
			EndIf
;~ 			If $2ok1=0 Then
;~ 				$2=tim(688, 554,'2ok1.png')
;~ 				If $2=1 And $2ok1=0 Then
;~ 					$2login=0
;~ 					$2ok1=1
;~ 					$3notice1=0
;~ 					$3notice2=0
;~ 					$3notice3=0
;~ 					$4gift=0
;~ 				EndIf
;~ 			EndIf
;~ 			If $2ok3=0 Then
;~ 				$2=tim(688, 554,'2ok3.png')
;~ 				If $2=1 And $2ok3=0 Then
;~ 					$2login=0
;~ 					$2ok3=1
;~ 					$3notice1=0
;~ 					$3notice2=0
;~ 					$3notice3=0
;~ 					$4gift=0
;~ 				EndIf
;~ 			EndIf
;~ 			If $2ok2=0 Then
;~ 				$2=tim(301, 509,'2ok2.png')
;~ 				If $2=1 And $2ok2=0 Then
;~ 					$2login=0
;~ 					$2ok2=1
;~ 					$3notice1=0
;~ 					$3notice2=0
;~ 					$3notice3=0
;~ 					$4gift=0
;~ 				EndIf
;~ 			EndIf
			If $3notice2=0 Then
				$3_2=tim1(527, 367,'3notice2.png')
				If $3_2=1 And $3notice2=0 Then
					$3notice2=1
					$4gift=0
					Sleep(200)
				EndIf
			EndIf
;~ 			If $3notice3=0 Then
;~ 				$3_3=tim1(527, 367,'3notice2.png')
;~ 				If $3_3=1 And $3notice3=0 Then
;~ 					$3notice3=1
;~ 					$4gift=0
;~ 					Sleep(200)
;~ 				EndIf
;~ 			EndIf
			If $3notice1=0 Then
;~ 				$3_1=tim(517, 373,'3notice1.png')
				$3_1=tim('','','3notice1.png')
				If $3_1=1 And $3notice1=0 Then
;~ 					$3notice1=1
					$4gift=0
					Send('{esc}')
				EndIf
			EndIf
			If $4gift=0 Then
				$4=tim('','','4gift.png')
				If $4=1 And $4gift=0 And $11logout1<>0 Then
					$4gift=1
					$5nhanqua1=0
					MouseClick('left',731, 532,1,0)

				EndIf
			EndIf
			If $5nhanqua1=0 Then
				$5=tim(866,296,'5nhanqua1.png')
				If $5=1 And $5nhanqua1=0 Then
					$5nhanqua1=1
					$6captcha=0
					Sleep(500)
				EndIf
			EndIf
			If $6captcha=0 Then
				$6=tim('', '','6captcha.png')
				If $6=1 And $6captcha=0 Then
					$6captcha=1
					$captcha=InputBox('','Captcha','','',-1,-1,0,0)
					MouseClick('left',358, 285,1,0)
					Sleep(500)
					Send($captcha)
					MouseClick('left',370, 381,1,0)
					$7captchaok=0
					$7captchaerror=0
				EndIf
			EndIf
			If $7captchaok=0 Then
				$7=tim('', '','7captchaok.png')
				If $7=1 And $7captchaok=0 Then
					$7captchaok=1
					Send('{esc}')
					Send('{esc}')
					$8transfer1=0
				EndIf
			EndIf
			If $7captchaerror=0 Then
				$7=tim(487, 348,'7captchaerror.png')
				If $7=1 And $7captchaerror=0 Then
					$7captchaerror=1
					$8transfer1=0
					$5nhanqua1=0

					$5=tim(866,296,'5nhanqua1.png')
					If $5=1 And $5nhanqua1=0 Then
						$5nhanqua1=1
						$6captcha=0
					EndIf

				EndIf
			EndIf
			If $8transfer1=0 Then
				$8=tim('','','8transfer1.png')
				If $8=1 And $8transfer1=0 Then
					MouseClick('left',69, 531,1,0)
					$8transfer1=1
					$9transfer2=0
					Sleep(500)
				EndIf
			EndIf
			If $9transfer2=0 Then
				$9=tim(149, 496,'9transfer2.png')
				If $9=1 And $9transfer2=0 Then
					$9transfer2=1
					$10transferruby=0
				EndIf
			EndIf
			If $10transferruby=0 Then
				$10=tim(536, 201,'10transferruby.png')
				If $10=1 And $10transferruby=0 Then
					$10transferruby=1
					MouseClick('left',394, 255,1,0)
					ClipPut($user)
					Sleep(500)
					Send('^{v}')
					Sleep(500)
					MouseClick('left',403, 318,1,0)
					Sleep(500)
					Send(2000)
					Sleep(200)
					MouseClick('left',487, 457,1,0)
;~ 					Sleep(200)
					MouseClick('left',387, 379,1,0)
					Sleep(200)
					$11logout1=0
					Send('{esc}')
					Send('{esc}')
					Send('{esc}')
				EndIf
			EndIf
;~ 			If $10tf_2=0 Then
;~ 				$10_2=tim('','','3notice2.png')
;~ 				If $10_2=1 And $10tf_2=0 Then
;~ 					$10tf_2=1
;~ 					$11logout1=0
;~ 					Sleep(200)
;~ 					Send('{esc}')
;~ 					Send('{esc}')
;~ 					Send('{esc}')
;~ 				EndIf
;~ 			EndIf
			If $11logout1=0 Then
				$11=tim('', '','11logout1.png')
				If $11=1 And $11logout1=0 Then
					$11logout1=1
					$12logout2=0
					MouseClick('left',915, 536,1,0)
					Sleep(500)
					MouseWheel('down',10)
					Sleep(800)
				EndIf
			EndIf
			If $12logout2=0 Then
				$12=tim(574, 556,'12logout2.png')
				If $12=1 And $12logout2=0 Then
					$12logout2=1
					MouseClick('left',372, 320,1,0)
					MouseClick('left',390, 403,1,0)
					ExitLoop
				EndIf
			EndIf
			;================
			If $2ok1=0 Then
				$2=tim2(688, 554,'2ok1.png')
				ToolTip('1',0,0)
				If $2=1 And $2ok1=0 Then
					$2login=0
					$2ok2=1
					$2ok1=1
					$2ok3=1
					$3notice1=0
					$3notice2=0
					$3notice3=0
					$4gift=0
					Sleep($haha*1000)
				EndIf
			EndIf
			If $2ok2=0 Then
				$2=tim3(301, 509,'2ok2.png')
				ToolTip('2',0,0)
				If $2=1 And $2ok2=0 Then
					$2login=0
					$2ok2=1
					$2ok1=1
					$2ok3=1
					$3notice1=0
					$3notice2=0
					$3notice3=0
					$4gift=0
					Sleep($haha*1000)
				EndIf
			EndIf
			If $2ok3=0 Then
				$2=tim2(688, 554,'2ok3.png')
				ToolTip('3',0,0)
				If $2=1 And $2ok3=0 Then
					$2login=0
					$2ok2=1
					$2ok1=1
					$2ok3=1
					$3notice1=0
					$3notice2=0
					$3notice3=0
					$4gift=0
					Sleep($haha*1000)
				EndIf
			EndIf
			;================
		WEnd

	WEnd
EndFunc

Func checklogin()
	$2=tim(688, 554,'2ok1.png')
	If $2=1 And $2ok1=0 Then
		$2login=0
		$2ok1=1
		$3notice1=0
		$3notice2=0
		$4gift=0
	EndIf
	$2=tim(688, 554,'2ok3.png')
	If $2=1 And $2ok3=0 Then
		$2login=0
		$2ok3=1
		$3notice1=0
		$3notice2=0
		$4gift=0
			EndIf
EndFunc

Func tim($a,$b,$fileanh)
	$fileanh=@ScriptDir&'\anh\'&$fileanh
	$kq=_ImageSearchArea($fileanh,0,0,0,959, 582,$x,$y,0)
	If $kq=1 And $a<>'' And $b<>'' Then
		Sleep(300)
		MouseClick('left',$a,$b,1,0)
		Sleep(200)
		Return 1
	EndIf
	If $kq=1 Then
		Return 1
	EndIf
EndFunc

Func tim1($a,$b,$fileanh)
	$fileanh=@ScriptDir&'\anh\'&$fileanh
	$kq=_ImageSearchArea($fileanh,0,446, 344,526, 389,$x,$y,0)
	If $kq=1 And $a<>'' And $b<>'' Then
		Sleep(300)
		MouseClick('left',$a,$b,1,0)
		Sleep(200)
		Return 1
	EndIf
	If $kq=1 Then
		Return 1
	EndIf
EndFunc

Func tim2($a,$b,$fileanh)
	$fileanh=@ScriptDir&'\anh\'&$fileanh
	$kq=_ImageSearchArea($fileanh,0,255, 310,789, 362,$x,$y,0)
	If $kq=1 And $a<>'' And $b<>'' Then
		Sleep(300)
		MouseClick('left',$a,$b,1,0)
		Sleep(200)
		Return 1
	EndIf
	If $kq=1 Then
		Return 1
	EndIf
EndFunc

Func tim3($a,$b,$fileanh)
	$fileanh=@ScriptDir&'\anh\'&$fileanh
	$kq=_ImageSearchArea($fileanh,0,131, 130,221, 400,$x,$y,0)
	If $kq=1 And $a<>'' And $b<>'' Then
		Sleep(300)
		MouseClick('left',$a,$b,1,0)
		Sleep(200)
		Return 1
	EndIf
	If $kq=1 Then
		Return 1
	EndIf
EndFunc

Func check3()
	$open=_WinHttpOpen()
	$connect=_WinHttpConnect($open,'autoboom-mh.blogspot.com')
	$request=_WinHttpOpenRequest($connect,'GET','/p/blog-page_80.html')

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

Func _exit()
	Exit
EndFunc