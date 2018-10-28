#RequireAdmin
#include <File.au3>
#include <IE.au3>
#include <String.au3>
#include <Array.au3>
#include <FF.au3>

HotKeySet('{F4}','pause')
Global $ten,$link,$id,$sth

Func pause()
	$a=MsgBox(4,'Cập nhật không?',$ten&@CRLF&'Tập: '&$sth)
	If $a=6 Then
		_IECreate($link)
		_FFStart('http://phimtuan.net/admin/films/'&$id&'/episodes')
		MsgBox(0,'','Cập nhật đi!!')
	EndIf
EndFunc

While 1
	Global $str1[100],$u,$stt,$iii,$tapmoi,$stt1
	$file=@ScriptDir&'\tenfile.txt'
	$line=_FileCountLines($file)
	Local $tenfile[$line+1]
	For $i=1 To $line
		$tenfile[$i]=FileReadLine($file,$i)
	Next

	For $i=1 To UBound($tenfile)-1
		$file=@ScriptDir&'\'&$tenfile[$i]&'.csv'
		$line=_FileCountLines($file)
		For $i=2 To $line
			Local $dong[$line+1]
			$dong[$i]=FileReadLine($file,$i)
			$muc=StringSplit($dong[$i],',')
			$id=$muc[1]
			$ten=$muc[2]
			If $id<>'' Then
				$link=$muc[4]
				$banquyen=$muc[7]
				$tap=$muc[8]
				$status=$muc[9]
				If StringInStr($status,'xong')<>0 Or StringInStr($banquyen,'bản quyền')<>0 Then
				ElseIf $tap='' Or $tap=' ' Then
				Else
					$a=StringRegExp($muc[8], '\d+', 1)
					$tap=$a[0]
					uptap()
				EndIf
			EndIf
		Next
	Next
WEnd

Func uptap()
	If StringInStr($link,'youtube.com')<>0 Then
		upyt()
	ElseIf StringInStr($link,'phimbathu.com')<>0 Then
		upbh()
	ElseIf StringInStr($link,'phim14.net')<>0 Then
		up14()
	ElseIf StringInStr($link,'bilutv.com')<>0 Then
		upbilu()
	ElseIf StringInStr($link,'phimmoi.net')<>0 Then
		uppm()
	Else
		TrayTip('Nguồn không biết','',2)
	EndIf
EndFunc

Func upyt()
	While 1
		$ie=_IECreate($link,0,0)
		$txt=_IEBodyReadHTML($ie)
		$u=_StringBetween($txt,'yt-uix-sessionlink  spf-link  playlist-video clearfix        spf-link " href="','"')
		$stt1=StringRegExp($txt,'<h4 class="yt-ui-ellipsis yt-ui-ellipsis-2">\R(.*?)\R      </h4>',1)
		$stt=StringRegExp($stt1[0],'\d+',1)
		$stt=$stt[0]
;~ 		$ten=$stt1[0]
		If $stt<=$tap Then
			ExitLoop
		EndIf
		_TrayTip('Có tập mới',$ten&': '&$stt,7)
		_IEQuit($ie)
		ExitLoop
	WEnd
EndFunc


Func uppm()
	While 1
		$ie3=_IECreate($link,0,0)
		Local $oIns = _IETagNameGetCollection($ie3, "a")
		For $oIn In $oIns
			If String($oIn.classname) = "btn btn-red" Then
				ExitLoop
			EndIf
		Next
		_IEAction($oIn,'click')
		_IELoadWait($ie3)
		$linkxem=_IEPropertyGet($ie3,'locationurl')
		_IEQuit($ie3)

		$ie=_IECreate($linkxem,0,0)
		$txt=_IEBodyReadHTML($ie)
