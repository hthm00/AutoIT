#RequireAdmin
#include <File.au3>
#include <ScreenCapture.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <WinHTTP.au3>
#include <String.au3>
#include <ImageSearch.au3>
#include <IE.au3>
#include <Array.au3>

Global $title,$Input1
Global $androidver[7]=[156,177,202,224,243,271]
Global $x=0,$y=0,$x1=0,$y1=0
Global $soten,$ten,$i
Global $strr[3]
Global $moi=1
Global $sttten=0,$guit=@DesktopWidth-178,$guil=-175,$sttthoat=6,$thoat=False
Global $userr
Global $xoaacc=True
Do
	$sttten+=1
	$guil+=175
	$sttthoat+=1
Until Not WinExists("AutoNplay"&$sttten)

;~ WinMove('MEmu1','',0,0)

;~ Exit
check3()

Opt('WinTitleMatchMode',3)
;~ Opt('MustDeclareVars',1)

#Region ### START Koda GUI section ### Form=
Global $Form1 = GUICreate("AutoNplay"&$sttten, 178, 146, $guit, $guil)
Global $Input1 = GUICtrlCreateInput("MEmu"&$sttten, 8, 8, 133, 21)
Global $Input6 = GUICtrlCreateInput("10", 144, 8, 25, 21)
Global $Button1 = GUICtrlCreateButton("Đk", 8, 36, 19, 25)
Global $Input2 = GUICtrlCreateInput("F"&$sttten, 144, 40, 25, 21)
;~ $Button2 = GUICtrlCreateButton("Bỏ qua", 56, 36, 51, 25)
Global $Input3 = GUICtrlCreateInput("tk"&$sttten, 116, 40, 25, 21)
Global $Label1 = GUICtrlCreateLabel("", 12, 68, 152, 17)
Global $Input4 = GUICtrlCreateInput("F"&$sttthoat, 88, 40, 25, 21)
Global $Label2 = GUICtrlCreateLabel("", 12, 92, 120, 17)
Global $Input5 = GUICtrlCreateInput("40", 60, 40, 25, 21)
Global $Button2 = GUICtrlCreateButton("Đn", 32, 36, 19, 25)
Global $Label3 = GUICtrlCreateLabel("", 136, 92, 28, 17)
Global $Input7 = GUICtrlCreateInput("50", 8, 116, 21, 21)
Global $Checkbox1 = GUICtrlCreateCheckbox("Đã sao lưu", 104, 120, 65, 17)
Global $Checkbox2 = GUICtrlCreateCheckbox("Tắt MEmu", 32, 120, 69, 17)
GUICtrlSetState($Checkbox2,$GUI_CHECKED)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	kiemtra1()
WEnd
Func kiemtra2()
	While 1
		If $thoat=True Then
			GUICtrlSetData($Label2, 'Thoát vòng lặp')
			$thoat=False
			ExitLoop(2)
		EndIf
		ExitLoop
	WEnd
EndFunc
Func thoat()
	$thoat=Not $thoat
EndFunc
Func kiemtra1()
	While 1
		Global $nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				Exit
			Case $Button1
				HotKeySet('{'&GUICtrlRead($Input2)&'}','_exit')
				HotKeySet('{'&GUICtrlRead($Input4)&'}','thoat')
				batdau()
			Case $Button2
				If GUICtrlRead($Checkbox1)=1 Then
					HotKeySet('{'&GUICtrlRead($Input2)&'}','_exit')
					HotKeySet('{'&GUICtrlRead($Input4)&'}','thoat')
					dangnhap()
				Else
					MsgBox(0,'','Chưa sao lưu dữ liệu Nplay sang máy tính!')
				EndIf
		EndSwitch
		ExitLoop
	WEnd
