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
Global $koxoa=0
check3()




$user=FileReadLine(@ScriptDir&'\tkchinh.txt',1)
Opt('WinTitleMatchMode',3)



#Region ### START Koda GUI section ### Form=
$Form3 = GUICreate("iWin",213, 244, 980, 0)
;~ $Label1 = GUICtrlCreateLabel("Tài khoản phụ: tk.txt", 16, 16, 360, 17)
;~ $Label2 = GUICtrlCreateLabel("Tài khoản chính: tkchinh.txt"&@CRLF&"Tắt unikey trước khi auto", 16, 48, 360, 30)
$Label3 = GUICtrlCreateLabel("", 16, 128, 360, 17)
GUICtrlSetColor(-1, '0xE1280B')
$Button1 = GUICtrlCreateButton("Bắt đầu", 16, 88, 83, 25)
;~ $Button2 = GUICtrlCreateButton("F4 để dừng", 112, 88, 83, 25)
$Input1 = GUICtrlCreateInput("MEmu 2.9.2 - MEmu", 80, 16, 113, 21)
$Label1 = GUICtrlCreateLabel("Auto By Minh Huỳnh", 16, 224, 164, 17)
$Label2 = GUICtrlCreateLabel("Tên cửa sổ:", 16, 19, 60, 17)
$Label4 = GUICtrlCreateLabel("Số giây chờ:", 16, 56, 60, 17)
$Input2 = GUICtrlCreateInput("3", 80, 53, 113, 21)
$Label5 = GUICtrlCreateLabel("Delay (ms):", 16, 163, 52, 17)
$Input3 = GUICtrlCreateInput("100", 80, 160, 113, 21)
$Label6 = GUICtrlCreateLabel("Dừng:", 112, 91, 36, 17)
$Input4 = GUICtrlCreateInput("F4", 152, 88, 49, 21)
$Label7 = GUICtrlCreateLabel("Captcha:", 16, 195, 52, 17)
$Input5 = GUICtrlCreateInput("", 80, 192, 113, 21)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###


While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			HotKeySet('{'&GUICtrlRead($Input4)&'}','_exit')
			batdau()

	EndSwitch

WEnd

Func _click($xx,$yy)
	ControlClick($title,'','','left',1,$xx,$yy)
EndFunc

Func _Send($ttxt)
	ControlSend($title,'','',$ttxt)
EndFunc


Func batdau()
	Global $i=1,$str[10]
	Global $title=GUICtrlRead($Input1)
	Global $pos=WinGetPos($title)
;~ 	WinMove($title,'',0,0)
	WinActivate($title)

	$sotk=_FileCountLines(@ScriptDir&'\tk.txt')
	$haha= GUICtrlRead($Input2)


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
				_click(425, 183)
;~ 				MouseClick('left',618, 374,1,0)
				Sleep(800)
			EndIf
			If $2loi2=0 Then
				$2=tim('', '','2loi2.png')
				If $2=1 And $2loi2=0 Then
					_Send('{esc}')
					$2login=0
					$2loi1=1
					$2loi2=1
					$2loi3=1
					$2loi4=1
	;~ 				ExitLoop
				EndIf
			EndIf
			If $2login=0 Then
				$2=tim(204, 232,'2login.png')
;~ 				ClipPut($str[1])
				If $2=1 And $2login=0 Then
					Opt('SendKeyDelay',GUICtrlRead($Input3))
					Sleep(800)
					_Send($str[1])
;~ 					ClipPut($str[2])
					Sleep(500)
					_click(234, 266)
					Sleep(800)
	;~ 				_Send('{tab}')
					_Send($str[2])
					Sleep(500)
					_click(325, 305)
	;~ 				_Send('{enter}')
					Sleep(1300)
;~ 					Opt('SendKeyDelay',5)
					Sleep($haha*1000)
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
;~ 			If $2=1 And $nzj31622@noicd.comzxzxzx2ok3=0 Then
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
					_Send('{esc}')
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
					_Send('{esc}')
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
					_Send('{esc}')
					$2login=0
					$2loi1=1
					$2loi2=1
					$2loi3=1
					$2loi4=1
					_FileWriteToLine (@ScriptDir&'\tk.txt',1,$str[1])
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
				$3_2=tim(328, 220,'3notice2.png')
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
					_Send('{esc}')
				EndIf
			EndIf
			If $4gift=0 Then
				$4=tim('','','4gift.png')
				If $4=1 And $4gift=0 And $11logout1<>0 Then
					$4gift=1
					$5nhanqua1=0
					_click(558, 314)

				EndIf
			EndIf
			If $5nhanqua1=0 Then
				$5=tim(591, 95,'5nhanqua1.png')
				If $5=1 And $5nhanqua1=0 Then
					$5nhanqua1=1
					$6captcha=0
