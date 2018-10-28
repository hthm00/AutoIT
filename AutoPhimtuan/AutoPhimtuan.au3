#include <FF.au3>
#include <String.au3>
#include <Array.au3>
#include <IE.au3>
#include <File.au3>
#RequireAdmin
#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

HotKeySet('{f4}','_exit')


#Region ### START Koda GUI section ### Form=
$Form5 = GUICreate("Auto-MH", 223, 275, 1019, 102)
$Label1 = GUICtrlCreateLabel("Up PhimBilu:", 24, 24, 92, 17)
$Button1 = GUICtrlCreateButton("Chạy", 128, 16, 75, 25)
$Label2 = GUICtrlCreateLabel("", 24, 48, 180, 17)
GUICtrlSetColor(-1,0x887BD7)
$Label3 = GUICtrlCreateLabel("Up Phimtuan:", 24, 80, 92, 17)
$Button2 = GUICtrlCreateButton("Chạy", 128, 72, 75, 25)
$Label4 = GUICtrlCreateLabel("", 24, 104, 180, 17)
GUICtrlSetColor(-1,0x887BD7)
$Label5 = GUICtrlCreateLabel("Thêm phim:", 24, 136, 92, 17)
$Button3 = GUICtrlCreateButton("Chạy", 128, 128, 75, 25)
$Label6 = GUICtrlCreateLabel("", 24, 160, 180, 41)
GUICtrlSetColor(-1,0x887BD7)
$Button4 = GUICtrlCreateButton("Chạy", 128, 224, 75, 25)
$Label7 = GUICtrlCreateLabel("Chạy cả 3:", 24, 232, 92, 17)
$Button5 = GUICtrlCreateButton("Xong", 128, 184, 75, 25)
GUICtrlSetState($Button5,$GUI_HIDE)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global $phim14new=False,$dong,$str1[1000]



;~ themphbilu()
;~ Exit

;~ _FFStart('http://phimtuan.net/admin/films')
;~ upphim14()
;~ upphimtuan()
;~ $ie=_IECreate('http://phimtuan.net/admin/films')
;~ $txt=_IEBodyReadHTML($ie)
;~ ClipPut($txt)
;~ $ie=_IECreate('http://phimtuan.net/admin/films')
;~ MsgBox(0,'','Hãy đổi Emulation')
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
;~ 			upphim14()
			upphimbilu()
		Case $Button2
			upphtuan()
		Case $Button3
;~ 			sosanh()
			sosanhbilu()
		Case $Button4
;~ 			upphim14()
			upphimbilu
			upphtuan()
			sosanh()
	EndSwitch
WEnd


;~ themph()
;~ sosanh()
;~ upphim14()

Func _exit()
	$yn=MsgBox(4,'','Chép lại phim vừa rồi?')
	If $yn=6 Then
		_FileWriteToLine(@ScriptDir&'\phimbilu.txt',1,$dong)
	EndIf
	Exit
EndFunc


Func themphbilu()
While 1
;~ 	$dong='Anh Nhớ Em - I Miss You (2013)'
;~ 	$dong='Bộ Phim Để Đời - Be Positive'
;~ 	$dong='Cô Nàng Cử Tạ, Kim Bok Joo - Weightlifting Fairy Kim Bok Joo'
;~ 	_IENavigate($ie,'http://phimtuan.net/admin/films/create',0)
	$ie=_IECreate('http://phimtuan.net/admin/films/create',0,1,0)
	WinWait('Choose File to Upload','',7)
	WinClose('Choose File to Upload')


;~ 	Local $oIns = _IETagNameGetCollection($ie, "div")
;~ 	$oIn = _IETagNameGetCollection($ie, "ul",1)
;~ 	_IEAction($oIn,'click')
;~ Exit
;~ 	For $oIn In $oIns
;~ 		MsgBox(0,'',String($oIn.value))
;~ 		If String($oIn.classname) = "form-control select-styled" Then
;~ 			_IEAction($oIn,'click')
;~ 			_IELoadWait($ie)
;~ 		EndIf
;~ 	Next


	$form=_IEFormGetCollection($ie,0)



;~ 	For $i=1 To 30
;~ 		MsgBox(0,'',$i)
;~ 		$btt=_IETagNameGetCollection($ie, "div",$i)
;~ 		_IEAction($btt,'click')
;~ 	Next


	$str=StringSplit($dong,' - ',1)
	$tenen=StringRight($str[2],StringLen($str[2]))
	$tenvi=StringLeft($str[1],StringLen($str[1]))
	$str=StringReplace($tenen,' ','-')
	$gg=StringReplace($tenen,' ','+')
	$gg1=StringReplace($tenvi,' ','+')
	$ie2=_IECreate('http://bilutv.com/tim-kiem.html?q='&$gg)
	$txt=_IEBodyReadHTML($ie2)
	$str2=_StringBetween($txt,'"'&$tenvi&'" href="','">')
	If @error Then
;~ 		MsgBox(0,'','Không tìm thấy phim')
		_FileWriteToLine(@ScriptDir&'\phimtuan.txt',1,$dong)
		ProcessClose('iexplore.exe')
		ExitLoop
	EndIf
	_IEQuit($ie2)
	$ie3=_IECreate('http://bilutv.com'&$str2[0])
	$txt=_IEBodyReadText($ie3)