;~ 		ClipPut($txt)
;~ 		$tenvi=_StringBetween($txt,'"name">','</h1>')
;~ 		$tenen=_StringBetween($txt,'real-name">','</h2>')
;~ 		$ten=$tenvi[0]&' - '&$tenen[0]
		$u1=_StringBetween($txt,'<div class="list-server">','</div>')
		If @error=1 Then
			MsgBox(0,'','Xem lại link đi: '&$link)
			Exit
		EndIf
		$u=_StringBetween($u1[0],'href="','">')
		$stt=_StringBetween($u1[0],'data-number="','"')
		$stt3=$stt
		For $k=UBound($stt)-1 To 0 Step -1
			If StringInStr($stt[$k],'-')<>0 Then
				If StringInStr($stt[$k],'End')<>0 Then
				Else
					_ArrayDelete($stt,$k)
					_ArrayDelete($u,$k-1)
				EndIf
			EndIf
		Next
		$str1=$u
		If UBound($u)<=$tap Then
			If UBound($stt3)>UBound($stt) Then
				$sth=$stt3[UBound($stt)]
				_TrayTip('Có tập mới',$ten&': '&$stt3[UBound($stt)],7)
			Else
				ExitLoop
			EndIf
		Else
			$tapmoi=UBound($u)+1-$tap
			$sth=$stt3[UBound($stt)-1]
			_TrayTip('Có tập mới',$ten&': '&$stt[UBound($stt)-1],7)
		EndIf
		_IEQuit($ie)
		ExitLoop
	WEnd
EndFunc

Func upbh()
	While 1
		$ie3=_IECreate($link,0,0)
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

		$ie=_IECreate($linkxem,0,0)
		$txt=_IEBodyReadHTML($ie)
;~ 		ClipPut($txt)
;~ 		$tenvi=_StringBetween($txt,'"name">','</h1>')
;~ 		$tenen=_StringBetween($txt,'real-name">','</h2>')
;~ 		$ten=$tenvi[0]&' - '&$tenen[0]
		$u=_StringBetween($txt,'<a class="current" href="','">')
		If @error=1 Then
			MsgBox(0,'','Xem lại link đi: '&$link)
			Exit
		EndIf
		$str1[0]=$u[0]
		$u1=_StringBetween($txt,'<div class="list-episode" id="list_episodes">','</div>')
		$u=_StringBetween($u1[0],'<a href="','">')
		$stt=_StringBetween($u1[0],'">','</a>')
		$stt3=$stt
		For $k=UBound($stt)-1 To 0 Step -1
			If StringInStr($stt[$k],'-')<>0 Then
				If StringInStr($stt[$k],'End')<>0 Then
				Else
					_ArrayDelete($stt,$k)
					_ArrayDelete($u,$k-1)
				EndIf
			EndIf
		Next
		For $ii=0 To UBound($u)-1
			$str1[$ii+1]=$u[$ii]
		Next
		If UBound($u)+1<=$tap Then
			If UBound($stt3)>UBound($stt) Then
				$sth=$stt3[UBound($stt)]
				_TrayTip('Có tập mới',$ten&': '&$stt3[UBound($stt)],7)
			Else
				ExitLoop
			EndIf
		Else
			$tapmoi=UBound($u)+1-$tap
			$sth=$stt3[UBound($stt)-1]
			_TrayTip('Có tập mới',$ten&': '&$stt[UBound($stt)-1],7)
		EndIf

;~ 		_FFStart('http://phimtuan.net/admin/films/'&$id&'/episodes')
;~ 		For $iii=$tapmoi To 1 Step -1
;~ 			$yn=MsgBox(4,'Cập nhật?','Phim: '&$ten&@CRLF&'Tập hiện tại: '&$tap&@CRLF&'Tập mới: '&$stt[$tap+$tapmoi-$iii])
;~ 			$stt1=$tap+$tapmoi-$iii
;~ 			If $yn=6 Then
;~ 				dongy()
;~ 			EndIf
;~ 		Next
;~ 		WinClose('Phim Tuần AdminCP - Mozilla Firefox')
		_IEQuit($ie)
		ExitLoop
	WEnd
EndFunc

Func upbilu()
	While 1
		$ie3=_IECreate($link,0,0)
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

		$ie=_IECreate($linkxem,0,1)
		$txt=_IEBodyReadHTML($ie)
