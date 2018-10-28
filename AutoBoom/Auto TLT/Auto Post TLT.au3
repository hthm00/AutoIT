#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Users\Administrator\Desktop\1.ico
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Description="Zerowelcome's Auto"
#AutoIt3Wrapper_Res_Fileversion=1.0.1.0
#AutoIt3Wrapper_Res_ProductVersion=1.0.1.0
#AutoIt3Wrapper_Versioning_Parameters=1.0.1.0
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****


#RequireAdmin
#include <GUIConstantsEx.au3>
#include <GUIConstants.au3>
#include <EditConstants.au3>
#Include <WindowsConstants.au3>
#include <Inet.au3>
#include <Misc.au3>
#include <File.au3>
#include <Date.au3>
#NoTrayIcon
;Opt("TrayIconDebug", 1)


Global $MaKH, $outout, $sweb, $dsweb, $Adaptername, $Adapternameid, $dangmo
Global $thumucprogram, $thumuc, $FileInfo, $thumucboom



;~ $thumucprogram = RegRead("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion", "ProgramFilesDir")
;~ $thumuc = $thumucprogram & "\zerowelcome auto\"
$thumuc = @ScriptDir & "\settings\"
$thumucboom = ""

$FileInfo = $thumuc & "configs12.dat"

;~ $dsweb="http://zerowelcome.com/index100"

Sleep(500)
;~ If _Singleton("ZeroAutoPostTLT", 1) = 0 Then
;~ 	Exit
;~ EndIf

Opt("MouseCoordMode",2)
Opt("PixelCoordMode", 2)

If not IsAdmin ( ) Then
	MsgBox(64,"Lỗi !!!","Để chạy được Auto, cần đăng nhập User có quyền Administrator !")
	Exit
EndIf

Xet()
Func Xet()
$dangmo=0
$outout = 1

$Output = ""
$objWMIService = ObjGet("winmgmts:\\localhost\root\CIMV2")
Local $colItems = $objWMIService.ExecQuery("SELECT Name FROM Win32_Processor", "WQL", 0x10 + 0x20)
If IsObj($colItems) Then
	For $objItem In $colItems
		$Output &= $objItem.Name
	Next
EndIf

If $Output = "" Then
	$objWMIService = ObjGet("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2")
	Local $colCPU = $objWMIService.ExecQuery("select * from CIM_Processor")
	For $object In $colCPU
		$Output &= StringStripWS($object.Name, 1)
	Next
EndIf

Local $o_WMIService = ObjGet("winmgmts:\\" & @ComputerName & "\root\CIMV2")
Local $Items = $o_WMIService.ExecQuery("select * from Win32_NetworkAdapter")
If IsObj($Items) Then
	Local $objItem
	$Adaptername = ""
	For $objItem In $Items
		If $objItem.AdapterType = "Ethernet 802.3" And StringLen($objItem.Name) > StringLen($Adaptername) And StringInStr($objItem.ServiceName, "usb") = 0 Then
			$Adaptername = $objItem.Name
			$Adapternameid = $objItem.NetConnectionID
			$connected=0
			If $objItem.NetConnectionStatus=2 Then $connected=1
		EndIf
	Next
EndIf

Local $o_WMIService = ObjGet("winmgmts:\\" & @ComputerName & "\root\CIMV2")
Local $Items = $o_WMIService.ExecQuery('select * from Win32_NetworkAdapter Where NetConnectionID = "' & $Adapternameid & '"')
If IsObj($Items) Then
	Local $objItem
	For $objItem In $Items
		Local $AdapterReg = GetAdapterRegKey($objItem.Name)

		$remac=0


		If $remac=0 Then
			$dcmac = $objItem.MACAddress
		EndIf

		$a = StringMid($dcmac, 14, 1) & StringMid($dcmac, 16, 2)

		$b = ""
		For $i = 1 To StringLen($Output)
			If StringMid($Output, $i, 1) = "0" Or Number(StringMid($Output, $i, 1)) <> 0 Then
				$b = $b & StringMid($Output, $i, 1)
			EndIf
		Next

		$a = $a & StringMid($b, 1, 1) & StringMid($b, StringLen($b) - 2, 2)
		$MaKH = $a



		;$sweb="*f1b531*804531*e6f531*3fc210*3e6210*"

	Next
EndIf

EndFunc











$outout = 0





If Not FileExists($thumuc) Then DirCreate($thumuc)
If Not FileExists($FileInfo) Then
	Resetthongso()
EndIf



Func CreateRadio( $rText, $rLeft, $rTop, ByRef $Label)
    Local $PCRadio = GUICtrlCreateRadio(" ", $rLeft, $rTop,14,14)
	GUICtrlSetResizing(-1, $GUI_DOCKALL)
	$Label = GUICtrlCreateLabel($rText, $rLeft+15, $rTop)
	GUICtrlSetResizing(-1, $GUI_DOCKALL)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	;DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", 0, "wstr", 0)

	Return $PCRadio
EndFunc

Func CreateCheckbox( $rText, $rLeft, $rTop, ByRef $Label)
    Local $PCCheckbox = GUICtrlCreateCheckbox(" ", $rLeft, $rTop,14,14)
	GUICtrlSetResizing(-1, $GUI_DOCKALL)
	$Label = GUICtrlCreateLabel($rText, $rLeft+17, $rTop)
	GUICtrlSetResizing(-1, $GUI_DOCKALL)
	GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	;DllCall("UxTheme.dll", "int", "SetWindowTheme", "hwnd", GUICtrlGetHandle(-1), "wstr", 0, "wstr", 0)
	Return $PCCheckbox
EndFunc

Func CreateLabel( $rText, $rLeft, $rTop, $rBackColor = "" , $rTextColor = "" )
    Local $PCLabel = GUICtrlCreateLabel($rText, $rLeft, $rTop)
	GUICtrlSetResizing(-1, $GUI_DOCKALL)
    GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	Return $PCLabel
EndFunc

Func CreateButton( $rText, $rLeft, $rTop, $rwidth, $rheight )
    Local $PCButton = GUICtrlCreateButton($rText, $rLeft, $rTop, $rwidth, $rheight)
	GUICtrlSetResizing(-1, $GUI_DOCKALL)
    ;GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	Return $PCButton
EndFunc

Func CreateInput( $rText, $rLeft, $rTop, $rwidth, $rheight)
    Local $PCInput = GUICtrlCreateInput($rText, $rLeft, $rTop, $rwidth, $rheight)
	GUICtrlSetResizing(-1, $GUI_DOCKALL)
    GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	Return $PCInput
EndFunc

Func CreateInputSo( $rText, $rLeft, $rTop, $rwidth, $rheight)
    Local $PCInput = GUICtrlCreateInput($rText, $rLeft, $rTop, $rwidth, $rheight, $ES_NUMBER)
	GUICtrlSetResizing(-1, $GUI_DOCKALL)
    GUICtrlSetBkColor(-1, $GUI_BKCOLOR_TRANSPARENT)
	Return $PCInput
EndFunc

Func _GUICtrlEdit_TogglePassChars($hWnd, $hCtrl, $iToggleState = -1, $sPassChar = -1)
    If Not IsHWnd($hWnd) Then
        $hWnd = WinGetHandle($hWnd)
    EndIf

    If Not IsHWnd($hCtrl) Then
        $hCtrl = ControlGetHandle($hWnd, "", $hCtrl)
    EndIf

    Local Const $EM_SETPASSWORDCHAR = 0xCC
    Local Const $EM_GETPASSWORDCHAR = 0xD2

    Local $iGet_Pass_Char, $iSet_Pass_Char, $iDef_Pass_Char = 9679
    Local $aRet = DllCall("user32.dll", "long", "SendMessageW", "hwnd", $hCtrl, "int", $EM_GETPASSWORDCHAR, "int", 0, "int", 0)

    If Not @error And $aRet[0] Then
        $iGet_Pass_Char = $aRet[0]
    EndIf

    If $sPassChar = -1 Then
        $iSet_Pass_Char = $iGet_Pass_Char
    Else
        If IsString($sPassChar) Then
            $iSet_Pass_Char = Asc($sPassChar)
        Else
            $iSet_Pass_Char = $sPassChar
        EndIf

        $iDef_Pass_Char = $iSet_Pass_Char
    EndIf

    If $iToggleState = -1 Then
        If $iGet_Pass_Char <> 0 Then
            $iSet_Pass_Char = 0
        Else
            $iSet_Pass_Char = $iDef_Pass_Char
        EndIf
    ElseIf $iToggleState = 0 Then
        $iSet_Pass_Char = 0
    ElseIf $iToggleState = 1 Then
        $iSet_Pass_Char = $iDef_Pass_Char
    EndIf

    DllCall("user32.dll", "none", "SendMessageW", "hwnd", $hCtrl, "int", $EM_SETPASSWORDCHAR, "int", $iSet_Pass_Char, "int", 0)
    DllCall("user32.dll", "none", "InvalidateRect", "hwnd", $hCtrl, "ptr", 0, "int", 1)
EndFunc




If $outout=0 Then

	Global $BanDo, $Tudo, $BanDau, $DoiMap, $DoiTD, $BatDau, $Chuyen, $Time1, $Time2, $Tocdo
	Global $k, $z, $GoBack, $Khop, $cs[12], $Maucs[12], $MissTD, $MissMap, $sovan, $Hut3lan
	Global $Tocdo, $TimeWaitBoom, $TimeWaitActive, $TimeBonus, $LBpost1, $LBpost2, $LBHCM, $LBHN
	$Chuyen=0

	Global $yy=0
	If @OSVersion = "WIN_XP" Then $yy=4
	If StringLeft(@OSVersion, 5) = "WIN_8" Then $yy = 1








;~ 	FileInstall("C:\background2.jpg", @windowsdir & "\Temp\zerobackground2.jpg")
    Global $hGui = GUICreate ("Auto Post TLT - By Minh Huỳnh" ,500 ,370 ,@DesktopWidth-500, 0)