;~ 	ClipPut($txt)
;~ 	Exit

	$str2=_StringBetween($txt,'Nội dung phim','Trailer - Preview')
	$str2=StringRegExp($str2[0],'(\R)?(\R)?(\R)?(\R)?(\R)?(.*)(\R)?(\R)?(\R)?',3)
	$mota=''
	For $k=0 To UBound($str2)-1
		If $str2[$k] <> '' And $str2[$k] <> @CRLF Then
			$mota&=$str2[$k]&@CRLF
		EndIf
	Next

	$txt=_IEBodyReadHTML($ie3)
	$str2=_StringBetween($txt,'<label>Thể loại:</label>','<li>')
;~ 	ClipPut($str2[0])
;~ 	Exit
	$hoathinh=StringInStr($str2[0],'Hoạt Hình')
	If $hoathinh<>0 Then
		_FileWriteToLine(@ScriptDir&'\phimtuan.txt',1,$dong)
		ProcessClose('iexplore.exe')
		ExitLoop
	EndIf
;~ 	$str2=StringRegExp($txt,'<a href="/the-loai/.{1,50}">(.*)</a>',1)
;~ 	$theloai=$str2[0]
	$str2=_StringBetween($txt,'<label>Thể loại:</label>','<li>')
	$theloai=$str2[0]

;~ 	MsgBox(0,'',$theloai)
	$str2=StringRegExp($txt,'<a href="/quoc-gia/.{1,50}">(.*)</a>',1)
	$quocgia=$str2[0]
	$str2=StringRegExp($txt,'<strong>(.*)</strong>',1)
	If StringInStr($str2[0],'HD')<>0 Then
		_FileWriteToLine(@ScriptDir&'\phimtuan.txt',1,$dong)
		ProcessClose('iexplore.exe')
		ExitLoop
	ElseIf StringInStr($str2[0],'Full')<>0 Then
;~ 		$tap=$str2[0]
;~ 		ClipPut($tap)
;~ 		MsgBox(0,'',$tap)
		If StringInStr($str2[0],'Vietsub')<>0 Then
			$tap1=StringRegExp($str2[0],'Full [0-9]{1,10}/(.*) ',1)
			$tap=$tap1[0]
		ElseIf StringInStr($str2[0],'Thuyết Minh')<>0 Then
			$tap1=StringRegExp($str2[0],'Full [0-9]{1,10}/(.*) Thu',1)
			$tap=$tap1[0]
		ElseIf StringInStr($str2[0],'Lồng Tiếng')<>0 Then
			$tap1=StringRegExp($str2[0],'Full [0-9]{1,10}/(.*) L',1)
			$tap=$tap1[0]
		EndIf
	Else
		_FileWriteToLine(@ScriptDir&'\phimtuan.txt',1,$dong)
		ProcessClose('iexplore.exe')
		ExitLoop
	EndIf
	$str2=StringRegExp($txt,'<label>Năm xuất bản:</label>\R                    <span>(.*)</span>',1)
	$nam=$str2[0]
	If $nam<1994 Then
		_IEQuit($ie)
		_IEQuit($ie3)
		_FileWriteToLine(@ScriptDir&'\phimtuan.txt',1,$dong)
		ExitLoop
	EndIf
;~ 	$str2=_StringBetween($txt,'Status: <font color="red">','</font>')
;~ 	$status=$str2[0]
;~ 	$sis=StringInStr($status,'Trailer')
;~ 	If $sis<>0 Then
;~ 		$sis='Not HD'
;~ 	Else
;~ 		$sis='HD'
;~ 	EndIf
	$str2=_StringBetween($txt,'<a href="/dao-dien','</a>')
	If @error Then
		$daodien='N/A'
	Else
		$str2=StringRegExp($str2[0],'/.{1,50}">(.*)',1)
		$daodien=$str2[0]
	EndIf



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

	$ie6=_IECreate($linkxem)
	$txt=_IEBodyReadHTML($ie6)
	ClipPut($txt)
;~ 	$str1=StringRegExp($txt,'<li><a class="(current)?" href="(.*)">',3)
	$u=_StringBetween($txt,'<li><a class="current" href="','">')
	$str1[0]=$u[0]
	$u=_StringBetween($txt,'<ul class="list-episode" id="list_episodes">','</ul>')
	$u=_StringBetween($u[0],'<li><a href="','">')

	For $bla=0 To UBound($u)-1
		$str1[$bla+1]=$u[$bla]
	Next

	If UBound($u)+1<$tap Then
		_FileWriteToLine(@ScriptDir&'\phimtuan.txt',1,$dong)
		ProcessClose('iexplore.exe')
		ExitLoop
	EndIf



;~ 	$in10=_IEFormElementGetCollection($form,10)