;~ 					Sleep(1000)
				EndIf
			EndIf
			If $6captcha=0 Then
				$6=tim('', '','6captcha.png')
				If $6=1 And $6captcha=0 Then
					$6captcha=1
					$captcha=InputBox('','Captcha','','',-1,-1,$pos[0],$pos[1])
					_click(259, 174)
;~ 					ClipPut($captcha)
					Sleep(500)
					_Send($captcha)
					Sleep(500)
					_click(252, 226)
					$7captchaok=0
					$7captchaerror=0
					$3notice2=1
				EndIf
			EndIf
			If $7captchaok=0 Then
				$7=tim('', '','7captchaok.png')
				If $7=1 And $7captchaok=0 Then
					$7captchaok=1
					_Send('{esc}')
					_Send('{esc}')
					$8transfer1=0
				EndIf
			EndIf
			If $7captchaerror=0 Then
				$7=tim(328, 210,'7captchaerror.png')
				If $7=1 And $7captchaerror=0 Then
					$7captchaerror=1
					$8transfer1=0
					$5nhanqua1=0
;~ 					 Sleep(1000)
;~ 					$5=tim(588, 152,'5nhanqua1.png')
;~ 					If $5=1 And $5nhanqua1=0 Then
;~ 						$5nhanqua1=1
;~ 						$6captcha=0
;~ 					EndIf

				EndIf
			EndIf
			If $8transfer1=0 Then
				$8=tim('','','8transfer1.png')
				If $8=1 And $8transfer1=0 Then
					_click(33, 310)
					$8transfer1=1
					$9transfer2=0
					Sleep(500)
				EndIf
			EndIf
			If $9transfer2=0 Then
				$9=tim(102, 256,'9transfer2.png')
				If $9=1 And $9transfer2=0 Then
					$9transfer2=1
					$10transferruby=0
				EndIf
			EndIf
			If $10transferruby=0 Then
				$10=tim(349, 111,'10transferruby.png')
				If $10=1 And $10transferruby=0 Then
					$10transferruby=1
					_click(289, 142)
;~ 					ClipPut($user)
					Sleep(500)
					_Send($user)
					Sleep(500)
					_click(222, 199)
					Sleep(500)
					_Send(2000)
					Sleep(200)
					_click(331, 278)
;~ 					Sleep(200)
					_click(253, 224)
					Sleep(abs(($haha-1.5))*1000)
					$11logout1=0
					_Send('{esc}')
					_Send('{esc}')
					_Send('{esc}')
				EndIf
			EndIf
;~ 			If $10tf_2=0 Then
;~ 				$10_2=tim('','','3notice2.png')
;~ 				If $10_2=1 And $10tf_2=0 Then
;~ 					$10tf_2=1
;~ 					$11logout1=0
;~ 					Sleep(200)
;~ 					_Send('{esc}')
;~ 					_Send('{esc}')
;~ 					_Send('{esc}')
;~ 				EndIf
;~ 			EndIf
			If $11logout1=0 Then
				$11=tim('', '','11logout1.png')
				If $11=1 And $11logout1=0 Then
					$11logout1=1
					$12logout2=0
					_click(630, 313)
					Sleep(500)
					_click(401, 242)
					WinActivate($title)
					MouseMove($pos[0]+466,$pos[1]+239,10)
					MouseWheel('down',10)
					Sleep(800)
				EndIf
			EndIf
			If $12logout2=0 Then
				$12=tim(371, 318,'12logout2.png')
				If $12=1 And $12logout2=0 Then
					$12logout2=1
					Sleep(800)
					_click(269, 193)
					_click(253, 237)
					ExitLoop
				EndIf
			EndIf
			;================
			If $2ok1=0 Then
				$2=tim2(688, 554,'2ok1.png')
				If $2=1 And $2ok1=0 Then
					$2login=0
					$2ok2=1
					$2ok1=1
					$2ok3=1
					$3notice1=0
					$3notice2=0
					$3notice3=0
					$4gift=0
;~ 					Sleep($haha*1000)
				EndIf
			EndIf
			If $2ok2=0 Then
				$2=tim(-1, 0,'2ok2.png')
;~ 				ToolTip('2',0,0)
				If $2=1 And $2ok2=0 Then
;~ 				   _click(474, 233)
;~ 				   _click(474, 243)
;~ 				   _click(474, 253)
;~ 				   _click(474, 263)
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
				$2=tim(373, 303,'2ok3.png')
;~ 				ToolTip('3',0,0)
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
	$kq=_ImageSearchArea($fileanh,0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,0)
	If $kq=1 And $a<>'' And $b<>'' Then
		Sleep(300)
		ControlClick($title,'','','left',1,$a,$b)
		Sleep(200)
		Return 1
	 EndIf
	 If $a=-1 Then
		Sleep(300)
		ControlClick($title,'','','left',1,$x-$pos[0],$y-$pos[1])
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