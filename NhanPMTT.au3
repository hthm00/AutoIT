#RequireAdmin
#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <TabConstants.au3>
#include <WindowsConstants.au3>



;~ $dir=RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM','Path')
;~ 			$n=StringReplace($dir,'autoupdate.exe','')
;~ 		ClipPut($n)
;~ MsgBox(0,'',@ScriptDir)
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
$Label13 = GUICtrlCreateLabel("Vị trí nhiệm vụ", 40, 96, 58, 33)
$Button7 = GUICtrlCreateButton("Bắt đầu", 224, 96, 75, 25)
$Label14 = GUICtrlCreateLabel("Auto tự login - File: tkgdps.txt", 40, 64, 42, 17)


GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global $cs[100],$i, $open[100],$name[100],$login[100],$tk[100],$str[100],$l=0
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button2
			If GUICtrlRead($Checkbox1)=1 Then
				login()
			EndIf
;~ 			$sophuttem=GUICtrlRead($Input8)+2
			$cs=StringSplit(GUICtrlRead($Input3),',')
;~ 			MsgBox(0,'',$cs[0])
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
;~ 						$sophuttem=$sophuttem-1
;~ 						GUICtrlSetData($Input8,$sophuttem)

						Sleep(60000)
						If $ii=30 Then
							GUICtrlSetData($Input4,'0')
						EndIf
;~ 						If $sophuttem=0 And GUICtrlRead($Checkbox2)=1 Then
;~ 							dongtem()
;~ 							$sophuttem=10

;~ 						EndIf
				Next
			WEnd
		Case $Button1
			WinSetTitle(GUICtrlRead($Input1),'',GUICtrlRead($Input2))
		Case $Button3
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

		Case $Button5
			kethop()
		Case $Button6
			ExitLoop
	EndSwitch
WEnd

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
	FileCopy(@ScriptDir&'\dwk.dll',$n)
	While 1
		For $k=1 To GUICtrlRead($Input7)
			$win='cs'&$k
			If WinExists($win) Then
				$open[$i]=True
				$name[$i]=True
				$login[$i]=True

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