;~ 	$a=0
;~ 	If $quocgia<>'Hàn Quốc' And $quocgia<>'Trung Quốc' And $quocgia<>'Âu Mỹ' And $quocgia<>'Việt Nam' And $quocgia<>'Châu Á' Then
;~ 		While $a<1 Or $a>2
;~ 			$a=InputBox('Nhập STT quốc gia',$quocgia&'?'&@CRLF&'1. Âu Mỹ'&@CRLF&'2. Châu Á')
;~ 			If $a=1 Then
;~ 				$b='Âu Mỹ'
;~ 			ElseIf $a=2 Then
;~ 				$b='Châu Á'
;~ 			EndIf
;~ 		WEnd
;~ 		$quocgia=$b
;~ 	EndIf
;~ 	$a=0
;~ 	If $theloai<>'Hành Động' And $theloai<>'Kinh Dị - Ma' And $theloai<>'Tình Cảm' And $theloai<>'Hài Hước' And $theloai<>'Cổ Trang' And $theloai<>'Viễn Tưởng' Then
;~ 		While $a<1 Or $a>6
;~ 			$a=InputBox('Nhập thể loại',$theloai&'?'&@CRLF&'1. Hành Động'&@CRLF&'2. Kinh Dị - Ma'&@CRLF&'3. Tình Cảm'&@CRLF&'4. Hài Hước'&@CRLF&'5. Cổ Trang'&@CRLF&'6. Viễn Tưởng','','',-1,220)
;~ 			If $a=1 Then
;~ 				$b='Hành Động'
;~ 			ElseIf $a=2 Then
;~ 				$b='Kinh Dị - Ma'
;~ 			ElseIf $a=3 Then
;~ 				$b='Tình Cảm'
;~ 			ElseIf $a=4 Then
;~ 				$b='Hài Hước'
;~ 			ElseIf $a=5 Then
;~ 				$b='Cổ Trang'
;~ 			ElseIf $a=6 Then
;~ 				$b='Viễn Tưởng'
;~ 			EndIf
;~ 		WEnd
;~ 		$theloai=$b
;~ 	EndIf
	WinMove('Thêm phim mới - Internet Explorer','',0,0,500,500)
	WinActivate('Thêm phim mới - Internet Explorer')
	Local $oIns = _IETagNameGetCollection($ie, "div")
	For $oIn In $oIns
		If String($oIn.classname) = "form-control select-styled" Then
			_IEAction($oIn,'click')
			_IEAction($oIn,'scrollintoview')
			_IELoadWait($ie)
		EndIf
	Next
	Sleep(500)
	If $quocgia='Hàn Quốc' Then
		MouseClick('left',67, 102,1,0)
	ElseIf $quocgia='Trung Quốc' Then
		MouseClick('left',68, 135,1,0)
	ElseIf $quocgia='Âu - Mỹ' Then
		MouseClick('left',66, 171,1,0)
	ElseIf $quocgia='Việt Nam' Then
		MouseClick('left',66, 171,1,0)
;~ 	ElseIf $quocgia='Châu Á' Then
	Else
		MouseClick('left',52, 239,1,0)
	EndIf
;~ 	_IEFormElementOptionSelect($in10,$quocgia,1,'bytext')


;~ 	MsgBox(0,'','')
	$in1=_IEFormElementGetCollection($form,1);ten en
	$in2=_IEFormElementGetCollection($form,2);ten vi
	$in5=_IEFormElementGetCollection($form,5);the loai
	$in6=_IEFormElementGetCollection($form,6);tap
;~ 	$in7=_IEFormElementGetCollection($form,7);lich
	$in8=_IEFormElementGetCollection($form,8);dao dien
;~ 	$in9=_IEFormElementGetCollection($form,9);subteam
	$in10=_IEFormElementGetCollection($form,10);quoc gia
	$in11=_IEFormElementGetCollection($form,11);nam

	_IEAction($in1,'scrollintoview')
	ClipPut($tenen)
	Sleep(500)
	MouseClick('left',196, 74,1,0)
	Sleep(500)
	Send('^{v}')
	Sleep(500)
;~ 	_IEAction($in1,'click')

	_IEAction($in2,'scrollintoview')
	ClipPut($tenvi)
	Sleep(500)
	MouseClick('left',196, 74,1,0)
	Sleep(500)
	Send('^{v}')
	Sleep(500)
;~ 	_IEAction($in2,'click')

	_IEAction($in5,'scrollintoview')
	Sleep(500)
	MouseClick('left',196, 74,1,0)
	;If $theloai<>'Hành Động' And $theloai<>'Kinh Dị - Ma' And $theloai<>'Tình Cảm' And $theloai<>'Hài Hước' And $theloai<>'Cổ Trang' And $theloai<>'Viễn Tưởng' Then
	Local $hd=0,$kd=0,$tc=0,$hh=0,$ct=0,$vt=0
	If StringInStr($theloai,'Hành Động')<>0 Then
		ClipPut('Hành Động')
		Sleep(500)
		Send('^{v}')
		Sleep(200)
		Send('{enter}')
		$hd=1
	EndIf
	If StringInStr($theloai,'Kinh Dị')<>0 Then
		ClipPut('Kinh Dị - Ma')
		Sleep(500)
		Send('^{v}')
		Sleep(200)
		Send('{enter}')
		$kd=1
	EndIf
	If StringInStr($theloai,'Tình Cảm')<>0 Then
		ClipPut('Tình Cảm')
		Sleep(500)
		Send('^{v}')
		Sleep(200)
		Send('{enter}')
		$tc=1
	EndIf
	If StringInStr($theloai,'Hài Hước')<>0 Then
		ClipPut('Hài Hước')
		Sleep(500)
		Send('^{v}')
		Sleep(200)
		Send('{enter}')
		$hh=1
	EndIf
	If StringInStr($theloai,'Cổ Trang')<>0 Then
		ClipPut('Cổ Trang')
		Sleep(500)
		Send('^{v}')
		Sleep(200)
		Send('{enter}')
		$ct=1
	EndIf
	If StringInStr($theloai,'Viễn Tưởng')<>0 Then
		ClipPut('Viễn Tưởng')
		Sleep(500)
		Send('^{v}')
		Sleep(200)
		Send('{enter}')
		$vt=1
	EndIf
	If $hd=0 And $kd=0 And $tc=0 And $hh=0 And $ct=0 And $vt=0 Then
		$a=0
		If $theloai<>'Hành Động' And $theloai<>'Kinh Dị - Ma' And $theloai<>'Tình Cảm' And $theloai<>'Hài Hước' And $theloai<>'Cổ Trang' And $theloai<>'Viễn Tưởng' Then
			While $a<1 Or $a>6
				$a=InputBox('Nhập thể loại',$theloai&'?'&@CRLF&'1. Hành Động'&@CRLF&'2. Kinh Dị - Ma'&@CRLF&'3. Tình Cảm'&@CRLF&'4. Hài Hước'&@CRLF&'5. Cổ Trang'&@CRLF&'6. Viễn Tưởng','','',-1,220)
				If $a=1 Then
					$b='Hành Động'
				ElseIf $a=2 Then
					$b='Kinh Dị - Ma'
				ElseIf $a=3 Then
					$b='Tình Cảm'
				ElseIf $a=4 Then
					$b='Hài Hước'
				ElseIf $a=5 Then
					$b='Cổ Trang'
				ElseIf $a=6 Then
					$b='Viễn Tưởng'
				EndIf
			WEnd
			$theloai=$b
		EndIf
		ClipPut($theloai)
		Sleep(500)
		Send('^{v}')
		Sleep(200)
		Send('{enter}')
	EndIf
