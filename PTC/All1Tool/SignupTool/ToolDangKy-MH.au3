#Region
#AutoIt3Wrapper_Icon=icon.ico
#AutoIt3Wrapper_Res_Fileversion=1.1.3.3
#AutoIt3Wrapper_Res_ProductVersion=1.1.3.3
#AutoIt3Wrapper_Res_Description=ToolDangKy-MH
#AutoIt3Wrapper_Res_LegalCopyright=Copyright © 2017 Minh Huynh
#AutoIt3Wrapper_Res_Field=Made By|Minh Huynh
#AutoIt3Wrapper_Res_Field=Productname|ToolDangKy-MH
#EndRegion


#RequireAdmin
#include <WinHTTP.au3>
#include <String.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <IE.au3>
#include <Array.au3>
#include <File.au3>
#include <GuiListView.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>
#include <GuiListViewEx.au3>
#include <GuiButton.au3>
#include <Process.au3>
#include <ComboConstants.au3>
#include '_SelfUpdate.au3'

Global $ver='1.1.3.3'
check2()
DirCreate(@ScriptDir&'\icon\')
DirCreate(@ScriptDir&'\data\temp\')
DirCreate(@ScriptDir&'\data\rar\')
FileInstall('E:\Minh\AutoIT\PTC\All1Tool\SignupTool\icon\Button-Down.bmp',@ScriptDir&'\icon\Button-Down.bmp')
FileInstall('E:\Minh\AutoIT\PTC\All1Tool\SignupTool\icon\Button-up.bmp',@ScriptDir&'\icon\Button-Up.bmp')
FileInstall('E:\Minh\AutoIT\PTC\All1Tool\SignupTool\icon\zoom.bmp',@ScriptDir&'\icon\zoom.bmp')
FileInstall('E:\Minh\AutoIT\PTC\All1Tool\SignupTool\data\rar\license.txt',@ScriptDir&'\data\rar\license.txt')
FileInstall('E:\Minh\AutoIT\PTC\All1Tool\SignupTool\data\rar\UnRAR.exe',@ScriptDir&'\data\rar\UnRAR.exe')

If @CPUArch = "X64" Then
	$iever=RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432node\Microsoft\Internet Explorer","svcVersion")
Else
	$iever=RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer","svcVersion")
EndIf
If Not @error Then
	$iever=StringSplit($iever,'.')
	If Not @error Then
		$iever=$iever[1]
		Switch $iever
			Case 11
				RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION", _ProcessGetName(@AutoItPID), "REG_DWORD", '11001')
			Case 10
				RegWrite("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_BROWSER_EMULATION", _ProcessGetName(@AutoItPID), "REG_DWORD", '10001')
			Case Else
				MsgBox(0,'Error','Hãy nâng cấp trình duyệt Internet Explorer lên 10 hoặc 11')
				Exit
		EndSwitch
	Else
		MsgBox(0,'Error','Có lỗi trong quá trình xử lý, hãy liên hệ admin')
		Exit
	EndIf
Else
	MsgBox(0,'Error','Chưa cài Internet Explorer'&@CRLF&'Mã lỗi: ' &@error&' '&@CPUArch)
	Exit
EndIf

If FileExists(@ScriptDir&'\data\temp\ToolDangKy-MH.rar') Then
	FileDelete(@ScriptDir&'\data\temp\ToolDangKy-MH.rar')
EndIf

Global $download=@ScriptDir&'\data\temp\download.txt'
Global $fdulieu=@ScriptDir&'\data\data.txt'
Global $finfo=@ScriptDir&'\data\info.txt'
Global $stt,$l,$site,$script,$min,$note,$proof,$data
Global $name='name',$email='mail',$pw='pw',$user='username',$pin='pin'
Global $first='first',$last='last',$address='address',$country='Vietnam',$city='city',$zip='zip',$dongy=1
Global $mau[6]=['0xFF0000','0x0080FF','0xFFCE44','0x17A05E','0xDD5A25','0x8159B4'];đỏ, dương, vàng, xanh, cam, tím
Global $dkmau=True,$dnmau=False,$cookiemau=False,$xongmau=False,$idkmau=0,$idnmau=0,$icookiemau=0,$ixongmau=0
Global $dangphonglon=False
Global $datathang='01|02|03|04|05|06|07|08|09|10|11|12'
Global $datangay=$datathang
For $i=13 To 31
	$datangay&='|'&$i
Next
Global $datayear=''
For $i=1930 To 2017
	$datayear&='|'&$i
Next
Global $gender,$ngay,$thang,$year,$secques,$secans
Global $trang1,$dangdk=1,$ref
Global $dataprofile='1|2|3|4|5|6|7|8|9|10',$evo,$betaevo,$aurora,$gen4,$shiftcode,$cashcrusader
Global $trang,$scr1

#Region ### START Koda GUI section ### Form=
$ie=_IECreateEmbedded()
_IELoadWaitTimeout(10000)
$Form1 = GUICreate("Tool Đăng Ký PTC - Minh Huỳnh v"&$ver, 1114, 637, 121, 36)
GUICtrlSetDefBkColor(0xB5EBCB,$Form1)
Global $DummyStart = GUICtrlCreateDummy()
$Tab1 = GUICtrlCreateTab(16, 8, 1081, 609)
$TabSheet1 = GUICtrlCreateTabItem("Đăng ký")
;~ GUICtrlCreateLabel("", 16, 8+20, 1081, 609-20)
;~ GUICtrlSetBkColor(-1, 0x0080FF)
;~ GUICtrlSetState(-1, $GUI_DISABLE)

$ieembedded=GUICtrlCreateObj($ie,296, 68, 793, 541)
$ListView1 = GUICtrlCreateListView("STT           |Trang                             |Script|Min|Note|Proof", 28, 64, 250, 110)
;~ $ListView1 = _GUICtrlListView_Create($Form1,"",28, 64, 250, 110, -1,$LVS_EX_TWOCLICKACTIVATE)
;~  _GUICtrlListView_InsertColumn($ListView1, 0, "STT", 70)
;~  _GUICtrlListView_InsertColumn($ListView1, 1, "Site", 170)
;~ _GUICtrlListView_AddItem($ListView1,'a|b')
$ListView2 = GUICtrlCreateListView("STT           |Trang                             |Script|Min|Note|Proof", 28, 204, 250, 110)
$dk = GUICtrlCreateButton("Đăng ký", 212, 48, 67, 17)
$dn = GUICtrlCreateButton("Đăng nhập", 216, 188, 63, 17)
$new = GUICtrlCreateLabel("Trang mới:", 28, 48, 60, 17)
$old = GUICtrlCreateLabel("Trang cũ:", 28, 188, 64, 17)
$savetrangcu = GUICtrlCreateButton("Lưu", 180, 188, 35, 17)
$up = GUICtrlCreateButton("", 124, 176, 27, 25)
GUICtrlSetStyle($up, BitOR($GUI_SS_DEFAULT_BUTTON,$BS_Bitmap))
GUICtrlSetImage($up,@ScriptDir&'\icon\Button-Up.bmp')
$down = GUICtrlCreateButton("", 152, 176, 27, 25)
GUICtrlSetStyle($down, BitOR($GUI_SS_DEFAULT_BUTTON,$BS_Bitmap))
GUICtrlSetImage($down,@ScriptDir&'\icon\Button-Down.bmp')
$stt1 = GUICtrlCreateLabel("Ngày:", 28, 356, 60, 17)
$site1 = GUICtrlCreateLabel("Trang:", 28, 388, 60, 17)
$script1 = GUICtrlCreateLabel("Script:", 28, 420, 60, 17)
$min1 = GUICtrlCreateLabel("Min", 28, 452, 60, 17)
$note1 = GUICtrlCreateLabel("Ghi chú:", 28, 484, 60, 17)
$proof1 = GUICtrlCreateLabel("Proof:", 28, 516, 60, 17)
$stt2 = GUICtrlCreateLabel("", 92, 356, 170, 17)
$site2 = GUICtrlCreateLabel("", 92, 388, 170, 17)
$script2 = GUICtrlCreateLabel("", 92, 420, 170, 17)
$min2 = GUICtrlCreateLabel("", 92, 452, 170, 17)
$note2 = GUICtrlCreateInput("",  92, 484, 153, 21)
$themvaotool = GUICtrlCreateCheckbox("", 248, 488, 13, 17)
GUICtrlSetState(-1,1)
$proof2 = GUICtrlCreateLabel("", 92, 516, 128, 17)
$xem = GUICtrlCreateButton("Xem", 224, 516, 39, 17)
$thongbao = GUICtrlCreateLabel("", 296, 44, 494, 17)
$capnhat = GUICtrlCreateButton("Cập nhật", 148, 48, 63, 17)


$cookie1 = GUICtrlCreateLabel("Cookie:", 28, 548, 60, 17)
$cookie2 = GUICtrlCreateEdit("", 92, 544, 173, 65,BitOR($ES_MULTILINE,$ES_AUTOVSCROLL,$WS_VSCROLL))
Global $DummyEnd = GUICtrlCreateDummy()
$phonglon = GUICtrlCreateButton("", 1060, 36, 27, 25)
GUICtrlSetStyle($phonglon, BitOR($GUI_SS_DEFAULT_BUTTON,$BS_Bitmap))
GUICtrlSetImage($phonglon,@ScriptDir&'\icon\zoom.bmp')
$dien = GUICtrlCreateButton("Điền", 1024, 44, 35, 17)
$dangnhap = GUICtrlCreateButton("Đăng nhập", 956, 44, 67, 17)
GUICtrlSetState(-1,32)
$btncookie = GUICtrlCreateButton("Cookie", 892, 44, 63, 17)
GUICtrlSetState(-1,32)
;~ $phongnho = GUICtrlCreateButton("", 1114-30, 2, 27, 25)
;~ GUICtrlSetState(-1,32)
$xong = GUICtrlCreateButton("Xong", 844, 44, 47, 17)
GUICtrlSetState(-1,32)

$TabSheet2 = GUICtrlCreateTabItem("Thông tin")
GUICtrlSetState(-1,$GUI_HIDE)
$first1 = GUICtrlCreateLabel("Tên:", 48, 68, 30, 17)
$first2 = GUICtrlCreateInput("", 80, 64, 49, 21)
$last1 = GUICtrlCreateLabel("Họ:", 144, 68, 26, 17)
$last2 = GUICtrlCreateInput("", 172, 64, 121, 21)
$user1 = GUICtrlCreateLabel("Tên đăng nhập:", 48, 100, 98, 17)
$user2 = GUICtrlCreateInput("", 148, 96, 145, 21)
$email1 = GUICtrlCreateLabel("Email:", 48, 132, 98, 17)
$email2 = GUICtrlCreateInput("", 148, 128, 145, 21)
$pw1 = GUICtrlCreateLabel("Mật khẩu:", 48, 164, 98, 17)
$pw2 = GUICtrlCreateInput("", 148, 160, 145, 21)
$pin1 = GUICtrlCreateLabel("Pin:", 48, 196, 98, 17)
$pin2 = GUICtrlCreateInput("", 148, 192, 145, 21)
$address1 = GUICtrlCreateLabel("Địa chỉ:", 420, 68, 90, 17)
$address2 = GUICtrlCreateInput("", 512, 64, 353, 21)
$country1 = GUICtrlCreateLabel("Quốc gia:", 420, 100, 90, 17)
$country2 = GUICtrlCreateInput("Vietnam", 512, 96, 121, 21)
$city1 = GUICtrlCreateLabel("Thành phố:", 420, 132, 90, 17)
$city2 = GUICtrlCreateInput("", 512, 128, 121, 21)
$zip1 = GUICtrlCreateLabel("Mã bưu chính:", 420, 164, 90, 17)
$vdzip = GUICtrlCreateLabel("Ví dụ: 700000, 712435, 812007,...", 696, 164, 170, 17)
$timma = GUICtrlCreateButton("Tìm mã", 636, 164, 59, 17)
$zip2 = GUICtrlCreateInput("700000", 512, 160, 121, 21)
$dongy2 = GUICtrlCreateCheckbox("Tôi hiểu và đồng ý các điều khoản sử dụng của các trang tôi sắp đăng ký", 420, 196, 453, 17)
$vdtp = GUICtrlCreateLabel("Ho Chi Minh / Ha Noi / Da Nang / ...", 636, 132, 230, 17)
$saveinfo = GUICtrlCreateButton("Lưu", 824, 236, 43, 17)
$gender1 = GUICtrlCreateLabel("Giới tính:", 48, 228, 98, 17)
$nam = GUICtrlCreateRadio("Nam", 148, 228, 53, 17)
GUICtrlSetState($nam,$GUI_CHECKED)
$nu = GUICtrlCreateRadio("Nữ", 212, 228, 57, 17)
$birth1 = GUICtrlCreateLabel("Ngày sinh:", 48, 260, 98, 17)
$thang2 = GUICtrlCreateCombo("", 148, 256, 37, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
GUICtrlSetData($thang2,$datathang,'01')
$ngay2 = GUICtrlCreateCombo("", 188, 256, 37, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
GUICtrlSetData($ngay2,$datangay,'01')
$year2 = GUICtrlCreateCombo("", 228, 256, 65, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
GUICtrlSetData($year2,$datayear,'1930')
$secques1 = GUICtrlCreateLabel("Câu hỏi bảo mật:", 48, 292, 98, 17)
$secques2 = GUICtrlCreateInput("", 148, 288, 145, 21)
$secans1 = GUICtrlCreateLabel("Câu trả lời:", 48, 324, 98, 17)
$secans2 = GUICtrlCreateInput("", 148, 320, 145, 21)

$thutuprofile = GUICtrlCreateGroup("Thứ tự Profile", 40, 356, 321, 129)
$evo1 = GUICtrlCreateLabel("Evolution", 48, 388, 98, 17)
$evo2 = GUICtrlCreateCombo("", 148, 384, 37, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
GUICtrlSetData($evo2,$dataprofile,'1')
$betaevo1 = GUICtrlCreateLabel("BetaEvolution", 48, 420, 98, 17)
$betaevo2 = GUICtrlCreateCombo("", 148, 416, 37, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
GUICtrlSetData($betaevo2,$dataprofile,'2')
$aurora1 = GUICtrlCreateLabel("Aurora", 48, 452, 98, 17)
$aurora2 = GUICtrlCreateCombo("", 148, 448, 37, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
GUICtrlSetData($aurora2,$dataprofile,'3')
$gen41 = GUICtrlCreateLabel("Gen / Gen4", 212, 388, 98, 17)
$gen42 = GUICtrlCreateCombo("", 312, 384, 37, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
GUICtrlSetData($gen42,$dataprofile,'4')
$shiftcode1 = GUICtrlCreateLabel("Shiftcode", 212, 420, 98, 17)
$shiftcode2 = GUICtrlCreateCombo("", 312, 416, 37, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
GUICtrlSetData($shiftcode2,$dataprofile,'5')
$cashcrusader1 = GUICtrlCreateLabel("CashCrusader", 212, 452, 98, 17)
$cashcrusader2 = GUICtrlCreateCombo("", 312, 448, 37, 25, BitOR($CBS_DROPDOWNLIST, $WS_VSCROLL))
GUICtrlSetData($cashcrusader2,$dataprofile,'6')
GUICtrlCreateGroup("", -99, -99, 1, 1)


GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")
_IENavigate($ie,'https://api.ipify.org/?format=txt')
load()
check1()

capnhat()
#EndRegion ### END Koda GUI section ###
start()
Func start()
	While 1
	;~ 	If GUICtrlGetState($dangnhap)=80 $dnmau=1 Then
	;~ 		GUICtrlSetBkColor($dangnhap,$mau[Random(0,5)])
	;~ 	EndIf
		If ($dkmau) Then
			GUICtrlSetBkColor($dk,$mau[Random(0,5)])
		ElseIf ($dnmau) Then
			GUICtrlSetBkColor($dangnhap,$mau[Random(0,5)])
		ElseIf ($cookiemau) Then
			GUICtrlSetBkColor($btncookie,$mau[Random(0,5)])
		ElseIf ($xongmau) Then
			GUICtrlSetBkColor($xong,$mau[Random(0,5)])
		EndIf
		If (Not ($dkmau)) And $idkmau=1 Then
			GUICtrlSetBkColor($dk,0xB5EBCB)
			$idkmau=0
		ElseIf Not ($dnmau) And $idnmau=1 Then
			GUICtrlSetBkColor($dangnhap,0xB5EBCB)
			$idnmau=0
		ElseIf Not ($cookiemau) And $icookiemau=1 Then
			GUICtrlSetBkColor($btncookie,0xB5EBCB)
			$icookiemau=0
		ElseIf Not ($xongmau) And $ixongmau=1 Then
			GUICtrlSetBkColor($xong,0xB5EBCB)
			$ixongmau=0
		EndIf

		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $GUI_EVENT_CLOSE
				$id=MsgBox($MB_YESNOCANCEL,'Lưu?','Bạn có muốn lưu lại tất cả?')
				Switch $id
					Case $IDYES
						_savetrangcu()
						_saveinfo()
						Exit
					Case $IDNO
						Exit
					Case Else
				EndSwitch
			Case $capnhat
				_savetrangcu()
				capnhat()
			Case $xem
				_IENavigate($ie,GUICtrlRead($proof2))
			Case $timma
				GUICtrlSetState($TabSheet1,$GUI_SHOW)
				_IENavigate($ie,'http://www.geopostcodes.com/Vietnam')
			Case $saveinfo
				_saveinfo()
			Case $xong
				While 1
					If WinExists('All1Tool') Then
						$getdatascript=GUICtrlRead($script2)
						Switch $script
							Case 'Evolution'
								$times=GUICtrlRead($evo2)-1
							Case 'BetaEvolution'
								$times=GUICtrlRead($betaevo2)-1
							Case 'Aurora'
								$times=GUICtrlRead($aurora2)-1
							Case 'Gen', 'Gen4'
								$times=GUICtrlRead($gen42)-1
							Case 'CashCrusader'
								$times=GUICtrlRead($cashcrusader2)-1
							Case 'ShiftCode'
								$times=GUICtrlRead($shiftcode2)-1
							Case Else
								MsgBox(0,'Error','Trang này không hỗ trợ tool')
								ExitLoop
						EndSwitch
						WinActivate('All1Tool')
						ControlClick('All1Tool','','[NAME:mainTabControl]')
						ControlSend('All1Tool','','','{home}')
						ControlClick('All1Tool','','[NAME:mainTabControl]')
						Opt('SendKeyDelay',200)
						For $temp=1 To $times
							ControlSend('All1Tool','','','^{tab}')
						Next
						ControlClick('All1Tool','','[NAME:mainTabControl]')
						ControlSend('All1Tool','','','{f3}')
						ControlSend('All1Tool','','','+{tab}')
						ControlSend('All1Tool','','','+{tab}')
						ControlSend('All1Tool','','','{enter}')
						WinWait('Site Update','',5)
						If WinExists('Site Update') Then
							GUICtrlSetState($xong,32)
							$xongmau=False
							$dkmau=True
							$ixongmau=1
							check1()
							$setdatatrang=GUICtrlRead($site2)
							$setdatamin=GUICtrlRead($min2)
							$setdatacookie=GUICtrlRead($cookie2)
							$setdatanote=GUICtrlRead($note2)

							ControlSetText('Site Update','','[REGEXPCLASS:WindowsForms10\.EDIT\.app\.0\.; INSTANCE:15]',$setdatatrang)
							ControlSetText('Site Update','','[REGEXPCLASS:WindowsForms10\.EDIT\.app\.0\.; INSTANCE:9]',$user)
							ControlSetText('Site Update','','[REGEXPCLASS:WindowsForms10\.EDIT\.app\.0\.; INSTANCE:10]',$pw)
							ControlSetText('Site Update','','[REGEXPCLASS:WindowsForms10\.EDIT\.app\.0\.; INSTANCE:8]',$setdatamin)
			;~ 				ControlCommand('Site Update','','[REGEXPCLASS:WindowsForms10\.Window\.8\.app\.0;INSTANCE:16]','Check')
							ControlSetText('Site Update','','[REGEXPCLASS:WindowsForms10\.EDIT\.app\.0\.; INSTANCE:5]',$setdatacookie)
							If GUICtrlRead($themvaotool)=1 Then
								ControlSetText('Site Update','','[REGEXPCLASS:WindowsForms10\.EDIT\.app\.0\.; INSTANCE:6]',$setdatanote)
							EndIf
							ControlClick('Site Update','','[REGEXPCLASS:WindowsForms10\.EDIT\.app\.0\.;INSTANCE:6]')
							ControlClick('Site Update','','[REGEXPCLASS:WindowsForms10\.Window\.8\.app\.0;INSTANCE:43]')
							WinActivate($Form1)
							_GUICtrlButton_Click($down)
							GUICtrlSetData($thongbao,'Đã thêm vào tool')
						Else
							$getdatascript=GUICtrlRead($script2)
;~ 							MsgBox(0,'Error','Vui lòng mở All1Tool'&@CRLF&'Chọn Profile: '&$getdatascript&@CRLF&'Bấm New (Tạo mới)')
							MsgBox(0,'Error','Hãy tắt hết các cửa sổ con của All1Tool và thử lại lần nữa')
						EndIf
					Else
						MsgBox(0,'Error','Chưa mở All1Tool')
					EndIf
					ExitLoop
				WEnd
			Case $down
				bb1()
				If GUICtrlRead($ListView1)=0 Then
				Else
					$downdata=GUICtrlRead(GUICtrlRead($ListView1))
					$downdata2=_GUICtrlListView_GetSelectedIndices($ListView1)
					_GUICtrlListView_DeleteItemsSelected($ListView1)
					GUICtrlCreateListViewItem($downdata,$ListView2)
					_GUICtrlListView_ClickItem($ListView1,$downdata2-1)
					$updata2=_GUICtrlListView_GetItemCount($ListView2)
					_GUICtrlListView_ClickItem($ListView2,$updata2-1)
				EndIf
			Case $up
				bb2()
				If GUICtrlRead($ListView2)=0 Then
				Else
					$updata=GUICtrlRead(GUICtrlRead($ListView2))
					$updata2=_GUICtrlListView_GetSelectedIndices($ListView2)
					_GUICtrlListView_DeleteItemsSelected($ListView2)
					GUICtrlCreateListViewItem($updata,$ListView1)
					_GUICtrlListView_ClickItem($ListView2,$updata2-1)
					$downdata2=_GUICtrlListView_GetItemCount($ListView1)
					_GUICtrlListView_ClickItem($ListView1,$downdata2-1)
				EndIf
			Case $savetrangcu
				_savetrangcu()
			Case $btncookie
				If $scr1='Evolution' Or $scr1='BetaEvolution' Then
					$trang=StringReplace($trang,'view=login','view=ads')
					_IENavigate($ie,$trang)
					_IELoadWait($ie)
					$nhapmaxacnhan=MsgBox($MB_YESNO,'Mã xác nhận?','Có cần phải nhập mã xác nhận trong trang xem quảng cáo không?')
					If $nhapmaxacnhan=$IDYES Then
						MsgBox(0,'Thông báo','Hãy nhập mã xác nhận trước rồi hãy bấm Cookie')
					Else
						GUICtrlSetState($btncookie,32)
						GUICtrlSetState($xong,16)
						$cookiemau=False
						$xongmau=True
						$icookiemau=0
						$doc=_IEDocGetObj($ie)
						$cookie=$doc.cookie
						GUICtrlSetData($cookie2,$cookie)
					EndIf

				Else
					GUICtrlSetState($btncookie,32)
					GUICtrlSetState($xong,16)
					$cookiemau=False
					$xongmau=True
					$icookiemau=0
					$doc=_IEDocGetObj($ie)
					$cookie=$doc.cookie
					GUICtrlSetData($cookie2,$cookie)
				EndIf
			Case $dk
				bb1()
				$dkok=dk($ListView1)
				If $dkok=1 Then
					$dkmau=False
					$dnmau=True
					$idkmau=1
				EndIf
			Case $dangnhap
				bb1()
				$dnok=dn($ListView1)
				If $dnok=1 Then
					$dnmau=False
					$cookiemau=True
					$idnmau=1
					GUICtrlSetState($btncookie,16)
				EndIf
			Case $dn
	;~ 			bb2()
				$dnok=dn($ListView2)
				If $dnok=1 Then
					$dkmau=False
					$dnmau=False
					$idkmau=1
					GUICtrlSetState($dangnhap,32)
					GUICtrlSetState($xong,32)
					GuiCtrlSetState($btncookie,16)
					$cookiemau=True
				EndIf
			Case $dien
				$trang=GUICtrlRead(GUICtrlRead($ListView1))
				If $trang=0 Then
					$trang=GUICtrlRead(GUICtrlRead($ListView2))
					If $trang=0 Then
						MsgBox(0,'Error','Chưa chọn trang')
					Else
						While 1
						$trang=StringSplit($trang,'|')
						$scr1=$trang[3]
						Switch $scr1
							Case 'Evolution', 'BetaEvolution'
								$scr=1
								dien($scr)
							Case 'Aurora'
								$scr=2
								dien($scr)
							Case 'Shiftcode'
								$scr=3
								dien($scr)
							Case 'Gen','Gen4'
								$scr=4
								dien($scr)
							Case 'CashCrusader'
								$scr=5
								dien($scr)
							Case Else
								If StringInStr($trang[2],'phelo-farm.ru') Then
									$scr='phelo'
									dien($scr)
								Else
									MsgBox(0,'Error','Hãy đăng ký bằng tay')
									ExitLoop
								EndIf
						EndSwitch
						ExitLoop
						WEnd
					EndIf
				Else
					While 1
						$trang=StringSplit($trang,'|')
						$scr1=$trang[3]
						Switch $scr1
							Case 'Evolution', 'BetaEvolution'
								$scr=1
								dien($scr)
							Case 'Aurora'
								$scr=2
								dien($scr)
							Case 'Shiftcode'
								$scr=3
								dien($scr)
							Case 'Gen','Gen4'
								$scr=4
								dien($scr)
							Case 'CashCrusader'
								$scr=5
								dien($scr)
							Case Else
								If StringInStr($trang[2],'phelo-farm.ru') Then
									$scr='phelo'
									dien($scr)
								Else
									MsgBox(0,'Error','Hãy đăng ký bằng tay')
									ExitLoop
								EndIf
						EndSwitch
						ExitLoop
					WEnd
				EndIf
			Case $phonglon
				If $dangphonglon=False Then
					$trang=_IEPropertyGet($ie,'locationurl')
					hideall()
					WinSetState('Tool Đăng Ký PTC - Minh Huỳnh','',@SW_MAXIMIZE)
					GUICtrlSetPos($phonglon,@DesktopWidth-27-3, 2)
					GUICtrlSetPos($dien,@DesktopWidth-27-3-2-35, 2+8)
					GUICtrlSetPos($dangnhap,@DesktopWidth-27-3-2-35-2-67, 2+8)
					GUICtrlSetPos($btncookie,@DesktopWidth-27-3-2-35-2-67-2-63, 2+8)
					GUICtrlSetPos($xong,@DesktopWidth-27-3-2-35-2-67-2-63-2-47, 2+8)
					GUICtrlDelete($ieembedded)
					GUICtrlCreateObj($ie,0,30,@DesktopWidth,@DesktopHeight-20)
					_IENavigate($ie,$trang)
				Else
					$trang=_IEPropertyGet($ie,'locationurl')
					hideall()
					WinSetState('Tool Đăng Ký PTC - Minh Huỳnh','',@SW_RESTORE)
					GUICtrlSetPos($phonglon,1060, 36)
					GUICtrlSetPos($dien,1024, 44)
					GUICtrlSetPos($dangnhap,956, 44)
					GUICtrlSetPos($btncookie,892, 44)
					GUICtrlSetPos($xong,844, 44)
					GUICtrlDelete($ieembedded)
					GUICtrlCreateObj($ie,296, 68, 793, 541)
					_IENavigate($ie,$trang)
				EndIf
				$dangphonglon= Not $dangphonglon
		EndSwitch
	WEnd
EndFunc
Func check2();http://ptctemp.blogspot.com/2017/02/version.html
	$open=_WinHttpOpen()
	$connect=_WinHttpConnect($open,'ptctemp.blogspot.com')
	$request=_WinHttpOpenRequest($connect,'GET','2017/02/version.html')

	_WinHttpSendRequest($request)
	_WinHttpReceiveResponse($request)
	$txt=_WinHttpSimpleReadData($request)
	$ok=_StringBetween($txt,"verrrr","endverrrr")
	If Not @error Then
		If $ok[0]<>$ver Then
			$updatelink=_StringBetween($txt,'downnn','enddownnn')
			If Not @error Then
				InetGet($updatelink[0],@ScriptDir&'\data\Temp\ToolDangKy-MH.rar')
				RunWait('"'&@ScriptDir&'\data\rar\Unrar.exe"'&' e "'&@ScriptDir&'\data\temp\ToolDangky-MH.rar" "'&@ScriptDir&'\data\temp\" '&'-y','',@SW_HIDE)
				FileDelete(@ScriptDir&'\data\temp\ToolDangKy-MH.rar')
				_selfupdate(@ScriptDir&'\data\temp\ToolDangKy-MH.exe',True,5,Default,False)
				Exit
			Else
				MsgBox(0,'Error','Không thể cập nhật')
				Exit
			EndIf
		EndIf
	Else
		MsgBox(0,'Error','Hãy liên hệ admin')
		Exit
	EndIf

	_WinHttpCloseHandle($Request)
	_WinHttpCloseHandle($Connect)
	_WinHttpCloseHandle($Open)

EndFunc
Func check1();$address='address',$country='Vietnam',$city='city',$zip='zip'
	$first=GUICtrlRead($first2)
	$last=GUICtrlRead($last2)
	$name=$first&' '&$last
	$email=GUICtrlRead($email2)
	$pw=GUICtrlRead($pw2)
	$user=GUICtrlRead($user2)
	$pin=GUICtrlRead($pin2)
	$address=GUICtrlRead($first2)
	$country=GUICtrlRead($first2)
	$city=GUICtrlRead($first2)
	$zip=GUICtrlRead($first2)
	$dongy=GUICtrlRead($dongy2)
EndFunc
Func load()
	If FileExists($fdulieu) Then
		For $i=_FileCountLines($fdulieu) To 1 Step -1
			GUICtrlCreateListViewItem(FileReadLine($fdulieu,$i),$ListView2)
		Next
	EndIf
	If FileExists($finfo) Then
		Local $temp[_FileCountLines($finfo)+1]
		For $i=1 To _FileCountLines($finfo)
			$temp[$i]=FileReadLine($finfo,$i)
			Switch $i
				Case 1
					GUICtrlSetData($first2,$temp[$i])
				Case 2
					GUICtrlSetData($last2,$temp[$i])
				Case 3
					GUICtrlSetData($email2,$temp[$i])
				Case 4
					GUICtrlSetData($pw2,$temp[$i])
				Case 5
					GUICtrlSetData($user2,$temp[$i])
				Case 6
					GUICtrlSetData($pin2,$temp[$i])
				Case 7
					GUICtrlSetData($address2,$temp[$i])
				Case 8
					GUICtrlSetData($country2,$temp[$i])
				Case 9
					GUICtrlSetData($city2,$temp[$i])
				Case 10
					GUICtrlSetData($zip2,$temp[$i])
				Case 11
					GUICtrlSetState($dongy2,$temp[$i])
				Case 12
					If $temp[$i]=1 Then
						GUICtrlSetState($nam,$GUI_CHECKED)
					Else
						GUICtrlSetState($nu,$GUI_CHECKED)
					EndIf
				Case 13
					GUICtrlSetData($thang2,'','')
					GUICtrlSetData($thang2,$datathang,$temp[$i])
				Case 14
					GUICtrlSetData($ngay2,'','')
					GUICtrlSetData($ngay2,$datangay,$temp[$i])
				Case 15
					GUICtrlSetData($year2,'','')
					GUICtrlSetData($year2,$datayear,$temp[$i])
				Case 16
					GUICtrlSetData($secques2,$temp[$i])
				Case 17
					GUICtrlSetData($secans2,$temp[$i])
				Case 18
					GUICtrlSetData($evo2,'','')
					GUICtrlSetData($evo2,$dataprofile,$temp[$i])
				Case 19
					GUICtrlSetData($betaevo2,'','')
					GUICtrlSetData($betaevo2,$dataprofile,$temp[$i])
				Case 20
					GUICtrlSetData($aurora2,'','')
					GUICtrlSetData($aurora2,$dataprofile,$temp[$i])
				Case 21
					GUICtrlSetData($gen42,'','')
					GUICtrlSetData($gen42,$dataprofile,$temp[$i])
				Case 22
					GUICtrlSetData($shiftcode2,'','')
					GUICtrlSetData($shiftcode2,$dataprofile,$temp[$i])
				Case 23
					GUICtrlSetData($cashcrusader2,'','')
					GUICtrlSetData($cashcrusader2,$dataprofile,$temp[$i])
			EndSwitch
		Next
	EndIf
EndFunc
Func bb1()
	$downdata2=_GUICtrlListView_GetItemCount($ListView1)
	_GUICtrlListView_ClickItem($ListView1,$downdata2-1)
EndFunc
Func bb2()
	$updata2=_GUICtrlListView_GetItemCount($ListView2)
	_GUICtrlListView_ClickItem($ListView2,$updata2-1)
EndFunc
Func _saveinfo()
	If Not FileExists($finfo) Then
		_FileCreate($finfo)
	EndIf
	$hopen=FileOpen($finfo,2)
	layinfo()
	$temp=''
	$temp&=$first&@CRLF
	$temp&=$last&@CRLF
	$temp&=$email&@CRLF
	$temp&=$pw&@CRLF
	$temp&=$user&@CRLF
	$temp&=$pin&@CRLF
	$temp&=$address2&@CRLF
	$temp&=$country&@CRLF
	$temp&=$city&@CRLF
	$temp&=$zip&@CRLF
	$temp&=$dongy&@CRLF
	$temp&=$gender&@CRLF
	$temp&=$thang&@CRLF
	$temp&=$ngay&@CRLF
	$temp&=$year&@CRLF
	$temp&=$secques&@CRLF
	$temp&=$secans&@CRLF
	$temp&=$evo&@CRLF
	$temp&=$betaevo&@CRLF
	$temp&=$aurora&@CRLF
	$temp&=$gen4&@CRLF
	$temp&=$shiftcode&@CRLF
	$temp&=$cashcrusader
	FileWrite($hopen,$temp)
EndFunc
Func layinfo()
	$first=GUICtrlRead($first2)
	$last=GUICtrlRead($last2)
	$name=$first&' '&$last
	$email=GUICtrlRead($email2)
	$pw=GUICtrlRead($pw2)
	$user=GUICtrlRead($user2)
	$pin=GUICtrlRead($pin2)
	$address=GUICtrlRead($address2)
	$country=GUICtrlRead($country2)
	$city=GUICtrlRead($city2)
	$zip=GUICtrlRead($zip2)
	$dongy=GUICtrlRead($dongy2)
	$gender=GUICtrlRead($nam)
	$thang=GUICtrlRead($thang2)
	$ngay=GUICtrlRead($ngay2)
	$year=GUICtrlRead($year2)
	$secques=GUICtrlRead($secques2)
	$secans=GUICtrlRead($secans2)
	$evo=GUICtrlRead($evo2)
	$betaevo=GUICtrlRead($betaevo2)
	$aurora=GUICtrlRead($aurora2)
	$gen4=GUICtrlRead($gen42)
	$shiftcode=GUICtrlRead($shiftcode2)
	$cashcrusader=GUICtrlRead($cashcrusader2)
EndFunc
Func _savetrangcu()
	$dulieu=''
	$row=_GUICtrlListView_GetItemCount($ListView2)
	For $i=$row-1 To 0 Step -1
		$dulieu2=_GUICtrlListView_GetItemTextString($ListView2,$i)
		If $i=0 Then
			$dulieu&=$dulieu2
		Else
			$dulieu&=$dulieu2&@CRLF
		EndIf
	Next
	$hopen=FileOpen($fdulieu,2)
	FileWrite($hopen,$dulieu)
	GUICtrlSetData($thongbao,'Đã lưu')
EndFunc
Func dn($lv)
	$trang=GUICtrlRead(GUICtrlRead($lv))
	If $trang=0 Then
		MsgBox(0,'Error','Chưa chọn trang')
		Return 0
	Else
		GUICtrlSetState($dangnhap,32)
		GUICtrlSetData($cookie2,'')
		While 1
			$trang=StringSplit($trang,'|')
			$scr1=$trang[3]
			$trang=$trang[2]
			Switch $scr1
				Case 'Evolution', 'BetaEvolution'
					$scr=1
					$trang=_StringBetween($trang,'//','?ref')
					If Not @error Then
						$raw=$trang[0]
						$trang=$trang[0]&'index.php?view=login'
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang)
						_IELoadWait($ie)
						dien($scr)
						GUICtrlSetData($thongbao,'Đã điền xong')
					EndIf
				Case 'Aurora'
					$scr=2
					$trang=_StringBetween($trang,'//','index.php')
					If Not @error Then
						$raw=$trang[0]
						$trang=$trang[0]&'index.php?view=login&'
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang)
						_IELoadWait($ie)
						dien($scr)
						GUICtrlSetData($thongbao,'Đã điền xong')
					EndIf
				Case 'Shiftcode'
					$scr=3
					$trang=_StringBetween($trang,'//','members')
					If Not @error Then
						$raw=$trang[0]
						$trang=$trang[0]&'members/login.php'
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang)
						_IELoadWait($ie)
						dien($scr)
						GUICtrlSetData($thongbao,'Đã điền xong')
					EndIf
				Case 'Gen', 'Gen4'
					$scr=4
					$trang=_StringBetween($trang,'//','index.php?')
					If Not @error Then
						$raw=$trang[0]
						$trang=$trang[0]&'login.php'
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang)
						_IELoadWait($ie)
						dien($scr)
						GUICtrlSetData($thongbao,'Đã điền xong')
					EndIf
				Case 'CashCrusader'
					$dangdk=0
					$scr=5
					$trang=_StringBetween($trang,'//','pages/index.php')
					If Not @error Then
						$raw=$trang[0]
						$trang=$trang[0]&'pages/enter.php'
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang)
						_IELoadWait($ie)
						dien($scr)
						GUICtrlSetData($thongbao,'Đã điền xong')
					EndIf
				Case Else
					If StringInStr($trang,'phelo-farm.ru') Then
						$scr='phelo'
						$trang='http://phelo-farm.ru'
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang)
						_IELoadWait($ie)
						dien($scr)
						GUICtrlSetData($thongbao,'Đã điền xong')
					Else
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang)
						$raw=$trang
						MsgBox(0,'Error','Hãy đăng nhập bằng tay')
						GUICtrlSetData($thongbao,'Hãy đăng nhập bằng tay')
						$dnmau=False
						$cookiemau=True
						$idnmau=1
						GUICtrlSetState($btncookie,16)
						GUICtrlSetState($dangnhap,32)
						GUICtrlSetState($xong,32)
						$dkmau=False
						$idkmau=1
						Return 0
						ExitLoop
					EndIf
			EndSwitch
			ExitLoop
		WEnd
		Return 1
	EndIf
EndFunc
Func dk($lv)
	GUICtrlSetState($dangnhap,32)
	GUICtrlSetState($btncookie,32)
	GUICtrlSetState($xong,32)
	$trang=GUICtrlRead(GUICtrlRead($lv))
	If $trang=0 Then
		MsgBox(0,'Error','Chưa chọn trang')
		Return 0
	Else
		While 1
			$trang=StringSplit($trang,'|')
			$scr1=$trang[3]
			$trang=$trang[2]
			Switch $scr1
				Case 'Evolution', 'BetaEvolution'
					$scr=1
					GUICtrlSetData($thongbao,'Đang tải trang...')
					$nav=_IENavigate($ie,$trang,0)
					_IELoadWait($ie)
					$trang=_StringBetween($trang,'//','?ref')
					If Not @error Then
						$raw=$trang[0]
						$trang=$trang[0]&'index.php?view=register'
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang)
						_IELoadWait($ie)
						dien($scr)
						GUICtrlSetData($thongbao,'Đã điền xong')
						GUICtrlSetState($dangnhap,16)
					Else
						MsgBox(0,'Error','Hãy đăng ký bằng tay')
					EndIf
				Case 'Aurora'
					$scr=2
					GUICtrlSetData($thongbao,'Đang tải trang...')
					_IENavigate($ie,$trang)
					_IELoadWait($ie)
					$ref=StringMid($trang,StringInStr($trang,'?ref=')+5)
					$trang=_StringBetween($trang,'//','index.php?')
					If Not @error Then
						$raw=$trang[0]
						$trang=$trang[0]&'index.php?view=join&ref='&$ref&'&'
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang)
						_IELoadWait($ie)
						dien($scr)
						GUICtrlSetData($thongbao,'Đã điền xong')
						GUICtrlSetState($dangnhap,16)
					Else
						MsgBox(0,'Error','Hãy đăng ký bằng tay')
					EndIf
				Case 'Shiftcode'
					$scr=3
					GUICtrlSetData($thongbao,'Đang tải trang...')
					_IENavigate($ie,$trang)
					$raw=$trang
					_IELoadWait($ie)
					dien($scr)
					GUICtrlSetData($thongbao,'Đã điền xong')
					GUICtrlSetState($dangnhap,16)
				Case 'Gen', 'Gen4'
					$scr=4
					GUICtrlSetData($thongbao,'Đang tải trang...')
					$nav=_IENavigate($ie,$trang,0)
					_IELoadWait($ie)
					$trang=_StringBetween($trang,'//','index.php?')
					If Not @error Then
						$raw=$trang[0]
						$trang=$trang[0]&'register.php'
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang)
						_IELoadWait($ie)
						dien($scr)
						GUICtrlSetData($thongbao,'Đã điền xong')
						GUICtrlSetState($dangnhap,16)
					Else
						MsgBox(0,'Error','Hãy đăng ký bằng tay')
					EndIf
				Case 'CashCrusader'
					$scr=5
					GUICtrlSetData($thongbao,'Đang tải trang...')
					$nav=_IENavigate($ie,$trang,0)
					_IELoadWait($ie)
					$ref=StringMid($trang,StringInStr($trang,'?refid=')+7)
					$trang=_StringBetween($trang,'//','pages/index.php')
					If Not @error Then
						$raw=$trang[0]
						$trang=$trang[0]&'pages/confirm.php'
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang)
						_IELoadWait($ie)
						$dangdk=1
						dien($scr)
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang1)
						_IELoadWait($ie)
						$dangdk=0
						dien($scr)
						GUICtrlSetData($thongbao,'Đã điền xong')
						GUICtrlSetState($dangnhap,16)
					Else
						MsgBox(0,'Error','Hãy đăng ký bằng tay')
					EndIf
				Case Else
					If StringInStr($trang,'phelo-farm.ru') Then
						$scr='phelo'
						$trang='http://phelo-farm.ru/signup'
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang)
						_IELoadWait($ie)
						dien($scr)
						GUICtrlSetData($thongbao,'Đã điền xong')
						GUICtrlSetState($dangnhap,16)
					Else
						GUICtrlSetData($thongbao,'Đang tải trang...')
						_IENavigate($ie,$trang)
						$raw=$trang
						MsgBox(0,'Error','Hãy đăng ký bằng tay')
						GUICtrlSetData($thongbao,'Hãy đăng ký bằng tay')
						$dnmau=False
						$cookiemau=True
						$idnmau=1
						GUICtrlSetState($btncookie,16)
						GUICtrlSetState($dangnhap,32)
						GUICtrlSetState($xong,32)
						$dkmau=False
						$idkmau=1
						Return 0
						ExitLoop
					EndIf
			EndSwitch

			ExitLoop
		WEnd
		Return 1
	EndIf
