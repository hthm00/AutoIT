#RequireAdmin
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>
Global $hd[4]=[224,275,253,272],$bat[4]=[232,277,313,281],$cuu[4]=[271,271,301,281],$batboss[4]=[292,275,274,273],$winboss[4]=[245,271,292,275],$dtqv[4]=[295,280,271,281],$winthuong[4]=[192,272,357,280],$mau='004800B1'
;			piggy,5 				hthm1,3						,hmbnhn9,3				,hmbnhn3,1	,					hmbnhn8,5					hthm1					,hmbnhn16,5


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
$Group5 = GUICtrlCreateGroup("Giúp Đỡ Pháp Sư", 24, 40, 377, 105)
$Combo2 = GUICtrlCreateCombo("", 112, 96, 57, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData(-1,'1|2|3|4')
$Label13 = GUICtrlCreateLabel("Vị trí nhiệm vụ", 40, 96, 80, 33)
$Button7 = GUICtrlCreateButton("Bắt đầu", 224, 96, 75, 25)
$Label14 = GUICtrlCreateLabel("Auto tự login - File: tkgdps.txt", 40, 64, 500, 17)


GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global $cs[100],$i, $open[100],$name[100],$login[100],$tk[100],$str[100],$l=0,$in[100]
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
	EndSwitch
	If WinExists('Auto by MH') Then
		GUICtrlSetData($Combo2,ControlGetText('Auto by MH','','[CLASS:ComboBox; INSTANCE:2]'),$Combo2)
		WinClose('Auto by MH')
		gdps()
	EndIf
WEnd




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
		ControlClick($ten,'','','left',6,482-2, 441-23)
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
		For $i=1 To 45
			ControlClick($ten,'','','left',1,333-2, 433-23)
			ControlClick($ten,'','','left',1,377-2, 433-23)
			Sleep(70)
			$nMsg = GUIGetMsg()
			Switch $nMsg
				Case $Button6
					ExitLoop(2)
			EndSwitch
		Next
		Sleep(2000)
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
		Sleep(3500)
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
;~ 	WinSetState('cuaso2','',@SW_MINIMIZE)
	While 6
		ControlClick('cuaso1','','','left',1,586-2,611-23)
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
		WinActivate('cuaso1')
		WinMove('cuaso1','',0,0)
		Sleep(1000)
		nvhd()
		nvbat()
		nvcuu()
		nvbatboss()
		nvwinboss()
		nvwinthuong()
		nvdtqv()
		xong()
	WEnd
EndFunc

Func xong() ; ===> ok
	If Hex(PixelGetColor(250,393))='00F3DDB2' Then
		ToolTip('Đang nhận quà',0,0)
		ControlClick('cuaso1','','','left',1,256-2,393-23)
		Sleep(500)
		ControlClick('cuaso1','','','left',1,325-2,390-23)
		Sleep(500)
		ControlClick('cuaso1','','','left',1,217-2,440-23)
		Sleep(500)
		ControlClick('cuaso1','','','left',1,291-2,439-23)
		Sleep(500)
		ControlClick('cuaso1','','','left',1,362-2,437-23)
		Sleep(500)
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
		Next
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
		Sleep(100)
	EndIf
EndFunc

Func nvbat() ; ===> ok
	If Hex(PixelGetColor($bat[0],$bat[1]))=$mau And Hex(PixelGetColor($bat[2],$bat[3]))=$mau Then
		$sovan=3
		ToolTip('Bắt: '&$sovan&' lần còn lại',0,0)
		For $f=1 To 3
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
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
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
		$sovan=3
		ToolTip('Cứu: '&$sovan&' lần còn lại',0,0)
		For $f=1 To 3
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
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
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
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
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
			Sleep(7500)

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
			Sleep(38000)
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
			ControlClick('hack1','','[CLASS:TAdvOfficeCheckBox; INSTANCE:9]')
			Sleep(500)
			MouseMove(126,224)
			Sleep(500)
			ControlClick('hack1','','[CLASS:TAdvOfficeCheckBox; INSTANCE:9]')
			Sleep(8000)
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
		$sovan=5
		ToolTip('Win Boss: '&$sovan&' lần còn lại',0,0)
		For $f=1 To 5
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
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
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
		$sovan=5
		ToolTip('Win Thường: '&$sovan&' lần còn lại',0,0)
		For $f=1 To 5
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
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
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
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,642-2,222-23)
			Sleep(100)
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
			Sleep(9000)
			ControlClick('hack1','','[CLASS:TAdvOfficeCheckBox; INSTANCE:5]')
			Sleep(1000)
			ControlClick('hack1','','[CLASS:TAdvOfficeCheckBox; INSTANCE:5]')
			Sleep(31000)
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgUp}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgUp}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgUp}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgUp}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgUp}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgUp}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgUp}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgUp}')
			Sleep(10000)
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgDn}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgDn}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgDn}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgDn}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgDn}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgDn}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgDn}')
			ControlSend('hack1','','[CLASS:TAdvTrackBar; INSTANCE:1]','{PgDn}')
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
			ToolTip('Thắng ĐTQV: '&$sovan&' lần còn lại',0,0)
		Next
	EndIf
EndFunc


