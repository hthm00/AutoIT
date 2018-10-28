#RequireAdmin
#include <ImageSearch.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $7=0,$8=0,$x=0,$y=0,$click[5]=['',309,420,522,612],$cat[7]=['',151,191,248,341,392,443]


#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Perk", 121, 142, 1220, 12,BitOR($WS_CAPTION, $WS_POPUP, $WS_SYSMENU ))
$Label1 = GUICtrlCreateLabel("Title", 8, 8, 36, 17)
$Input1 = GUICtrlCreateInput("MEmu 2.7.2 - MEmu", 56, 8, 49, 21)
$Label2 = GUICtrlCreateLabel("Stop", 8, 40, 36, 17)
$Input2 = GUICtrlCreateInput("F1", 56, 40, 49, 21)
$Label3 = GUICtrlCreateLabel("", 8, 72, 100, 17)
GUICtrlSetColor(-1,0x43A100)
$Button1 = GUICtrlCreateButton("Start", 24, 104, 75, 25)
GUISetState(@SW_SHOW)

#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1

			$bla=GUICtrlRead($Input2)
			HotKeySet('{'&$bla&'}','_exit')

			$title=GUICtrlRead($Input1)
			Opt('WinTitleMatchMode',3)
			$win=WinGetPos($title)

			start()
	EndSwitch
WEnd




Func start()
	While 1
		$win=WinGetPos($title)
		find('2browse')
		find('3categories',161, $cat[Random(1,6,1)])
		find('4choose')
		find('5solo')
		find('6ad1')
;~ 		find('6ad2')

		$7=find('7playing')
		If $7=1 Then
			While 1
				ControlClick($title,'','','left',1,198,$click[Random(1,4,1)])
				Sleep(Random(900,1500,1))
				$8=find('8again',195, 379)
				If $8=1 Then
					$7=0
					$8=0
					ExitLoop
				EndIf
			WEnd
		EndIf
		find('8again',195, 379)
		find('9out',271, 490)

	WEnd









EndFunc


Func find($fileanh,$a='',$b='')
	GUICtrlSetData($Label3,$fileanh)
	$fileanh=@ScriptDir&'\anh\'&$fileanh&'.png'
	$kq=_ImageSearchArea($fileanh,0,$win[0],$win[1],$win[0]+$win[2],$win[1]+$win[3],$x,$y,0)
	If $kq=1 And $a<>'' And $b<>'' Then
		ControlClick($title,'','','left',1,$a,$b)
		Sleep(500)
		Return 1
	EndIf
	If $kq=1 And $a='' And $b='' Then
		ControlClick($title,'','','left',1,$x-$win[0],$y-$win[1])
		Sleep(500)
		Return 1
	EndIf
EndFunc

Func find0($fileanh)
	$fileanh=@ScriptDir&'\anh\'&$fileanh
	$kq=_ImageSearchArea($fileanh,0,$win[0],$win[1],$win[0]+$win[2],$win[1]+$win[3],$x,$y,0)

	If $kq=1 Then
		Return 1
	EndIf
EndFunc

Func _exit()
	Exit
EndFunc