EndFunc
Func _xoa($sitedelete)
	WinActivate('All1Tool')
	ControlClick('All1Tool','','[NAME:mainTabControl]')
	ControlSetText('All1Tool','','[NAME:txtSearch]',$sitedelete)
	ControlClick('All1Tool','','[NAME:btnSearchAll]')
	ControlSend('All1Tool','','','{f3}')
	ControlSend('All1Tool','','','+{tab}')
	ControlSend('All1Tool','','','{enter}')
	WinWait('DeleteConfirm','',2)
	If WinExists('DeleteConfirm') Then
		ControlClick('DeleteConfirm','','[NAME:listBox1]')
		ControlClick('DeleteConfirm','','[NAME:kryptonButton1]')
		WinActivate($Form1)
		_GUICtrlButton_Click($down)
	Else
		MsgBox(0,'Error','Không tìm thấy trang')
	EndIf
EndFunc
Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
    #forceref $hWnd, $iMsg, $iwParam
    Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndListView, $tInfo
    $hWndListView = $ListView1
    $hWndListView2 = $ListView2
    If Not IsHWnd($ListView1) Then $hWndListView = GUICtrlGetHandle($ListView1)
    If Not IsHWnd($ListView2) Then $hWndListView2 = GUICtrlGetHandle($ListView2)

    $tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
    $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
    $iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
    $iCode = DllStructGetData($tNMHDR, "Code")
    Switch $hWndFrom
        Case $hWndListView
            Switch $iCode
				Case $NM_CLICK
					$trang=GUICtrlRead(GUICtrlRead($ListView1))
					$trang=StringSplit($trang,'|')
					If UBound($trang)>=7 Then
						$stt=$trang[1]
						$site=$trang[2]
						$script=$trang[3]
						$min=$trang[4]
						$note=$trang[5]
						$proof=$trang[6]
						Switch $stt
							Case '2Xoa'
								GUICtrlSetData($stt2,$stt)
								GUICtrlSetData($stt1,'Yêu cầu:')
								GUICtrlSetBkColor($stt2,$mau[0])
								GUICtrlSetColor($stt2,'0xFFFFFF')
								$xoako=MsgBox($MB_YESNO,'Yêu cầu xóa','Bạn muốn xóa trang này không?'&@CRLF&$site)
								If $xoako=$IDYES Then
									$sitedelete=StringReplace($site,'www.','')
									$sitedelete=_StringBetween($sitedelete,'//','.')
									If Not @error Then
										If $sitedelete[0]<>'' Then
											_xoa($sitedelete[0])
										EndIf
									Else
										MsgBox(0,'Error','Có lỗi trong quá trình xử lý, hãy xóa trang bằng tay')
									EndIf
								EndIf
							Case '1Cap nhat'
								GUICtrlSetData($stt2,$stt)
								GUICtrlSetData($stt1,'Yêu cầu:')
								GUICtrlSetBkColor($stt2,$mau[1])
								GUICtrlSetColor($stt2,'0xFFFFFF')
								MsgBox(0,'Yêu cầu cập nhật','Ghi chú từ Admin:'&@CRLF&@CRLF&$note)
							Case Else
								GUICtrlSetData($stt2,$stt)
								GUICtrlSetData($stt1,'Ngày:')
								GUICtrlSetBkColor($stt2,'0xB5EBCB')
								GUICtrlSetColor($stt2,'0x000000')
						EndSwitch
						GUICtrlSetData($site2,$site)
						GUICtrlSetData($script2,$script)
						GUICtrlSetData($min2,$min)
						GUICtrlSetData($note2,$note)
						GUICtrlSetData($proof2,$proof)
					EndIf
			EndSwitch
		Case $hWndListView2
			Switch $iCode
				Case $NM_CLICK
					$trang=GUICtrlRead(GUICtrlRead($ListView2))
					$trang=StringSplit($trang,'|')
					If UBound($trang)>=7 Then
						$stt=$trang[1]
						$site=$trang[2]
						$script=$trang[3]
						$min=$trang[4]
						$note=$trang[5]
						$proof=$trang[6]
						Switch $stt
							Case '2Xoa'
								GUICtrlSetData($stt2,$stt)
								GUICtrlSetData($stt1,'Yêu cầu:')
								GUICtrlSetBkColor($stt2,$mau[0])
								GUICtrlSetColor($stt2,'0xFFFFFF')
							Case '1Cap nhat'
								GUICtrlSetData($stt2,$stt)
								GUICtrlSetData($stt1,'Yêu cầu:')
								GUICtrlSetBkColor($stt2,$mau[1])
								GUICtrlSetColor($stt2,'0xFFFFFF')
							Case Else
								GUICtrlSetData($stt2,$stt)
								GUICtrlSetData($stt1,'Ngày:')
								GUICtrlSetBkColor($stt2,'0xB5EBCB')
								GUICtrlSetColor($stt2,'0x000000')
						EndSwitch
						GUICtrlSetData($site2,$site)
						GUICtrlSetData($script2,$script)
						GUICtrlSetData($min2,$min)
						GUICtrlSetData($note2,$note)
						GUICtrlSetData($proof2,$proof)
					EndIf
			EndSwitch
    EndSwitch
    Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY\