;~ 	GUICtrlCreatePic(@windowsdir  & "\Temp\zerobackground2.jpg", 0, 0, 1155, 703, "$SS_BITMAP")
;~ 	GUISetBkColor(0xFF943D)



	GUISetFont (8.5, 700)


	Global $thumucboom, $LBCsPhu1, $LBCsPhu2, $LBCsPhu3, $LBCsPhu4, $LBcaidat, $LBOutMiss, $LBHopQua
	Global $LBTocdo1,$LBTocdo2, $LBHienPass, $LBPhimtat1, $LBDoiMo, $LBDoiTat, $LBDoiMapLienTuc



	CreateLabel ("Chọn TD: " , 20, 60)
	Global $TD[11], $LBTD[11]

	$TD[1] = CreateRadio( "TD 1", 80, 20, $LBTD[1])
	$TD[2] = CreateRadio( "TD 3", 80, 40, $LBTD[2])
	$TD[3] = CreateRadio( "TD 5", 80, 60, $LBTD[3])
	$TD[4] = CreateRadio( "TD 7", 80, 80, $LBTD[4])
	$TD[5] = CreateRadio( "TD 9", 80, 100, $LBTD[5])

	$TD[6] = CreateRadio( "TD 11", 140, 20, $LBTD[6])
	$TD[7] = CreateRadio( "TD 13", 140, 40, $LBTD[7])
	$TD[8] = CreateRadio( "TD 15", 140, 60, $LBTD[8])
	$TD[9] = CreateRadio( "TD 17", 140, 80, $LBTD[9])
	$TD[10] = CreateRadio( "TD 19", 140, 100, $LBTD[10])




	CreateLabel ("Đổi tên cs :" , 20 , 143)
	Global $Tencs1 = CreateInput("Boom",82,140,50,20)
	Global $ChonCs=CreateButton(chr(187) , 132, 141,22,18)
	Global $Tencs2 = CreateInput("cs1",155,140,40,20)
	Global $Doi=CreateButton(" Đổi " , 200 , 137,35,27)

	GUIStartGroup()
	CreateLabel("Server : ", 20, 180)
	Global $HCM = CreateRadio(" HCM ", 65, 180, $LBHCM)
	Global $HN = CreateRadio(" HN ", 115, 180, $LBHN)
	GUICtrlSetState($HCM, $GUI_CHECKED)

	Global $MoCsBoom=CreateButton (" Mở cs Boom" , 154 , 172 ,80,27)

	CreateLabel ("Số ván post :" , 20 , 218)

	Global $Reset=CreateButton (" Reset" , 195 , 213 ,40,25)

	Global $sovanpost = CreateInputSo("9999999",95,215,60,20)
	CreateLabel ("ván " , 165 , 218)


	Global $DoiTat = CreateCheckbox ( " Tự động tắt máy sau khi post xong !", 20, 250, $LBDoiTat )



	CreateLabel ("Tốc Độ:" , 20 , 294)
	GUIStartGroup()
	Global $Tocdo1 = CreateRadio (" Nhanh " , 80 , 283, $LBTocdo1)
    Global $Tocdo2 = CreateRadio (" Chậm " , 80 , 303, $LBTocdo2)

	CreateLabel ("  ( F2: Ngưng / tiếp tục  -  F6: Dừng hẳn )" , 20, 330)



	GUISetFont (10, 700)

	$start=CreateButton (" Bắt đầu" , 150 , 283 ,87,35)

	CreateLabel ("Tên acc" , 318, 20)
	CreateLabel ("Pass" , 415, 20)


	GUISetFont (8.5, 700)




	CreateLabel ("Cs 1:" , 260, 44)
	CreateLabel ("Cs 2:" , 260, 104)
	;CreateLabel ("Cs 3:" , 260, 164)

	Global $Nick[9][3]
	Global $Pass[9][3]

	$Nick[1][1]=CreateInput("",290,40,110,20)
	$Pass[1][1]=CreateInput("",405,40,70,20)
	$Nick[1][2]=CreateInput("",290,65,110,20)
	$Pass[1][2]=CreateInput("",405,65,70,20)

	$Nick[2][1]=CreateInput("",290,100,110,20)
	$Pass[2][1]=CreateInput("",405,100,70,20)
	$Nick[2][2]=CreateInput("",290,125,110,20)
	$Pass[2][2]=CreateInput("",405,125,70,20)

	$Nick[3][1]=CreateInput("",290,160,110,20)
	$Pass[3][1]=CreateInput("",405,160,70,20)
	$Nick[3][2]=CreateInput("",290,185,110,20)
	$Pass[3][2]=CreateInput("",405,185,70,20)


	GUICtrlSetState($Nick[3][1],$GUI_HIDE)
	GUICtrlSetState($Pass[3][1],$GUI_HIDE)
	GUICtrlSetState($Nick[3][2],$GUI_HIDE)
	GUICtrlSetState($Pass[3][2],$GUI_HIDE)


	For $i=1 to 7
		For $j=1 to 2
		_GUICtrlEdit_TogglePassChars($hGUI, $Pass[$i][$j], -1, "*")
		Next
	Next




	GUIStartGroup()
	CreateLabel ("Mỗi cửa sổ post :" , 260 , 180)
	Global $post1 = CreateRadio (" 1 acc " , 370 , 180, $LBpost1)
    Global $post2 = CreateRadio (" 2 acc " , 430 , 180, $LBpost2)
	GUICtrlSetState($post2, $GUI_CHECKED)
	$post=2


	Global $HopQua = CreateCheckbox ( "Nhận Hộp Quà", 260, 210, $LBHopQua )
	Global $HienPass = CreateCheckbox ( "Hiện Password", 377, 210, $LBHienPass )



	Global $Phimtat = CreateCheckbox ( "", 260, 245, $LBPhimtat1 )
;~ 	Global $Phimtat = CreateCheckbox ( "Sử dụng phím tắt thay thế pass bằng", 260, 245, $LBPhimtat1 )
	GUICtrlSetState($Phimtat,32)
	Global $caispeed = CreateLabel( "Cài Hack Speed:",260,245)

	$dirrr=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
	$nnn=StringReplace($dirrr,'autoupdate.exe','')

	Global $gocaidat= CreateButton("Gỡ cài đặt", 350, 245,65,18)
	Global $caidat= CreateButton("Cài đặt", 350, 245,65,18)
	If FileExists($nnn&'d3d9.dll') Then
		GUICtrlSetState($caidat,32)
	Else
		GUICtrlSetState($gocaidat,32)
	EndIf
;~ 	CreateLabel ( "Unikey >>>>>>>>>>>>",260,267)
;~ 	$LBPhimtat2=CreateLabel("(Khuyến cáo: nên sử dụng chức năng sử", 260, 290)
;~ 	$LBPhimtat3=CreateLabel("dụng pass thay thế này để bảo mật pass ", 260, 310)
;~ 	$LBPhimtat3=CreateLabel("ở mức độ cao nhất ) ", 260, 330)


	GUISetFont (8.5,  700, 4)

	$Huongdan3=CreateLabel("Xem hướng dẫn", 390, 265)
	GUICtrlSetState($Huongdan3,32)
	GUICtrlSetCursor(-1, 0)
	GUICtrlSetColor(-1, 0x040A7B)



    GUISetState ()
	Mothongso()

	HotKeySet("{F6}", "ManHinhCho")
	HotKeySet("{F2}", "Pause")

$BatDau=0
ManHinhCho()
EndIf

Global $Paused = False
Global $Mau0, $Mau1

Func Pause()
If $dangmo=1 Then Return
If $BatDau=1 Then
	$BanDau=1
	$BanDo=0

	$Paused = Not $Paused
    While $Paused
        Sleep(1)
        ToolTip('Tạm ngưng. Ấn F2 để tiếp tục. Ấn F6 để dừng hẳn')
    WEnd
    ToolTip("")
	WinMove("cs1","",0,0)
	WinMove("cs2","",0,0)
	WinMove("cs3","",0,0)
EndIf
EndFunc   ;==>TogglePause


Func ManHinhCho()


If $dangmo=1 Then Return

