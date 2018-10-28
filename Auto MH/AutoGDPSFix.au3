#RequireAdmin
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
#include <ScreenCapture.au3>
#include <File.au3>
#include <ImageSearch.au3>



HotKeySet('{f3}','_exit')
Func _exit()
	Exit
EndFunc
While 1
ControlClick('Boom','','','left',1,336-2, 480-23)
Sleep(1000)
WEnd

Global $hd[4]=[224,275,253,272],$bat[4]=[232,277,313,281],$cuu[4]=[271,271,301,281],$batboss[4]=[292,275,274,273],$winboss[4]=[245,271,292,275],$dtqv[4]=[295,280,271,281],$winthuong[4]=[192,272,357,280],$mau='004800B1'
;			piggy,5 				hthm1,3						,hmbnhn9,3				,hmbnhn3,1	,					hmbnhn8,5					hthm1					,hmbnhn16,5

Global $x=0,$y=0, $x1=0,$y1=0, $txt=@ScriptDir&'\SanItem\stt.txt'

;~ WinActivate('cuaso1')
;~ Sleep(700)
;~ nvhd()
;~ Sleep(700)
;~ nvbat()
;~ Sleep(700)
;~ nvcuu()
;~ Sleep(700)
;~ nvbatboss()
;~ Sleep(700)
;~ nvwinboss()
;~ Sleep(700)
;~ nvwinthuong()
;~ Sleep(700)
;~ Exit

;~ MsgBox(0,'',Hex(PixelGetColor(224,275)))
;~ Exit

;~ $dir=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
;~ 			$n=StringReplace($dir,'autoupdate.exe','')
;~ 		ClipPut($n)
;~ MsgBox(0,'',@ScriptDir)
;~ While 4
;~ 		If WinExists('ca') Then
;~ 			WinClose('ca')
;~ 		Else
;~ 			ExitLoop
;~ 		EndIf
;~ 	WEnd
;~ 		Exit



