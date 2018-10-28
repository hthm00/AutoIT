#RequireAdmin
#include <File.au3>
#include <IE.au3>
#include <String.au3>
#include <Array.au3>
#include <FF.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

#include <GUIConstants.au3>

Global $str1[1000],$stt[1000],$id


#Region ### START Koda GUI section ### Form=
$Form3 = GUICreate("Auto Add Tập", 279, 174, 1012, 144)
$Label1 = GUICtrlCreateLabel("ID", 16, 16, 36, 17)
$Input1 = GUICtrlCreateInput("", 64, 16, 65, 21)
$Label2 = GUICtrlCreateLabel("Link phim:", 16, 48, 50, 17)
$Input2 = GUICtrlCreateInput("", 64, 48, 129, 21)
$Button3 = GUICtrlCreateButton("Let's Go", 184, 16, 75, 25)
$Label3 = GUICtrlCreateLabel("Up từ số:", 16, 96, 50, 17)
$Input3 = GUICtrlCreateInput("", 64, 96, 33, 21)
$Label4 = GUICtrlCreateLabel("Đến", 104, 96, 28, 17)
$Input4 = GUICtrlCreateInput("", 136, 96, 33, 21)
$Button1 = GUICtrlCreateButton("Auto", 184, 96, 75, 25)
$Button2 = GUICtrlCreateButton("Up tay", 184, 128, 75, 25)
$Label5 = GUICtrlCreateLabel("", 208, 48, 70, 17)
$Checkbox1 = GUICtrlCreateCheckbox("Lấy link thông minh", 16, 72, 161, 17)

GUICtrlSetState($Checkbox1,$GUI_CHECKED)
GUICtrlSetState($Label3,$GUI_HIDE)
GUICtrlSetState($Input3,$GUI_HIDE)
GUICtrlSetState($Label4,$GUI_HIDE)
GUICtrlSetState($Input4,$GUI_HIDE)
GUICtrlSetState($Button1,$GUI_HIDE)
GUICtrlSetState($Button2,$GUI_HIDE)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button3
			$id=GUICtrlRead($Input1)
			chay()

	EndSwitch
	$link=GUICtrlRead($Input2)
	If StringInStr($link,'youtube.com')<>0 Then
		GUICtrlSetData($Label5,'Youtube')
	ElseIf StringInStr($link,'phimbathu.com')<>0 Then
		GUICtrlSetData($Label5,'Phim Bất Hủ')
	ElseIf StringInStr($link,'phim14.net')<>0 Then
		GUICtrlSetData($Label5,'Phim14')
	ElseIf StringInStr($link,'bilutv.com')<>0 Then
		GUICtrlSetData($Label5,'Bilu TV')
	ElseIf $link='' Then
		GUICtrlSetData($Label5,'')
	Else
		GUICtrlSetData($Label5,'Nguồn ko biết')
	EndIf
WEnd

Func chay()
	If StringInStr($link,'youtube.com')<>0 Then
		upyt()
	ElseIf StringInStr($link,'phimbathu.com')<>0 Then
		upbh()
	ElseIf StringInStr($link,'phim14.net')<>0 Then
		up14()
	ElseIf StringInStr($link,'bilutv.com')<>0 Then
		upbilu()
	EndIf
EndFunc