Global $Paused = False
$BatDau=0
ToolTip("")
GUISetState(@SW_ENABLE)
WinActivate($hgui)
    While  True

        Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				thoat()
				;If $ans = 2 Then MsgBox("","", "cancel")
			Case $LBTocdo1
				If GUICtrlRead($Tocdo1)=1 Then
					ControlCommand($hGui, "", $Tocdo1, "UnCheck")
				Else
					ControlCommand($hGui, "", $Tocdo1, "Check")
				EndIf
			Case $LBTocdo2
				If GUICtrlRead($Tocdo2)=1 Then
					ControlCommand($hGui, "", $Tocdo2, "UnCheck")
				Else
					ControlCommand($hGui, "", $Tocdo2, "Check")
				EndIf
			Case $Tocdo1
				$Tocdo=1
				$TimeWaitBoom=60
				$TimeWaitActive=100
				$TimeBonus=0
			Case $Tocdo2
				$Tocdo=2
				$TimeWaitBoom=100
				$TimeWaitActive=200
				$TimeBonus=500

			Case $LBTD[1]
				If GUICtrlRead($TD[1])=1 Then
					ControlCommand($hGui, "", $TD[1], "UnCheck")
				Else
					ControlCommand($hGui, "", $TD[1], "Check")
				EndIf
			Case $LBTD[2]
				If GUICtrlRead($TD[2])=1 Then
					ControlCommand($hGui, "", $TD[2], "UnCheck")
				Else
					ControlCommand($hGui, "", $TD[2], "Check")
				EndIf
			Case $LBTD[3]
				If GUICtrlRead($TD[3])=1 Then
					ControlCommand($hGui, "", $TD[3], "UnCheck")
				Else
					ControlCommand($hGui, "", $TD[3], "Check")
				EndIf
			Case $LBTD[4]
				If GUICtrlRead($TD[4])=1 Then
					ControlCommand($hGui, "", $TD[4], "UnCheck")
				Else
					ControlCommand($hGui, "", $TD[4], "Check")
				EndIf
			Case $LBTD[5]
				If GUICtrlRead($TD[5])=1 Then
					ControlCommand($hGui, "", $TD[5], "UnCheck")
				Else
					ControlCommand($hGui, "", $TD[5], "Check")
				EndIf
			Case $LBTD[6]
				If GUICtrlRead($TD[6])=1 Then
					ControlCommand($hGui, "", $TD[6], "UnCheck")
				Else
					ControlCommand($hGui, "", $TD[6], "Check")
				EndIf
			Case $LBTD[7]
				If GUICtrlRead($TD[7])=1 Then
					ControlCommand($hGui, "", $TD[7], "UnCheck")
				Else
					ControlCommand($hGui, "", $TD[7], "Check")
				EndIf
			Case $LBTD[8]
				If GUICtrlRead($TD[8])=1 Then
					ControlCommand($hGui, "", $TD[8], "UnCheck")
				Else
					ControlCommand($hGui, "", $TD[8], "Check")
				EndIf
			Case $LBTD[9]
				If GUICtrlRead($TD[9])=1 Then
					ControlCommand($hGui, "", $TD[9], "UnCheck")
				Else
					ControlCommand($hGui, "", $TD[9], "Check")
				EndIf
			Case $LBTD[10]
				If GUICtrlRead($TD[10])=1 Then
					ControlCommand($hGui, "", $TD[10], "UnCheck")
				Else
					ControlCommand($hGui, "", $TD[10], "Check")
				EndIf

			Case $LBpost1
				If GUICtrlRead($post1)=1 Then
					ControlCommand($hGui, "", $post1, "UnCheck")
				Else
					ControlCommand($hGui, "", $post1, "Check")
				EndIf
			Case $LBpost2
				If GUICtrlRead($post2)=1 Then
					ControlCommand($hGui, "", $post2, "UnCheck")
				Else
					ControlCommand($hGui, "", $post2, "Check")
				EndIf
			Case $post1
				$post=1
				For $i=1 to 2
				GUICtrlSetState($Nick[$i][2], $GUI_HIDE)
				GUICtrlSetState($Pass[$i][2], $GUI_HIDE)
				Next
			Case $post2
				$post=2
				For $i=1 to 2
				GUICtrlSetState($Nick[$i][2], $GUI_SHOW)
				GUICtrlSetState($Pass[$i][2], $GUI_SHOW)
				Next


			Case $LBHienPass
				If GUICtrlRead($HienPass)=1 Then
					ControlCommand($hGui, "", $HienPass, "UnCheck")
				Else
					ControlCommand($hGui, "", $HienPass, "Check")
				EndIf

			Case $LBHopQua
				If GUICtrlRead($HopQua)=1 Then
					ControlCommand($hGui, "", $HopQua, "UnCheck")
				Else
					ControlCommand($hGui, "", $HopQua, "Check")
				EndIf

			Case $LBDoiTat
				If GUICtrlRead($DoiTat)=1 Then
					ControlCommand($hGui, "", $DoiTat, "UnCheck")
				Else
					ControlCommand($hGui, "", $DoiTat, "Check")
				EndIf




			Case $HienPass
				For $i=1 to 7
					For $j=1 to 2
					_GUICtrlEdit_TogglePassChars($hGUI, $Pass[$i][$j], -1, "*")
					Next
				Next
			Case $LBPhimtat1
				If GUICtrlRead($Phimtat)=1 Then
					ControlCommand($hGui, "", $Phimtat, "UnCheck")
				Else
					ControlCommand($hGui, "", $Phimtat, "Check")
				EndIf
			Case $Phimtat
				If GUICtrlRead($Phimtat)=4 Then
					GUICtrlSetState($HienPass, $GUI_ENABLE)
					GUICtrlSetState($LBHienPass, $GUI_ENABLE)
					GUICtrlSetData($Pass[1][1], "")
					GUICtrlSetData($Pass[1][2], "")
					GUICtrlSetData($Pass[2][1], "")
					GUICtrlSetData($Pass[2][2], "")
					GUICtrlSetData($Pass[3][1], "")
					GUICtrlSetData($Pass[3][2], "")
					GUICtrlSetData($Pass[4][1], "")
					GUICtrlSetData($Pass[4][2], "")
					GUICtrlSetData($Pass[5][1], "")
					GUICtrlSetData($Pass[5][2], "")
					GUICtrlSetData($Pass[6][1], "")
					GUICtrlSetData($Pass[6][2], "")
					GUICtrlSetData($Pass[7][1], "")
					GUICtrlSetData($Pass[7][2], "")
					GUICtrlSetState($Pass[1][1], $GUI_ENABLE)
					GUICtrlSetState($Pass[1][2], $GUI_ENABLE)
					GUICtrlSetState($Pass[2][1], $GUI_ENABLE)
					GUICtrlSetState($Pass[2][2], $GUI_ENABLE)
					GUICtrlSetState($Pass[3][1], $GUI_ENABLE)
					GUICtrlSetState($Pass[3][2], $GUI_ENABLE)
					GUICtrlSetState($Pass[4][1], $GUI_ENABLE)
					GUICtrlSetState($Pass[4][2], $GUI_ENABLE)
					GUICtrlSetState($Pass[5][1], $GUI_ENABLE)
					GUICtrlSetState($Pass[5][2], $GUI_ENABLE)
					GUICtrlSetState($Pass[6][1], $GUI_ENABLE)
					GUICtrlSetState($Pass[6][2], $GUI_ENABLE)
					GUICtrlSetState($Pass[7][1], $GUI_ENABLE)
					GUICtrlSetState($Pass[7][2], $GUI_ENABLE)
				Else
					ControlCommand($hGui, "", $HienPass, "Check")
					GUICtrlSetState($HienPass, $GUI_DISABLE)
					GUICtrlSetState($LBHienPass, $GUI_DISABLE)
					GUICtrlSetData($Pass[1][1], "pass11")
					GUICtrlSetData($Pass[1][2], "pass12")
					GUICtrlSetData($Pass[2][1], "pass21")
					GUICtrlSetData($Pass[2][2], "pass22")
					GUICtrlSetData($Pass[3][1], "pass31")
					GUICtrlSetData($Pass[3][2], "pass32")
					GUICtrlSetData($Pass[4][1], "pass41")
					GUICtrlSetData($Pass[4][2], "pass42")
					GUICtrlSetData($Pass[5][1], "pass51")
					GUICtrlSetData($Pass[5][2], "pass52")
					GUICtrlSetData($Pass[6][1], "pass61")
					GUICtrlSetData($Pass[6][2], "pass62")
					GUICtrlSetData($Pass[7][1], "pass71")
					GUICtrlSetData($Pass[7][2], "pass72")
					GUICtrlSetState($Pass[1][1], $GUI_DISABLE)
					GUICtrlSetState($Pass[1][2], $GUI_DISABLE)
					GUICtrlSetState($Pass[2][1], $GUI_DISABLE)
					GUICtrlSetState($Pass[2][2], $GUI_DISABLE)
					GUICtrlSetState($Pass[3][1], $GUI_DISABLE)
					GUICtrlSetState($Pass[3][2], $GUI_DISABLE)
					GUICtrlSetState($Pass[4][1], $GUI_DISABLE)
					GUICtrlSetState($Pass[4][2], $GUI_DISABLE)
					GUICtrlSetState($Pass[5][1], $GUI_DISABLE)
					GUICtrlSetState($Pass[5][2], $GUI_DISABLE)
					GUICtrlSetState($Pass[6][1], $GUI_DISABLE)
					GUICtrlSetState($Pass[6][2], $GUI_DISABLE)
					GUICtrlSetState($Pass[7][1], $GUI_DISABLE)
					GUICtrlSetState($Pass[7][2], $GUI_DISABLE)
				EndIf
			Case $MoCsBoom
				MoCsNew()
			Case $LBHCM
				If GUICtrlRead($HCM) = 1 Then
					ControlCommand($hGui, "", $HCM, "UnCheck")
				Else
					ControlCommand($hGui, "", $HCM, "Check")
				EndIf
			Case $LBHN
				If GUICtrlRead($HN) = 1 Then
					ControlCommand($hGui, "", $HN, "UnCheck")
				Else
					ControlCommand($hGui, "", $HN, "Check")
				EndIf
			Case $HCM
				For $dem=3 to 10
					GUICtrlSetState($TD[$dem],$GUI_SHOW)
					GUICtrlSetState($LBTD[$dem],$GUI_SHOW)
				Next
			Case $HN
				ControlCommand($hGui, "", $TD[2], "Check")
				For $dem=3 to 10
					GUICtrlSetState($TD[$dem],$GUI_HIDE)
					GUICtrlSetState($LBTD[$dem],$GUI_HIDE)
				Next
			Case $ChonCs
				GUISetState(@SW_DISABLE)
				GUICtrlSetState($Tencs2,256)
				GUICtrlSetState($Tencs1,256)
				Do
					Sleep(1)
					; Retrieve the window title of the active window.
					Local $sText = WinGetTitle("[ACTIVE]")
					ToolTip("Tên cửa sổ cần đổi: " & $sText & @CRLF & "Ấn Enter để chọn tên cửa sổ này")
				Until _IsPressed("0D")	;enter
				ToolTip("")
				GUISetState(@SW_ENABLE)
				WinActivate($hgui)
				GUICtrlSetData($Tencs1, $sText)
				GUICtrlSetState($Tencs1,$GUI_FOCUS)
			Case $Doi
				WinSetTitle(GUICtrlRead($Tencs1), "", GUICtrlRead($Tencs2))
			Case $Reset
				GUISetState(@SW_DISABLE)
				$ans = MsgBox(1, "  Chú ý !!!", "Cài đặt lại toàn bộ thông số trở về mặc định ban đầu ?" & @CRLF & "(kể cả đường dẫn thư mục Boom)")
				If $ans = 1 Then
					Resetthongso()
					Mothongso()
				EndIf
				GUISetState(@SW_ENABLE)
				WinActivate($hgui)

			Case $Huongdan3
				ShellExecute("http://www.zerowelcome.com/hd-su-dung-go-phim-tat-thay-the-khi-dang-nhap-pass-bang-unikey")
			Case $start
				GUISetState(@SW_DISABLE)
				WinActivate($hgui)

				$Loi=0

				$tm2=""
				$tm2=RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\MPlay\Crazy Arcade", "CAPath")
				if $tm2="" Then
					$tm2=RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\MPlay\Crazy Arcade", "CAPath")
				EndIf
				$thumucboom=$tm2 & "\"

				If not FileExists($thumucboom & "ca.exe") Then
					$Loi=1
					ControlCommand($hgui,"",$MoCsBoom,"Check")
				EndIf


				$j=0
				For $i=1 to 10
					If GUICtrlRead($TD[$i]) = $GUI_CHECKED Then $j=$j+1
				Next
				If $j = 0 Then
					MsgBox(64, "  Lỗi !!!", "Bạn chưa chọn kênh tự do !!!")
					$Loi=1
				EndIf
				$j=0



				If GUICtrlGetState($sovanpost)=80 Then	; 80 show enable  , 144 show disable
					If GUICtrlRead($sovanpost)=0 or GUICtrlRead($sovanpost)="" Then GUICtrlSetData($sovanpost, 9999999)
				EndIf

				If $Loi=0 Then Chay()

				GUISetState(@SW_ENABLE)
				WinActivate($hgui)
			Case $caidat
				If ProcessExists('ca.exe') Then
					MsgBox(0,'','Bạn phải tắt Boom để cài')
				Else
					$dirrr=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
					$nnn=StringReplace($dirrr,'autoupdate.exe','')
					FileInstall('E:\Minh\AutoIT\Auto TLT\d3d9.dll',$nnn&'d3d9.dll')