Func dien($scr);1: evo, 2: aurora, 3: shiftcode
	layinfo()
	If $scr=1 Then
		$forms=_IEFormGetCollection($ie)
		For $form In $forms
			$eles=_IEFormGetObjByName($ie,$form.id)
			If IsObj($eles) Then
				For $ele in $eles
					kiemtra($eles,'fullname',$name)
					kiemtra($eles,'email',$email)
					kiemtra($eles,'email2',$email)
					kiemtra($eles,'password',$pw)
					kiemtra($eles,'password2',$pw)
					kiemtra($eles,'username',$user)
					If $dongy=1 Then
						_IEFormElementCheckBoxSelect($eles,0,'terms',1,'byIndex')
					EndIf
				Next
			EndIf
		Next
	ElseIf $scr=2 Then
		$eles=_IEFormGetCollection($ie,0)
		If IsObj($eles) Then
			kiemtra($eles,'uName',$name)
			kiemtra($eles,'uEmail',$email)
			kiemtra($eles,'uPin',$pin)
			kiemtra($eles,'uVPin',$pin)
			kiemtra($eles,'uPassword',$pw)
			kiemtra($eles,'uVPassword',$pw)
			kiemtra($eles,'uUsername',$user)
			kiemtra($eles,'user',$user)
			kiemtra($eles,'pass',$pw)
			kiemtra($eles,'form_user',$user)
			kiemtra($eles,'form_pwd',$pw)
			$term=_IEFormElementGetObjByName($eles,'uTerms')
			If $dongy=1 Then
				_IEFormElementOptionSelect($term,'yes')
			EndIf
		EndIf
	ElseIf $scr=3 Then
		$eles=_IEFormGetCollection($ie,0)
		If IsObj($eles) Then
			kiemtra($eles,'first',$first)
			kiemtra($eles,'last',$last)
			kiemtra($eles,'username',$user)
			kiemtra($eles,'password',$pw)
			kiemtra($eles,'password2',$pw)
			kiemtra($eles,'email',$email)
			kiemtra($eles,'email2',$email)
			kiemtra($eles,'billingAddress1',$address)
			kiemtra($eles,'billingCity',$city)
			$term=_IEFormElementGetObjByName($eles,'billingCountry')
			_IEFormElementOptionSelect($term,$country,1,'byText')
			kiemtra($eles,'billingZip',$zip)
			If $dongy=1 Then
				_IEFormElementCheckBoxSelect($eles,'1','terms',1,'byValue')
			EndIf
		EndIf
	ElseIf $scr=4 Then
		$eles=_IEFormGetCollection($ie,0)
		If IsObj($eles) Then
			kiemtra($eles,'username',$user)
			kiemtra($eles,'2',$pw)
			kiemtra($eles,'3',$pw)
			kiemtra($eles,'4',$email)
			kiemtra($eles,'5',$email)
			kiemtra($eles,'9',$secques)
			kiemtra($eles,'10',$secans)
			$obj2=_IEFormElementGetObjByName($eles,'month')
			If IsObj($obj2) Then
				_IEFormElementOptionSelect($obj2,$thang)
			EndIf
			$obj2=_IEFormElementGetObjByName($eles,'day')
			If IsObj($obj2) Then
				_IEFormElementOptionSelect($obj2,$ngay)
			EndIf
			$obj2=_IEFormElementGetObjByName($eles,'year')
			If IsObj($obj2) Then
				_IEFormElementOptionSelect($obj2,$year)
			EndIf
			kiemtra($eles,'login_username',$user)
			kiemtra($eles,'login_password',$user)
			$oforms=_IETagNameGetCollection($ie,'input')
			$temp=1
			For $oform In $oforms
				If $oform.name='8' Then
					If $dongy=1 Then
						If $temp=2 Then
							$oform.click()
						EndIf
					EndIf
					$temp+=1
				EndIf
				If $oform.name='11' Then
					If $gender<>1 Then
						$oform.click()
					EndIf
				EndIf
			Next
		EndIf
	ElseIf $scr=5 Then
		For $ii=0 To 1
			$eles=_IEFormGetCollection($ie,$ii)
			If IsObj($eles) Then
	 			kiemtra($eles,'userform[email]',$email)
				kiemtra($eles,'username',$user)
				kiemtra($eles,'password',$pw)
				kiemtra($eles,'userform[username]',$user)
				kiemtra($eles,'userform[first_name]',$first)
				kiemtra($eles,'userform[last_name]',$last)
				kiemtra($eles,'userform[address]',$address)
				kiemtra($eles,'userform[city]',$city)
				kiemtra($eles,'userform[zipcode]',$zip)
				kiemtra($eles,'userform[state_other]',$city)
				kiemtra($eles,'userform[pay_account]',$email)
				kiemtra($eles,'refid',$ref)
				$term=_IEFormElementGetObjByName($eles,'userform[country]')
				_IEFormElementOptionSelect($term,$country,1,'byText')
				For $i=0 To 30
					$oforms=_IETagNameGetCollection($eles,'input')
					For $oform In $oforms
						If $oform.name='keyword['&$i&']' Then
							$oform.click()
						EndIf
					Next
				Next
				kiemtra($eles,'userform[password]',$pw)
				kiemtra($eles,'userform[confirm_password]',$pw)
				If $dangdk=1 Then
					$obj2=_IEFormElementGetObjByName($eles,'submit')
					If IsObj($obj2) Then
						$obj2.click()
					EndIf
				EndIf
				_IELoadWait($ie)
			EndIf
		Next
		If $dangdk=1 Then
			While 1
				Global $trang1=InputBox('OK','Hãy kiểm tra mail và copy link kích hoạt vào đây')
				If $trang1<>'' Or @error=1 Then
					ExitLoop
				EndIf
			WEnd
		EndIf
	ElseIf $scr='phelo' Then
		$eles=_IEFormGetCollection($ie,2)
		If IsObj($eles) Then
			kiemtra($eles,'login',$user)
			kiemtra($eles,'email',$email)
			kiemtra($eles,'pass',$pw)
			kiemtra($eles,'repass',$pw)
			If $dongy=1 Then
				_IEFormElementCheckBoxSelect($eles,'1','rules',1,'byValue')
			EndIf
		EndIf
		$eles=_IEFormGetCollection($ie,0)
		If IsObj($eles) Then
			kiemtra($eles,'log_email',$email)
			kiemtra($eles,'pass',$pw)
		EndIf
	EndIf