;~
;~ 	_IEAction($in5,'click')

	_IEAction($in6,'scrollintoview')
	ClipPut($tap)
	Sleep(500)
	MouseClick('left',196, 74,1,0)
	Sleep(500)
	Send('^{v}')
	Sleep(500)
;~ 	_IEAction($in6,'click')
;~ 	_IEAction($in7,'click')
;~ 	_IEFormElementSetValue($in7,$lich)
	If $daodien <> 'N/A' Then

		_IEAction($in8,'scrollintoview')
		ClipPut($daodien)
		Sleep(500)
		MouseClick('left',196, 74,1,0)
		Sleep(500)
		Send('^{v}')
		Sleep(500)
;~ 		_IEAction($in8,'click')
	EndIf
;~ 	_IEFormElementSetValue($in9,$subteam)

	_IEAction($in11,'scrollintoview')
	ClipPut($nam)
	Sleep(500)
	MouseClick('left',196, 74,1,0)
	Sleep(500)
	Send('^{v}')
	Sleep(500)

	Local $oIns = _IETagNameGetCollection($ie, "div")
	For $oIn In $oIns
		If String($oIn.classname) = "note-editable panel-body" Then
			_IEAction($oIn,'scrollintoview')
			ClipPut($mota)
			Sleep(500)
			MouseClick('left',196, 74,1,0)
			Sleep(500)
			Send('^{v}')
			Sleep(500)
;~ 			Send('{pgup}')
;~ 			Sleep(200)
;~ 			Send('{down}')
;~ 			Sleep(200)
;~ 			Send('{bs}')
;~ 			Sleep(200)

			ExitLoop
;~ 			_IELoadWait($ie)
		EndIf
	Next
;~ 	_IEQuit($ie3)

	$ie4=_IECreate('https://www.google.com/search?site=&tbm=isch&q='&$gg)
;~ 	MsgBox(0,'','Cập nhật ảnh, xong bấm OK')
	GUICtrlSetData($Label6,'Cập nhật ảnh rồi bấm Xong')
	GUICtrlSetState($Button5,$GUI_SHOW)
	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $Button5
				GUICtrlSetState($Button5,$GUI_HIDE)
				ExitLoop
		EndSwitch
	WEnd
	_IEQuit($ie4)
	_IEFormSubmit($form)
	_IELoadWait($ie2)
	_IEQuit($ie2)

	_FFStart('http://phimtuan.net/admin/films/hidden')
	_FFLoadWait()
	$hidden=_FFReadHTML()
	$code=_StringBetween($hidden,'hongthiennu</a>','episodes/create')
	$code1=_StringBetween($code[0],'href="/admin/films/','/')
;~ 	$code2='http://phimtuan.net/admin/films/'&$code1[0]&'/edit'
	$code2='http://phimtuan.net/admin/films/'&$code1[0]&'/episodes/create'
	$linkthemtap=$code2
	WinClose('Danh sách phim ẩn - Mozilla Firefox')


;~ 	Local $oIns = _IETagNameGetCollection($ie3, "a")
;~ 	For $oIn In $oIns
;~ 		If String($oIn.classname) = "btn-see btn btn-danger" Then
;~ 			ExitLoop
;~ 		EndIf
;~ 	Next
;~ 	_IEAction($oIn,'click')
;~ 	_IELoadWait($ie3)
;~ 	$linkxem=_IEPropertyGet($ie3,'locationurl')
;~ 	_IEQuit($ie3)

;~ 	$ie6=_IECreate($linkxem)
;~ 	$txt=_IEBodyReadHTML($ie6)
;~ 	ClipPut($txt)
;~ 	$u=_StringBetween($txt,'<li><a class="current" href="','">')
;~ 	$str1[0]=$u[0]
;~ 	$u=_StringBetween($txt,'<ul class="list-episode" id="list_episodes">','</ul>')
;~ 	$u=_StringBetween($u[0],'<li><a href="','">')

;~ 	For $bla=0 To UBound($u)-1
;~ 		$str1[$bla+1]=$u[$bla]
;~ 	Next
;~ 	$str1=_StringBetween($str[0],'" href="','" episode-type="watch">')

;~ 	_IEQuit($ie3)

	For $sotap=0 To UBound($u) Step 1
		$linkphim=$str1[$sotap]