;~ 					FileCopy(@ScriptDir&'\d3d9.dll',$nnn)
					GUICtrlSetState($caidat,32)
					GUICtrlSetState($gocaidat,16)
				EndIf
			Case $gocaidat
				If ProcessExists('ca.exe') Then
					MsgBox(0,'','Bạn phải tắt Boom để gỡ')
				Else
					$dirrr=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
					$nnn=StringReplace($dirrr,'autoupdate.exe','')
					FileDelete($nnn&'d3d9.dll')
					GUICtrlSetState($caidat,16)
					GUICtrlSetState($gocaidat,32)
				EndIf
		EndSwitch

		If WinExists('MH Speed                 ') Then
			WinSetTitle('MH Speed                 ','','MH Speed')
			ControlCommand('MH Speed','','[CLASS:TTrackBar; INSTANCE:1]','TabLeft','')
			ControlCommand('MH Speed','','[CLASS:TTrackBar; INSTANCE:1]','TabLeft','')
			WinMove('MH Speed','',@DesktopWidth-165,0)
			WinSetState('MH Speed','',@SW_SHOW)
		EndIf

    WEnd



EndFunc











Func Resetthongso()
	$mofile = FileOpen($FileInfo, 130)
	FileWrite($mofile, @CRLF)
	FileWrite($mofile, "4" & @CRLF) ; $TD[1]
	FileWrite($mofile, "4" & @CRLF) ; $TD[2]
	FileWrite($mofile, "4" & @CRLF) ; $TD[3]
	FileWrite($mofile, "4" & @CRLF) ; $TD[4]
	FileWrite($mofile, "1" & @CRLF) ; $TD[5]
	FileWrite($mofile, "4" & @CRLF) ; $TD[6]
	FileWrite($mofile, "4" & @CRLF) ; $TD[7]
	FileWrite($mofile, "4" & @CRLF) ; $TD[8]
	FileWrite($mofile, "4" & @CRLF) ; $TD[9]
	FileWrite($mofile, "4" & @CRLF) ; $TD[10]
	FileWrite($mofile, "Boom" & @CRLF) ; $Tencs1
	FileWrite($mofile, "cs1" & @CRLF) ; $Tencs2
	FileWrite($mofile, "4" & @CRLF) ; $DoiTat
	FileWrite($mofile, "9999999" & @CRLF) ; $sovanpost
	FileWrite($mofile, "1" & @CRLF) ; $Tocdo1
	FileWrite($mofile, "4" & @CRLF) ; $Tocdo2
	FileWrite($mofile, "" & @CRLF) ; $Nick[1][1]
	FileWrite($mofile, "" & @CRLF) ; $Pass[1][1]
	FileWrite($mofile, "" & @CRLF) ; $Nick[1][2]
	FileWrite($mofile, "" & @CRLF) ; $Pass[1][2]
	FileWrite($mofile, "" & @CRLF) ; $Nick[2][1]
	FileWrite($mofile, "" & @CRLF) ; $Pass[2][1]
	FileWrite($mofile, "" & @CRLF) ; $Nick[2][2]
	FileWrite($mofile, "" & @CRLF) ; $Pass[2][2]
	FileWrite($mofile, "" & @CRLF) ; $Nick[3][1]
	FileWrite($mofile, "" & @CRLF) ; $Pass[3][1]
	FileWrite($mofile, "" & @CRLF) ; $Nick[3][2]
	FileWrite($mofile, "" & @CRLF) ; $Pass[3][2]
	FileWrite($mofile, "4" & @CRLF) ; $HopQua
	FileWrite($mofile, "4" & @CRLF) ; $HienPass
	FileWrite($mofile, "4" & @CRLF) ; $Phimtat
	FileWrite($mofile, "4" & @CRLF) ; $post1
	FileWrite($mofile, "1" & @CRLF) ; $post2
	FileWrite($mofile, "1" & @CRLF) ; $HCM
	FileWrite($mofile, "4" & @CRLF) ; $HN
	FileClose($mofile)
EndFunc


Func Mothongso()
if fileexists($FileInfo) then
	$mofile = FileOpen($FileInfo, 128)
	Local $Check[5]
	$Check[1]="Check"
	$Check[4]="UnCheck"
	$thumucboom=FileReadLine($mofile, 1)
	ControlCommand($hGui, "", $TD[1], $Check[FileReadLine($mofile, 2)])
	ControlCommand($hGui, "", $TD[2], $Check[FileReadLine($mofile, 3)])
	ControlCommand($hGui, "", $TD[3], $Check[FileReadLine($mofile, 4)])
	ControlCommand($hGui, "", $TD[4], $Check[FileReadLine($mofile, 5)])
	ControlCommand($hGui, "", $TD[5], $Check[FileReadLine($mofile, 6)])
	ControlCommand($hGui, "", $TD[6], $Check[FileReadLine($mofile, 7)])
	ControlCommand($hGui, "", $TD[7], $Check[FileReadLine($mofile, 8)])
	ControlCommand($hGui, "", $TD[8], $Check[FileReadLine($mofile, 9)])
	ControlCommand($hGui, "", $TD[9], $Check[FileReadLine($mofile, 10)])
	ControlCommand($hGui, "", $TD[10], $Check[FileReadLine($mofile, 11)])
	GUICtrlSetData($Tencs1, FileReadLine($mofile, 12))
	GUICtrlSetData($Tencs2, FileReadLine($mofile, 13))

	ControlCommand($hGui, "", $DoiTat, $Check[FileReadLine($mofile, 14)])
	GUICtrlSetData($sovanpost, FileReadLine($mofile, 15))
	ControlCommand($hGui, "", $Tocdo1, $Check[FileReadLine($mofile, 16)])
	ControlCommand($hGui, "", $Tocdo2, $Check[FileReadLine($mofile, 17)])
	GUICtrlSetData($Nick[1][1], FileReadLine($mofile, 18))
	GUICtrlSetData($Pass[1][1], FileReadLine($mofile, 19))
	GUICtrlSetData($Nick[1][2], FileReadLine($mofile, 20))
	GUICtrlSetData($Pass[1][2], FileReadLine($mofile, 21))
	GUICtrlSetData($Nick[2][1], FileReadLine($mofile, 22))
	GUICtrlSetData($Pass[2][1], FileReadLine($mofile, 23))
	GUICtrlSetData($Nick[2][2], FileReadLine($mofile, 24))
	GUICtrlSetData($Pass[2][2], FileReadLine($mofile, 25))
	GUICtrlSetData($Nick[3][1], FileReadLine($mofile, 26))
	GUICtrlSetData($Pass[3][1], FileReadLine($mofile, 27))
	GUICtrlSetData($Nick[3][2], FileReadLine($mofile, 28))
	GUICtrlSetData($Pass[3][2], FileReadLine($mofile, 29))
	ControlCommand($hGui, "", $HopQua, $Check[FileReadLine($mofile, 30)])
	ControlCommand($hGui, "", $HienPass, $Check[FileReadLine($mofile, 31)])
	ControlCommand($hGui, "", $Phimtat, $Check[FileReadLine($mofile, 32)])
	ControlCommand($hGui, "", $post1, $Check[FileReadLine($mofile, 33)])
	ControlCommand($hGui, "", $post2, $Check[FileReadLine($mofile, 34)])
	ControlCommand($hGui, "", $HCM, $Check[FileReadLine($mofile, 35)])
	ControlCommand($hGui, "", $HN, $Check[FileReadLine($mofile, 36)])

FileClose($mofile)
EndIf
EndFunc

Func thoat()
GUISetState(@SW_DISABLE)
$ans = MsgBox(1, "", " Thoát Auto ?")