Func upyt()
	While 1
		$ie=_IECreate($link)
		$txt=_IEBodyReadHTML($ie)
		$uuuu=_StringBetween($txt,'yt-uix-sessionlink  spf-link  playlist-video clearfix        spf-link " href="','"')
		$stt1=StringRegExp($txt,'<h4 class="yt-ui-ellipsis yt-ui-ellipsis-2">\R(.*?)\R      </h4>',3)
		$file=@ScriptDir&'\phim.txt'
		$text=''
		$hopen=FileOpen($file,2)
		FileClose($hopen)
		For $tt=0 To UBound($uuuu)-1
			$text&=$stt1[$tt]&','&$uuuu[$tt]&@CRLF
		Next
		FileWrite($file,$text)
		Run('notepad.exe'&' '&$file,@WindowsDir,@SW_MAXIMIZE)
		MsgBox(0,'','Xóa các tập ko hợp lý!')
		$uuuu=0
		$stt1=0
		Local $uuuu[500],$stt1[500]
		For $p=1 To _FileCountLines($file)
			$line=FileReadLine($file,$p)
			$b=StringSplit($line,',')
			$uuuu[$p]=$b[2]
			$stt1[$p]=$b[1]
		Next
		For $p=UBound($uuuu)-1 To 0 Step -1
			If $uuuu[$p]='' Then
				_ArrayDelete($uuuu,$p)
				_ArrayDelete($stt1,$p)
			EndIf
		Next
		If GUICtrlRead($Checkbox1)=1 Then
			For $j=UBound($stt1)-1 To 0 Step -1
				$stt2=StringRegExp($stt1[$j],'\d+',1)
				If @error=1 Then
					$stt[UBound($stt1)-1-$j]=InputBox('Ko rõ tập','Này tập mấy vậy?'&@CRLF&$stt1[$j])
				Else
					$stt[UBound($stt1)-1-$j]=$stt2[0]
				EndIf
			Next
			For $ii=0 To UBound($uuuu)-1
				$str1[$stt[$ii]]='https://www.youtube.com'&$uuuu[UBound($uuuu)-1-$ii]
			Next
		Else
			$str1=$uuuu
			For $ii=0 To UBound($uuuu)-1
				$str1[$ii]='https://www.youtube.com'&$uuuu[$ii]
			Next
			$stt=$stt1
		EndIf
		$ten=$stt1[0]
		$sotapdung=UBound($stt1)-1


		GUICtrlSetState($Label3,$GUI_SHOW)
		GUICtrlSetState($Input3,$GUI_SHOW)
		GUICtrlSetState($Label4,$GUI_SHOW)
		GUICtrlSetState($Input4,$GUI_SHOW)
		GUICtrlSetState($Button1,$GUI_SHOW)
		GUICtrlSetState($Button2,$GUI_SHOW)
		GUICtrlSetData($Input3,0)
		GUICtrlSetData($Input4,$sotapdung)
		_ArrayDisplay($stt)
		While 1
		$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $GUI_EVENT_CLOSE
					Exit
				Case $Button1
					_ArrayDisplay($str1)
					auto()
					ExitLoop
				Case $Button2
					tulam()
					ExitLoop
			EndSwitch
		WEnd
		_IEQuit($ie)
		GUICtrlSetState($Label3,$GUI_HIDE)
		GUICtrlSetState($Input3,$GUI_HIDE)
		GUICtrlSetState($Label4,$GUI_HIDE)
		GUICtrlSetState($Input4,$GUI_HIDE)
		GUICtrlSetState($Button1,$GUI_HIDE)
		GUICtrlSetState($Button2,$GUI_HIDE)
		ExitLoop
	WEnd
EndFunc