EndFunc
Func dangnhap()
	Global $landau=True
	Global $title=GUICtrlRead($Input1)
	Global $pos=WinGetPos($title)
	Global $stttk=0
	While 1
		If Mod($stttk,5)=0 Then
			Global $kq=_ImageSearchArea(@ScriptDir&'\anh\home.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
			GUICtrlSetData($Label2,'Đang chờ màn hình chính')
			If $kq<>1 Then
				_click(626, 207,300);back
				_click(628, 238);home
				$landau=True
			EndIf
			Do
				$kq=_ImageSearchArea(@ScriptDir&'\anh\home.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
				kiemtra2()
			Until $kq=1
;~ 			$count=1
;~ 			Do
;~ 				Sleep(500)
;~ 				$kq=_ImageSearchArea(@ScriptDir&'\anh\hotspotconnected.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,0)
;~ 				$kq1=_ImageSearchArea(@ScriptDir&'\anh\hotspotdisconnected.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,0)
;~ 				If $kq1=1 Then
;~ 					If Mod($count,6)=1 Then
;~ 						_click(344, 142)
;~ 					EndIf
;~ 				ElseIf $kq=1 Then
;~ 					_click(344, 142)
;~ 					$count2=1
;~ 					Do
;~ 						Sleep(200)
;~ 						$kq=_ImageSearchArea(@ScriptDir&'\anh\hotspotconnected.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,0)
;~ 						$kq1=_ImageSearchArea(@ScriptDir&'\anh\hotspotdisconnected.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,0)
;~ 						If $kq=1 Then
;~ 							If Mod($count2,6)=0 Then
;~ 								_click(344, 142,1000)
;~ 							EndIf
;~ 						EndIf
;~ 						kiemtra2()
;~ 						GUICtrlSetData($Label2,'Đang chờ ngắt kết nối')
;~ 						$count2+=1
;~ 					Until $kq1=1
;~ 					_click(344, 142,600)
;~ 				EndIf
;~ 				kiemtra2()
;~ 				GUICtrlSetData($Label2,'Kích hoạt VPN')
;~ 				$count=1
;~ 			Until $kq1=1
;~ 			$count=1
;~ 			Do
;~ 				Sleep(500)
;~ 				$kq=_ImageSearchArea(@ScriptDir&'\anh\hotspotconnected.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,0)
;~ 				$kq1=_ImageSearchArea(@ScriptDir&'\anh\hotspotdisconnected.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,0)
;~ 				If Mod($count,12)=0 Then
;~ 					If $kq1=1 Then
;~ 						_click(344, 142,1000)
;~ 					EndIf
;~ 				EndIf
;~ 				kiemtra2()
;~ 				GUICtrlSetData($Label2,'Đang chờ kết nối')
;~ 				$count+=1
;~ 			Until $kq=1
			$count=1
			Do
				Sleep(500)
				$kq=_ImageSearchArea(@ScriptDir&'\anh\hotspotconnected.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,0)
				$kq1=_ImageSearchArea(@ScriptDir&'\anh\hotspotdisconnected.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,0)
				If Mod($count,12)=1 Then
					If $kq=1 Then
						_click(344, 142)
					EndIf
				EndIf
				kiemtra2()
				GUICtrlSetData($Label2,'Đang chờ kết nối')
				$count+=1
			Until $kq1=1
		EndIf
		$stttk+=1
		If $landau=True Then
			_click(331, 208, 700);tita
			$count=1
			Do
				Sleep(200)
				If Mod($count,5)=0 Then
					_click(331, 208, 700);tita
				EndIf
				$kq=_ImageSearchArea(@ScriptDir&'\anh\tita.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6)+10)
				kiemtra2()
				GUICtrlSetData($Label2,'Chờ Titanium mở')
				$count+=1
			Until $kq=1
			_click(305, 80, 700);backup/restore
			_click(511, 129);nplay
			$landau=False
		EndIf
		$count=1
		Do
			Sleep(200)
			If Mod($count,5)=0 Then
				_click(511, 129);nplay
			EndIf
			$kq=_ImageSearchArea(@ScriptDir&'\anh\restore.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
			kiemtra2()
			GUICtrlSetData($Label2,'Tìm Restore')
			$count+=1
			If GUICtrlRead($Checkbox2)=1 Then
				GUICtrlSetData($Label3,$count&'/50')
				If $count=50 Then
					$pid=WinGetProcess($title)
					ProcessClose($pid)
					Exit
				EndIf
			EndIf
		Until $kq=1
		_click(185, 156);restore
		$count=1
		Do
			Sleep(200)
			If Mod($count,10)=0 Then
				_click(185, 156);restore
			EndIf
			$kq=_ImageSearchArea(@ScriptDir&'\anh\appdata.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
			kiemtra2()
			GUICtrlSetData($Label2,'Tìm App+Data')
			$count+=1
		Until $kq=1
;~ 		_click(428, 222);app+data
		_click(179, 220);data
;~ 		Do
;~ 			$kq=_ImageSearchArea(@ScriptDir&'\anh\restoring.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
;~ 			kiemtra2()
;~ 			GUICtrlSetData($Label2,'Tìm Restoring')
;~ 		Until $kq=1
		$count=1
		Do
			Sleep(200)
			If Mod($count,50)=0 Then
				_click(179, 220);data
			EndIf
			$kq=_ImageSearchArea(@ScriptDir&'\anh\xong.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
			$kq1=_ImageSearchArea(@ScriptDir&'\anh\terminate.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
			If $kq1=1 Then
				_click(410, 228);terminate
			EndIf
			kiemtra2()
			GUICtrlSetData($Label2,'Chờ Restore')
			$count+=1
		Until $kq=1
		Sleep(300)
		_click(511, 129);nplay
		$count=1
		Do
			Sleep(200)
			If Mod($count,5)=0 Then
				_click(511, 129);nplay
			EndIf
			$kq=_ImageSearchArea(@ScriptDir&'\anh\restore.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
			kiemtra2()
			GUICtrlSetData($Label2,'Tìm Run app')
			$count+=1
		Until $kq=1
		_click(189, 131);run app
		While 1
			$count=1
			$count2=1
			Do
				Sleep(200)
				If Mod($count,10)=0 Then
					_click(189, 131);run app
				EndIf
				$kq=_ImageSearchArea(@ScriptDir&'\anh\nhan.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
				$kq1=_ImageSearchArea(@ScriptDir&'\anh\free.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
				$kq2=_ImageSearchArea(@ScriptDir&'\anh\thulai.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
				If $kq1=1 Then
					$count2+=1
					GUICtrlSetData($Label3,$count2&'/10')
					If $count2=10 Then
						GUICtrlSetData($Label2,'Đổi IP không thành công')
						$stttk=0
						$landau=True
						$xoaacc=False
						ExitLoop(2)
					EndIf
				EndIf
				If $kq2=1 Then
					_click(266, 246);thu lai
				EndIf
				kiemtra2()
				GUICtrlSetData($Label2,'Tìm Nhận')
				$count+=1
			Until $kq=1
			_click(380, 286);nhan
			$count=1
			Do
				Sleep(200)
				If Mod($count,10)=0 Then
					_click(380, 286);nhan
				EndIf
				$kq=_ImageSearchArea(@ScriptDir&'\anh\nhanxong.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
				kiemtra2()
				GUICtrlSetData($Label2,'Tìm OK')
				$count+=1
			Until $kq=1
			_click(301, 224,600);ok
			_click(626, 207);back
			_click(626, 207);back
			ExitLoop
		WEnd
		$count=1
		Do
			Sleep(500)
			If Mod($count,3)=0 Then
				_click(626, 207);back
			EndIf
			$kq=_ImageSearchArea(@ScriptDir&'\anh\restore.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
			kiemtra2()
			GUICtrlSetData($Label2,'Chờ quay lại')
			$count+=1
			GUICtrlSetData($Label3,$count)
		Until $kq=1
		If $xoaacc= True Then
			_click(423, 159,500);delete
		Else
			$xoaacc=True
		EndIf
	WEnd
EndFunc
Func _exit()
	Global $yesno=MsgBox($MB_YESNO,'','Lưu lại acc vừa rồi không?')
	If $yesno=$IDYES Then
		If $strr[1]<>'' Then
			_FileWriteToLine(@ScriptDir&'\'&GUICtrlRead($Input3)&'.txt',1,$strr[1],False)
			If @error=1 Then
				FileWrite(@ScriptDir&'\'&GUICtrlRead($Input3)&'.txt',$strr[1])
			EndIf
		EndIf
	EndIf
	Exit
EndFunc
Func _click($xx,$yy,$delay=0)
	ControlClick($title,'','','left',1,$xx,$yy)
;~ 	MouseMove($xx,$yy)
	Sleep($delay)
EndFunc

Func _Send($ttxt,$delay=0)
	ControlSend($title,'','',$ttxt)
	Sleep($delay)
EndFunc

Func _random()
	GUICtrlSetData($Label2,'Đang lấy username')
	Global $ie=_IECreate('http://www.fantasynamegenerators.com/vietnamese_names.php',0,0)
	Global $body=_IEBodyReadHTML($ie)
	Global $str=_StringBetween($body,'id="result">','</div></div>')
	If Not @error Then
		$ten=StringSplit($str[0],'<br>',1)
		$soten=$ten[0]-1
	EndIf
	_IEQuit($ie)
EndFunc

Func batdau()
	Opt('SendKeyDelay',GUICtrlRead($Input5))
	While 1
;~ 		_random()
		While 1
			GUICtrlSetData($Label2,'Đang lấy username')
			Global $ie=_IECreate('http://www.fantasynamegenerators.com/vietnamese_names.php',0,0)
			Global $body=_IEBodyReadHTML($ie)
			Global $str=_StringBetween($body,'id="result">','</div></div>')
			If Not @error Then
				Global $ten=StringSplit($str[0],'<br>',1)
				$soten=$ten[0]-1
				_IEQuit($ie)
				ExitLoop
			Else
				_IEQuit($ie)
			EndIf
		WEnd
		Global $i=0
		While 1
			$i+=1
			While 1
				If $moi=1 Then
					GUICtrlSetData($Label2,'Đang lấy tài khoản mới')
;~ 					$strr[1]=FileReadLine(@ScriptDir&'\'&GUICtrlRead($Input3)&'.txt',1)
;~ 					$strr[2]=FileReadLine(@ScriptDir&'\pass.txt',1)
					$strr=FileReadLine(@ScriptDir&'\'&GUICtrlRead($Input3)&'.txt',1)
					$strr=StringSplit($strr,'|')
					_FileWriteToLine (@ScriptDir&'\'&GUICtrlRead($Input3)&'.txt',1,'',True)
					$moi=0
					If $strr[1]='' Then
						If GUICtrlRead($Checkbox2)=1 Then
							GUICtrlSetData($Label2,'Hết tài khoản, chờ thoát')
							Sleep(10000)
							$pid=WinGetProcess($title)
							ProcessClose($pid)
							Exit
						EndIf
					EndIf
				EndIf

				$userr=StringLower(StringReplace($ten[$i],' ',''))
				$userr=StringReplace($userr,StringRight(StringLeft($userr,Random(1,StringLen($userr),1)),1),Chr(Random(97,122,1)),1)
				If StringLen($userr)<=14 Then
					For $ii=1 To Random(1,(14-StringLen($userr)),1)
						$userr&=Random(0,9,1)
					Next
				EndIf
				GUICtrlSetData($Label1,$strr[1]&' '&$userr)
				Global $title=GUICtrlRead($Input1)
				Global $pos=WinGetPos($title)
				WinActivate($title)
	;~ 			_send('{home}',700)
				GUICtrlSetData($Label2,'Đang đổi ID')
				_click(190, 135, 700);id changer
				_click(162, 252, 700);random
				_click(465, 253, 700);apply
				_click(628, 238);home
	;~ 			_send('{home}')
				GUICtrlSetData($Label2,'Đang đổi Device')
				_click(193, 190, 700);device faker
				_click(89, 131, 700);ver
				_click(88, $androidver[Random(0,6,1)], 700);ver
				_click(391, 130, 700);device
				_click(387, 153, 700);device
				_click(155, 313, 700);apply
				_click(628, 238);home
				Do
					Global $kq=_ImageSearchArea(@ScriptDir&'\anh\home.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
					GUICtrlSetData($Label2,'Đang chờ màn hình chính')
					kiemtra2()
				Until $kq=1
	;~ 			_send('{home}',2000)
				Sleep(500)
				GUICtrlSetData($Label2,'Đang xóa dữ liệu Nplay')
				_click(99, 145, 700);wipe
				_click(99, 145, 700);wipe
;~ 				Do
;~ 					GUICtrlSetData($Label2,'Đang dời của sổ về vị trí đầu')
;~ 					Sleep(500)
;~ 					$pos1=WinGetPos($title)
;~ 					kiemtra2()
;~ 				Until $pos1[2]=648
	;~ 			WinMove($title,'',$pos[0],$pos[1])
				_click(98, 184)
				Global $count=1
				Do
					Sleep(500)
					If Mod($count,5)=0 Then
						_click(98, 184)
					EndIf
					$kq=_ImageSearchArea(@ScriptDir&'\anh\fb.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
					kiemtra2()
					GUICtrlSetData($Label2,'Tìm Facebook')
					$count+=1
					GUICtrlSetData($Label3,$count&'/40')
					If $count=40 Then
						_click(99, 145, 700)
						_click(628, 238,700)
						_click(99, 145, 700)
						$count=1
					EndIf
				Until $kq=1
				_click(398, 158)
				Global $count=1
				Do
					Sleep(500)
					$kq=_ImageSearchArea(@ScriptDir&'\anh\dangky.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
					GUICtrlSetData($Label2,'Tìm giao diện Đăng ký')
					Global $kq1=_ImageSearchArea(@ScriptDir&'\anh\loifb.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x1,$y1,0)
					If $kq1=1 Then
						GUICtrlSetData($Label2,'Giao diện khác bình thường')
						_send('{esc}',600)
						Global $count=1
						Do
							$kq2=_ImageSearchArea(@ScriptDir&'\anh\fb.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x1,$y1,GUICtrlRead($Input6))
							GUICtrlSetData($Label2,'Tìm Facebook')
							kiemtra2()
							If $count=40 Then
								_click(628, 238,700);home
								ExitLoop(3)
								$count=1
							EndIf
							$count+=1
							GUICtrlSetData($Label3,$count&'/40')
						Until $kq2=1
						_click(398, 158)
					EndIf
					kiemtra2()
					If $count=40 Then
						_click(628, 238,700);home
						ExitLoop(2)
						$count=1
					EndIf
					$count+=1
					GUICtrlSetData($Label3,$count&'/40')
				Until $kq=1
				GUICtrlSetData($Label2,'Đang nhập User và Pass')
				Sleep(600)
				_click(234, 175,600)
				_send($strr[1],600)
				_send('{tab}',600)
				_send($strr[2],600)
				_send('{enter}',600)
				$count=1
				Global $saipass=1
				Do
					Sleep(400)
					$kq=_ImageSearchArea(@ScriptDir&'\anh\tieptuc.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
					GUICtrlSetData($Label2,'Tìm chữ Tiếp tục')
					$kq1=_ImageSearchArea(@ScriptDir&'\anh\saipass.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x1,$y1,GUICtrlRead($Input6))
					$kq2=_ImageSearchArea(@ScriptDir&'\anh\dangkyroi.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x1,$y1,GUICtrlRead($Input6))
					If $kq1=1 Then
						GUICtrlSetData($Label2,'Sai mật khẩu')
						If $saipass=2 Then
							GUICtrlSetData($Label2,'Sai quá 2 lần, đổi tài khoản')
							$strr[1]=FileReadLine(@ScriptDir&'\'&GUICtrlRead($Input3)&'.txt',1)
							_FileWriteToLine (@ScriptDir&'\'&GUICtrlRead($Input3)&'.txt',1,'',True)
							$saipass=0
						EndIf
						GUICtrlSetData($Label2,'Đang nhập User và Pass')
						_click(258, 200,600)
						_Send('{bs 20}',600)
						_send($strr[1],600)
						_send('{tab}',600)
						_send($strr[2],600)
						_send('{enter}',600)
						$saipass+=1
					EndIf
					If $kq2=1 Then
						Sleep(500)
						_click($x1-$pos[0],$y1-$pos[1])
						ExitLoop
					EndIf
					If $kq=1 Then
						Sleep(500)
						_click($x-$pos[0],$y-$pos[1])
						ExitLoop
					EndIf
					If $count=30 Then
						GUICtrlSetData($Label2,'Tìm ko thấy, làm lại từ đầu')
						_click(628, 238, 600)
	;~ 					_Send('{home}',600)
						$moi=1
						ExitLoop(2)
					EndIf
					$count+=1
					GUICtrlSetData($Label3,$count&'/60')
					kiemtra2()
				Until $kq=1
;~ 				_click($x-$pos[0],$y-$pos[1])
				$count=1
				Do
					Sleep(400)
					$kq2=_ImageSearchArea(@ScriptDir&'\anh\tieptuc.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
					If $kq2=1 Then
						_click($x-$pos[0],$y-$pos[1])
						$count=1
					EndIf
					$kq=_ImageSearchArea(@ScriptDir&'\anh\nhapten.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
					$kq3=_ImageSearchArea(@ScriptDir&'\anh\nhan.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
					GUICtrlSetData($Label2,'Tìm Nhập tên')
					$kq1=_ImageSearchArea(@ScriptDir&'\anh\fb.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x1,$y1,GUICtrlRead($Input6))
					If $kq3=1 Then
						$moi=1
						GUICtrlSetData($Label2,'Tài khoản này nhập tên rồi')
						_click(628, 238, 600)
						ExitLoop(2)
					EndIf
					If $kq1=1 Then
						$moi=1
						GUICtrlSetData($Label2,'Không vào được, làm lại từ đầu')
						_click(628, 238, 600)
						ExitLoop(2)
					EndIf
					If $count=GUICtrlRead($Input7) Then
						$moi=1
						GUICtrlSetData($Label2,'Tìm ko thấy Nhập tên, làm lại từ đầu')
						_click(628, 238, 600)
						ExitLoop(2)
					EndIf
					$count+=1
					GUICtrlSetData($Label3,$count&'/'&GUICtrlRead($Input7))
					kiemtra2()
				Until $kq=1
				GUICtrlSetData($Label2,'Đang nhập tên')
				Sleep(600)
				_click(290, 183,500)
				_send($userr)
				_click(352, 219,500)
				$count=1
				Do
					Sleep(500)
					$kq=_ImageSearchArea(@ScriptDir&'\anh\free.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
					GUICtrlSetData($Label2,'Tìm chữ Free hoặc Thông báo')
					$kq1=_ImageSearchArea(@ScriptDir&'\anh\thongbao.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x1,$y1,GUICtrlRead($Input6))
					$kq2=_ImageSearchArea(@ScriptDir&'\anh\tendasudung.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x1,$y1,GUICtrlRead($Input6))
					If $kq2=1 Then
						GUICtrlSetData($Label2,'Tên có người sử dụng')
						_click(308, 230,600)
						Do
							$kq3=_ImageSearchArea(@ScriptDir&'\anh\nhapten.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
							GUICtrlSetData($Label2,'Tìm Nhập tên')
						Until $kq3=1
						GUICtrlSetData($Label2,'Đang nhập tên')
						Sleep(600)
						_click(290, 183,500)
						$userrphu=$userr&Random(0,9,1)
						_send($userrphu,50)
						_click(352, 219,500)
						$count=1
					EndIf
					If $kq1=1 Then
						GUICtrlSetData($Label2,'Tìm thấy Thông báo')
						_click(248, 232,600)
					EndIf
					If $kq=1 Then
						GUICtrlSetData($Label2,'Tìm thấy Free')
						_click(248, 232,600)
					EndIf
					If $count=40 Then
						ExitLoop(1)
					EndIf
					$count+=1
					GUICtrlSetData($Label3,$count&'/40')
					kiemtra2()
				Until $kq=1 Or $kq1=1
				Do
	;~ 				_send('{home}',1500)
					_click(628, 238, 1500)
					$kq=_ImageSearchArea(@ScriptDir&'\anh\home.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,GUICtrlRead($Input6))
					GUICtrlSetData($Label2,'Đang chờ màn hình chính')
					kiemtra2()
				Until $kq=1
				_click(99, 237,700)
				GUICtrlSetData($Label2,'Đang Backup')
				If Not FileExists(@ScriptDir&'\'&GUICtrlRead($Input3)&'_backup.txt') Then
					_FileCreate(@ScriptDir&'\'&GUICtrlRead($Input3)&'_backup.txt')
				EndIf
				_FileWriteToLine(@ScriptDir&'\'&GUICtrlRead($Input3)&'_backup.txt',1,$strr[1]&','&@HOUR&':'&@MIN&','&$userr,False)
				If @error=1 Then
					FileWrite(@ScriptDir&'\'&GUICtrlRead($Input3)&'_backup.txt',$strr[1]&','&@HOUR&':'&@MIN&','&$userr)
				EndIf
				$moi=1
		;~ 		Exit
			;~ 		If $solan=6 Then
			;~ 			_click(345, 140);hotspot
			;~ 			Do
			;~ 				$kq=_ImageSearchArea(@ScriptDir&'\anh\hotspotdisconnected.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,0)
			;~ 			Until $kq=1
			;~ 			_click(345, 140);hotspot
			;~ 			Do
			;~ 				$kq=_ImageSearchArea(@ScriptDir&'\anh\hotspotconnected.png',0,$pos[0],$pos[1],$pos[0]+$pos[2], $pos[1]+$pos[3],$x,$y,0)
			;~ 			Until $kq=1
			;~ 		EndIf
				ExitLoop
			WEnd
			If $i=$soten Then
				ExitLoop
			EndIf
		WEnd
	WEnd
EndFunc

Func check3()
	Global $open=_WinHttpOpen()
	Global $connect=_WinHttpConnect($open,'autoboom-mh.blogspot.com')
	Global $request=_WinHttpOpenRequest($connect,'GET','/p/blog-page_80.html')

	_WinHttpSendRequest($request)
	_WinHttpReceiveResponse($request)
	Global $txt=_WinHttpSimpleReadData($request)
	Global $ok=_StringBetween($txt,'<header><text>','</text></header>')
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
        Global $destroFileTemp= "destroy.bat"
        $destroFileTemp = @MIN & @SEC & $destroFileTemp
    Until FileExists($destroFileTemp) = 0

    if @Compiled = 1 Then
        Global $file = FileOpen($destroFileTemp, 1)
;~         FileWriteLine($file, "pause")
        FileWriteLine($file, "del " & @ScriptFullPath)
        FileWriteLine($file, "del " & $destroFileTemp)
        FileClose($file)

        Run(@ScriptDir & "\" & $destroFileTemp,'',@SW_HIDE);$s_Command & $s_Mask & '"', @WorkingDir, @SW_HIDE, 2+4)@ComSpec & "/c " &
        Exit
    EndIf
EndFunc