;~ 		$tenvi=_StringBetween($txt,'<h1>','</h1>')
;~ 		$tenen=_StringBetween($txt,'real-name">','</h2>')
;~ 		$ten=$tenvi[0]&' - '&$tenen[0]
		$u=_StringBetween($txt,'<li><a class="current" href="','">')
		$str1[0]=$u[0]
		$u1=_StringBetween($txt,'class="list-episode"','</ul>')
		$u=_StringBetween($u1[0],'<li><a href="','">')
		$stt=_StringBetween($u1[0],'">','</a>')
		$stt3=$stt
		For $k=UBound($stt)-1 To 0 Step -1
			If StringInStr($stt[$k],'-')<>0 Then
				If StringInStr($stt[$k],'End')<>0 Then
				Else
					_ArrayDelete($stt,$k)
					_ArrayDelete($u,$k-1)
				EndIf
			EndIf
		Next
		For $ii=0 To UBound($u)-1
			$str1[$ii+1]=$u[$ii]
		Next
		If UBound($u)+1<=$tap Then
			If UBound($stt3)>UBound($stt) Then
				$sth=$stt3[UBound($stt)]
				_TrayTip('Có tập mới',$ten&': '&$stt3[UBound($stt)],7)
			Else
				ExitLoop
			EndIf
		Else
			$tapmoi=UBound($u)+1-$tap
			$sth=$stt3[UBound($stt)-1]
			_TrayTip('Có tập mới',$ten&': '&$stt[UBound($stt)-1],7)
		EndIf
;~ 		For $iii=$tapmoi To 1 Step -1
;~ 			_FFStart('http://phimtuan.net/admin/films/'&$id&'/episodes')
;~ 			$yn=MsgBox(4,'Cập nhật?','Phim: '&$ten&@CRLF&'Tập hiện tại: '&$tap&@CRLF&'Tập mới: '&$stt[UBound($stt)-$iii])
;~ 			If $yn=6 Then
;~ 				dongy()
;~ 			EndIf
;~ 		Next
		_IEQuit($ie)
		WinClose('Phim Tuần AdminCP - Mozilla Firefox')
		ExitLoop
	WEnd
EndFunc

Func up14()
	While 1
		$ie3=_IECreate($link,0,0)
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

		$ie=_IECreate($linkxem,0,0)
		$txt=_IEBodyReadHTML($ie)
;~ 		$tenvi=_StringBetween($txt,'<h1><a title="','"')
;~ 		$tenen=_StringBetween($txt,'real-name">','</h2>')
;~ 		$ten=$tenvi[0]
		$u1=_StringBetween($txt,'<ul class="episode_list">','</ul>')
		$u=_StringBetween($u1[0],'href="','"')
		$stt=_StringBetween($u1[0],'"watch">','</a>')
		$stt3=$stt
		For $k=UBound($stt)-1 To 0 Step -1
			If StringInStr($stt[$k],'-')<>0 Then
				If StringInStr($stt[$k],'End')<>0 Then
				Else
					_ArrayDelete($stt,$k)
					_ArrayDelete($u,$k)
				EndIf
			EndIf
		Next
		If UBound($u)+1<=$tap Then
			If UBound($stt3)>UBound($stt) Then
				$sth=$stt3[UBound($stt)]
				_TrayTip('Có tập mới',$ten&': '&$stt3[UBound($stt)],7)
			Else
				ExitLoop
			EndIf
		Else
			$tapmoi=UBound($u)+1-$tap
			$sth=$stt3[UBound($stt)-1]
			_TrayTip('Có tập mới',$ten&': '&$stt[UBound($stt)-1],7)
		EndIf
		_IEQuit($ie)
		ExitLoop
	WEnd
EndFunc

Func dongy()
	$linkphim=$str1[$stt1]
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
EndFunc

Func _TrayTip($sTitle,$sMsg, Const ByRef $iTimeout, Const $iOption = 0)
    Local $hwnd_timer

    TrayTip($sTitle, $sMsg, $iTimeout, $iOption)

    $hwnd_timer = TimerInit()
    While (($iTimeout * 1000) - TimerDiff($hwnd_timer) > 0)
        Sleep(10)
    WEnd

;~     Opt("trayiconhide", 1);Momentarily hides AutoIt Tray Icon as TrayTip cannot function without a tray icon.
;~     Opt("trayiconhide", 0);Re-enables AutoIt Tray Icon.
EndFunc