;~ 		$linkthemtap='http://phimtuan.net/admin/films/716/episodes/create'
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
	_FileWriteToLine(@ScriptDir&'\phimtuan.txt',1,$dong)
	ProcessClose('iexplore.exe')


	;http://phim14.net/phim/chinh-phuc-trai-tim-hoang-tu.8508.html
	;http://phim14.net/xem-phim/chinh-phuc-trai-tim-hoang-tu_4-hearts-of-the-mountains-series-1.8508.html

;~ 	_IEAction($in11,'click')




;~ 	Local $oIns = _IETagNameGetCollection($ie, "input")
;~ 	For $oIn In $oIns
;~ 		If String($oIn.name) = "name_en" Then
;~ 			_IEFormElementSetValue($oIn,'tai sao')
;~ 			_IELoadWait($ie)
;~ 		EndIf
;~ 	Next
	ExitLoop
WEnd
EndFunc

Func upphimbilu()
	$phbilumoi=0
	$sotrang=InputBox('','Cập nhật mấy trang?',1)
	For $i=1 To $sotrang
		$ie=_IECreate('http://bilutv.com/film/filter?order=publish_date&cat_id=&city_id=&year=&page='&$i)
		$txt=_IEBodyReadHTML($ie)
		$ph=_StringBetween($txt,'<p class="name">','</p>')
		$ph2=_StringBetween($txt,'<p class="real-name">','</p>')
		For $ii=0 To UBound($ph)-1 Step 1
			If $ph2[$ii]='' Then
				$ph2[$ii]=$ph[$ii]
			EndIf
			$ph1=$ph[$ii]&' - '&$ph2[$ii]
			$filephimbilu=FileRead(@ScriptDir&'\phimbilu.txt')
			$a=StringInStr($filephimbilu,$ph1)
;~ 			MsgBox(0,'',$a)
			If $a = 0 Then
;~ 				MsgBox(0,'Có phim mới',$ph1[0])
				$phbilumoi+=1
				_FileWriteToLine(@ScriptDir&'\phimbilu.txt',1,$ph1)
;~ 				MsgBox(0,'',@error)
			EndIf
		Next
		_IEQuit($ie)
	Next
	GUICtrlSetData($Label2,$phbilumoi&' phim mới')
EndFunc

Func sosanhbilu()
	$fphbilu=@ScriptDir&'\phimbilu.txt'
	$fphtuan=@ScriptDir&'\phimtuan.txt'
	$sophbilu=_FileCountLines($fphbilu)
	$sophtuan=FileRead($fphtuan)
	For $iii=1 To $sophbilu Step 1
		$dong=FileReadLine($fphbilu,1)
		$str=StringSplit($dong,' - ',1)
		$tenen=StringRight($str[2],StringLen($str[2]))
		$tenvi=StringLeft($str[1],StringLen($str[1]))
		$b=StringInStr($tenen,'(')
		If $b<>0 Then
			$tenbonam=StringRegExp($tenen,'(.*) \([0-9]\)?',1)
			$a=StringInStr($sophtuan,$tenbonam[0])
;~ 			MsgBox(0,'',$tenbonam[0])
		Else
			$a=StringInStr($sophtuan,$tenen)
;~ 			MsgBox(0,'',$tenen)
		EndIf
;~ 		MsgBox(0,'',$tenbonam[0])
;~ 		$a=StringInStr($sophtuan,$dong)
;~ 		$a=StringInStr($sophtuan,$tenbonam[0])
		If $a <> 0 Then
;~ 			MsgBox(0,'',$tenbonam[0])
			_FileWriteToLine($fphbilu,1,'',True)
;~ 			MsgBox(0,'Phim có rồi!',$dong)
		Else
;~ 			$b=InputBox('','Cập nhật phim:',$dong)
			$b=$dong
			GUICtrlSetData($Label6,'Phim mới: '&$dong)
			$dong=$b
			_FileCreate(@ScriptDir&'\phimupdate.txt')
			_FileWriteToLine(@ScriptDir&'\phimupdate.txt',1,$dong)
			_FileWriteToLine($fphbilu,1,'',True)
			themphbilu()
;~ 			_FileWriteToLine(@ScriptDir&'\phimtuan.txt',1,$tenph2)
		EndIf
	Next
EndFunc

Func sosanh()
	$fph14=@ScriptDir&'\phim14.txt'
	$fphtuan=@ScriptDir&'\phimtuan.txt'
	$soph14=_FileCountLines($fph14)
	$sophtuan=FileRead($fphtuan)
	For $iii=$soph14 To 1 Step -1
		$dong=FileReadLine($fph14,$iii)
		$a=StringInStr($sophtuan,$dong)
		If $a <> 0 Then
;~ 			MsgBox(0,'Phim có rồi!',$dong)
		Else
;~ 			$b=InputBox('','Cập nhật phim:',$dong)
			$b=$dong
			GUICtrlSetData($Label6,'Phim mới: '&$dong)
			$dong=$b
			_FileCreate(@ScriptDir&'\phimupdate.txt')
			_FileWriteToLine(@ScriptDir&'\phimupdate.txt',1,$dong)
			themph()
;~ 			_FileWriteToLine(@ScriptDir&'\phimtuan.txt',1,$tenph2)
		EndIf
	Next
EndFunc