Func upbh()
	While 1
		$ie3=_IECreate($link)
		Local $oIns = _IETagNameGetCollection($ie3, "a")
		For $oIn In $oIns
			If String($oIn.classname) = "btn-see btn btn-info adspruce-streamlink" Then
				ExitLoop
			EndIf
		Next
		_IEAction($oIn,'click')
		_IELoadWait($ie3)
		$linkxem=_IEPropertyGet($ie3,'locationurl')
		_IEQuit($ie3)

		$ie=_IECreate($linkxem)
		$txt=_IEBodyReadHTML($ie)
		ClipPut($txt)
		$tenvi=_StringBetween($txt,'"name">','</h1>')
		$tenen=_StringBetween($txt,'real-name">','</h2>')
		$ten=$tenvi[0]&' - '&$tenen[0]
		$uuuu=_StringBetween($txt,'<a class="current" href="','">')
		$str1[0]=$uuuu[0]
		$uuuu1=_StringBetween($txt,'<div class="list-episode" id="list_episodes">','</div>')
		$uuuu=_StringBetween($uuuu1[0],'<a href="','">')
		$stt=_StringBetween($uuuu1[0],'">','</a>')
		$sotapdung=UBound($stt)-1
		For $k=UBound($stt)-1 To 0 Step -1
			If StringInStr($stt[$k],'-')<>0 Then
				If StringInStr($stt[$k],'End')<>0 Then
				Else
					$sotapdung-=1
				EndIf
			EndIf
		Next
		For $ii=0 To UBound($uuuu)-1
			$str1[$ii+1]=$uuuu[$ii]
		Next
		GUICtrlSetState($Label3,$GUI_SHOW)
		GUICtrlSetState($Input3,$GUI_SHOW)
		GUICtrlSetState($Label4,$GUI_SHOW)
		GUICtrlSetState($Input4,$GUI_SHOW)
		GUICtrlSetState($Button1,$GUI_SHOW)
		GUICtrlSetState($Button2,$GUI_SHOW)
		GUICtrlSetData($Input3,0)
		GUICtrlSetData($Input4,$sotapdung)
		_ArrayDisplay($stt)
		While 1
		$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $GUI_EVENT_CLOSE
					Exit
				Case $Button1
					auto()
					ExitLoop
				Case $Button2
					tulam()
					ExitLoop
			EndSwitch
		WEnd
		_IEQuit($ie)
		GUICtrlSetState($Label3,$GUI_HIDE)
		GUICtrlSetState($Input3,$GUI_HIDE)
		GUICtrlSetState($Label4,$GUI_HIDE)
		GUICtrlSetState($Input4,$GUI_HIDE)
		GUICtrlSetState($Button1,$GUI_HIDE)
		GUICtrlSetState($Button2,$GUI_HIDE)
		ExitLoop
	WEnd
EndFunc

Func auto()
	If GUICtrlRead($Input3)<=GUICtrlRead($Input4) Then
		$step=1
	Else
		$step=-1
	EndIf
	For $l=GUICtrlRead($Input3) To GUICtrlRead($Input4) Step $step
		$linkphim=$str1[$l]
		$linkthemtap='http://phimtuan.net/admin/films/'&$id&'/episodes/create'
		$ie5=_IECreate($linkthemtap)
		$form=_IEFormGetCollection($ie5,0)
		$linkph=_IEFormElementGetCollection($form,2)
		WinMove('Phim Tuần AdminCP - Internet Explorer','',0,0,500,500)
		WinActivate('Phim Tuần AdminCP - Internet Explorer')
		_IEAction($linkph,'scrollintoview')
		ClipPut($linkphim)
		Sleep(500)
		MouseClick('left',196, 74,1,0)
		Sleep(500)
		Send('^{v}')
		Sleep(500)
		_IEFormSubmit($form)
		_IELoadWait($ie5)
		_IEQuit($ie5)
	Next
EndFunc

Func tulam()
	$bla=$str1
	_FFStart('http://phimtuan.net/admin/films/'&$id&'/episodes')
	_ArrayDisplay($bla)
EndFunc