Opt('WinTitleMatchMode',3)
#Region ### START Koda GUI section ### Form=
$Form2 = GUICreate("Auto By Minh Huỳnh", 431, 318, 876, 2)
$Tab1 = GUICtrlCreateTab(8, 8, 409, 300)
$TabSheet1 = GUICtrlCreateTabItem("Tool")
$Group1 = GUICtrlCreateGroup("Đổi tên cửa sổ", 28, 41, 377, 73)
$Input1 = GUICtrlCreateInput("Boom", 84, 65, 65, 21)
$Label1 = GUICtrlCreateLabel("Từ:", 36, 73, 36, 17)
$Label2 = GUICtrlCreateLabel("Thành", 156, 73, 36, 17)
$Input2 = GUICtrlCreateInput("cs1", 204, 65, 65, 21)
$Button1 = GUICtrlCreateButton("Đổi", 284, 65, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group2 = GUICtrlCreateGroup("Auto PMTT", 28, 121, 377, 177)
$Label3 = GUICtrlCreateLabel("Tên cửa sổ", 36, 145, 84, 17)
$Input3 = GUICtrlCreateInput("", 124, 145, 233, 21)
$Label4 = GUICtrlCreateLabel('Lưu ý: Nhiều cửa sổ thì "," giữa các cửa sổ, ví dụ: cs1,cs2,cs3', 36, 177, 300, 17)
GUICtrlSetColor(-1,'0x000FFF')
$Label5 = GUICtrlCreateLabel("Thời gian hiện tại", 36, 209, 46, 37)
$Input4 = GUICtrlCreateInput("0", 92, 209, 41, 21)
$Label6 = GUICtrlCreateLabel("phút", 140, 209, 36, 17)
$Button2 = GUICtrlCreateButton("Bắt đầu", 308, 265, 75, 25)
$Checkbox1 = GUICtrlCreateCheckbox("Auto Login:", 40, 240, 81, 17)
GUICtrlSetState(-1,1)
;~ $Checkbox2 = GUICtrlCreateCheckbox("Đóng tem", 40, 264, 81, 17)
GUICtrlSetState(-1,1)
$Label11 = GUICtrlCreateLabel("cửa sổ => Vui lòng tắt hết Boom - File:tk.txt", 168, 240, 210, 17)
$Input7 = GUICtrlCreateInput("", 136, 240, 25, 21)
;~ $Label7 = GUICtrlCreateLabel("Thời gian hiện tại", 136, 264, 44, 31)
GUICtrlCreateGroup("", -99, -99, 1, 1)
;~ $Input8 = GUICtrlCreateInput("0", 184, 264, 41, 21)
;~ $Label12 = GUICtrlCreateLabel("phút", 232, 264, 42, 17)



$TabSheet2 = GUICtrlCreateTabItem("Auto NSMM")
$Group3 = GUICtrlCreateGroup("Mở NSMM", 24, 40, 369, 81)
$Input5 = GUICtrlCreateInput("Boom", 80, 72, 65, 21)
$Label8 = GUICtrlCreateLabel("Cửa sổ:", 32, 72, 56, 17)
$Button3 = GUICtrlCreateButton("Chạy", 176, 72, 75, 25)
$Button4 = GUICtrlCreateButton("Dừng", 280, 72, 75, 25)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Group4 = GUICtrlCreateGroup("Mở NSMM + Kết hợp", 24, 128, 369, 137)
$Label9 = GUICtrlCreateLabel("Cửa sổ:", 32, 160, 36, 17)
$Input6 = GUICtrlCreateInput("Boom", 80, 160, 73, 21)
$Button5 = GUICtrlCreateButton("Chạy", 176, 184, 75, 25)
$Button6 = GUICtrlCreateButton("Dừng", 280, 184, 75, 25)
$Label10 = GUICtrlCreateLabel("Vị trí NSMM", 32, 216, 42, 57)
$Combo1 = GUICtrlCreateCombo("", 80, 216, 73, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1,'1|2|3|4')

$TabSheet3 = GUICtrlCreateTabItem("GĐPS")
GUICtrlSetState(-1,$GUI_SHOW)
$Group5 = GUICtrlCreateGroup("Giúp Đỡ Pháp Sư", 24, 40, 377, 249)
$Combo2 = GUICtrlCreateCombo("", 112, 96, 57, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1,'1|2|3|4')
$Label13 = GUICtrlCreateLabel("Vị trí nhiệm vụ", 40, 96, 80, 33)
$Button7 = GUICtrlCreateButton("Bắt đầu", 224, 96, 75, 25)
$Label14 = GUICtrlCreateLabel("Auto tự login - File: tkgdps.txt", 40, 64, 500, 17)
$Label15 = GUICtrlCreateLabel("Check nếu đã làm những điều sau trước khi auto", 152, 136, 234, 41)
$Checkbox3 = GUICtrlCreateCheckbox("Tháo Pet", 40, 136, 97, 17)
$Checkbox4 = GUICtrlCreateCheckbox("Chọn Bé Bỏng", 40, 160, 97, 17)
$Checkbox5 = GUICtrlCreateCheckbox("1.Map GTK2 - 2.Map Khoảng Sản 23", 40, 184, 300, 17)
$Checkbox6 = GUICtrlCreateCheckbox("1.Cướp biển 2", 40, 208, 97, 17)
$Checkbox7 = GUICtrlCreateCheckbox("Tháo Kim", 40, 232, 97, 17)
$Checkbox8 = GUICtrlCreateCheckbox("Tháo Bom Hẹn Giờ", 40, 256, 300, 17)
GUICtrlDelete($TabSheet3)

$TabSheet4 = GUICtrlCreateTabItem("ĐCHC")
GUICtrlSetState(-1,$GUI_SHOW)
$Group6 = GUICtrlCreateGroup("Đại chiến hải cẩu", 24, 40, 377, 257)
$Input10 = GUICtrlCreateInput("4", 48, 64, 33, 21)
$Label17 = GUICtrlCreateLabel("cửa sổ", 88, 64, 74, 17)
$Label18 = GUICtrlCreateLabel("File: tkdchc.txt", 48, 96, 186, 17)
$Combo3 = GUICtrlCreateCombo("", 104, 128, 73, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1,'1|2|3|4')
$Label19 = GUICtrlCreateLabel("Vị trí nhiệm vụ", 48, 128, 50, 41)
$Button8 = GUICtrlCreateButton("Bắt đầu", 216, 160, 75, 25)
$Input11 = GUICtrlCreateInput("1000", 256, 64, 41, 21)
$Label20 = GUICtrlCreateLabel("Số ván:", 200, 64, 50, 17)
GUICtrlDelete($TabSheet3)

$TabSheet5 = GUICtrlCreateTabItem("Xí Ngầu")
GUICtrlSetState(-1,$GUI_SHOW)
$Button9 = GUICtrlCreateButton("2P: Player 1", 232, 64, 115, 25)
$Label21 = GUICtrlCreateLabel("Cừa sổ", 24, 64, 42, 17)
$Input12 = GUICtrlCreateInput("La[1]", 88, 64, 121, 21)
$Button10 = GUICtrlCreateButton("2P: Player 2", 232, 104, 115, 25)
$Button11 = GUICtrlCreateButton("Dừng", 232, 144, 115, 25)
$Button14 = GUICtrlCreateButton("1P", 88, 104, 115, 25)

$TabSheet6 = GUICtrlCreateTabItem("Cửa sổ Boom")
GUICtrlSetState(-1,$GUI_SHOW)
$Button12 = GUICtrlCreateButton("Hồ Chí Minh", 56, 64, 123, 25)
$Button13 = GUICtrlCreateButton("Hà Nội", 208, 64, 131, 25)
$Button15 = GUICtrlCreateButton("Chạy Hack", 56, 112, 123, 25)
$Button16 = GUICtrlCreateButton("Tắt Boom", 208, 112, 123, 25)
$Input9 = GUICtrlCreateInput("Boom", 56, 160, 121, 22)
$Button19 = GUICtrlCreateButton("Mua bằng bạc (1 lần)", 208, 160, 123, 25)
$Button20 = GUICtrlCreateButton("Mua bằng vàng (vô hạn)", 56, 200, 123, 25)
$Button21 = GUICtrlCreateButton("Dừng", 184, 200, 75, 25)


$TabSheet7 = GUICtrlCreateTabItem("Săn Item")
GUICtrlSetState(-1,$GUI_SHOW)
$Label7 = GUICtrlCreateLabel("Cửa sổ:", 32, 48, 36, 17)
$Input8 = GUICtrlCreateInput("cs1", 88, 48, 65, 21)
$Button17 = GUICtrlCreateButton("BMĐ", 32, 88, 91, 25)
$Button18 = GUICtrlCreateButton("Deco", 144, 88, 91, 25)
$Button22 = GUICtrlCreateButton("Dừng", 336, 280, 75, 25)
GUICtrlSetState($Button22,$GUI_HIDE)
$Button23 = GUICtrlCreateButton("Xóa hiệu ứng", 248, 48, 83, 25)
$Button24 = GUICtrlCreateButton("Như cũ", 336, 48, 75, 25)
$Button25 = GUICtrlCreateButton("BMĐ&Deco", 256, 88, 91, 25)
$Label12 = GUICtrlCreateLabel("Item khác:", 32, 136, 50, 17)
$Input13 = GUICtrlCreateInput("tênfileảnh.bmp", 88, 136, 121, 21)
$Button26 = GUICtrlCreateButton("Săn", 224, 136, 75, 25)
$Button27 = GUICtrlCreateButton("Thu nhỏ", 160, 48, 83, 25)
$Button27back = GUICtrlCreateButton("Mở rộng", 160, 48, 83, 25)
GUICtrlSetState($Button27back,$GUI_HIDE)

GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global $cs[100],$i, $open[100],$name[100],$login[100],$tk[100],$str[100],$l=0,$in[100]
Global $xonghd=False, $solanpmtt=0
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button2
			autopmtt()
		Case $Button1
			WinSetTitle(GUICtrlRead($Input1),'',GUICtrlRead($Input2))
		Case $Button3
			nsmm()
		Case $Button5
			kethop()
		Case $Button6
			ExitLoop
		Case $Button7
			gdps()
		Case $Button8
			dchc()
		Case $Button9
			dbv1()
		Case $Button10
			dbv2()
		Case $Button12
			hcm()
		Case $Button13
			hn()
		Case $Button14
			dbv()
		Case $Button15
			hackbnb()
		Case $Button16
			ProcessClose('ca.exe')
		Case $Button17
			sanbmd()
		Case $Button18
			sandeco()
		Case $Button19
			muadobac()
		Case $Button20
			muadovang()
		Case $Button23
			xoahieuung()
		Case $Button24
			nhucu()
		Case $Button25
			bmddeco()
		Case $Button26
			sankhac()
		Case $Button27
			thunho()
		Case $Button27back
			thunhoback()
	EndSwitch
	If WinExists('ca') Then
		WinClose('ca')
	EndIf
	If WinExists('ca (Not Responding)') Then
		WinClose('ca (Not Responding)')
	EndIf
	If WinExists('Auto by MH') Then
		GUICtrlSetData($Combo2,ControlGetText('Auto by MH','','[CLASS:ComboBox; INSTANCE:2]'),$Combo2)
		WinClose('Auto by MH')
		gdps()
	EndIf
WEnd

Func thunho()
	$cs=GUICtrlRead($Input8)
	$csboom=WinGetPos($cs)
	WinMove($cs,'',$csboom[0],$csboom[1],159, 266)
	GUICtrlSetState($Button27,$GUI_HIDE)
	GUICtrlSetState($Button27back,$GUI_SHOW)
EndFunc

Func thunhoback()
	$cs=GUICtrlRead($Input8)
	$csboom=WinGetPos($cs)
	WinMove($cs,'',$csboom[0],$csboom[1],806, 629)
	GUICtrlSetState($Button27back,$GUI_HIDE)
	GUICtrlSetState($Button27,$GUI_SHOW)
EndFunc

Func xoahieuung()
	$dir=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
	$n=StringReplace($dir,'autoupdate.exe','')
	FileCopy(@ScriptDir&'\SanItem\d3d9.dll',$n,1)
EndFunc

Func nhucu()
	$dir=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
	$n=StringReplace($dir,'autoupdate.exe','')
	FileDelete($n&'d3d9.dll')
EndFunc

Func muadobac()
	$cs=GUICtrlRead($Input9)
	ControlSend($cs,'','','{enter}')
	clickboom($cs,225, 252)
	ControlSend($cs,'','','{enter}')
	clickboom($cs,276, 471)
	ControlSend($cs,'','','{enter}')
EndFunc

Func muadovang()
	While 1
		$nMsg = GUIGetMsg()
		$cs=GUICtrlRead($Input9)
		ControlSend($cs,'','','{enter}')
		clickboom($cs,225, 252)
		clickboom($cs,276, 471)
		ControlSend($cs,'','','{enter}')
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $Button21
				ExitLoop
		EndSwitch
	WEnd
EndFunc

Func clickboom($1,$2,$3)
	ControlClick($1,'','','left',1,$2-2,$3-23)
EndFunc

Func sanbmd()
	GUICtrlSetState($Button22,$GUI_SHOW)
	$ii=1
	$filebmd=@ScriptDir&'\SanItem\BMD.bmp'
	$cs=GUICtrlRead($Input8)
	$csboom=WinGetPos($cs)
;~ 	WinMove($cs,'',$csboom[0],$csboom[1],159, 266)
	If FileExists(@ScriptDir&'\SanItem\stt.txt') Then
	Else
		_FileCreate(@ScriptDir&'\SanItem\stt.txt')
		FileWrite(@ScriptDir&'\SanItem\stt.txt',1)
	EndIf
	$i=FileRead(@ScriptDir&'\SanItem\stt.txt')
	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $Button22
;~ 				WinMove($cs,'',$csboom[0],$csboom[1],$csboom[2],$csboom[3])
				GUICtrlSetState($Button22,$GUI_HIDE)
				ExitLoop
		EndSwitch
		ControlSend($cs,'','','{enter}')
		clickboom($cs,118, 119)
		clickboom($cs,55, 117)
		$ii=1
;~ 		clickboom($cs,246, 118)
;~ 		clickboom($cs,308, 119)
		While Hex(PixelGetColor($csboom[0]+27,$csboom[1]+188)) <> '00237BD4'
			ControlSend($cs,'','','{enter}')
			$ii+=1
			If Mod($ii, 100)=0 Then
				clickboom($cs,118, 119)
				Sleep(1000)
				clickboom($cs,55, 117)
;~ 				clickboom($cs,55, 117)

			EndIf
			$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $Button22
					WinMove($cs,'',$csboom[0],$csboom[1],$csboom[2],$csboom[3])
					GUICtrlSetState($Button22,$GUI_HIDE)
					FileClose($txt)
					ExitLoop(2)
			EndSwitch
		WEnd
		$kq=_ImageSearchArea($filebmd,0,$csboom[0]+65,$csboom[1]+186,$csboom[0]+109,$csboom[1]+260,$x,$y,0)
		If $kq=1 Then
			clickboom($cs,461,$y-$csboom[1])
			clickboom($cs,345, 458)
			_ScreenCapture_Capture(@ScriptDir&'\SanItem\'&$i&'bmd.png')
			$i+=1
			$txt=FileOpen(@ScriptDir&'\SanItem\stt.txt',2)
			FileWrite($txt,$i)
		EndIf
	WEnd


EndFunc

Func sandeco()
	GUICtrlSetState($Button22,$GUI_SHOW)
	$ii=1
	$filedeco=@ScriptDir&'\SanItem\Deco.bmp'
	$cs=GUICtrlRead($Input8)
	$csboom=WinGetPos($cs)
;~ 	WinMove($cs,'',$csboom[0],$csboom[1],159, 266)
	If FileExists(@ScriptDir&'\SanItem\stt.txt') Then
	Else
		_FileCreate(@ScriptDir&'\SanItem\stt.txt')
		FileWrite(@ScriptDir&'\SanItem\stt.txt',1)
	EndIf
	$i=FileRead(@ScriptDir&'\SanItem\stt.txt')
	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $Button22
;~ 				WinMove($cs,'',$csboom[0],$csboom[1],$csboom[2],$csboom[3])
				GUICtrlSetState($Button22,$GUI_HIDE)
				ExitLoop
		EndSwitch
		ControlSend($cs,'','','{enter}')
		clickboom($cs,118, 119)
		clickboom($cs,55, 117)
		$ii=1
;~ 		clickboom($cs,246, 118)
;~ 		clickboom($cs,308, 119)
		While Hex(PixelGetColor($csboom[0]+27,$csboom[1]+188)) <> '00237BD4'
			ControlSend($cs,'','','{enter}')
			$ii+=1
			If Mod($ii, 100)=0 Then
				clickboom($cs,118, 119)
				Sleep(1000)
				clickboom($cs,55, 117)
			EndIf
			$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $Button22
					WinMove($cs,'',$csboom[0],$csboom[1],$csboom[2],$csboom[3])
					GUICtrlSetState($Button22,$GUI_HIDE)
					FileClose($txt)
					ExitLoop(2)
			EndSwitch
		WEnd
		$kq=_ImageSearchArea($filedeco,0,$csboom[0]+68,$csboom[1]+190,$csboom[0]+120,$csboom[1]+263,$x,$y,0)
		If $kq=1 Then
			clickboom($cs,461,$y-$csboom[1])
			clickboom($cs,345, 458)
			_ScreenCapture_Capture(@ScriptDir&'\SanItem\'&$i&'deco.png')
			$i+=1
			$txt=FileOpen(@ScriptDir&'\SanItem\stt.txt',2)
			FileWrite($txt,$i)
		EndIf
	WEnd
EndFunc

Func bmddeco()
	GUICtrlSetState($Button22,$GUI_SHOW)
	$ii=1
	$filebmd=@ScriptDir&'\SanItem\BMD.bmp'
	$filedeco=@ScriptDir&'\SanItem\Deco.bmp'
	$cs=GUICtrlRead($Input8)
	$csboom=WinGetPos($cs)
;~ 	WinMove($cs,'',$csboom[0],$csboom[1],159, 266)
	If FileExists(@ScriptDir&'\SanItem\stt.txt') Then
	Else
		_FileCreate(@ScriptDir&'\SanItem\stt.txt')
		FileWrite(@ScriptDir&'\SanItem\stt.txt',1)
	EndIf
	$i=FileRead(@ScriptDir&'\SanItem\stt.txt')
	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $Button22
;~ 				WinMove($cs,'',$csboom[0],$csboom[1],$csboom[2],$csboom[3])
				GUICtrlSetState($Button22,$GUI_HIDE)
				ExitLoop
		EndSwitch
		ControlSend($cs,'','','{enter}')
		clickboom($cs,118, 119)
		clickboom($cs,55, 117)
		$ii=1
;~ 		clickboom($cs,246, 118)
;~ 		clickboom($cs,308, 119)
		While Hex(PixelGetColor($csboom[0]+27,$csboom[1]+188)) <> '00237BD4'
			ControlSend($cs,'','','{enter}')
			$ii+=1
			If Mod($ii, 100)=0 Then
				clickboom($cs,118, 119)
				Sleep(1000)
				clickboom($cs,55, 117)
			EndIf
			$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $Button22
					WinMove($cs,'',$csboom[0],$csboom[1],$csboom[2],$csboom[3])
					GUICtrlSetState($Button22,$GUI_HIDE)
					FileClose($txt)
					ExitLoop(2)
			EndSwitch
		WEnd
		$kq=_ImageSearchArea($filebmd,0,$csboom[0]+65,$csboom[1]+186,$csboom[0]+109,$csboom[1]+260,$x,$y,0)
		$kq1=_ImageSearchArea($filedeco,0,$csboom[0]+68,$csboom[1]+190,$csboom[0]+120,$csboom[1]+263,$x1,$y1,0)
		If $kq=1 Then
			clickboom($cs,461,$y-$csboom[1])
			clickboom($cs,345, 458)
			_ScreenCapture_Capture(@ScriptDir&'\SanItem\'&$i&'bmd.png')
			$i+=1
			$txt=FileOpen(@ScriptDir&'\SanItem\stt.txt',2)
			FileWrite($txt,$i)
		EndIf
		If $kq1=1 Then
			clickboom($cs,461,$y1-$csboom[1])
			clickboom($cs,345, 458)
			_ScreenCapture_Capture(@ScriptDir&'\SanItem\'&$i&'deco.png')
			$i+=1
			$txt=FileOpen(@ScriptDir&'\SanItem\stt.txt',2)
			FileWrite($txt,$i)
		EndIf
	WEnd
EndFunc

Func sankhac()
	GUICtrlSetState($Button22,$GUI_SHOW)
	$ii=1
	$filekhac=@ScriptDir&'\SanItem\'&GUICtrlRead($Input13)
	$cs=GUICtrlRead($Input8)
	$csboom=WinGetPos($cs)
;~ 	WinMove($cs,'',$csboom[0],$csboom[1],159, 266)
	If FileExists(@ScriptDir&'\SanItem\stt.txt') Then
	Else
		_FileCreate(@ScriptDir&'\SanItem\stt.txt')
		FileWrite(@ScriptDir&'\SanItem\stt.txt',1)
	EndIf
	$i=FileRead(@ScriptDir&'\SanItem\stt.txt')
	While 1
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $Button22
;~ 				WinMove($cs,'',$csboom[0],$csboom[1],$csboom[2],$csboom[3])
				GUICtrlSetState($Button22,$GUI_HIDE)
				ExitLoop
		EndSwitch
		ControlSend($cs,'','','{enter}')
		clickboom($cs,118, 119)
		clickboom($cs,55, 117)
		$ii=1
		While Hex(PixelGetColor($csboom[0]+27,$csboom[1]+188)) <> '00237BD4'
			ControlSend($cs,'','','{enter}')
			$ii+=1
			If Mod($ii, 100)=0 Then
				clickboom($cs,118, 119)
				Sleep(1000)
				clickboom($cs,55, 117)
			EndIf
			$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $Button22
					WinMove($cs,'',$csboom[0],$csboom[1],$csboom[2],$csboom[3])
					GUICtrlSetState($Button22,$GUI_HIDE)
					FileClose($txt)
					ExitLoop(2)
			EndSwitch
		WEnd
		$kq=_ImageSearchArea($filekhac,0,$csboom[0]+35,$csboom[1]+188,$csboom[0]+158,$csboom[1]+265,$x,$y,0)
		If $kq=1 Then
			clickboom($cs,461,$y-$csboom[1])
			clickboom($cs,345, 458)
			_ScreenCapture_Capture(@ScriptDir&'\SanItem\'&$i&'khac.png')
			$i+=1
			$txt=FileOpen(@ScriptDir&'\SanItem\stt.txt',2)
			FileWrite($txt,$i)
		EndIf
	WEnd
EndFunc

Func hackbnb()
	$a=@ScriptDir&'\Hack\5fad6b8d89500eea35bd8093a76576f4.exe'
	$b=@ScriptDir&'\Hack\5fad6b8d89500eea35bd8093a76576f3.dll'
;~ 	$b=@ScriptDir&'\Hack\3a7f43407a50cbf756108afa1663f0b7.dll'
;~ 	FileCopy($b,'C:\Windows\SysWOW64',1)
;~ 	FileCopy($a,'C:\Windows\SysWOW64',1)
	$code=InputBox('','','')
	If $code=1 Then
		Run('"'&'C:\Windows\SysWOW64'&'\5fad6b8d89500eea35bd8093a76576f4.exe'&'"')
	Else
;~ 	Opt('WinTitleMatchMode',3)
		ControlDisable('Hack BNB 2016','','[CLASS:Button; INSTANCE:2]')
		ControlEnable('Hack BNB 2016','','[CLASS:Button; INSTANCE:3]')
		ControlEnable('Hack BNB 2016','','[CLASS:Button; INSTANCE:4]')
		ControlEnable('Hack BNB 2016','','[CLASS:Button; INSTANCE:5]')
	EndIf

;~ 	$id=InputBox('','')

;~ 	Run('"'&'E:\Minh\Compressed\PSTools\pssuspend64.exe '&$id&'"')
;~ 	Run('"'&@TempDir&'\3a7f43407a50cbf756108afa1663f0b7.exe'&'"')
EndFunc

Func hcm()
	$dir=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
	$n=StringReplace($dir,'autoupdate.exe','')
	FileDelete($n&'dwk.dll')
	FileCopy(@ScriptDir&'\dwk.dll',$n)
	Run('"'&$n&'ca.exe"')
EndFunc

Func hn()
	$dir=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
	$n=StringReplace($dir,'autoupdate.exe','')
	FileDelete($n&'dwk.dll')
	FileCopy(@ScriptDir&'\dwk.dll',$n)
	Run('"'&$n&'ca.exe" svrHN')
EndFunc

Func dbv()
	$cs=GUICtrlRead($Input12)
	While 11
		ControlClick($cs,'','','left',1,638-2,402-23)
		ControlSend($cs,'','','{enter}')
		ControlClick($cs,'','','left',1,347-2,613-23)
			$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $Button11
					ExitLoop
			EndSwitch
	WEnd
EndFunc

Func dbv1()
	$cs=GUICtrlRead($Input12)
	While 11
		ControlClick($cs,'','','left',1,638-2,402-23)
		ControlSend($cs,'','','{enter}')
		ControlClick($cs,'','','left',1,347-2,613-23)
		ControlClick($cs,'','','left',1,514-2,330-23)
			$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $Button11
					ExitLoop
			EndSwitch
;~ 		ControlClick($cs,'','','left',1,514-2,330-23)
;~ 		ControlClick($cs,'','','left',1,514-2,357-23)
;~ 		Sleep(500)
	WEnd
EndFunc

Func dbv2()
	$cs=GUICtrlRead($Input12)
	While 11
		ControlClick($cs,'','','left',1,638-2,402-23)
		ControlSend($cs,'','','{enter}')
		ControlClick($cs,'','','left',1,347-2,613-23)
		ControlClick($cs,'','','left',1,514-2,357-23)
			$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $Button11
					ExitLoop
			EndSwitch
;~ 		ControlClick($cs,'','','left',1,514-2,330-23)
;~ 		ControlClick($cs,'','','left',1,514-2,357-23)
;~ 		Sleep(500)
	WEnd
EndFunc

Func dchc()
	logindchc()
	$file=FileReadLine(@ScriptDir&'\tkdchc.txt',2)
	$str=StringSplit($file,',')
	$in[1]=$str[1]
	$file=FileReadLine(@ScriptDir&'\tkdchc.txt',3)
	$str=StringSplit($file,',')
	$in[2]=$str[1]
	$file=FileReadLine(@ScriptDir&'\tkdchc.txt',4)
	$str=StringSplit($file,',')
	$in[3]=$str[3]
	For $i=1 To GUICtrlRead($Input11) Step 5
		For $ii=1 To 5
			ToolTip($i+$ii-1&' ván',0,0)
			ControlSend('cs1','','','{enter}')
			Sleep(100)
			ControlSend('cs1','','','{enter}')
			Sleep(100)
			ControlSend('cs1','','','{enter}')
			Sleep(100)
			ControlSend('cs4','','','{enter}')
			Sleep(100)
			ControlSend('cs4','','','{enter}')
			Sleep(100)
			ControlSend('cs4','','','{enter}')
			Sleep(100)

			ControlClick('cs1','','','left',1,302-2,67-23)
			Sleep(200)
			ControlClick('cs1','','','left',1,123-2,274-23);dhc
			Sleep(200)
			ControlClick('cs1','','','left',1,272-2,451-23);key
			Sleep(200)
			ControlClick('cs1','','','left',1,508-2,453-23);key
			Sleep(200)
			ControlSend('cs1','','','122')
			ControlSend('cs1','','','{enter}')
			Sleep(1000)

			ControlSend('cs1','','','/in '&$in[3])
			ControlSend('cs1','','','{enter}')
;~ 			Sleep(200)
			ControlSend('cs1','','','{enter}')
			ControlSend('cs1','','','{enter}')
;~ 			Sleep(200)
			ControlSend('cs1','','','/in '&$in[3])
			ControlSend('cs1','','','{enter}')
;~ 			Sleep(200)
			ControlSend('cs1','','','{enter}')
;~ 			Sleep(200)
			ControlSend('cs1','','','{enter}')

			ControlSend('cs1','','','/in '&$in[1])
			ControlSend('cs1','','','{enter}')
;~ 			Sleep(200)
			ControlSend('cs1','','','{enter}')
			ControlSend('cs1','','','{enter}')
;~ 			Sleep(200)
			ControlSend('cs1','','','/in '&$in[1])
			ControlSend('cs1','','','{enter}')
;~ 			Sleep(200)
			ControlSend('cs1','','','{enter}')
;~ 			Sleep(200)
			ControlSend('cs1','','','{enter}')

			ControlSend('cs1','','','/in '&$in[2])
			ControlSend('cs1','','','{enter}')
;~ 			Sleep(200)
			ControlSend('cs1','','','{enter}')
			ControlSend('cs1','','','{enter}')
;~ 			Sleep(200)
			ControlSend('cs1','','','/in '&$in[2])
			ControlSend('cs1','','','{enter}')
;~ 			Sleep(200)
			ControlSend('cs1','','','{enter}')
;~ 			Sleep(200)
			ControlSend('cs1','','','{enter}')


			Sleep(500)
;~ 			ControlSend('cs2','','','{f5}')
;~ 			ControlSend('cs2','','','{enter}')

			ControlSend('cs4','','','{enter}')
			ControlSend('cs4','','','{enter}')
			ControlSend('cs4','','','{enter}')
;~ 			Sleep(200)
			ControlSend('cs2','','','{enter}')
			ControlSend('cs2','','','{enter}')
			ControlSend('cs2','','','{enter}')
			ControlSend('cs3','','','{enter}')
			ControlSend('cs3','','','{enter}')
			ControlSend('cs3','','','{enter}')

			Sleep(200)
			ControlSend('cs1','','','{f5}')
			ControlSend('cs1','','','{enter}')
			ControlSend('cs1','','','{f5}')
			ControlSend('cs1','','','{enter}')
			ControlSend('cs1','','','{enter}')

;~ 			ControlSend('cs3','','','{f5}')
;~ 			ControlSend('cs3','','','{enter}')
			WinActivate('cs1')
			Sleep(4000)
			If Hex(PixelGetColor(699, 149))='00EE3FBD' Then
				Sleep(26500)
				ControlClick('cs4','','','left',1,746-2,613-23)
				ControlClick('cs4','','','left',1,746-2,613-23)
				ControlClick('cs4','','','left',1,746-2,613-23)
				Sleep(500)
			Else
				If Hex(PixelGetColor(697, 195))='00EE3FBD' Then
					Sleep(26500)
					ControlClick('cs1','','','left',1,746-2,613-23)
					ControlClick('cs1','','','left',1,746-2,613-23)
					ControlClick('cs1','','','left',1,746-2,613-23)
					Sleep(500)
				Else
					$ii=$ii-1
				EndIf
			EndIf


;~ 			Sleep(32000)

		;	ControlClick('cs2','','','left',1,119-2,613-23)
		;	ControlClick('cs3','','','left',1,119-2,613-23)


			ControlClick('cs2','','','left',1,746-2,613-23)
			ControlClick('cs2','','','left',1,746-2,613-23)
			ControlClick('cs2','','','left',1,746-2,613-23)
			ControlClick('cs3','','','left',1,746-2,613-23)
			ControlClick('cs3','','','left',1,746-2,613-23)
			ControlClick('cs3','','','left',1,746-2,613-23)
			Sleep(1000)
			ControlSend('cs2','','','{enter}')
			ControlSend('cs2','','','{enter}')
			ControlSend('cs2','','','{enter}')
			ControlSend('cs3','','','{enter}')
			ControlSend('cs3','','','{enter}')
			ControlSend('cs3','','','{enter}')

			If $ii=5 Then
#cs
;=========================================1
				ControlClick('cs2','','','left',1,586-2,611-23)
				ControlClick('cs2','','','left',1,515-2,331-23)
				Sleep(1000)

				If GUICtrlRead($Combo3)=1 Then
					ControlClick('cs2','','','left',1,592-2,157-23)
				ElseIf GUICtrlRead($Combo3)=2 Then
					ControlClick('cs2','','','left',1,589-2,192-23)
				ElseIf GUICtrlRead($Combo3)=3 Then
					ControlClick('cs2','','','left',1,588-2,222-23)
				ElseIf GUICtrlRead($Combo3)=4 Then
					ControlClick('cs2','','','left',1,589-2,260-23)
				Else
					MsgBox(0,'','Lỗi')
				EndIf
				Sleep(500)
				ControlClick('cs2','','','left',1,401-2,362-23)
				ControlClick('cs2','','','left',1,401-2,362-23)
				ControlSend('cs2','','','{enter}')
				ControlSend('cs2','','','{enter}')
				ControlSend('cs2','','','{enter}');
				ControlSend('cs2','','','{enter}');
				ControlSend('cs2','','','{enter}');
				Sleep(500)
	;========================================2
				ControlClick('cs2','','','left',1,586-2,611-23)
				ControlClick('cs2','','','left',1,515-2,358-23)
				Sleep(1000)

				If GUICtrlRead($Combo3)=1 Then
					ControlClick('cs2','','','left',1,592-2,157-23)
				ElseIf GUICtrlRead($Combo3)=2 Then
					ControlClick('cs2','','','left',1,589-2,192-23)
				ElseIf GUICtrlRead($Combo3)=3 Then
					ControlClick('cs2','','','left',1,588-2,222-23)
				ElseIf GUICtrlRead($Combo3)=4 Then
					ControlClick('cs2','','','left',1,589-2,260-23)
				Else
					MsgBox(0,'','Lỗi')
				EndIf
				Sleep(500)
				ControlClick('cs2','','','left',1,401-2,362-23)
				ControlClick('cs2','','','left',1,401-2,362-23)
				ControlSend('cs2','','','{enter}')
				ControlSend('cs2','','','{enter}')
				ControlSend('cs2','','','{enter}')
				ControlSend('cs2','','','{enter}')
				ControlSend('cs2','','','{enter}')
				Sleep(500)
	;===================
				ControlClick('cs1','','','left',1,746-2,613-23)
				ControlClick('cs1','','','left',1,746-2,613-23)
				ControlClick('cs1','','','left',1,746-2,613-23)
	;============================================1

				ControlClick('cs3','','','left',1,586-2,611-23)
				ControlClick('cs3','','','left',1,515-2,331-23)
				Sleep(1000)

				If GUICtrlRead($Combo3)=1 Then
					ControlClick('cs3','','','left',1,592-2,157-23)
				ElseIf GUICtrlRead($Combo3)=2 Then
					ControlClick('cs3','','','left',1,589-2,192-23)
				ElseIf GUICtrlRead($Combo3)=3 Then
					ControlClick('cs3','','','left',1,588-2,222-23)
				ElseIf GUICtrlRead($Combo3)=4 Then
					ControlClick('cs3','','','left',1,589-2,260-23)
				Else
					MsgBox(0,'','Lỗi')
				EndIf
				Sleep(500)
				ControlClick('cs3','','','left',1,401-2,362-23)
				ControlClick('cs3','','','left',1,401-2,362-23)
				ControlSend('cs3','','','{enter}')
				ControlSend('cs3','','','{enter}')
				ControlSend('cs3','','','{enter}')
				ControlSend('cs3','','','{enter}')
				ControlSend('cs3','','','{enter}')
				Sleep(500)
	;===========================================2
				ControlClick('cs3','','','left',1,586-2,611-23)
				ControlClick('cs3','','','left',1,515-2,358-23)
				Sleep(1000)

				If GUICtrlRead($Combo3)=1 Then
					ControlClick('cs3','','','left',1,592-2,157-23)
				ElseIf GUICtrlRead($Combo3)=2 Then
					ControlClick('cs3','','','left',1,589-2,192-23)
				ElseIf GUICtrlRead($Combo3)=3 Then
					ControlClick('cs3','','','left',1,588-2,222-23)
				ElseIf GUICtrlRead($Combo3)=4 Then
					ControlClick('cs3','','','left',1,589-2,260-23)
				Else
					MsgBox(0,'','Lỗi')
				EndIf
				Sleep(500)
				ControlClick('cs3','','','left',1,401-2,362-23)
				ControlClick('cs3','','','left',1,401-2,362-23)
				ControlSend('cs3','','','{enter}')
				ControlSend('cs3','','','{enter}')
				ControlSend('cs3','','','{enter}')
				ControlSend('cs3','','','{enter}')
				ControlSend('cs3','','','{enter}')
				Sleep(500)
	;============================================
#ce
	;~ 			Sleep(1000)
				Sleep(700)
				ControlClick('cs1','','','left',1,746-2,613-23)
				ControlClick('cs1','','','left',1,746-2,613-23)
				ControlClick('cs1','','','left',1,746-2,613-23)
				ControlClick('cs4','','','left',1,746-2,613-23)
				ControlClick('cs4','','','left',1,746-2,613-23)
				ControlClick('cs4','','','left',1,746-2,613-23)
				Sleep(1000)
				ControlSend('cs1','','','{enter}')
				ControlSend('cs1','','','{enter}')
				ControlSend('cs1','','','{enter}')
				ControlSend('cs1','','','{enter}')
				ControlSend('cs4','','','{enter}')
				ControlSend('cs4','','','{enter}')
				ControlSend('cs4','','','{enter}')
				ControlSend('cs4','','','{enter}')
				Sleep(500)
	;======================================1
				ControlClick('cs1','','','left',1,586-2,611-23)
				ControlClick('cs1','','','left',1,515-2,331-23)
				Sleep(1000)

				If GUICtrlRead($Combo3)=1 Then
					ControlClick('cs1','','','left',1,592-2,157-23)
				ElseIf GUICtrlRead($Combo3)=2 Then
					ControlClick('cs1','','','left',1,589-2,192-23)
				ElseIf GUICtrlRead($Combo3)=3 Then
					ControlClick('cs1','','','left',1,588-2,222-23)
				ElseIf GUICtrlRead($Combo3)=4 Then
					ControlClick('cs1','','','left',1,589-2,260-23)
				Else
					MsgBox(0,'','Lỗi')
				EndIf
				Sleep(500)
				ControlClick('cs1','','','left',1,401-2,362-23)
				ControlClick('cs1','','','left',1,401-2,362-23)
				ControlSend('cs1','','','{enter}')
				ControlSend('cs1','','','{enter}')
				ControlSend('cs1','','','{enter}')
				ControlSend('cs1','','','{enter}')
				ControlSend('cs1','','','{enter}')
				Sleep(500)
	;=========================================2


				ControlClick('cs4','','','left',1,586-2,611-23)
				ControlClick('cs4','','','left',1,515-2,358-23)
				Sleep(1000)

				If GUICtrlRead($Combo3)=1 Then
					ControlClick('cs4','','','left',1,592-2,157-23)
				ElseIf GUICtrlRead($Combo3)=2 Then
					ControlClick('cs4','','','left',1,589-2,192-23)
				ElseIf GUICtrlRead($Combo3)=3 Then
					ControlClick('cs4','','','left',1,588-2,222-23)
				ElseIf GUICtrlRead($Combo3)=4 Then
					ControlClick('cs4','','','left',1,589-2,260-23)
				Else
					MsgBox(0,'','Lỗi')
				EndIf
				Sleep(500)
				ControlClick('cs4','','','left',1,401-2,362-23)
				ControlClick('cs4','','','left',1,401-2,362-23)
				ControlSend('cs4','','','{enter}')
				ControlSend('cs4','','','{enter}')
				ControlSend('cs4','','','{enter}')
				ControlSend('cs4','','','{enter}')
				ControlSend('cs4','','','{enter}')
				Sleep(500)
	;=========================================
			Else
				Sleep(700)
				ControlClick('cs4','','','left',1,746-2,613-23)
				ControlClick('cs4','','','left',1,746-2,613-23)
				ControlClick('cs4','','','left',1,746-2,613-23)
				ControlClick('cs1','','','left',1,746-2,613-23)
				ControlClick('cs1','','','left',1,746-2,613-23)
				ControlClick('cs1','','','left',1,746-2,613-23)
			EndIf
		Next
	Next
EndFunc

Func logindchc()
	$caccs='cs1'
	If GUICtrlRead($Input10)=1 Then
		$caccs='cs1'
	ElseIf GUICtrlRead($Input10)>1 Then
		For $i=2 To GUICtrlRead($Input10)
			$caccs=$caccs&','&'cs'&$i
		Next
	EndIf

	GUICtrlSetData($Input3,$caccs)

	For $k=1 To GUICtrlRead($Input10)
		$open[$i]=False
		$name[$i]=False
		$login[$i]=False
	Next
	While 3
		If WinExists('Boom') Then
			WinClose('Boom')
		ElseIf ProcessExists('ca.exe') Then
			ProcessClose('ca.exe')
		Else
			ExitLoop
		EndIf
	WEnd
	$dir=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
	$n=StringReplace($dir,'autoupdate.exe','')
	FileDelete($n&'dwk.dll')
	FileCopy(@ScriptDir&'\dwk.dll',$n)
	While 1
		For $k=1 To GUICtrlRead($Input10)
			$win='cs'&$k
			If WinExists($win) Then
				$open[$k]=True
				$name[$k]=True
				$login[$k]=True

			EndIf
		Next
		For $i=1 To GUICtrlRead($Input10)
		$win='cs'&$i
		If $open[$i]=False and Not WinExists($win) Then
;~ 			ControlClick('Auto Update','','[Class:TButton; Instance:2]')
;~ 			$dir=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
;~ 			$n=StringReplace($dir,'autoupdate.exe','')

			Run('"'&$n&'\ca.exe"')
			Sleep(20000)
			$open[$i]=True
		EndIf
		Next

		For $i=1 To GUICtrlRead($Input10)
		$win='cs'&$i
		If $name[$i]=False and WinExists('Boom') Then
			WinSetTitle('Boom','','cs'&$i)
			$name[$i]=True
		EndIf
		Next
		For $i=1 To GUICtrlRead($Input10)
			$win='cs'&$i
			$file=FileReadLine(@ScriptDir&'\tkdchc.txt',$i)
			$str=StringSplit($file,',')
			$tk[1]=$str[1]
			$tk[2]=$str[2]
			$tk[3]=$str[3]
			$tk[4]=$str[4]
			If WinExists($win) And $login[$i]=False Then
;~ 			Sleep(5000)
				ControlClick($win,'','','left',1,30,30)

				Sleep(2000)
				If $i=2 Or $i=3 Then
					ControlClick($win,'','','left',1,564-2,506-23)
					ControlSend($win,'','','{tab}')
					ControlClick($win,'','','left',1,398-2,500-23)
					Sleep(200)
				EndIf
				If $i=2 Or $i=3 Or $i=1 Then
					ControlSend($win,'','',$tk[1])
					ControlSend($win,'','','{tab}')
					ControlSend($win,'','',$tk[2])
					ControlSend($win,'','','{tab}')
				EndIf
				If $i=2 Or $i=3 Or $i=4 Then
					ControlSend($win,'','',$tk[3])
					ControlSend($win,'','','{tab}')
					ControlSend($win,'','',$tk[4])
				EndIf
				ControlSend($win,'','','{enter}')
				Sleep(5000)
				ControlClick($win,'','','left',1,509-2,217-23)
				Sleep(500)
				ControlClick($win,'','','left',1,506-2,449-23)
				Sleep(5000)

				ControlClick($win,'','','left',1,610-2,526-23)
				Sleep(500)
				ControlClick($win,'','','left',1,660-2,526-23)
				Sleep(500)
				ControlClick($win,'','','left',1,558-2,462-23)
				Sleep(500)
				ControlClick($win,'','','left',1,587-2,463-23)
				Sleep(500)

				ControlSend($win,'','','{enter}')
				Sleep(200)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				$login[$i]=True
				If $i=1 Then
				Else
					WinSetState($win,'',@SW_MINIMIZE)
				EndIf
			EndIf
		Next

		For $i=1 To GUICtrlRead($Input10)
			If $open[$i]=True And $name[$i]=True And $login[$i]=True Then
				$l+=1
			EndIf
		Next
		If $l=GUICtrlRead($Input10) Then
;~ 			MsgBox(0,'','')
			ExitLoop
		Else
			$l=0
		EndIf
	WEnd
EndFunc

Func autopmtt()
	If GUICtrlRead($Checkbox1)=1 Then
				login()
			EndIf
			$cs=StringSplit(GUICtrlRead($Input3),',')
			If $cs[0]=0 Then
				$cs[0]=1
				$cs[1]=GUICtrlRead($Input1)
			EndIf
			While 1
				For $i=1 To $cs[0]
					ControlClick($cs[$i],'','','left',1,589-2,613-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,515-2,331-23);
					Sleep(1500)
					ControlClick($cs[$i],'','','left',1,549-2,157-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,225-2,465-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,327-2,465-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,431-2,463-23)
					Sleep(500)

					ControlClick($cs[$i],'','','left',1,589-2,191-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,225-2,465-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,327-2,465-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,431-2,463-23)
					Sleep(1500)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)

					ControlClick($cs[$i],'','','left',1,589-2,613-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,515-2,358-23);
					Sleep(1500)
					ControlClick($cs[$i],'','','left',1,549-2,157-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,225-2,465-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,327-2,465-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,431-2,463-23)
					Sleep(500)

					ControlClick($cs[$i],'','','left',1,589-2,191-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,225-2,465-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,327-2,465-23)
					Sleep(500)
					ControlClick($cs[$i],'','','left',1,431-2,463-23)
					Sleep(1500)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)
					ControlSend($cs[$i],'','','{enter}')
					Sleep(200)



				Next
				For $ii=GUICtrlRead($Input4) To 30
						GUICtrlSetData($Input4,$ii)

						Sleep(60000)
						If $ii=30 Then
							GUICtrlSetData($Input4,'0')
						EndIf
				Next
			WEnd
EndFunc

Func login()
	$caccs='cs1'
	If GUICtrlRead($Input7)=1 Then
		$caccs='cs1'
	ElseIf GUICtrlRead($Input7)>1 Then
		For $i=2 To GUICtrlRead($Input7)
			$caccs=$caccs&','&'cs'&$i
		Next
	EndIf

	GUICtrlSetData($Input3,$caccs)

	For $k=1 To GUICtrlRead($Input7)
		$open[$i]=False
		$name[$i]=False
		$login[$i]=False
	Next
	While 3
		If WinExists('Boom') Then
			WinClose('Boom')
		ElseIf ProcessExists('ca.exe') Then
			ProcessClose('ca.exe')
		Else
			ExitLoop
		EndIf
	WEnd
	$dir=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
	$n=StringReplace($dir,'autoupdate.exe','')
	FileDelete($n&'dwk.dll')
	FileCopy(@ScriptDir&'\dwk.dll',$n)
	While 1
		For $k=1 To GUICtrlRead($Input7)
			$win='cs'&$k
			If WinExists($win) Then
				$open[$k]=True
				$name[$k]=True
				$login[$k]=True

			EndIf
		Next
		For $i=1 To GUICtrlRead($Input7)
		$win='cs'&$i
		If $open[$i]=False and Not WinExists($win) Then
;~ 			ControlClick('Auto Update','','[Class:TButton; Instance:2]')
;~ 			$dir=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
;~ 			$n=StringReplace($dir,'autoupdate.exe','')

			Run('"'&$n&'\ca.exe"')
			Sleep(20000)
			$open[$i]=True
		EndIf
		Next

		For $i=1 To GUICtrlRead($Input7)
		$win='cs'&$i
		If $name[$i]=False and WinExists('Boom') Then
			WinSetTitle('Boom','','cs'&$i)
			$name[$i]=True
		EndIf
		Next
		For $i=1 To GUICtrlRead($Input7)
			$win='cs'&$i
			$file=FileReadLine(@ScriptDir&'\tk.txt',$i)
			$str=StringSplit($file,',')
			$tk[1]=$str[1]
			$tk[2]=$str[2]
			$tk[3]=$str[3]
			$tk[4]=$str[4]
			If WinExists($win) And $login[$i]=False Then
;~ 			Sleep(5000)
				ControlClick($win,'','','left',1,30,30)

				Sleep(2000)
				ControlClick($win,'','','left',1,564-2,506-23)
				ControlSend($win,'','','{tab}')
				ControlClick($win,'','','left',1,398-2,500-23)
				Sleep(200)
				ControlSend($win,'','',$tk[1])
				ControlSend($win,'','','{tab}')
				ControlSend($win,'','',$tk[2])
				ControlSend($win,'','','{tab}')
				ControlSend($win,'','',$tk[3])
				ControlSend($win,'','','{tab}')
				ControlSend($win,'','',$tk[4])
				ControlSend($win,'','','{enter}')
				Sleep(5000)
				ControlClick($win,'','','left',1,509-2,217-23)
				Sleep(500)
				ControlClick($win,'','','left',1,506-2,449-23)
				Sleep(5000)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				$login[$i]=True
				WinSetState($win,'',@SW_MINIMIZE)
			EndIf
		Next

		For $i=1 To GUICtrlRead($Input7)
			If $open[$i]=True And $name[$i]=True And $login[$i]=True Then
				$l+=1
			EndIf
		Next
		If $l=GUICtrlRead($Input7) Then
;~ 			MsgBox(0,'','')
			ExitLoop
		Else
			$l=0
		EndIf
	WEnd
EndFunc

Func kethop()
	$ten=GUICtrlRead($Input6)
	$vitri=GUICtrlRead($Combo1)
	While 2
		$nMsg = GUIGetMsg()
		Switch $nMsg
			Case $Button6
				ExitLoop
		EndSwitch
		ControlClick($ten,'','','left',1,666-2, 609-23)
		Sleep(1500)
		If $vitri=1 Then
		ControlClick($ten,'','','left',6,484-2, 457-23)
		Sleep(700)
		ElseIf $vitri=2 Then
		ControlClick($ten,'','','left',6,558-2, 441-23)
		Sleep(700)
		ElseIf $vitri=3 Then
		ControlClick($ten,'','','left',6,626-2, 441-23)
		Sleep(700)
		ElseIf $vitri=4 Then
		ControlClick($ten,'','','left',6,698-2, 441-23)
		Sleep(700)
		Else
			MsgBox(0,'','Lỗi')
			Exit
		EndIf
		For $i=1 To 60
			ControlClick($ten,'','','left',1,333-2, 433-23)
			ControlClick($ten,'','','left',1,377-2, 433-23)
			Sleep(70)
			$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $Button6
					ExitLoop(2)
			EndSwitch
		Next
		Sleep(1000)
		ControlSend($ten,'','','{enter}')
		Sleep(100)
		ControlSend($ten,'','','{enter}')
		Sleep(100)
		ControlSend($ten,'','','{enter}')
		Sleep(100)
		ControlSend($ten,'','','{enter}')
		Sleep(100)
		ControlClick($ten,'','','left',1,310-2, 547-23)
		Sleep(700)
		ControlSend($ten,'','','{enter}')
		Sleep(100)
		ControlSend($ten,'','','{enter}')
		Sleep(100)
		ControlSend($ten,'','','{enter}')
		Sleep(100)
		ControlSend($ten,'','','{enter}')
		Sleep(100)
		ControlClick($ten,'','','left',1,282-2, 613-23)
		Sleep(1500)
		ControlClick($ten,'','','left',1,675-2, 102-23)
		Sleep(700)
		ControlClick($ten,'','','left',1,153-2, 189-23)
		Sleep(200)
		ControlClick($ten,'','','left',1,222-2, 193-23)
		Sleep(200)
		ControlClick($ten,'','','left',1,146-2, 254-23)
		Sleep(200)
		ControlClick($ten,'','','left',1,225-2, 254-23)
		Sleep(200)
		ControlClick($ten,'','','left',1,153-2, 323-23)
		Sleep(200)
		ControlClick($ten,'','','left',1,224-2, 320-23)
		Sleep(200)
		ControlClick($ten,'','','left',1,418-2, 427-23)
		Sleep(2500)
		ControlClick($ten,'','','left',1,400-2, 442-23)
		Sleep(700)
		ControlClick($ten,'','','left',1,712-2, 69-23)
		Sleep(700)
	WEnd
EndFunc

Func nsmm()
	$ten=GUICtrlRead($Input5)
			While 2
				$nMsg = GUIGetMsg()
				ControlClick($ten,'','','left',1,333-2, 433-23)
				Sleep(100)
				ControlClick($ten,'','','left',1,377-2, 433-23)
				Sleep(100)
				Switch $nMsg
					Case $Button4
						ExitLoop
				EndSwitch
			WEnd
EndFunc

Func gdps()
	$file=FileReadLine(@ScriptDir&'\tkgdps.txt',2)
	$str=StringSplit($file,',')
	$in[1]=$str[1]
	$in[2]=$str[2]
	For $k=1 To 2
		$login[$k]=False
		$open[$k]=False
	Next
	While 3
		If WinExists('Boom') Then
			WinClose('Boom')
		ElseIf ProcessExists('ca.exe') Then
			ProcessClose('ca.exe')
		Else
			ExitLoop
		EndIf
	WEnd
	$dir=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
	$n=StringReplace($dir,'autoupdate.exe','')
;~ 	MsgBox(0,'',@ScriptDir&'\Hack\dwk.dll')
	FileDelete($n&'dwk.dll')
	FileCopy(@ScriptDir&'\Hack\dwk.dll',$n)
	While 9
		For $i=1 To 2
			Run('"'&$n&'\ca.exe"')
			Sleep(15000)
			While 4
				If WinExists('ca') Then
					WinClose('ca')
					ControlClick('Plug 19/9/2016','','[CLASS:TAdvGlowButton; INSTANCE:1]')
					Sleep(1000)
					WinSetTitle('BNB PLUG 19/9/2016 - Create by Quốc Bảo','','hack'&$i)
					Sleep(500)
					ControlSetText('hack'&$i,'','[CLASS:TAdvEdit; INSTANCE:1]','cuaso'&$i)
					Sleep(1000)
					$open[$i]=True
					ExitLoop
				Else
					WinSetTitle('Auto By Minh Huỳnh','','Auto by MH')
					MsgBox(0,'Error','Không thể mở hack, Đang Bắt Đầu lại',2)
					Run('"'&@ScriptFullPath&'"')
					Sleep(5000)
					Exit
				EndIf
			WEnd
		Next
		If $open[1]=True And $open[2]= True Then
			ExitLoop
		EndIf
	WEnd

	While 5
		ToolTip('Đang đăng nhập',0,0)
		For $i=1 To 2
			If WinExists('cuaso'&$i) And $login[$i]=False Then
				$win='cuaso'&$i
				$file=FileReadLine(@ScriptDir&'\tkgdps.txt',$i)
				$str=StringSplit($file,',')
				$tk[1]=$str[1]
				$tk[2]=$str[2]

				ControlClick('cuaso'&$i,'','','left',1,30,30)
				Sleep(2000)
				WinActivate('cuaso'&$i)
				WinMove('cuaso1','',0,0)
				While 8
					ControlSend('cuaso'&$i,'','',$tk[1])
					Sleep(500)
					ControlSend('cuaso'&$i,'','','{tab}')
					Sleep(500)
					ControlSend('cuaso'&$i,'','',$tk[2])
					Sleep(500)
					ControlSend('cuaso'&$i,'','','{enter}')

					Sleep(5000)
					If Hex(PixelGetColor(87,168))='000B5FBC' Then
						ExitLoop
					Else
						ControlSend('cuaso'&$i,'','','+{tab}')
					EndIf
				WEnd
				ControlClick($win,'','','left',1,509-2,217-23)
				Sleep(500)
				ControlClick($win,'','','left',1,506-2,449-23)
				Sleep(5000)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				ControlSend($win,'','','{enter}')
				Sleep(200)
				$login[$i]=True
			EndIf
		Next
		If $login[1]=True And $login[2]=True Then
			ToolTip('',0,0)
			ExitLoop
		EndIf
	WEnd
	ControlClick('hack1','','[CLASS:TAdvGlowButton; INSTANCE:1]')
	Sleep(500)
	WinSetTitle('Vàng ','','item1')
;~ 	WinSetState('cuaso2','',@SW_MINIMIZE)
	While 6
		ControlSend('cuaso1','','','{enter}')
		Sleep(200)
		ControlSend('cuaso1','','','{enter}')
		Sleep(200)
		ControlSend('cuaso1','','','{enter}')
		Sleep(200)
		ControlClick('cuaso1','','','left',1,586-2,611-23)
		WinActivate('cuaso1')
		WinMove('cuaso1','',0,0)
		Sleep(1000)

		If GUICtrlRead($Combo2)=1 Then
			ControlClick('cuaso1','','','left',1,592-2,157-23)
		ElseIf GUICtrlRead($Combo2)=2 Then
			ControlClick('cuaso1','','','left',1,589-2,192-23)
		ElseIf GUICtrlRead($Combo2)=3 Then
			ControlClick('cuaso1','','','left',1,588-2,222-23)
		ElseIf GUICtrlRead($Combo2)=4 Then
			ControlClick('cuaso1','','','left',1,589-2,260-23)
		Else
			MsgBox(0,'','Lỗi')
		EndIf

;~ 		Sleep(1000)
		nvhd()
		nvbat()
		nvcuu()
		nvbatboss()
		nvwinboss()
		nvwinthuong()
		nvdtqv()
		xong()
		biout()
		stopworking()
	WEnd
EndFunc

Func xong() ; ===> ok
	If Hex(PixelGetColor(250,393))='00F3DDB2' Then
		ToolTip('Đang nhận quà',0,0)
		$bb=0




;~ 		ControlClick('cuaso1','','','left',1,256-2,393-23)
;~ 		Sleep(1000)
;~ 		PixelSearch(221, 372,283, 411,0x0EC400)
;~ 		If Not @error Then
;~ 			$bb+=1
;~ 		EndIf
;~ 		ControlClick('cuaso1','','','left',1,325-2,390-23)
;~ 		Sleep(1000)
;~ 		PixelSearch(293, 368,359, 409,0x0EC400)
;~ 		If Not @error Then
;~ 			$bb+=1
;~ 		EndIf
;~ 		If $bb<2 Then
;~ 			ControlClick('cuaso1','','','left',1,217-2,440-23)
;~ 			Sleep(1000)
;~ 			PixelSearch(187, 417,248, 459,0x0EC400)
;~ 			If  Not @error Then
;~ 				$bb+=1
;~ 			EndIf
;~ 			If $bb<2 Then
;~ 				ControlClick('cuaso1','','','left',1,291-2,439-23)
;~ 				Sleep(500)
;~ 				ControlClick('cuaso1','','','left',1,362-2,437-23)
;~ 				Sleep(500)
;~ 			EndIf
;~ 		EndIf

		ControlClick('cuaso1','','','left',1,325-2,390-23)
		Sleep(1000)
		PixelSearch(197, 375,392, 457,0x0EC400)
		If @error=1 Then
			ControlClick('cuaso1','','','left',1,362-2,437-23)
			Sleep(1000)
			PixelSearch(197, 375,392, 457,0x0EC400)
			If @error=1 Then
				ControlClick('cuaso1','','','left',1,256-2,393-23)
				Sleep(1000)
				PixelSearch(197, 375,392, 457,0x0EC400)
				If @error=1 Then
					ControlClick('cuaso1','','','left',1,291-2,439-23)
					Sleep(500)
				EndIf
			EndIf
		EndIf



;~ 		FileDelete(@ScriptDir&'\Images\'&$lan&'.jpg')
		$lan=FileReadLine(@ScriptDir&'\Images\solan.txt',1)
		_ScreenCapture_Capture(@ScriptDir&'\Images\'&$lan&'.jpg')
		_FileWriteToLine(@ScriptDir&'\Images\solan.txt',1,$lan+1,True)
		ControlClick('cuaso1','','','left',1,439-2,406-23)
		Sleep(500)
		ControlClick('cuaso1','','','left',1,256-2,393-23)
		ControlClick('cuaso1','','','left',1,325-2,390-23)
		ControlClick('cuaso1','','','left',1,217-2,440-23)
		ControlClick('cuaso1','','','left',1,291-2,439-23)
		ControlClick('cuaso1','','','left',1,362-2,437-23)
		ControlClick('cuaso1','','','left',1,439-2,406-23)
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
	EndIf

EndFunc

Func xonghd()
	ControlSend('cuaso1','','','{enter}')
	Sleep(200)
	ControlSend('cuaso1','','','{enter}')
	Sleep(200)
	ControlSend('cuaso1','','','{enter}')
	Sleep(200)
	ControlClick('cuaso1','','','left',1,586-2,611-23)
	WinActivate('cuaso1')
	WinMove('cuaso1','',0,0)
	Sleep(1000)
	If GUICtrlRead($Combo2)=1 Then
		ControlClick('cuaso1','','','left',1,592-2,157-23)
	ElseIf GUICtrlRead($Combo2)=2 Then
		ControlClick('cuaso1','','','left',1,589-2,192-23)
	ElseIf GUICtrlRead($Combo2)=3 Then
		ControlClick('cuaso1','','','left',1,588-2,222-23)
	ElseIf GUICtrlRead($Combo2)=4 Then
		ControlClick('cuaso1','','','left',1,589-2,260-23)
	Else
		MsgBox(0,'','Lỗi')
	EndIf

;~ 	Sleep(1000)
	If Hex(PixelGetColor(250,393))='00F3DDB2' Then
		$xonghd=True
		ToolTip('Đang nhận quà',0,0)
		$bb=0




;~ 		ControlClick('cuaso1','','','left',1,256-2,393-23)
;~ 		Sleep(1000)
;~ 		PixelSearch(221, 372,283, 411,0x0EC400)
;~ 		If Not @error Then
;~ 			$bb+=1
;~ 		EndIf
;~ 		ControlClick('cuaso1','','','left',1,325-2,390-23)
;~ 		Sleep(1000)
;~ 		PixelSearch(293, 368,359, 409,0x0EC400)
;~ 		If Not @error Then
;~ 			$bb+=1
;~ 		EndIf
;~ 		If $bb<2 Then
;~ 			ControlClick('cuaso1','','','left',1,217-2,440-23)
;~ 			Sleep(1000)
;~ 			PixelSearch(187, 417,248, 459,0x0EC400)
;~ 			If  Not @error Then
;~ 				$bb+=1
;~ 			EndIf
;~ 			If $bb<2 Then
;~ 				ControlClick('cuaso1','','','left',1,291-2,439-23)
;~ 				Sleep(500)
;~ 				ControlClick('cuaso1','','','left',1,362-2,437-23)
;~ 				Sleep(500)
;~ 			EndIf
;~ 		EndIf

;~ 		ControlClick('cuaso1','','','left',1,325-2,390-23)
;~ 		Sleep(500)
;~ 		ControlClick('cuaso1','','','left',1,362-2,437-23)
;~ 		Sleep(500)
;~ 		ControlClick('cuaso1','','','left',1,256-2,393-23)
;~ 		Sleep(500)
;~ 		PixelSearch(197, 375,392, 457,0x0EC400)
;~ 		If @error=1 Then
;~ 			ControlClick('cuaso1','','','left',1,291-2,439-23)
;~ 			Sleep(500)
;~ 		EndIf


		ControlClick('cuaso1','','','left',1,325-2,390-23)
		Sleep(1000)
		PixelSearch(197, 375,392, 457,0x0EC400)
		If @error=1 Then
			ControlClick('cuaso1','','','left',1,362-2,437-23)
			Sleep(1000)
			PixelSearch(197, 375,392, 457,0x0EC400)
			If @error=1 Then
				ControlClick('cuaso1','','','left',1,256-2,393-23)
				Sleep(1000)
				PixelSearch(197, 375,392, 457,0x0EC400)
				If @error=1 Then
					ControlClick('cuaso1','','','left',1,291-2,439-23)
					Sleep(500)
				EndIf
			EndIf
		EndIf


;~ 		FileDelete(@ScriptDir&'\Images\'&$lan&'.jpg')
		$lan=FileReadLine(@ScriptDir&'\Images\solan.txt',1)
		_ScreenCapture_Capture(@ScriptDir&'\Images\'&$lan&'.jpg')
		_FileWriteToLine(@ScriptDir&'\Images\solan.txt',1,$lan+1,True)
		ControlClick('cuaso1','','','left',1,439-2,406-23)
		Sleep(500)
		ControlClick('cuaso1','','','left',1,256-2,393-23)
		ControlClick('cuaso1','','','left',1,325-2,390-23)
		ControlClick('cuaso1','','','left',1,217-2,440-23)
		ControlClick('cuaso1','','','left',1,291-2,439-23)
		ControlClick('cuaso1','','','left',1,362-2,437-23)
		ControlClick('cuaso1','','','left',1,439-2,406-23)
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		Sleep(500)
		ControlClick('cuaso1','','','left',1,118-2,611-23)
		ControlClick('cuaso2','','','left',1,118-2,611-23)
		Sleep(2000)
		ControlClick('cuaso1','','','left',1,616-2,82-23)
		ControlClick('cuaso2','','','left',1,616-2,82-23)
		Sleep(500)
		ControlClick('cuaso1','','','left',1,509-2,217-23)
		ControlClick('cuaso2','','','left',1,509-2,217-23)
		Sleep(3000)
		ControlClick('cuaso1','','','left',1,513-2,448-23)
		ControlClick('cuaso2','','','left',1,513-2,448-23)
		Sleep(5000)
		ControlSend('cuaso1','','','{enter}')
		Sleep(100)
		ControlSend('cuaso1','','','{enter}')
		Sleep(100)
		ControlSend('cuaso1','','','{enter}')
		Sleep(100)
		ControlSend('cuaso1','','','{enter}')
		Sleep(100)
		ControlSend('cuaso1','','','{enter}')
		Sleep(100)
		ControlSend('cuaso2','','','{enter}')
		Sleep(100)
		ControlSend('cuaso2','','','{enter}')
		Sleep(100)
		ControlSend('cuaso2','','','{enter}')
		Sleep(100)
		ControlSend('cuaso2','','','{enter}')
		Sleep(100)
		ControlSend('cuaso2','','','{enter}')
;~ 		Sleep(100)
	EndIf
EndFunc

Func nvhd() ; ===> ok
	If Hex(PixelGetColor($hd[0],$hd[1]))=$mau And Hex(PixelGetColor($hd[2],$hd[3]))=$mau Then
		$sovan=5
		ToolTip('Hidden Catch: '&$sovan&' lần còn lại',0,0)
		ControlSend('cuaso1','','','{enter}')
		Sleep(100)
		ControlSend('cuaso1','','','{enter}')
		Sleep(100)
		ControlSend('cuaso1','','','{enter}')
		Sleep(100)
		ControlSend('cuaso1','','','{enter}')
		Sleep(100)
		ControlSend('cuaso1','','','{enter}')
		Sleep(100)
		ControlClick('cuaso1','','','left',1,118-2,611-23)
		Sleep(100)
		ControlSend('cuaso2','','','{enter}')
		Sleep(100)
		ControlSend('cuaso2','','','{enter}')
		Sleep(100)
		ControlSend('cuaso2','','','{enter}')
		Sleep(100)
		ControlSend('cuaso2','','','{enter}')
		Sleep(100)
		ControlSend('cuaso2','','','{enter}')
		Sleep(100)
		ControlClick('cuaso2','','','left',1,118-2,611-23)
		Sleep(2000)
		ControlClick('cuaso1','','','left',1,616-2,82-23)
		ControlClick('cuaso2','','','left',1,616-2,82-23)
		Sleep(3000)
		ControlClick('cuaso1','','','left',1,506-2,334-23)
		ControlClick('cuaso2','','','left',1,506-2,334-23)
		Sleep(5000)
		For $f=1 To 5
			If $xonghd=True Then
				$xonghd=False
				ExitLoop
			EndIf
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso2','','','{enter}')
			Sleep(100)
			ControlSend('cuaso2','','','{enter}')
			Sleep(100)
			ControlSend('cuaso2','','','{enter}')
			Sleep(100)
			ControlSend('cuaso2','','','{enter}')
			Sleep(100)
			ControlSend('cuaso2','','','{enter}')
			Sleep(100)
			ControlClick('cuaso1','','','left',1,308-2,67-23)
			Sleep(200)
			ControlClick('cuaso1','','','left',1,488-2,465-23);key
			Sleep(200)
			ControlClick('cuaso1','','','left',1,336-2,464-23);key xxxxxxxxxxxxxxxxx
			Sleep(200)
			ControlSend('cuaso1','','','122')
			ControlSend('cuaso1','','','{enter}')
			Sleep(500)
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			Sleep(1000)
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			Sleep(43500)
			ControlClick('cuaso2','','','left',1,784-2,611-23)
			Sleep(3000)
			ControlClick('cuaso1','','','left',1,784-2,611-23)
			Sleep(500)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso2','','','{enter}')
			Sleep(100)
			ControlSend('cuaso2','','','{enter}')
			Sleep(100)
			ControlSend('cuaso2','','','{enter}')
			Sleep(100)
			ControlSend('cuaso2','','','{enter}')
			Sleep(100)
			ControlSend('cuaso2','','','{enter}')
			Sleep(100)
			While 7
				If WinExists('ca') Then
					WinClose('ca')
				Else
					ExitLoop
				EndIf
			WEnd
			$sovan=$sovan-1
			ToolTip('Hidden Catch: '&$sovan&' lần còn lại',0,0)
			xonghd()
		Next



;~ 		ControlClick('cuaso1','','','left',1,118-2,611-23)
;~ 		ControlClick('cuaso2','','','left',1,118-2,611-23)
;~ 		Sleep(2000)
;~ 		ControlClick('cuaso1','','','left',1,616-2,82-23)
;~ 		ControlClick('cuaso2','','','left',1,616-2,82-23)
;~ 		Sleep(500)
;~ 		ControlClick('cuaso1','','','left',1,509-2,217-23)
;~ 		ControlClick('cuaso2','','','left',1,509-2,217-23)
;~ 		Sleep(3000)
;~ 		ControlClick('cuaso1','','','left',1,513-2,448-23)
;~ 		ControlClick('cuaso2','','','left',1,513-2,448-23)
;~ 		Sleep(5000)
;~ 		ControlSend('cuaso1','','','{enter}')
;~ 		Sleep(100)
;~ 		ControlSend('cuaso1','','','{enter}')
;~ 		Sleep(100)
;~ 		ControlSend('cuaso1','','','{enter}')
;~ 		Sleep(100)
;~ 		ControlSend('cuaso1','','','{enter}')
;~ 		Sleep(100)
;~ 		ControlSend('cuaso1','','','{enter}')
;~ 		Sleep(100)
;~ 		ControlSend('cuaso2','','','{enter}')
;~ 		Sleep(100)
;~ 		ControlSend('cuaso2','','','{enter}')
;~ 		Sleep(100)
;~ 		ControlSend('cuaso2','','','{enter}')
;~ 		Sleep(100)
;~ 		ControlSend('cuaso2','','','{enter}')
;~ 		Sleep(100)
;~ 		ControlSend('cuaso2','','','{enter}')
;~ 		Sleep(100)



	EndIf
EndFunc

Func nvbat() ; ===> ok
	If Hex(PixelGetColor($bat[0],$bat[1]))=$mau And Hex(PixelGetColor($bat[2],$bat[3]))=$mau Then
		$sovan=1
		ToolTip('Bắt: '&$sovan&' lần còn lại',0,0)
		For $f=1 To 1
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlClick('cuaso1','','','left',1,302-2,67-23)
			Sleep(200)
			ControlClick('cuaso1','','','left',1,191-2,285-23);đại chiến
			Sleep(200)
			ControlClick('cuaso1','','','left',1,272-2,451-23);key
			Sleep(200)
			ControlClick('cuaso1','','','left',1,508-2,453-23);key
			Sleep(200)
			ControlSend('cuaso1','','','122')
			ControlSend('cuaso1','','','{enter}')
			Sleep(500)
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			Sleep(500)
			ControlClick('cuaso1','','','left',1,712-2,479-23)
			Sleep(1000)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(500)
			Opt('MouseClickDelay',100)
			ControlClick('cuaso1','','','left',100,641-2,214-23)
			Opt('MouseClickDelay',5)
			Sleep(500)

			ControlClick('cuaso1','','','left',1,407-2,240-23); map GTK 2
			Sleep(500)
			ControlSend('cuaso1','','','{enter}')
			Sleep(1000)
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			Sleep(41500)
			ControlSend('cuaso2','','','{space}')
			Sleep(7000)

			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso2','','','left',1,746-2,613-23)
			ControlClick('cuaso2','','','left',1,746-2,613-23)
			ControlClick('cuaso2','','','left',1,746-2,613-23)
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')

			While 7
				If WinExists('ca') Then
					WinClose('ca')
				Else
					ExitLoop
				EndIf
			WEnd
			$sovan=$sovan-1
			ToolTip('Bắt: '&$sovan&' lần còn lại',0,0)
		Next
	EndIf
EndFunc

Func nvcuu() ; ===> ok
	If Hex(PixelGetColor($cuu[0],$cuu[1]))=$mau And Hex(PixelGetColor($cuu[2],$cuu[3]))=$mau Then
		$sovan=1
		ToolTip('Cứu: '&$sovan&' lần còn lại',0,0)
		For $f=1 To 1
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlClick('cuaso1','','','left',1,302-2,67-23)
			Sleep(200)
			ControlClick('cuaso1','','','left',1,340-2,286-23);boss
			Sleep(200)
			ControlClick('cuaso1','','','left',1,272-2,451-23);key
			Sleep(200)
			ControlClick('cuaso1','','','left',1,508-2,453-23);key
			Sleep(200)
			ControlSend('cuaso1','','','122')
			ControlSend('cuaso1','','','{enter}')
			Sleep(500)
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			Sleep(500)
			ControlClick('cuaso1','','','left',1,712-2,479-23)
			Sleep(1000)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(500)
			Opt('MouseClickDelay',100)
			ControlClick('cuaso1','','','left',100,641-2,214-23)
			Opt('MouseClickDelay',5)
			Sleep(500)


			ControlClick('cuaso1','','','left',1,407-2,240-23); map cuop biển 2
			Sleep(500)
			ControlSend('cuaso1','','','{enter}')
			Sleep(1000)
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			Sleep(7000)
			Opt("SendKeyDownDelay", 5000)
			ControlSend('cuaso1','','','{left}')
			Opt("SendKeyDownDelay", 5)
			Sleep(1000)
			ControlSend('cuaso2','','','{space}')
			Sleep(6000)
			Opt("SendKeyDownDelay", 5000)
			ControlSend('cuaso1','','','{right}')
			Opt("SendKeyDownDelay", 5)
			Sleep(18000)

			ControlClick('hack2','','[CLASS:TButton; INSTANCE:1]')
			Sleep(200)
			ControlClick('hack2','','[CLASS:TButton; INSTANCE:1]')
			Sleep(3000)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso2','','','left',1,746-2,613-23)
			ControlClick('cuaso2','','','left',1,746-2,613-23)
			ControlClick('cuaso2','','','left',1,746-2,613-23)
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			While 7
				If WinExists('ca') Then
					WinClose('ca')
				Else
					ExitLoop
				EndIf
			WEnd
			$sovan=$sovan-1
			ToolTip('Cứu: '&$sovan&' lần còn lại',0,0)
		Next
	EndIf
;~ 	ControlClick('cuaso1','','','left',1,302-2,67-23)
;~ 	Sleep(200)
;~ 	ControlClick('cuaso1','','','left',1,302-2,67-23)
;~ 	Sleep(200)

EndFunc


Func nvbatboss() ; ===> ok
	If Hex(PixelGetColor($batboss[0],$batboss[1]))=$mau And Hex(PixelGetColor($batboss[2],$batboss[3]))=$mau Then
		$sovan=1
		ToolTip('Bắt Boss: '&$sovan&' lần còn lại',0,0)
		For $f=1 To 1
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlClick('cuaso1','','','left',1,302-2,67-23)
			Sleep(200)
			ControlClick('cuaso1','','','left',1,340-2,286-23);boss
			Sleep(200)
			ControlClick('cuaso1','','','left',1,272-2,451-23);key
			Sleep(200)
			ControlClick('cuaso1','','','left',1,508-2,453-23);key
			Sleep(200)
			ControlSend('cuaso1','','','122')
			ControlSend('cuaso1','','','{enter}')
			Sleep(1000)

			ControlClick('cuaso1','','','left',1,712-2,479-23)
			Sleep(1000)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(500)
			Opt('MouseClickDelay',100)
			ControlClick('cuaso1','','','left',100,641-2,214-23)
			Opt('MouseClickDelay',5)
			Sleep(500)


			ControlClick('cuaso1','','','left',1,407-2,240-23); map cuop biển 2
			Sleep(500)
			ControlSend('cuaso1','','','{enter}')
			Sleep(1000)
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			Sleep(5500)

			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(13000)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(32000)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)

;~ 			Opt("SendKeyDownDelay", 3000)
;~ 			ControlSend('cuaso1','','','{left}')
;~ 			Opt("SendKeyDownDelay", 5)
;~ 			Sleep(500)
;~ 			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
;~ 			Sleep(500)
;~ 			Opt("SendKeyDownDelay", 3000)
;~ 			ControlSend('cuaso1','','','{left}')
;~ 			Opt("SendKeyDownDelay", 5)
;~ 			Sleep(500)
;~ 			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
;~ 			Sleep(500)
;~ 			Opt("SendKeyDownDelay", 700)
;~ 			ControlSend('cuaso1','','','{right}')
;~ 			Opt("SendKeyDownDelay", 5)
;~ 			Sleep(500)
;~ 			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
;~ 			Sleep(500)
;~ 			Opt("SendKeyDownDelay", 5000)
;~ 			ControlSend('cuaso1','','','{up}')
;~ 			Opt("SendKeyDownDelay", 5)

;~ 			ControlClick('hack1','','[CLASS:TAdvOfficeCheckBox; INSTANCE:9]')
;~ 			Sleep(500)
;~ 			MouseMove(126,224)
;~ 			Sleep(500)
;~ 			ControlClick('hack1','','[CLASS:TAdvOfficeCheckBox; INSTANCE:9]')
			Sleep(13000)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			While 7
				If WinExists('ca') Then
					WinClose('ca')
				Else
					ExitLoop
				EndIf
			WEnd
			$sovan=$sovan-1
			ToolTip('Win Boss: '&$sovan&' lần còn lại',0,0)
		Next
	EndIf
EndFunc

Func nvwinboss() ; ===> ok
	If Hex(PixelGetColor($winboss[0],$winboss[1]))=$mau And Hex(PixelGetColor($winboss[2],$winboss[3]))=$mau Then
		$sovan=1
		ToolTip('Win Boss: '&$sovan&' lần còn lại',0,0)
		For $f=1 To 1
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlClick('cuaso1','','','left',1,302-2,67-23)
			Sleep(200)
			ControlClick('cuaso1','','','left',1,340-2,286-23);boss
			Sleep(200)
			ControlClick('cuaso1','','','left',1,272-2,451-23);key
			Sleep(200)
			ControlClick('cuaso1','','','left',1,508-2,453-23);key
			Sleep(200)
			ControlSend('cuaso1','','','122')
			ControlSend('cuaso1','','','{enter}')
			Sleep(1000)

			ControlClick('cuaso1','','','left',1,712-2,479-23)
			Sleep(1000)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(500)
			Opt('MouseClickDelay',100)
			ControlClick('cuaso1','','','left',100,641-2,214-23)
			Opt('MouseClickDelay',5)
			Sleep(500)


			ControlClick('cuaso1','','','left',1,407-2,240-23); map cuop biển 2
			Sleep(500)
			ControlSend('cuaso1','','','{enter}')
			Sleep(1000)
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			Sleep(43000)

			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(200)
			ControlClick('hack1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(3000)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			While 7
				If WinExists('ca') Then
					WinClose('ca')
				Else
					ExitLoop
				EndIf
			WEnd
			$sovan=$sovan-1
			ToolTip('Win Boss: '&$sovan&' lần còn lại',0,0)
		Next
	EndIf
EndFunc

Func nvwinthuong() ; ===> ok
	If Hex(PixelGetColor($winthuong[0],$winthuong[1]))=$mau And Hex(PixelGetColor($winthuong[2],$winthuong[3]))=$mau Then
		$sovan=1
		ToolTip('Win Thường: '&$sovan&' lần còn lại',0,0)
		For $f=1 To 1
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlClick('cuaso1','','','left',1,302-2,67-23)
			Sleep(200)
			ControlClick('cuaso1','','','left',1,191-2,285-23);đại chiến
			Sleep(200)
			ControlClick('cuaso1','','','left',1,272-2,451-23);key
			Sleep(200)
			ControlClick('cuaso1','','','left',1,508-2,453-23);key
			Sleep(200)
			ControlSend('cuaso1','','','122')
			ControlSend('cuaso1','','','{enter}')
			Sleep(500)
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','/in '&$in[1])
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			Sleep(200)
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			Sleep(500)
			ControlClick('cuaso1','','','left',1,712-2,479-23)
			Sleep(1000)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(500)
			Opt('MouseClickDelay',100)
			ControlClick('cuaso1','','','left',100,641-2,214-23)
			Opt('MouseClickDelay',5)
			Sleep(500)

			ControlClick('cuaso1','','','left',1,407-2,240-23); map GTK 2
			Sleep(500)
			ControlSend('cuaso1','','','{enter}')
			Sleep(1000)
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			Sleep(41500)
;~ 			ControlSend('cuaso2','','','{space}')
			Sleep(1000)

			ControlClick('cuaso2','','','left',1,746-2,613-23)
			ControlClick('cuaso2','','','left',1,746-2,613-23)
			ControlClick('cuaso2','','','left',1,746-2,613-23)
			Sleep(2000)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso1','','','left',1,746-2,613-23)

			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')
			ControlSend('cuaso2','','','{enter}')

			While 7
				If WinExists('ca') Then
					WinClose('ca')
				Else
					ExitLoop
				EndIf
			WEnd
			$sovan=$sovan-1
			ToolTip('Win Thường: '&$sovan&' lần còn lại',0,0)
		Next
	EndIf
EndFunc

Func nvdtqv()
	If Hex(PixelGetColor($dtqv[0],$dtqv[1]))=$mau And Hex(PixelGetColor($dtqv[2],$dtqv[3]))=$mau Then
		$sovan=1
		ToolTip('Thắng ĐTQV: '&$sovan&' lần còn lại',0,0)
		For $f=1 To 1
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			Sleep(100)
			ControlClick('cuaso1','','','left',1,302-2,67-23)
			Sleep(200)
			ControlClick('cuaso1','','','left',1,492-2,294-23);dtqv
			Sleep(200)
			ControlClick('cuaso1','','','left',1,272-2,451-23);key
			Sleep(200)
			ControlClick('cuaso1','','','left',1,508-2,453-23);key
			Sleep(200)
			ControlSend('cuaso1','','','122')
			ControlSend('cuaso1','','','{enter}')
			Sleep(1000)

			ControlClick('cuaso1','','','left',1,712-2,479-23)
			Sleep(1000)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
;~ 			ControlClick('cuaso1','','','left',1,642-2,222-23)
;~ 			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(500)
			Opt('MouseClickDelay',100)
			ControlClick('cuaso1','','','left',100,641-2,214-23)
			Opt('MouseClickDelay',5)
			Sleep(500)

			ControlClick('cuaso1','','','left',1,410-2,253-23); map khoang san 23
			Sleep(500)
			ControlSend('cuaso1','','','{enter}')
			Sleep(1000)
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			ControlSend('cuaso1','','','{f5}')
			Sleep(1500)
;~ 			ControlClick('hack1','','[CLASS:TAdvGlowButton; INSTANCE:1]')
;~ 			Sleep(500)
;~ 			WinSetTitle('Vàng ','','item1')
			ControlSetText('item1','','[CLASS:TEdit; INSTANCE:1]','127')
			Sleep(500)
			ControlClick('item1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(500)
			ControlSend('cuaso1','','','{lctrl}')
			Sleep(500)
			Opt("SendKeyDownDelay", 400)
			ControlSend('cuaso1','','','{left}')
			Opt("SendKeyDownDelay", 5)
			ControlSend('cuaso1','','','{lctrl}')
			Opt("SendKeyDownDelay", 400)
			ControlSend('cuaso1','','','{left}')
			Opt("SendKeyDownDelay", 5)
			ControlSend('cuaso1','','','{lctrl}')
			Opt("SendKeyDownDelay", 400)
			ControlSend('cuaso1','','','{left}')
			Opt("SendKeyDownDelay", 5)
			ControlSend('cuaso1','','','{lctrl}')
			Opt("SendKeyDownDelay", 400)
			ControlSend('cuaso1','','','{down}')
			Opt("SendKeyDownDelay", 5)
			ControlSend('cuaso1','','','{lctrl}')
			Opt("SendKeyDownDelay", 2000)
			ControlSend('cuaso1','','','{right}')
			Opt("SendKeyDownDelay", 5)
			ControlSend('cuaso1','','','{lctrl}')
			Opt("SendKeyDownDelay", 400)
			ControlSend('cuaso1','','','{up}')
			Opt("SendKeyDownDelay", 5)
			ControlSend('cuaso1','','','{lctrl}')
			Opt("SendKeyDownDelay", 1000)
			ControlSend('cuaso1','','','{left}')
			Opt("SendKeyDownDelay", 5)
			Opt("SendKeyDownDelay", 600)
			ControlSend('cuaso1','','','{up}')
			Opt("SendKeyDownDelay", 5)

			Sleep(25500)
			ControlSetText('item1','','[CLASS:TEdit; INSTANCE:1]','220')
			Sleep(500)
			ControlClick('item1','','[CLASS:TButton; INSTANCE:1]')
			Sleep(2000)
			ControlSend('cuaso1','','','{space}')
			Sleep(3500)
			ControlSend('cuaso1','','','{lctrl}')
			Sleep(7500)
			WinClose('ca')
			WinClose('ca')
			WinClose('ca')
			WinClose('ca')
			WinClose('ca')
;~ 			WinClose('item1')

			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlClick('cuaso1','','','left',1,746-2,613-23)
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')

			While 7
				If WinExists('ca') Then
					WinClose('ca')
				Else
					ExitLoop
				EndIf
			WEnd
			$sovan=$sovan-1
			ToolTip('Thắng ĐTQV: '&$sovan&' lần còn lại',0,0)
		Next
	EndIf
EndFunc

Func biout()
	WinActivate('cuaso2')
	If Hex(PixelGetColor(114,80))='00FEBC87' Then
		WinSetTitle('Auto By Minh Huỳnh','','Auto by MH')
		MsgBox(0,'Error','Bị Dis, Đang bắt đầu lại',2)
		Run('"'&@ScriptFullPath&'"')
		Sleep(5000)
		Exit
	EndIf
	WinActivate('cuaso1')
	If Hex(PixelGetColor(114,80))='00FEBC87' Then
		WinSetTitle('Auto By Minh Huỳnh','','Auto by MH')
		MsgBox(0,'Error','Bị Dis, Đang bắt đầu lại',2)
		Run('"'&@ScriptFullPath&'"')
		Sleep(5000)
		Exit
	EndIf
EndFunc

Func stopworking()
	If WinExists('Crazy Arcade Client') Then
		WinSetTitle('Auto By Minh Huỳnh','','Auto by MH')
		MsgBox(0,'Error','Bị Dis, Đang mở lại',2)
		Run('"'&@ScriptFullPath&'"')
		Sleep(5000)
		Exit
	EndIf
EndFunc