Func themph()
While 1
;~ 	$dong='Chinh Phục Trái Tim Hoàng Tử - 4 Hearts Of The Mountains Series 1'
;~ 	$dong='Bộ Phim Để Đời - Be Positive'
;~ 	$dong='Cô Nàng Cử Tạ, Kim Bok Joo - Weightlifting Fairy Kim Bok Joo'
;~ 	_IENavigate($ie,'http://phimtuan.net/admin/films/create',0)
	$ie=_IECreate('http://phimtuan.net/admin/films/create',0,1,0)
	WinWait('Choose File to Upload','',7)
	WinClose('Choose File to Upload')


;~ 	Local $oIns = _IETagNameGetCollection($ie, "div")
;~ 	$oIn = _IETagNameGetCollection($ie, "ul",1)
;~ 	_IEAction($oIn,'click')
;~ Exit
;~ 	For $oIn In $oIns
;~ 		MsgBox(0,'',String($oIn.value))
;~ 		If String($oIn.classname) = "form-control select-styled" Then
;~ 			_IEAction($oIn,'click')
;~ 			_IELoadWait($ie)
;~ 		EndIf
;~ 	Next


	$form=_IEFormGetCollection($ie,0)



;~ 	For $i=1 To 30
;~ 		MsgBox(0,'',$i)
;~ 		$btt=_IETagNameGetCollection($ie, "div",$i)
;~ 		_IEAction($btt,'click')
;~ 	Next


	$str=StringSplit($dong,'-')
	$tenen=StringRight($str[2],StringLen($str[2])-1)
	$tenvi=StringLeft($str[1],StringLen($str[1])-1)
	$str=StringReplace($tenen,' ','-')
	$gg=StringReplace($tenen,' ','+')
	$ie2=_IECreate('http://phim14.net/search/'&$str&'.html')
	$txt=_IEBodyReadHTML($ie2)
	$str2=_StringBetween($txt,$dong&'" href="','"><img src')
	_IEQuit($ie2)
	$ie3=_IECreate($str2[0])
	$txt=_IEBodyReadText($ie3)
	$str2=_StringBetween($txt,'Giới thiệu bộ phim: ',@CRLF&@CRLF&@CRLF)
	If @error Then
		$str2=_StringBetween($txt,'Giới thiệu bộ phim: ',@CRLF&@CRLF)
	EndIf
	$mota=$str2[0]
	$txt=_IEBodyReadHTML($ie3)
	$str2=_StringBetween($txt,'<a title=" Phim ','" href=')
	$theloai=$str2[0]
	$str2=_StringBetween($txt,'<a title="Xem Phim ','" href=')
	$quocgia=$str2[0]
	$str2=_StringBetween($txt,'Thời lượng: ',' Tập')
	$tap=$str2[0]
	$str2=_StringBetween($txt,'Năm phát hành: <a title="Phim ','" href=')
	$nam=$str2[0]
	If $nam<1994 Then
		_IEQuit($ie)
		_IEQuit($ie3)
		_FileWriteToLine(@ScriptDir&'\phimtuan.txt',1,$dong)
		ExitLoop
	EndIf
;~ 	$str2=_StringBetween($txt,'Status: <font color="red">','</font>')
;~ 	$status=$str2[0]
;~ 	$sis=StringInStr($status,'Trailer')
;~ 	If $sis<>0 Then
;~ 		$sis='Not HD'
;~ 	Else
;~ 		$sis='HD'
;~ 	EndIf
	$str2=_StringBetween($txt,'Đạo diễn:','</a>')
	$str2=_StringBetween($str2[0],'<a title="','" href=')
	$daodien=$str2[0]

;~ 	$in10=_IEFormElementGetCollection($form,10)
	$a=0
	If $quocgia<>'Hàn Quốc' And $quocgia<>'Trung Quốc' And $quocgia<>'Âu Mỹ' And $quocgia<>'Việt Nam' And $quocgia<>'Châu Á' Then
		While $a<1 Or $a>2
			$a=InputBox('Nhập STT quốc gia',$quocgia&'?'&@CRLF&'1. Âu Mỹ'&@CRLF&'2. Châu Á')
			If $a=1 Then
				$b='Âu Mỹ'
			ElseIf $a=2 Then
				$b='Châu Á'
			EndIf
		WEnd
		$quocgia=$b
	EndIf
	$a=0
	If $theloai<>'Hành Động' And $theloai<>'Kinh Dị - Ma' And $theloai<>'Tình Cảm' And $theloai<>'Hài Hước' And $theloai<>'Cổ Trang' And $theloai<>'Viễn Tưởng' Then
		While $a<1 Or $a>2
			$a=InputBox('Nhập thể loại',$theloai&'?'&@CRLF&'1. Hành Động'&@CRLF&'2. Kinh Dị - Ma'&@CRLF&'3. Tình Cảm'&@CRLF&'4. Hài Hước'&@CRLF&'5. Cổ Trang'&@CRLF&'6. Viễn Tưởng')
			If $a=1 Then
				$b='Hành Động'
			ElseIf $a=2 Then
				$b='Kinh Dị - Ma'
			ElseIf $a=3 Then
				$b='Tình Cảm'
			ElseIf $a=4 Then
				$b='Hài Hước'
			ElseIf $a=5 Then
				$b='Cổ Trang'
			ElseIf $a=6 Then
				$b='Viễn Tưởng'
			EndIf
		WEnd
		$theloai=$b
	EndIf
	WinMove('Thêm phim mới - Internet Explorer','',0,0,500,500)
	WinActivate('Thêm phim mới - Internet Explorer')
	Local $oIns = _IETagNameGetCollection($ie, "div")
	For $oIn In $oIns
		If String($oIn.classname) = "form-control select-styled" Then
			_IEAction($oIn,'click')
			_IEAction($oIn,'scrollintoview')
			_IELoadWait($ie)
		EndIf
	Next
	Sleep(500)
	If $quocgia='Hàn Quốc' Then
		MouseClick('left',67, 102,1,0)
	ElseIf $quocgia='Trung Quốc' Then
		MouseClick('left',68, 135,1,0)
	ElseIf $quocgia='Âu Mỹ' Then
		MouseClick('left',66, 171,1,0)
	ElseIf $quocgia='Việt Nam' Then
		MouseClick('left',66, 171,1,0)
	ElseIf $quocgia='Châu Á' Then
		MouseClick('left',52, 239,1,0)
	EndIf