EndFunc
Func hideall()
	Local Static $toggle = True
    $toggle = Not $toggle
    For $Loop = $DummyStart + 1 To $DummyEnd - 1
        If $toggle Then
            GUICtrlSetState($Loop, $GUI_SHOW)
        Else
            GUICtrlSetState($Loop, $GUI_HIDE)
        EndIf
    Next
EndFunc
Func kiemtra($obj,$ten,$value,$index=0)
	$obj2=_IEFormElementGetObjByName($obj,$ten,$index)
	If IsObj($obj2) Then
		_IEFormElementSetValue($obj2,$value)
	EndIf
EndFunc
Func capnhat()
	check3()
	_GUICtrlListView_DeleteAllItems($ListView1)
	If FileExists($fdulieu) Then
		$temp=FileReadLine($fdulieu,1)
		$temp=StringSplit($temp,'|')
		If Not @error Then
			For $i=1 To _FileCountLines($download)
				$temp1=FileReadLine($download,$i)
				If StringInStr($temp1,$temp[2]) Then
					$l=$i-1
					ExitLoop
				EndIf
			Next
		EndIf
	EndIf
	For $i=1 To $l Step 1
		$data[$i]=GUICtrlCreateListViewItem($stt[$i]&'|'&$site[$i]&'|'&$script[$i]&'|'&$min[$i]&'|'&$note[$i]&'|'&$proof[$i],$ListView1)
	Next
	_GUICtrlListView_EnsureVisible($ListView1,$l-1)
	_GUICtrlListView_ClickItem($ListView1,$l-1)
	GUICtrlSetData($thongbao,'Cập nhật lần cuối lúc: '&@HOUR&':'&@MIN)