If $ans = 1 Then

	$mofile = FileOpen($FileInfo, 130)
	FileWrite($mofile, $thumucboom & @CRLF) ;

	FileWrite($mofile, GUICtrlRead($TD[1]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($TD[2]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($TD[3]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($TD[4]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($TD[5]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($TD[6]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($TD[7]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($TD[8]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($TD[9]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($TD[10]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Tencs1) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Tencs2) & @CRLF)
	FileWrite($mofile, GUICtrlRead($DoiTat) & @CRLF)
	FileWrite($mofile, GUICtrlRead($sovanpost) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Tocdo1) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Tocdo2) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Nick[1][1]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Pass[1][1]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Nick[1][2]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Pass[1][2]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Nick[2][1]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Pass[2][1]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Nick[2][2]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Pass[2][2]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Nick[3][1]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Pass[3][1]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Nick[3][2]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Pass[3][2]) & @CRLF)
	FileWrite($mofile, GUICtrlRead($HopQua) & @CRLF)
	FileWrite($mofile, GUICtrlRead($HienPass) & @CRLF)
	FileWrite($mofile, GUICtrlRead($Phimtat) & @CRLF)
	FileWrite($mofile, GUICtrlRead($post1) & @CRLF)
	FileWrite($mofile, GUICtrlRead($post2) & @CRLF)
	FileWrite($mofile, GUICtrlRead($HCM) & @CRLF)
	FileWrite($mofile, GUICtrlRead($HN) & @CRLF)

	FileClose($mofile)



	Exit
EndIf
If $ans = 2 Then
	WinActivate($hgui)
	GUISetState(@SW_ENABLE)
	Return
EndIf

EndFunc





Func ChuanBi($z,$Ngung)
$nchuanbi=0
Do
$nchuanbi=$nchuanbi+1
If $nchuanbi>2 Then
	Send("{esc}{esc}{esc}{esc}{esc}{esc}{esc}{esc}")
	Sleep(1000)
EndIf
$GoBack=0
For $i=1 to 1
	;if thang nick1 trong'
	If not WinExists("cs" & $z) Then
		Mocuaso("cs" & $z)
		OutNhanh("cs" & $z)
		If WinExists("Error") or WinExists("Login Failed") Then
			WinActivates("Error")
			WinActivates("Login Failed")
			Send("{enter}")
		EndIf
		If Loopy(400,560,"FF6F05",150,"cs" & $z, "enter",116,610)=0 Then
			Kill("cs" & $z)
			$GoBack=1
			ExitLoop
		EndIf
	EndIf

	$mini=WinGetState("cs" & $z)
	WinActivates("cs" & $z)
	If $mini=23 Then Sleep(700)

	If GetColor(525,340)="D78E00" Then
		Send("{esc}")
		Sleep(100)
	EndIf

	If GetColor(525,340)="F39A28" Then
		Mouse(730,595)
		Sleep(50)
		Mouse(765,595)
	EndIf

	$color=GetColor(206,432)
	;tao phong hoac canhnan	  xem thtin acc	  tim` cho troi		tim` siei thi
	If $color="0DDFFF" or $color="074FB5" or $color="084E96" or $color="013A76" Then Send("{esc}")

	$color=GetColor(785,426)		;ria`
	$color1=GetColor(469,424)		;giua~
	$color2=GetColor(400,560)		;dangnhap
	$k=0

	;		cuong nhiet T8							moi` vao phong		do nhieu`		tang qua`			; bang event		; lan dau choi
	While $color1="6E1A76" or $color1="210823" or $color1="6EDFFF" or $color1="0CDFFF" or $color1="0448B1" or $color1="003588"  or $color1="01B3F4"
		If $color1="6EDFFF" or $color1="0CDFFF" or $color1="0448B1"  or $color1="01B3F4" Then Send("{esc}")
		If $color1="003588" Then

				Mouse(608,522)
				Sleep(50)
				Mouse(657,525)

		EndIf

		If  $color1="6E1A76" or $color1="210823" Then

				Mouse(695,507)
				Sleep(50)
				Mouse(732,506)
		EndIf
		$k=$k+1
		If $k>150 Then
			Kill("cs" & $z)
			$GoBack=1
			ExitLoop
		EndIf
		Sleep(100)
		$color1=GetColor(469,424)
	WEnd

	TatBangEvent()

	If $color2="FF6F05" Then
		If GUICtrlGetState($Nick[$z][2])=80 Then    ;80 la` hien, 96 la an?
			Mouse(190,500)
			Mouse(563,512)
			Mouse(480,500)
			Mouse(380,500)
		Else
			Mouse(190,500)
			Mouse(495,520)
			Mouse(495,500)
		EndIf

		Send(GUICtrlRead($Nick[$z][1]))
		Send("{tab}")
		Send(GUICtrlRead($Pass[$z][1]))
		If GUICtrlRead($Phimtat) Then Send("{enter}{enter}")
		If GUICtrlGetState ($Nick[$z][2])=80 Then
			Sleep(50)
			Send("{tab}")
			Sleep(10)
			Send(GUICtrlRead($Nick[$z][2]))
			Send("{tab}")
			Send(GUICtrlRead($Pass[$z][2]))
			If GUICtrlRead($Phimtat) Then Send("{enter}{enter}")
		EndIf
		Send("{enter}{enter}")

		$MauCs[$z]=""
		$BanDau=1

		If $Ngung="Ngung2" Then Return


		If Loopy(785,426,"0FDAFE",140,"cs" & $z, "",0,0)=0 Then ; khu vuc chon td
			WinActivates("cs" & $z)
			If GetColor(400,560)="FF6F05" Then
				Send("{enter}")
				Sleep(500)
				If GetColor(400,560)="FF6F05" Then
					Kill("cs" & $z)
					$GoBack=1
					ExitLoop
				EndIf
			EndIf
			$GoBack=1
			ExitLoop
		EndIf
		$color="0FDAFE"
	EndIf

	If $color="0FDAFE" Then	; khu vuc chon td

		Chontd($Tudo)
		If $Ngung="Ngung" Then Return
		If Loopy(469,424,"6E1A762108236EDFFF0CDFFF0448B100358801B3F40269E40254B6",140,"cs" & $z, "",0,0)=0 Then ; vao` phong` cho`
			;mau` tuan` tu.: cuongnhiett8, moivaophong, bang thong bao', dc tang qua, quang? cao', lan` dau`choi, phong` cho`
			If GetColor(406,276)="FFFA91" then ; tinh` trang login khong tot, quay lai phong cho`
				Send("{esc}")
				$GoBack=1
				ExitLoop
			EndIf
			Kill("cs" & $z)
			$GoBack=1
			ExitLoop
		EndIf
		$color1=GetColor(469,424)
	EndIf

	$color=GetColor(785,426)
	If $color="0481DA" or $color="035996" or $color="046CC8" or $color="012959" or $color="0465C8" Then
		; con` dang choi,  						phong bat dau`,   sieu thi           cho.
		Mouse(116,610)
		OutNhanh("cs" & $z)
		Send("{enter}")



		If Loopy(469,424,"6E1A762108236EDFFF0CDFFF0448B100358801B3F40269E40254B6",140,"cs" & $z, "",0,0)=0 Then ; vao` phong` cho`
			Kill("cs" & $z)
			$GoBack=1
			ExitLoop
		EndIf
		$color1=GetColor(469,424)
	EndIf



	$color1=GetColor(469,424)
	$k=0
	;		cuong nhiet T8						moi` vao phong		do nhieu`		tang qua`			; bang event		; lan dau choi
	While $color1="6E1A76" or $color1="210823" or $color1="6EDFFF" or $color1="0CDFFF" or $color1="0448B1" or $color1="003588"  or $color1="01B3F4"
		If $color1="6EDFFF" or $color1="0CDFFF" or $color1="0448B1"  or $color1="01B3F4" Then Send("{esc}")
		If $color1="003588" Then

				Mouse(608,522)
				Sleep(50)
				Mouse(657,525)
		EndIf
		If $color1="6E1A76"  or $color1="210823" Then

				Mouse(695,508)
				Sleep(50)
				Mouse(732,508)
		EndIf
		$k=$k+1
		If $k>150 Then
			Kill("cs" & $z)
			$GoBack=1
			ExitLoop
		EndIf
		Sleep(100)
		$color1=GetColor(469,424)
	WEnd

	TatBangEvent()

	If GetColor(525,340)="D78E00" Then
		Send("{esc}")
		Sleep(100)
	EndIf

	If GetColor(525,340)="F39A28" Then
		Mouse(730,595)
		Sleep(50)
		Mouse(765,595)
	EndIf

If $BanDau=0 And GUICtrlRead($Tocdo1)=1 Then Return

	$GoBack = 0
	If $MauCs[$z] = "" Then
		If GetColor(187, 87) = "0176E5" Then ; bi thu nho ten acc
			Send("{esc}")
			If Loopy(187, 87, "FFAE050EBAF7", 30, "cs" & $z, "", 0, 0) = 0 Then
				$GoBack = 1
				ExitLoop
			EndIf
		EndIf

		$k = 0
		Do
			$k = $k + 1
			If $k > 300 + $TimeBonus Then
				$GoBack = 1
				ExitLoop
			EndIf

			$color1 = GetColor(469, 424)
			;		cuong nhiet T8						moi` vao phong		do nhieu`		tang qua`			; bang event		; lan dau choi
			While $color1 = "6E1A76" Or $color1 = "210823" Or $color1 = "6EDFFF" Or $color1 = "0CDFFF" Or $color1 = "0448B1" Or $color1 = "003588" Or $color1 = "01B3F4"
				If $color1 = "6EDFFF" Or $color1 = "0CDFFF" Or $color1 = "0448B1" Or $color1 = "01B3F4" Then Send("{esc}")
				If $color1 = "003588" Then
					Mouse(608, 522)
					Sleep(50)
					Mouse(657, 525)
				EndIf
				If $color1 = "6E1A76" Or $color1 = "210823" Then
					Mouse(695, 507)
					Sleep(50)
					Mouse(732, 506)
				EndIf
				$k = $k + 1
				If $k > 150 Then
					Kill("cs" & $z)
					$GoBack = 1
					ExitLoop
				EndIf
				Sleep(100)
				$color1 = GetColor(469, 424)
			WEnd

			TatBangEvent()

			Sleep(10)
			If GetColor(187, 87) = "0176E5" Then ; bi thu nho ten acc
				Send("{esc}")
				If Loopy(187, 87, "FFAE050EBAF7", 30, "cs" & $z, "", 0, 0) = 0 Then
					$GoBack = 1
					ExitLoop
				EndIf
			EndIf

			If GetColor(32, 273) = "90FF00" Then ExitLoop

			If GetColor(525,340)="D78E00" Then
				Send("{esc}")
				Sleep(100)
			EndIf

			If GetColor(525,340)="F39A28" Then
				Mouse(731,591)
				Sleep(50)
				Mouse(766,593)
			EndIf

			If GetColor(561,345)="DADADA" Then	; bang quay level
				Mouse(424,509)
				Mouse(531,518)
			EndIf
		Until False
		If $GoBack = 1 Then ExitLoop

		$colorp=GetColor(27,224)
		If (($z=5 or GUICtrlGetState($Nick[$z][2])<>80) and ($colorp="108AE9" or $colorp="33E2FF")) or ($z<>5 and GUICtrlGetState($Nick[$z][2])=80 and $colorp<>"108AE9" and $colorp<>"33E2FF") Then
			;MsgBox("",GetColor(8,41),GetColor(27,223))
			If Loopy(400, 560, "FF6F05", 150, "cs" & $z, "enter", 116, 610) = 0 Then
				Kill("cs" & $z)
				$GoBack = 1
				ExitLoop
			EndIf
			$GoBack=1
			ExitLoop
		EndIf

		If GUICtrlGetState($Nick[$z][2]) = 80 And GetColor(27, 223) = "108AE9" Then ; cho no' qua lai 1P
			Mouse(27, 223)
			Sleep(500)
		EndIf


		$aPos = MouseGetPos()
		If ($aPos[0]>23) and ($aPos[0]<147) and ($aPos[1]>207) and ($aPos[1]<234) Then
			MouseMove(600,480,0)
			Sleep(100)
		EndIf



		If GetColor(187,87)<>"FFAE05" and GetColor(187,87)<>"0EBAF7" Then
			$MauCs[$z]=""
			$GoBack=1
			ExitLoop
		EndIf
		;If GetColor(65,407)<>"1A4361" Then
		;	$MauCs[$z]=""
		;	Mouse(116,610)
		;	Sleep(1800)
		;	$GoBack=1
		;	ExitLoop
		;EndIf




	EndIf


Next
Until $GoBack=0
EndFunc


Func TatBangEvent()

	If GetColor(505,345)="F39200" Then
		Mouse(505,345)
		Sleep(200)
	EndIf

	If GetColor(100,560)="058154" Then
		Mouse(707,567)
		Mouse(740,567)
	EndIf

	If GetColor(666,185)="D5D5D5" Then	; boomer thong thai
		Mouse(701,543)
		Mouse(728,543)
	EndIf

	If GetColor(193,543) = "042F01" Then ; mui~ tuan loc
		Mouse(600,544)
		Mouse(630,545)
	EndIf

	;If GetColor(469,424)="0269E4" or GetColor(190,570)="0076C0" Then Send("{enter}") ;bao ve kho bau

EndFunc


Func TaoPhong($z)
	$k=0
	if False Then
	Do
		If GetColor(735,402)="0158E1" Then		; bi thu nho tao phong
			Send("{esc}")
			If Loopy(735,402,"FFAE050EBAF7",20,"cs" & $z, "",0,0)=0 Then
				Send("{esc}")
				If Loopy(735,402,"FFAE050EBAF7",20,"cs" & $z, "",0,0)=0 Then
					Return 0
					ExitLoop
				EndIf
			EndIf
		EndIf



		$color1=GetColor(469,424)
		If $color1="6EDFFF" or $color1="0CDFFF" or $color1="0448B1" or $color1="01B3F4" Then Send("{esc}")
		If $color1="003588" Then

			Mouse(608,522)
			Sleep(50)
			Mouse(657,525)
		EndIf
		If $color1="6E1A76" or $color1="210823" Then

			Mouse(695,507)
			Sleep(50)
			Mouse(732,506)
		EndIf

		$color2=GetColor(400,560)
		If $color2="FF6F05" Then Return 0

		If GetColor(525,340)="D78E00" Then
			Send("{esc}")
			Sleep(100)
		EndIf

		If GetColor(525,340)="F39A28" Then
			Mouse(730,595)
			Sleep(50)
			Mouse(765,595)
		EndIf

		Mouse(300,60)
		Sleep(10)
		$k=$k+1
		If $k=300 Then TatBangEvent()
		If $k>70 + $TimeBonus Then Return 0
	Until GetColor(126,142)="FFFFFF"
	EndIf

	If GetColor(735,402)="0158E1" Then		; bi thu nho tao phong
		Send("{esc}")
		If Loopy(735,402,"FFAE050EBAF7",20,"cs" & $z, "",0,0)=0 Then
			Send("{esc}")
			If Loopy(735,402,"FFAE050EBAF7",20,"cs" & $z, "",0,0)=0 Then
				Return 0
			EndIf
		EndIf
	EndIf

	Mouse(300,60)
	If $BanDau=1 Then
		Sleep(100)
		If GetColor(260,310)="FFB200" or GetColor(428,290)="FF6EFF" Then Mouse(190,287)	; chon. dai chien'
;~ 		If GetColor(190, 271)="56709B" or GetColor(428,290)="FF6EFF" Then Mouse(190,287)	; chon. dai chien'
;~ 		ClipPut("Auto Zero: " & $MaKH)
		;Send("^v")					;Ten phong de? ma~ khach hang vao`
		$BanDau=0
	EndIf

	If $z=2 Then
		Mouse(406,424)
		Mouse(272,449)
		Mouse(590,447)


		Send(Random(1, 99, 1))
	EndIf

	Send("{enter}")
	Return 1
EndFunc


Func Loopy($a,$b,$c,$d,$CuaSo,$h,$x,$y)	; toa do a,b mau` c ; neu qua' thoi gian d se~ = 1
If WinExists($CuaSo) Then
	WinActivates($CuaSo)
	$d=$d*10 + $TimeBonus
	Global $cc[10]
	$n=Round(StringLen($c)/6)
	For $i=1 to $n
		$cc[$i]=StringMid($c , ($i -1)*6+1 ,6)
	Next
	$k=0
	While 1
		$k=$k+1
		If $k > $d Then return 0
		If $h="esc" or $h="enter" Then send("{esc}{esc}")
		If $x<>0 Then Mouse($x,$y)
		Sleep(10)
		If $h="enter" Then send("{enter}")
		$color0=GetColor($a,$b)
		For $i=1 to $n
			if $color0= $cc[$i] Then return 1
		Next


		If GetColor(525,340)="D78E00" Then
			Send("{esc}")
			Sleep(100)
		EndIf

		If GetColor(525,340)="F39A28" Then
			Mouse(730,595)
			Sleep(50)
			Mouse(765,595)
		EndIf

		if $k=300 Then
			if IniRead("RESsave.ini", "Width","",@DesktopWidth)=800 then
				Send("!{enter}")
				Sleep(3000)
				WinMove($CuaSo,"",0,0)
			EndIf

			If WinExists("CrashDlg") Then WinKill("CrashDlg")
			If WinExists("Error") Then WinKill("Error")
			If WinExists("Login Failed") Then WinKill("Login Failed")
			If WinExists("ErrCannotLoginCaption") Then WinKill("ErrCannotLoginCaption")
			If WinExists("Crazy Arcade Client") Then WinKill("Crazy Arcade Client")
			If WinExists("Auto Update Utility") Then WinKill("Auto Update Utility")
			If WinExists("ca.exe - Application Error") Then WinKill("ca.exe - Application Error")
			If WinExists("Nexon Game Security") Then WinKill("Nexon Game Security")
			If WinExists("NexonMessenger Core") Then WinKill("NexonMessenger Core")
			If WinExists("login fail") Then WinKill("login fail")
		EndIf
	WEnd
EndIf
EndFunc

Func Kill($CuaSo)
	WinKill($CuaSo)
	WinKill($CuaSo)
	WinKill($CuaSo & " (Not Responding)")
	WinKill($CuaSo & " (Not Responding)")
	If WinExists("CrashDlg") Then WinKill("CrashDlg")
	If WinExists("Error") Then WinKill("Error")
	If WinExists("Login Failed") Then WinKill("Login Failed")
	If WinExists("ErrCannotLoginCaption") Then WinKill("ErrCannotLoginCaption")
	If WinExists("Crazy Arcade Client") Then WinKill("Crazy Arcade Client")
	If WinExists("Auto Update Utility") Then WinKill("Auto Update Utility")
	If WinExists("ca.exe - Application Error") Then WinKill("ca.exe - Application Error")
	If WinExists("Nexon Game Security") Then WinKill("Nexon Game Security")
	If WinExists("NexonMessenger Core") Then WinKill("NexonMessenger Core")
	If WinExists("login fail") Then WinKill("login fail")
	Sleep(1000)
	WinKill($CuaSo)
	WinKill($CuaSo)
	WinKill($CuaSo & " (Not Responding)")
	WinKill($CuaSo & " (Not Responding)")
	Mocuaso($CuaSo)
EndFunc

Func MoCsNew()
	$mofile = FileOpen($FileInfo, 128)
	$thumucboom = FileReadLine($mofile, 1)
	FileClose($mofile)

	$tm2=""
	$tm2=RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\MPlay\Crazy Arcade", "CAPath")
	if $tm2="" Then
		$tm2=RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\MPlay\Crazy Arcade", "CAPath")
	EndIf
	$thumucboom=$tm2 & "\"

	If FileExists($thumucboom & "ca.exe") Then
		If GUICtrlRead($HN) = 1 Then
			$dirrr=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
			$nnn=StringReplace($dirrr,'autoupdate.exe','')
			FileDelete($nnn&'dwk.dll')
;~ 			FileCopy(@ScriptDir&'\dwk.dll',$nnn)
			FileInstall('E:\Minh\AutoIT\Auto TLT\dwk.dll',$nnn&'dwk.dll')
			If GUICtrlGetState($caidat)=16 Then
				Run('"'&$nnn&'ca.exe" svrHN','',@SW_HIDE)
			Else
				Run('"'&$nnn&'ca.exe" svrHN')
			EndIf
;~ 			ShellExecute($thumucboom & "ca.exe", "svrHN")
		Else
			$dirrr=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
			$nnn=StringReplace($dirrr,'autoupdate.exe','')
			FileDelete($nnn&'dwk.dll')
;~ 			FileCopy(@ScriptDir&'\dwk.dll',$nnn)
			FileInstall('E:\Minh\AutoIT\Auto TLT\dwk.dll',$nnn&'dwk.dll')
			If GUICtrlGetState($caidat)=16 Then
				Run('"'&$nnn&'ca.exe"','',@SW_HIDE)
			Else
				Run('"'&$nnn&'ca.exe"')
			EndIf
;~ 			ShellExecute($thumucboom & "ca.exe")
		EndIf
	EndIf

	If $thumucboom = "" Or Not FileExists($thumucboom & "ca.exe") Then
		WinActivate($hGui)
		GUISetState(@SW_DISABLE)
		WinActivate($hGui)
		MsgBox(64, "  Lỗi !!!", "Không tìm thấy thư mục Boom !!!" & @CRLF & "Chọn lại đường dẫn thư mục Boom...")
		WinActivate($hGui)
		Do
			Local $sFileSelectFolder = FileSelectFolder("Chọn thư mục Boom !!!" & @CRLF & "(Thư mục chứa file autoupdate.exe)", "")
			If Not @error Then
				If Not FileExists($sFileSelectFolder & "\ca.exe") Then
					WinActivate($hGui)
					MsgBox(64, "  Lỗi !!!", "Không phải thư mục Boom !" & @CRLF & "Chọn lại thư mục Boom có chứa file autoupdate.exe")
					WinActivate($hGui)
				Else
					$thumucboom = $sFileSelectFolder & "\"
					_FileWriteToLine($FileInfo, 1, $thumucboom, True)
					WinActivate($hGui)
					MsgBox(64, "  Xong !!!", "Đã chọn đường dẫn thư mục Boom.")
					WinActivate($hGui)
					GUISetState(@SW_ENABLE)
					ExitLoop
				EndIf
			EndIf
		Until @error
		WinActivate($hGui)
		GUISetState(@SW_ENABLE)
		WinActivate($hGui)
	EndIf
EndFunc


Func Mocuaso($CuaSo)
	If Not WinExists("Boom") Then
		MoCsNew()
		For $ij = 1 To $TimeWaitBoom
			If WinWait("Boom", "", 1) Then
				ExitLoop
			EndIf
			If WinExists("CrashDlg") Then WinKill("CrashDlg")
			If WinExists("Error") Then WinKill("Error")
			If WinExists("Login Failed") Then WinKill("Login Failed")
			If WinExists("ErrCannotLoginCaption") Then WinKill("ErrCannotLoginCaption")
			If WinExists("Crazy Arcade Client") Then WinKill("Crazy Arcade Client")
			If WinExists("Auto Update Utility") Then WinKill("Auto Update Utility")
			If WinExists("ca.exe - Application Error") Then WinKill("ca.exe - Application Error")
			If WinExists("Nexon Game Security") Then WinKill("Nexon Game Security")
			If WinExists("NexonMessenger Core") Then WinKill("NexonMessenger Core")
			If WinExists("login fail") Then WinKill("login fail")

			If $ij = $TimeWaitBoom Then
				Mocuaso($CuaSo)
				Return 0
			EndIf
		Next
	EndIf
	WinSetTitle("Boom", "", $CuaSo)
	If WinExists("Error") Or WinExists("Login Failed") Then
		WinActivates("Error")
		WinActivates("Login Failed")
		Send("{enter}")
	EndIf
	WinActivates($CuaSo)
	Return 1
EndFunc   ;==>Mocuaso




Func WinActivates($CuaSo)		; coi lai neu no bat len roi ma responding
If WinExists($CuaSo) Then
	WinSetState($CuaSo,"",@SW_SHOW)
	For $i=1 to $TimeWaitActive
		WinActivate($CuaSo)
		If WinActive($CuaSo) Then Return
		Sleep(10)
	Next
	Kill($CuaSo)
EndIf
EndFunc

Func Chontd($Tudo)
	if GetColor(529,325)="FFFF00" Then		; mau vang chu hidden catch td1
		Mouse(520,110)
		Sleep(2000)
	EndIf
	Mouse(529,224)
	if $Tudo>1 and $Tudo<5 Then
		Mouse(536,554)
	EndIf

	if $Tudo>4 and $Tudo<8 Then
		Mouse(566,554)
	EndIf

	if $Tudo>7 Then
		Mouse(595,554)
	EndIf

	Switch $Tudo
    Case 1,8
        Mouse(500,330)
    Case 2,5
        Mouse(500,400)
    Case 3,6,9
        Mouse(500,440)
	Case 4,7,10
        Mouse(500,500)
	EndSwitch
	MouseMove(414,579,0)
EndFunc


Func GetColor($a,$b)
	Return Hex(PixelGetColor($a -3,$b -25),6)
EndFunc

Func GetColor2($a,$b)
	Return Hex(PixelGetColor($a - 3 , $b-25),6)
EndFunc

Func Mouses($a,$b,$n)
	If $n=0 Then
		Return MouseClick("right",$a-3,$b-25,1,0)
;~ 		Return ControlClick('cs1','','','right',1,$a-2,$y-25)
	Else
		Return MouseClick("left",$a-3,$b-25,$n,0)
;~ 		Return ControlClick('cs1','','','left',1,$a-2,$y-25)
	EndIf
EndFunc

Func Mouse($a,$b)
	Return MouseClick("left",$a-3,$b -25,1,0)
EndFunc

Func OutNhanh($CuaSo)
	$colorx=GetColor(785,426)
	If $colorx="0481DA"  or $colorx="035996" Then

		If GUICtrlGetState($Nick[StringRight($Cuaso,1)][2])=80 Then
			;ControlSend($CuaSo, "","","{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{space}")
			ControlSend($CuaSo, "","","{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{space}")
		Else
			;ControlSend($CuaSo, "","","{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{left}{space}")
			ControlSend($CuaSo, "","","{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}")
		EndIf
	EndIf
EndFunc

Func Terminate()
	Exit
EndFunc





Func Chay()

$BatDau=1

$BanDau=1
$BanDo=0

For $i=1 to 10
	If GUICtrlRead($TD[$i]) = $GUI_CHECKED Then $Tudo= $i
Next

$sovan=0

If not WinExists("cs1") or not WinExists("cs2") Then
	ChuanBi("1","Ngung")
	ChuanBi("2","Ngung")
EndIf

Sleep(1000)
WinMove("cs1","",0,0)
WinMove("cs2","",0,0)

While 1
$GoBack=0
While 1

If $BanDau=1 Then
	ChuanBi("2","")
	Send("{F10}")
	Mouse(385,320)
	Mouse(385,345)
	Mouse(385,370)
	Mouse(385,395)
	Mouse(385,420)
	Mouse(385,445)
	Send("{enter}")
	Send("{enter}")
	Send("{enter}")
	Sleep(10)
	Send("{f9}")
	Mouse(522, 422)
	ClipPut("/in " & GUICtrlRead($Nick[1][1]))
	Send("^v")
	Mouse(522, 450)
;~ 	ClipPut("www.zerowelcome.com - Code Free Vip + Auto Free Vip caìc loaòi")
	Send("{enter}")

	ChuanBi("1","")
	Send("{F10}")
	Mouse(478,320)
	Mouse(478,345)
	Mouse(478,370)
	Mouse(478,395)
	Mouse(478,420)
	Mouse(478,445)
	Send("{enter}")
	Sleep(10)
	Send("{F9}")
	Mouse(522, 422)
	ClipPut("/in " & GUICtrlRead($Nick[1][1]))
	Send("^v")
	Mouse(522, 450)
;~ 	ClipPut("www.zerowelcome.com - Code Free Vip + Auto Free Vip caìc loaòi")
	Send("{enter}") ; ghi quang cao

EndIf

If false Then ;Mod($sovan,5)=3 Then
	ChuanBi("1","")
	Sleep(10)
	Send("{esc}")

	ControlSend("cs2","","","!9{alt up}{enter}{enter}")
EndIf

WinActivates("cs2")
If GetColor(476, 397)<>"046CC8" Then
	ChuanBi("2","")
	TaoPhong("2")
	If Loopy(476, 397, "046CC8", 50, "cs2", "", 0, 0) = 0 Then ExitLoop

EndIf


ControlSend("cs2","","","!9{alt up}{enter}{enter}")
Sleep(500)
ControlSend("cs1","","","{enter}")
Sleep(500)
ControlSend("cs1","","","{enter}")
Sleep(500)
ControlSend("cs1","","","{enter}")
Sleep(500)
ControlSend("cs1","","","{enter}")

$kk=0
Do
	Sleep(100)
	$kk=$kk+1
	If $kk<2 Then
		ControlSend("cs2","","","!9{alt up}{enter}{enter}{enter}")
		ControlSend("cs1","","","{enter}{enter}")
	EndIf
	If $kk>30 Then
		ChuanBi("1","")
		$GoBack=1
		ExitLoop
	EndIf

Until $kk>6

If GetColor(476, 397)<>"046CC8" Then ControlSend("cs2","","","{enter}{enter}{enter}")
$Pha=0
If $post=1 Then
	If GetColor(214,184)="0BBEFF" Then $Pha=1
EndIf
If $post=2 Then
	If GetColor(426,184)="0BBEFF" Then $Pha=1
EndIf
If $Pha=1 Then
	ControlClick("cs1", "", "", "left", 1, 116, 583)
	WinActivates("cs2")
	Mouse(707,478)
	Sleep(50)
	Mouse(343,544)
	Sleep(1000)
	$GoBack=1
	ChuanBi("1","")
	ExitLoop
EndIf

If False Then
$Mau1=""
For $i=84 to 94
	$Mau1=$Mau1 & GetColor($i,232)
Next
If $Mau0<>$Mau1 Then
	ChuanBi("1","")
	WinActivates("cs2")
	Mouse(707,478)
	Sleep(50)
	Mouse(343,544)
	Sleep(50)
	$GoBack=1
	ExitLoop
EndIf
EndIf


$k=0
Do
	$k=$k+1
	If $k=350 Then
		WinActivates("cs1")
		Mouse(733, 560)
		WinActivates("cs2")
	EndIf
	If $k> 500 Then
		ChuanBi("1","")
		$GoBack=1
		ExitLoop
	EndIf
	Sleep(10)
Until GetColor(175,246)="B00100" or GetColor(284,248)="B00100"
If $GoBack=1 Then ExitLoop

ControlSend("cs2","","","{f5}")
Sleep(20)
ControlClick("cs2", "", "", "left", 1, 116, 583)

If GUICtrlRead($Tocdo2)=1 Then
	$dem=1
	Do
		$dem=$dem+1
		If GUICtrlGetState($Nick[2][2])=80 Then
			ControlSend("cs2", "","","{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{lshift}{space}")
		Else
			ControlSend("cs2", "","","{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}{space}")
		EndIf
		$color5=GetColor(469, 424)
	Until $dem > 10 or $color5="0269E4"
	If $color5<>"0269E4" Then ChuanBi("2","")
EndIf

If GUICtrlRead($Tocdo1)=1 Then ChuanBi("2","")
	TaoPhong("2")
WinActivates("cs1")
$xong=0
$k=0
Do

	;If _IsPressed("51") Then MsgBox("","",GetColor(717,134))
	Sleep(10)
	$k=$k+1

	If $k= 100 Then
		If GetColor(785,426)="046CC8" Then		; cs 1 con` o? fog bat dau do cs2 out truoc  ko san sang duoc
			Send("{esc}{esc}")
			ControlClick("cs1", "", "", "left", 1, 116, 583)
			$GoBack=1
			ExitLoop
		EndIf


	EndIf



	$color3=GetColor(719,32)
	$color4=GetColor(717,134)
	If ($color3="0A61B6" or $color3="07437D") and $color4<>"299FEC" and $color4<>"1C6DA2" Then
		OutNhanh("cs2")
		Sleep(100)
		ChuanBi("2","")
		TaoPhong("2")
		WinActivates("cs1")
	EndIf


	If $k> 400 Then

		ChuanBi("2","")
		$GoBack=1
		ExitLoop
	EndIf
;Until GetColor(174,151)="F8F8F8"
Until GetColor(173,153)="E1E1E1" or GetColor(492,153)="E1E1E1"
If $GoBack=1 Then ExitLoop


If GUICtrlRead($HopQua)=1 Then
	Loopy(358,376,"DCDCDC",60,"cs" & $z, "",0,0)
	Sleep(100)

	Mouse(250,475)
	Sleep(100)
	Mouse(250,475)
	Sleep(100)
	Mouse(250,475)
	Sleep(500)

	If $post=2 Then
		Sleep(50)
		Mouses(415,475,3)
		Sleep(100)
		Mouses(415,476,3)
		Sleep(100)
		Mouses(415,477,3)
		Sleep(1000)
	EndIf
EndIf

OutNhanh("cs1")
ControlSend("cs2","","","!9{alt up}{enter}{enter}")

$sovan=$sovan+1

If $sovan>=GUICtrlRead($sovanpost) Then
	If GUICtrlRead($DoiTat)=1 Then Shutdown(13)
	MsgBox(64,"Hoàn Thành !!!", "Đã post xong số ván quy định !")
	ManHinhCho()
EndIf

WEnd
WEnd
EndFunc
























Func _ProcessOwner($pid=0,$hostname=".")
    $objWMIService = ObjGet("winmgmts://" & $hostname & "/root/cimv2")
    $colProcess = $objWMIService.ExecQuery("Select * from Win32_Process Where ProcessID ='" & $pid & "'")
    For $objProcess In $colProcess
        If $objProcess.ProcessID = $pid Then
            $usr = 0
            $objProcess.GetOwner($usr)
            Return $usr
        EndIf
    Next
EndFunc

Func GetAdapterRegKey($Adapter = "")
	Local $RetVal[2]
	Local $NetKey = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002BE10318}"
	If @OSTYPE = "WIN32_WINDOWS" Then
		$NetKey = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Class\Net"
	EndIf
	Local $i = 0
	While 1
		$i += 1
		Local $Key = RegEnumKey($NetKey, $i)
		If @error <> 0 Then ExitLoop
		Local $AdapterKey = $NetKey & "\" & $Key
		Local $j = 0
		While 1
			$j += 1
			Local $Value = RegEnumVal($AdapterKey, $j)
			If @error <> 0 Then ExitLoop
			If $Value = "DriverDesc" Then
				If $Adapter <> "" Then

					If $Adapter = RegRead($AdapterKey, $Value) Then
						$RetVal[0] = $AdapterKey
						$RetVal[1] = RegRead($AdapterKey, "networkaddress")
						ExitLoop
					EndIf
				Else

					ReDim $RetVal[$i + 1][3]
					$RetVal[0][0] = $i
					$RetVal[$i][0] = RegRead($AdapterKey, $Value)
					$RetVal[$i][1] = $AdapterKey
					$RetVal[$i][2] = RegRead($AdapterKey, "networkaddress")
				EndIf
			EndIf
		WEnd
	WEnd
	Return $RetVal
EndFunc   ;==>GetAdapterRegKey


Func DisNet()


	$oLanConnection = $Adapternameid
	$bEnable = False

	If @OSType <> "WIN32_NT" Then
		MsgBox(0, "", "This script requires Windows 2000 or higher.")
		Exit
	EndIf


	If @OSVersion = "WIN_2000" Then
		$strFolderName = "Network and Dial-up Connections"
	Else
		$strFolderName = "Network Connections"
	EndIf

	Select
		Case StringInStr("0409,0809,0c09,1009,1409,1809,1c09,2009,_2409,2809,2c09,3009,3409", @OSLang)
			$strEnableVerb = "En&able"
			$strDisableVerb = "Disa&ble"

	EndSelect


	Const $ssfCONTROLS = 3

	$ShellApp = ObjCreate("Shell.Application")
	$oControlPanel = $ShellApp.Namespace($ssfCONTROLS)


	$oNetConnections = ""

	For $FolderItem In $oControlPanel.Items
		If $FolderItem.Name = $strFolderName Then
			$oNetConnections = $FolderItem.GetFolder
			ExitLoop
		EndIf
	Next


	If Not IsObj($oNetConnections) Then
		;MsgBox(0, "Error", BinaryToString("0x4B68C3B46E672074C3AC6D207468E1BAA57920", 4) & '  Card' & $strFolderName)
		Exit
	EndIf


	For $FolderItem In $oNetConnections.Items
		If StringLower($FolderItem.Name) = StringLower($oLanConnection) Then
			$oLanConnection = $FolderItem
			ExitLoop
		EndIf
	Next

	If Not IsObj($oLanConnection) Then
		;MsgBox(0, "Error", BinaryToString("0x4B68C3B46E672074C3AC6D207468E1BAA57920", 4) & '  Card' & $oLanConnection)
		Exit
	EndIf

	$oEnableVerb = ""
	$oDisableVerb = ""

	For $Verb In $oLanConnection.Verbs
		If $Verb.Name = $strEnableVerb Then
			$oEnableVerb = $Verb
		EndIf
		If $Verb.Name = $strDisableVerb Then
			$oDisableVerb = $Verb
		EndIf
	Next

	If $bEnable Then
		If IsObj($oEnableVerb) Then $oEnableVerb.DoIt
	EndIf

	If Not $bEnable Then
		If IsObj($oDisableVerb) Then $oDisableVerb.DoIt
	EndIf

	Sleep(3000)
EndFunc


Func EnaNet()

	$oLanConnection = $Adapternameid
	$bEnable = True

	If @OSType <> "WIN32_NT" Then
		;MsgBox(0, "", "This script requires Windows 2000 or higher.")
		Exit
	EndIf


	If @OSVersion = "WIN_2000" Then
		$strFolderName = "Network and Dial-up Connections"
	Else
		$strFolderName = "Network Connections"
	EndIf

	Select
		Case StringInStr("0409,0809,0c09,1009,1409,1809,1c09,2009,_2409,2809,2c09,3009,3409", @OSLang)
			$strEnableVerb = "En&able"
			$strDisableVerb = "Disa&ble"

	EndSelect

	Const $ssfCONTROLS = 3

	$ShellApp = ObjCreate("Shell.Application")
	$oControlPanel = $ShellApp.Namespace($ssfCONTROLS)


	$oNetConnections = ""

	For $FolderItem In $oControlPanel.Items
		If $FolderItem.Name = $strFolderName Then
			$oNetConnections = $FolderItem.GetFolder
			ExitLoop
		EndIf
	Next


	If Not IsObj($oNetConnections) Then
		;MsgBox(0, "Error", BinaryToString("0x4B68C3B46E672074C3AC6D207468E1BAA57920", 4) & $strFolderName)
		Exit
	EndIf


	For $FolderItem In $oNetConnections.Items
		If StringLower($FolderItem.Name) = StringLower($oLanConnection) Then
			$oLanConnection = $FolderItem
			ExitLoop
		EndIf
	Next

	If Not IsObj($oLanConnection) Then
		;MsgBox(0, "Error", BinaryToString("0x4B68C3B46E672074C3AC6D207468E1BAA57920", 4) & $oLanConnection)
		Exit
	EndIf

	$oEnableVerb = ""
	$oDisableVerb = ""

	For $Verb In $oLanConnection.Verbs
		If $Verb.Name = $strEnableVerb Then
			$oEnableVerb = $Verb
		EndIf
		If $Verb.Name = $strDisableVerb Then
			$oDisableVerb = $Verb
		EndIf
	Next

	If $bEnable Then
		If IsObj($oEnableVerb) Then $oEnableVerb.DoIt
	EndIf

	If Not $bEnable Then
		If IsObj($oDisableVerb) Then $oDisableVerb.DoIt
	EndIf

EndFunc

Func MacAddress()
	$objWMIService = ObjGet("winmgmts:{impersonationLevel=impersonate}")
	$netAdapterSet = $objWMIService.ExecQuery('select *  from Win32_NetworkAdapter Where NetConnectionID = "' & $Adapternameid & '"')

	For $netAdapter In $netAdapterSet
		Return $netAdapter.MACAddress
	Next

	$objNetwork = ""
	$netAdapterSet = ""
EndFunc   ;==>MacAddress