;~ 	_IEFormElementOptionSelect($in10,$quocgia,1,'bytext')


;~ 	MsgBox(0,'','')
	$in1=_IEFormElementGetCollection($form,1);ten en
	$in2=_IEFormElementGetCollection($form,2);ten vi
	$in5=_IEFormElementGetCollection($form,5);the loai
	$in6=_IEFormElementGetCollection($form,6);tap
;~ 	$in7=_IEFormElementGetCollection($form,7);lich
	$in8=_IEFormElementGetCollection($form,8);dao dien
;~ 	$in9=_IEFormElementGetCollection($form,9);subteam
	$in10=_IEFormElementGetCollection($form,10);quoc gia
	$in11=_IEFormElementGetCollection($form,11);nam

	_IEAction($in1,'scrollintoview')
	ClipPut($tenen)
	Sleep(500)
	MouseClick('left',196, 74,1,0)
	Sleep(500)
	Send('^{v}')
	Sleep(500)
;~ 	_IEAction($in1,'click')

	_IEAction($in2,'scrollintoview')
	ClipPut($tenvi)
	Sleep(500)
	MouseClick('left',196, 74,1,0)
	Sleep(500)
	Send('^{v}')
	Sleep(500)
;~ 	_IEAction($in2,'click')

	_IEAction($in5,'scrollintoview')
	ClipPut($theloai)
	Sleep(500)
	MouseClick('left',196, 74,1,0)
	Sleep(500)
	Send('^{v}')
	Sleep(200)
	Send('{enter}')
	Sleep(500)
;~ 	_IEAction($in5,'click')

	_IEAction($in6,'scrollintoview')
	ClipPut($tap)
	Sleep(500)
	MouseClick('left',196, 74,1,0)
	Sleep(500)
	Send('^{v}')
	Sleep(500)
;~ 	_IEAction($in6,'click')
;~ 	_IEAction($in7,'click')
;~ 	_IEFormElementSetValue($in7,$lich)
	If $daodien <> 'N/A' Then

		_IEAction($in8,'scrollintoview')
		ClipPut($daodien)
		Sleep(500)
		MouseClick('left',196, 74,1,0)
		Sleep(500)
		Send('^{v}')
		Sleep(500)
;~ 		_IEAction($in8,'click')
	EndIf
;~ 	_IEFormElementSetValue($in9,$subteam)

	_IEAction($in11,'scrollintoview')
	ClipPut($nam)
	Sleep(500)
	MouseClick('left',196, 74,1,0)
	Sleep(500)
	Send('^{v}')
	Sleep(500)

	Local $oIns = _IETagNameGetCollection($ie, "div")
	For $oIn In $oIns
		If String($oIn.classname) = "note-editable panel-body" Then
			_IEAction($oIn,'scrollintoview')
			ClipPut($mota)
			Sleep(500)
			MouseClick('left',196, 74,1,0)
			Sleep(500)
			Send('^{v}')
			Sleep(500)
			Send('{pgup}')
			Sleep(200)
			Send('{down}')
			Sleep(200)
			Send('{bs}')
			Sleep(200)

			ExitLoop
;~ 			_IELoadWait($ie)
		EndIf
	Next
;~ 	_IEQuit($ie3)

	$ie4=_IECreate('https://www.google.com/search?site=&tbm=isch&q='&$gg)
;~ 	MsgBox(0,'','Cập nhật ảnh, xong bấm OK')
	GUICtrlSetData($Label6,'Cập nhật ảnh rồi bấm Xong')
	GUICtrlSetState($Button5,$GUI_SHOW)
	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $Button5
				GUICtrlSetState($Button5,$GUI_HIDE)
				ExitLoop
		EndSwitch
	WEnd
	_IEQuit($ie4)
	_IEFormSubmit($form)
	_IELoadWait($ie2)
	_IEQuit($ie2)

	_FFStart('http://phimtuan.net/admin/films/hidden')
	$hidden=_FFReadHTML()
	$code=_StringBetween($hidden,'hongthiennu</a>','episodes/create" class="btn')
	$code1=_StringBetween($code[0],'<a href="/admin/films/','/')
;~ 	$code2='http://phimtuan.net/admin/films/'&$code1[0]&'/edit'
	$code2='http://phimtuan.net/admin/films/'&$code1[0]&'/episodes/create'
	$linkthemtap=$code2



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

	$ie6=_IECreate($linkxem)
	$txt=_IEBodyReadHTML($ie6)
	$str=_StringBetween($txt,'<ul class="episode_list">','</ul>')
	$str1=_StringBetween($str[0],'" href="','" episode-type="watch">')

	For $sotap=0 To UBound($str1)-1
		$linkphim=$str1[$sotap]