EndFunc

Func check3();http://ptctemp.blogspot.com/2017/02/cap-nhat.html
	$open=_WinHttpOpen()
	$connect=_WinHttpConnect($open,'ptctemp.blogspot.com')
	$request=_WinHttpOpenRequest($connect,'GET','/2017/02/cap-nhat.html')

	_WinHttpSendRequest($request)
	_WinHttpReceiveResponse($request)
	$txt=_WinHttpSimpleReadData($request)
	$ok=_StringBetween($txt,"description articleBody'>"&@LF,"<div style='clear: both;'></div>")
	If Not @error Then
		$ok=StringReplace($ok[0],'<div>','')
		$ok=StringReplace($ok,'</div>'&@LF,'')
		$ok=StringReplace($ok,@LF,@CRLF)
		$ok=StringReplace($ok,'<br />','')
		_FileCreate($download)
		$hopen=FileOpen($download,2)
		FileWrite($hopen,$ok)
		If Not @error Then
			Global $l=_FileCountLines($download)
			Global $stt[$l+1],$site[$l+1],$script[$l+1],$min[$l+1],$note[$l+1],$proof[$l+1],$data[$l+1]
			For $i=1 To $l
				Local $split=StringSplit(FileReadLine($download,$i),',')
				$stt[$i]=$split[1]
				$site[$i]=$split[2]
				$script[$i]=$split[3]
				$min[$i]=$split[4]
				$note[$i]=$split[5]
				$proof[$i]=$split[6]
			Next
		EndIf
	Else
		MsgBox(0,'Error','Tool bị lỗi, liên hệ Admin')
		Exit
	EndIf
	_WinHttpCloseHandle($Request)
	_WinHttpCloseHandle($Connect)
	_WinHttpCloseHandle($Open)