Func upbilu()
	While 1
		$ie3=_IECreate($link)
		Local $oIns = _IETagNameGetCollection($ie3, "a")
		For $oIn In $oIns
			If String($oIn.classname) = "btn-see btn btn-danger" Then
				ExitLoop
			EndIf
		Next
		_IEAction($oIn,'click')
		_IELoadWait($ie3)
		$linkxem=_IEPropertyGet($ie3,'locationurl')
		_IEQuit($ie3)

		$ie=_IECreate($linkxem)
		$txt=_IEBodyReadHTML($ie)
		$tenvi=_StringBetween($txt,'<h1>','</h1>')
		$tenen=_StringBetween($txt,'real-name">','</h2>')
		$ten=$tenvi[0]&' - '&$tenen[0]
		$uuuu=_StringBetween($txt,'<li><a class="current" href="','">')
		$str1[0]=$uuuu[0]
		$uuuu1=_StringBetween($txt,'<ul class="list-episode" id="list_episodes">','</ul>')
		$uuuu=_StringBetween($uuuu1[0],'<li><a href="','">')
		$stt=_StringBetween($uuuu1[0],'">','</a>')
		$sotapdung=UBound($stt)-1
		For $k=UBound($stt)-1 To 0 Step -1
			If StringInStr($stt[$k],'-')<>0 Then
				If StringInStr($stt[$k],'End')<>0 Then
				Else
					$sotapdung-=1
				EndIf
			EndIf
		Next
		For $ii=0 To UBound($uuuu)-1
			$str1[$ii+1]=$uuuu[$ii]
		Next
		GUICtrlSetState($Label3,$GUI_SHOW)
		GUICtrlSetState($Input3,$GUI_SHOW)
		GUICtrlSetState($Label4,$GUI_SHOW)
		GUICtrlSetState($Input4,$GUI_SHOW)
		GUICtrlSetState($Button1,$GUI_SHOW)
		GUICtrlSetState($Button2,$GUI_SHOW)
		GUICtrlSetData($Input3,0)
		GUICtrlSetData($Input4,$sotapdung)
		_ArrayDisplay($stt)
		While 1
		$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $GUI_EVENT_CLOSE
					Exit
				Case $Button1
					auto()
					ExitLoop
				Case $Button2
					tulam()
					ExitLoop
			EndSwitch
		WEnd
		_IEQuit($ie)
		GUICtrlSetState($Label3,$GUI_HIDE)
		GUICtrlSetState($Input3,$GUI_HIDE)
		GUICtrlSetState($Label4,$GUI_HIDE)
		GUICtrlSetState($Input4,$GUI_HIDE)
		GUICtrlSetState($Button1,$GUI_HIDE)
		GUICtrlSetState($Button2,$GUI_HIDE)
		ExitLoop
	WEnd
EndFunc

Func up14()
	While 1
		$ie3=_IECreate($link)
		Local $oIns = _IETagNameGetCollection($ie3, "a")
		For $oIn In $oIns
			If String($oIn.classname) = "watch_button now" Then
				ExitLoop
			EndIf
		Next
		_IEAction($oIn,'click')
		_IELoadWait($ie3)
		$linkxem=_IEPropertyGet($ie3,'locationurl')
		_IEQuit($ie3)

		$ie=_IECreate($linkxem)
		$txt=_IEBodyReadHTML($ie)
		$tenvi=_StringBetween($txt,'<h1><a title="','"')
;~ 		$tenen=_StringBetween($txt,'real-name">','</h2>')
		$ten=$tenvi[0]
		$uuuu1=_StringBetween($txt,'<ul class="episode_list">','</ul>')
		$uuuu=_StringBetween($uuuu1[0],'href="','"')
		$stt=_StringBetween($uuuu1[0],'"watch">','</a>')
		$sotapdung=UBound($stt)-1
		For $k=UBound($stt)-1 To 0 Step -1
			If StringInStr($stt[$k],'-')<>0 Then
				If StringInStr($stt[$k],'End')<>0 Then
				Else
					$sotapdung-=1
				EndIf
			EndIf
		Next
		For $ii=0 To UBound($uuuu)-1
			$str1[$ii+1]=$uuuu[$ii]
		Next
		GUICtrlSetState($Label3,$GUI_SHOW)
		GUICtrlSetState($Input3,$GUI_SHOW)
		GUICtrlSetState($Label4,$GUI_SHOW)
		GUICtrlSetState($Input4,$GUI_SHOW)
		GUICtrlSetState($Button1,$GUI_SHOW)
		GUICtrlSetState($Button2,$GUI_SHOW)
		GUICtrlSetData($Input3,0)
		GUICtrlSetData($Input4,$sotapdung)
		_ArrayDisplay($stt)
		While 1
		$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $GUI_EVENT_CLOSE
					Exit
				Case $Button1
					auto()
					ExitLoop
				Case $Button2
					tulam()
					ExitLoop
			EndSwitch
		WEnd
		_IEQuit($ie)
		GUICtrlSetState($Label3,$GUI_HIDE)
		GUICtrlSetState($Input3,$GUI_HIDE)
		GUICtrlSetState($Label4,$GUI_HIDE)
		GUICtrlSetState($Input4,$GUI_HIDE)
		GUICtrlSetState($Button1,$GUI_HIDE)
		GUICtrlSetState($Button2,$GUI_HIDE)
		ExitLoop
	WEnd
EndFunc