;~ 		$linkthemtap='http://phimtuan.net/admin/films/716/episodes/create'
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
	_FileWriteToLine(@ScriptDir&'\phimtuan.txt',1,$dong)



	;http://phim14.net/phim/chinh-phuc-trai-tim-hoang-tu.8508.html
	;http://phim14.net/xem-phim/chinh-phuc-trai-tim-hoang-tu_4-hearts-of-the-mountains-series-1.8508.html

;~ 	_IEAction($in11,'click')




;~ 	Local $oIns = _IETagNameGetCollection($ie, "input")
;~ 	For $oIn In $oIns
;~ 		If String($oIn.name) = "name_en" Then
;~ 			_IEFormElementSetValue($oIn,'tai sao')
;~ 			_IELoadWait($ie)
;~ 		EndIf
;~ 	Next
	ExitLoop
WEnd
EndFunc

Func upphtuan()
	$phtuanmoi=0
	$ie=_IECreate('http://phimtuan.net/admin/films')
	MsgBox(0,'','Hãy đổi Emulation:'&@CRLF&@CRLF&'F12 -> Emulation -> Document mode: 9')
	$sotrang=InputBox('','Cập nhật mấy trang?',1)
	For $i=1 To $sotrang
		$txt=_IEBodyReadHTML($ie)
		$tenph=_StringBetween($txt,'<td class="col-md-3">','td>')
		For $ii=UBound($tenph)-1 To 0 Step -1
			$tenph1=_StringBetween($tenph[$ii],'                                            ','                                        </')
			$tenph2=StringReplace($tenph1[0],@LF,'')
			$fphtuan=FileRead(@ScriptDir&'\phimtuan.txt')
;~ 			MsgBox(0,'',$tenph2)
			$a=StringInStr($fphtuan,$tenph2)
			If $a <> 0 Then
			Else
;~ 				MsgBox(0,'Có phim mới',$tenph2)
				$phtuanmoi+=1
				_FileWriteToLine(@ScriptDir&'\phimtuan.txt',1,$tenph2)
			EndIf
		Next
		Local $oBtns = _IETagNameGetCollection($ie, "i")
		For $oBtn In $oBtns
			If String($oBtn.classname) = "fa fa-angle-right" Then
				_IEAction($oBtn,'click')
				_IELoadWait($ie)
				ExitLoop
			EndIf
		Next
	Next
	GUICtrlSetData($Label4,$phtuanmoi&' phim mới')
	_IEQuit($ie)
EndFunc

Func upphim14()
	$ph14moi=0
	For $i=1 To 1
		$ie=_IECreate('http://phim14.net/danh-sach/phim-bo/page-'&$i&'.html?order_by=last_update&category_id=&country_id=&year=')
		$txt=_IEBodyReadHTML($ie)
		$ph=_StringBetween($txt,'<div class="inner">','<div class="info">')
		For $ii=UBound($ph)-1 To 0 Step -1
			$ph1=_StringBetween($ph[$ii],'<a title="','" href=')
			$filephim14=FileRead(@ScriptDir&'\phim14.txt')
			$a=StringInStr($filephim14,$ph1[0])
			If $a <> 0 Then
			Else
;~ 				MsgBox(0,'Có phim mới',$ph1[0])
				$ph14moi+=1
				_FileWriteToLine(@ScriptDir&'\phim14.txt',1,$ph1[0])
			EndIf
		Next
		_IEQuit($ie)
	Next
	GUICtrlSetData($Label2,$ph14moi&' phim mới')
EndFunc

Func upphimtuannnnnnnnnnnnnnnnnnnn()
	_FFStart('http://phimtuan.net/admin/films')
	For $i=1 To 20
		$txt=_FFReadHTML()
		$tenph=_StringBetween($txt,'<td class="col-md-3">','td>')
		For $ii=0 To UBound($tenph)-1
			$tenph1=_StringBetween($tenph[$ii],'- ','                                        </')
			$tenph2=StringReplace($tenph1[0],@LF,'')
			$f=FileOpen(@ScriptDir&'\phimtuan.txt',1)
			FileWrite($f,$tenph2&@CRLF)
			FileClose($f)
		Next
		_FFClick('fa fa-angle-right','class')
	Next
EndFunc


Func upphim14loi()
	_FFStart('http://phim14.net/danh-sach/phim-bo/page-1.html?order_by=last_update&category_id=&country_id=&year=')
	For $i=1 To 1
		_FFOpenURL('http://phim14.net/danh-sach/phim-bo/page-'&$i&'.html?order_by=last_update&category_id=&country_id=&year=')
		$txt=_FFReadHTML()
		$tenph=_StringBetween($txt,'<div class="name2">','</div>')
		For $ii=UBound($tenph)-1 To 0 Step -1
			$tenph1=StringReplace($tenph[$ii],'							','')
			$tenph1=StringReplace($tenph1,'						','')
			$tenph1=StringReplace($tenph1,@LF,'')
			If StringInStr($tenph1,' ...') Then
				$tenph1=StringReplace($tenph1,' ...','')
			EndIf
			$filephim14=FileOpen(@ScriptDir&'\phim14.txt',1)
			If StringInStr($filephim14,$tenph1) Then
				$phim14new=True
			Else
				MsgBox(0,'',$tenph1)
				FileWrite($filephim14,$tenph1&@CRLF)
			EndIf
			FileClose($filephim14)
		Next
	Next
	If $phim14new=True Then
		MsgBox(0,'','Có phim mới')
	Else
		MsgBox(0,'','Ko có phim mới')
	EndIf
EndFunc