EndFunc

;===============================================================================
; Description:      Save ListView Content to a file
;
; Parameter(s):     $listViewObjectName - var, the variable name for the ListView Object
;                   $saveToFile - string, Where to save the file and it's name with extention (eg. C:\myListViewContent.txt)
;                   $hArray - string or array var, Use to save only certain columns to the output file from the listview (eg. '1,2,3') (default = '') (Note: only use , or | as delimiters)
;                   $cCheck - boolean, Check for  (default = false)
;                   $nCheck - number, Column to check for , which means checked thus save (default = "")
;
; Return Value(s):  On Success  - Saves the file
;                   On Failure  - 0 and Sets @Error
;                   @ERROR      - 0 = File could not be created
;                               - 1 = Probelm with counting the ListView Items
;                               - 2 = could not write to file
;                               - 3 = $hArray delimiter used is not , or |
;
; Note(s):          none
;===============================================================================
Func saveListView($listViewObjectName,$saveToFile,$hArray='',$cCheck=false,$nCheck="")
    If $hArray = -1 Then $hArray=''
    _FileCreate($saveToFile)
    If @error Then
        SetError(0,@error)
        Return 0
    EndIf
    Local $list_count = _GUICtrlListView_GetItemCount($listViewObjectName)
    If @error Then
        SetError(1)
        Return 0
    EndIf
    Local $saveArray[1] = [$list_count]
    If $cCheck Then
        For $i = 1 To $list_count
            $sSeltxt = StringSplit(_GUICtrlListView_GetItemText($listViewObjectName, $i - 1), '|')
            $bCheck = $sSeltxt[$nCheck]
            Switch $bCheck
                Case "", " "
                    ;nothing
                Case Else
                    If $hArray = '' Then
                        _ArrayAdd($saveArray, _GUICtrlListView_GetItemText($listViewObjectName, $i - 1))
                    Else
                        If IsArray($hArray) Then
                            $hhArray = $hArray
                        Else
                            If Number($hArray) = 0 Then
                                If StringInStr($hArray,',') > 0 Then
                                    $hhArray = StringSplit($hArray,',')
                                    _ArrayDelete($hhArray,0)
                                    for $nnl = 0 to UBound($hhArray)-1
                                        $hhArray[$nnl] = StringStripWS($hhArray[$nnl],8)
                                    next
                                ElseIf StringInStr($hArray,'|') > 0 Then
                                    $hhArray = StringSplit($hArray,'|')
                                    _ArrayDelete($hhArray,0)
                                    for $nnl = 0 to UBound($hhArray)-1
                                        $hhArray[$nnl] = StringStripWS($hhArray[$nnl],8)
                                    next
                                Else
                                    SetError(3)
                                    Return 0
                                EndIf
                            Else
                                ReDim $hhArray[$hArray];Previously was $hhArray = _ArrayCreate($hArray)
                            EndIf
                        EndIf

                        Local $nArray = [];Previously was $nArray = _ArrayCreate('')
                        for $nl = 0 to Ubound($hhArray)-1
                            _ArrayAdd($nArray,_GUICtrlListView_GetItemText($listViewObjectName, $i - 1,$hhArray[$nl]))
                        next
                        Local $hlinetoAdd = ''
                        Local $htotalSize = Ubound($nArray)-1
                        For $nl = 1 to $htotalSize
                            If $nl <> $htotalSize Then
                                $hlinetoAdd &= $nArray[$nl]&'|'
                            Else
                                $hlinetoAdd &= $nArray[$nl]
                            EndIf
                        Next
                        _ArrayAdd($saveArray,$hlinetoAdd)
                    EndIf
            EndSwitch
        Next
    Else
        For $i = 1 To $list_count
            If $hArray = '' Then
                _ArrayAdd($saveArray, _GUICtrlListView_GetItemText($listViewObjectName, $i - 1))
            Else
                If IsArray($hArray) Then
                    $hhArray = $hArray
                Else
                    If Number($hArray) = 0 Then
                        If StringInStr($hArray,',') > 0 Then
                            $hhArray = StringSplit($hArray,',')
                            _ArrayDelete($hhArray,0)
                            for $nnl = 0 to UBound($hhArray)-1
                                $hhArray[$nnl] = StringStripWS($hhArray[$nnl],8)
                            next
                        ElseIf StringInStr($hArray,'|') > 0 Then
                            $hhArray = StringSplit($hArray,'|')
                            _ArrayDelete($hhArray,0)
                            for $nnl = 0 to UBound($hhArray)-1
                                $hhArray[$nnl] = StringStripWS($hhArray[$nnl],8)
                            next
                        Else
                            SetError(3)
                            Return 0
                        EndIf
                    Else
                        ReDim $hhArray[$hArray];Previously was $hhArray = _ArrayCreate($hArray)
                    EndIf
                EndIf

                Local $nArray = [];Previously was $nArray = _ArrayCreate('')
                for $nl = 0 to Ubound($hhArray)-1
                    _ArrayAdd($nArray,_GUICtrlListView_GetItemText($listViewObjectName, $i - 1,$hhArray[$nl]))
                next
                Local $hlinetoAdd = ''
                Local $htotalSize = Ubound($nArray)-1
                For $nl = 1 to $htotalSize
                    If $nl <> $htotalSize Then
                        $hlinetoAdd &= $nArray[$nl]&'|'
                    Else
                        $hlinetoAdd &= $nArray[$nl]
                    EndIf
                Next
                _ArrayAdd($saveArray,$hlinetoAdd)
            EndIf
        Next
    EndIf
    $write = _FileWriteFromArray($saveToFile, $saveArray, 1)
    If @error Then
        SetError(2)
        Return 0
    EndIf
    Return 1
EndFunc
