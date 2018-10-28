#RequireAdmin
;~ WinSetTitle('La[2]','','La[1]')
;~ WinSetTitle('cuaso2','','Boom')
;~ ControlSend('Boom','','','{f5}')
;~ Send('{f1}')
;~ MsgBox(0,'',Hex(PixelGetColor(327, 415)))

MsgBox(0,'','')

While 1
	ControlClick('cuaso1','','','left',1,559-2, 233-23)


WEnd
Exit



HotKeySet('{f4}','_exit')
Global $i=2650, $ii=0, $lv2_1, $lv2_2,$nv=1, $k=0,$l=0
WinMove('cuaso1','',0,0)
WinActivate('cuaso1')
MsgBox(0,'','Auto By Minh Huynh')
MsgBox(0,'','Mở auto TLH trước rồi chạy, sau đó mới mở AutoSF'&@CRLF&'Ko ẩn cửa sổ'&@CRLF&'Ko di chuyển cửa sổ'&@CRLF&'F4 để tắt')
;~ MsgBox(0,'',Hex(PixelGetColor(308, 300)))
;~ ClipPut(Hex(PixelGetColor(308, 300)));00FFCF00
;~ Exit

While 1
	WinActivate('cuaso1')
	If Hex(PixelGetColor(304, 81))='00FEC70A' Then
		$i+=1
	EndIf
	If $i>=2640 Then
		$i=1
		Send('{f9}')
		Sleep(500)
		For $a=1 To 20
			ControlClick('cuaso1','','','left',1,663-2, 612-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,514-2, 330-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,309-2, 550-23)
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
		Next
		ControlClick('cuaso1','','','left',1,663-2, 612-23)
		Sleep(1000)
			ControlClick('cuaso1','','','left',1,514-2, 330-23)
		Sleep(1000)
			ControlClick('cuaso1','','','left',1,309-2, 550-23)
		Sleep(1000)
		For $aa=1 To 20
			ControlClick('cuaso1','','','left',1,663-2, 612-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,514-2, 356-23)
			Sleep(100)
			ControlClick('cuaso1','','','left',1,309-2, 550-23)
			Sleep(100)
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
		Next
		ControlClick('cuaso1','','','left',1,663-2, 612-23)
			Sleep(1000)
			ControlClick('cuaso1','','','left',1,514-2, 356-23)
			Sleep(1000)
			ControlClick('cuaso1','','','left',1,309-2, 550-23)
			Sleep(1000)
;##################1P##################
		ControlClick('cuaso1','','','left',1,589-2, 611-23)
		Sleep(200)
		ControlClick('cuaso1','','','left',1,514-2, 330-23)
		ToolTip('Đang tìm 2 lv2',0,@DesktopHeight-80)
		Do
			Sleep(200)
		Until Hex(PixelGetColor(457, 58))='000DDFFF' Or $nv=50
		$nv=1
		ControlClick('cuaso1','','','left',1,588-2, 223-23)
		Sleep(200)
		ControlClick('cuaso1','','','left',1,245-2, 321-23)
		Do
			ControlClick('cuaso1','','','left',1,528-2, 317-23)
			Sleep(500)
			If Hex(PixelGetColor(308, 300))='00FFCF00' Then
				$lv2_1=True
			EndIf
			$ii+=1
		Until Hex(PixelGetColor(308, 300))='00FFCF00' Or $ii=15
		$ii=0
		If Hex(PixelGetColor(308, 300))='00FFCF00' Then
			$txt=Hex(PixelGetColor(321, 316))
		EndIf
		Sleep(200)
		ControlClick('cuaso1','','','left',1,343-2, 398-23)
		Sleep(200)
		ControlClick('cuaso1','','','left',1,408-2, 321-23)
		Sleep(200)
		Do
			ControlClick('cuaso1','','','left',1,531-2, 317-23)
			Sleep(500)
			If Hex(PixelGetColor(308, 300))='00FFCF00' Then
				If Hex(PixelGetColor(321, 316))=$txt Then
				Else
					ExitLoop
				EndIf
			EndIf
			$ii+=1
		Until $ii=18
		$ii=0
		If Hex(PixelGetColor(308, 300))='00FFCF00' Then
			If Hex(PixelGetColor(321, 316))=$txt Then
			Else
				$lv2_2=True
			EndIf
		EndIf
		ControlClick('cuaso1','','','left',1,343-2, 398-23)
		Sleep(1000)
		If $lv2_1=True And $lv2_2=True Then
			Sleep(1000)
;~ 			ControlClick('cuaso1','','','left',1,327-2, 415-23)
			If Hex(PixelGetColor(327, 415))='00C018F6' Then
				ToolTip('Đủ 2 lv2',0,@DesktopHeight-80)
;~ 				MsgBox(0,'','')
				ControlClick('cuaso1','','','left',1,327-2, 415-23)
				Sleep(7000)
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
			Else
				ToolTip('Ko đủ 2 lv2',0,@DesktopHeight-80)
				Sleep(7000)
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
			EndIf
			Else
			ToolTip('Đang tìm 2 lv1',0,@DesktopHeight-80)
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			Sleep(200)
			ControlClick('cuaso1','','','left',1,589-2, 611-23)
			Sleep(200)
			ControlClick('cuaso1','','','left',1,514-2, 330-23)
			Do
				Sleep(200)
			Until Hex(PixelGetColor(457, 58))='000DDFFF' Or $nv=50
			$nv=1
			ControlClick('cuaso1','','','left',1,588-2, 223-23)
			Sleep(200)
			ControlClick('cuaso1','','','left',1,245-2, 321-23)
			Sleep(200)
			Do
				Sleep(500)
				If Hex(PixelGetColor(308, 300))='00FFCF00' Then
				Else
					If Hex(PixelGetColor(311, 299))='004261EF' Then
				Else
						$skilllv1=Hex(PixelGetColor(321, 316))
						Sleep(1000)
						ControlClick('cuaso1','','','left',1,343-2, 398-23)

						ExitLoop
					EndIf
				EndIf
				ControlClick('cuaso1','','','left',1,528-2, 317-23)
				$k+=1
			Until $k=15
			ControlClick('cuaso1','','','left',1,343-2, 398-23)
			Sleep(200)
			ControlClick('cuaso1','','','left',1,408-2, 321-23)
			Sleep(200)
			Do
				Sleep(500)
				If Hex(PixelGetColor(308, 300))='00FFCF00' Then
				Else
					If Hex(PixelGetColor(311, 299))='004261EF' Then
					Else
						If Hex(PixelGetColor(321, 316))=$skilllv1 Then
						Else
							Sleep(1000)
							ControlClick('cuaso1','','','left',1,343-2, 398-23)
;~ 							MsgBox(0,'','')
							ExitLoop
						EndIf
					EndIf
				EndIf
				ControlClick('cuaso1','','','left',1,528-2, 317-23)
				$l+=1
			Until $l=18
			ControlClick('cuaso1','','','left',1,343-2, 398-23)
			Sleep(3000)
			If Hex(PixelGetColor(327, 415))='00C018F6' Then
				If $k=15 Then
				Else
					If $l=18 Then
					Else
						ToolTip('Đủ 2 lv1',0,@DesktopHeight-80)
						ControlClick('cuaso1','','','left',1,327-2, 415-23)
						Sleep(7000)
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
				EndIf
			Else
;~ 				Sleep(7000)
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
		EndIf
		$k=0
		$l=0
		$lv2_1=False
		$lv2_2=False
;~ 		ControlClick('cuaso1','','','left',1,663-2, 612-23)
;~ 		Sleep(1000)
;~ 		ControlClick('cuaso1','','','left',1,514-2, 330-23)
;~ 		Sleep(1000)
;~ 		ControlClick('cuaso1','','','left',1,309-2, 550-23)
;~ 		Sleep(1000)
		ControlClick('cuaso1','','','left',1,663-2, 612-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,514-2, 330-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,309-2, 550-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,663-2, 612-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,514-2, 330-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,309-2, 550-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,663-2, 612-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,514-2, 330-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,309-2, 550-23)
		Sleep(1000)
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
;~ 		Exit
;##################1P##################


;##################2P##################
#cs
		ControlClick('cuaso1','','','left',1,589-2, 611-23)
		Sleep(200)
		ControlClick('cuaso1','','','left',1,514-2, 356-23)
		ToolTip('Đang tìm 2 lv2',0,@DesktopHeight-80)
		Do
			Sleep(200)
		Until Hex(PixelGetColor(457, 58))='000DDFFF' Or $nv=50
		$nv=1
		ControlClick('cuaso1','','','left',1,588-2, 223-23)
		Sleep(200)
		ControlClick('cuaso1','','','left',1,245-2, 321-23)
		Do
			ControlClick('cuaso1','','','left',1,528-2, 317-23)
			Sleep(500)
			If Hex(PixelGetColor(308, 300))='00FFCF00' Then
				$lv2_1=True
			EndIf
			$ii+=1
		Until Hex(PixelGetColor(308, 300))='00FFCF00' Or $ii=15
		$ii=0
		If Hex(PixelGetColor(308, 300))='00FFCF00' Then
			$txt=Hex(PixelGetColor(321, 316))
		EndIf
		Sleep(200)
		ControlClick('cuaso1','','','left',1,343-2, 398-23)
		Sleep(200)
		ControlClick('cuaso1','','','left',1,408-2, 321-23)
		Sleep(200)
		Do
			ControlClick('cuaso1','','','left',1,531-2, 317-23)
			Sleep(500)
			If Hex(PixelGetColor(308, 300))='00FFCF00' Then
				If Hex(PixelGetColor(321, 316))=$txt Then
				Else
;~ 					MsgBox(0,'',Hex(PixelGetColor(321, 316))&@CRLF&$txt)
					ExitLoop
				EndIf
			EndIf
			$ii+=1
		Until $ii=18
		$ii=0
		If Hex(PixelGetColor(308, 300))='00FFCF00' Then
			If Hex(PixelGetColor(321, 316))=$txt Then
			Else
				$lv2_2=True
			EndIf
		EndIf
		ControlClick('cuaso1','','','left',1,343-2, 398-23)
		Sleep(200)
		If $lv2_1=True And $lv2_2=True Then
			Sleep(1000)
;~ 			MsgBox(0,'','')
;~ 			ControlClick('cuaso1','','','left',1,327-2, 415-23)
			If Hex(PixelGetColor(327, 415))='00C018F6' Then
				ToolTip('Đủ 2 lv2',0,@DesktopHeight-80)
;~ 				MsgBox(0,'','')
				ControlClick('cuaso1','','','left',1,327-2, 415-23)
				Sleep(7000)
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
			Else
				ToolTip('Ko đủ 2 lv2',0,@DesktopHeight-80)
				Sleep(7000)
;~ 				MsgBox(0,'','')
				ControlSend('cuaso1','','','{enter}')
				ControlSend('cuaso1','','','{enter}')
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
			Else
#ce
			ToolTip('Đang tìm 2 lv1',0,@DesktopHeight-80)
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			ControlSend('cuaso1','','','{enter}')
			Sleep(200)
			ControlClick('cuaso1','','','left',1,589-2, 611-23)
			Sleep(200)
			ControlClick('cuaso1','','','left',1,514-2, 330-23)
			Do
				Sleep(200)
			Until Hex(PixelGetColor(457, 58))='000DDFFF' Or $nv=50
			$nv=1
			ControlClick('cuaso1','','','left',1,588-2, 223-23)
			Sleep(200)
			ControlClick('cuaso1','','','left',1,245-2, 321-23)
			Sleep(200)
			Do
				Sleep(500)
				If Hex(PixelGetColor(308, 300))='00FFCF00' Then
				Else
					If Hex(PixelGetColor(311, 299))='004261EF' Then
				Else
						$skilllv1=Hex(PixelGetColor(321, 316))
						Sleep(1000)
						ControlClick('cuaso1','','','left',1,343-2, 398-23)

						ExitLoop
					EndIf
				EndIf
				ControlClick('cuaso1','','','left',1,528-2, 317-23)
				$k+=1
			Until $k=15
			ControlClick('cuaso1','','','left',1,343-2, 398-23)
			Sleep(200)
			ControlClick('cuaso1','','','left',1,408-2, 321-23)
			Sleep(200)
			Do
				Sleep(500)
				If Hex(PixelGetColor(308, 300))='00FFCF00' Then
				Else
					If Hex(PixelGetColor(311, 299))='004261EF' Then
					Else
						If Hex(PixelGetColor(321, 316))=$skilllv1 Then
						Else
							Sleep(1000)
							ControlClick('cuaso1','','','left',1,343-2, 398-23)
;~ 							MsgBox(0,'','')
							ExitLoop
						EndIf
					EndIf
				EndIf
				ControlClick('cuaso1','','','left',1,528-2, 317-23)
				$l+=1
			Until $l=18
			ControlClick('cuaso1','','','left',1,343-2, 398-23)
			Sleep(3000)
			If Hex(PixelGetColor(327, 415))='00C018F6' Then
				If $k=15 Then
				Else
					If $l=18 Then
					Else
						ToolTip('Đủ 2 lv1',0,@DesktopHeight-80)
						ControlClick('cuaso1','','','left',1,327-2, 415-23)
						Sleep(7000)
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
				EndIf
			Else
;~ 				Sleep(7000)
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
		EndIf
		$k=0
		$l=0
		$lv2_1=False
		$lv2_2=False
;~ 		ControlClick('cuaso1','','','left',1,663-2, 612-23)
;~ 		Sleep(1000)
;~ 		ControlClick('cuaso1','','','left',1,514-2, 356-23)
;~ 		Sleep(1000)
;~ 		ControlClick('cuaso1','','','left',1,309-2, 550-23)
;~ 		Sleep(1000)
		ControlClick('cuaso1','','','left',1,663-2, 612-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,514-2, 356-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,309-2, 550-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,663-2, 612-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,514-2, 356-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,309-2, 550-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,663-2, 612-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,514-2, 356-23)
		Sleep(1000)
		ControlClick('cuaso1','','','left',1,309-2, 550-23)
		Sleep(1000)
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')
		ControlSend('cuaso1','','','{enter}')

;~ #ce
;~ 		Exit
;##################2P##################



;~ 		ControlClick('cuaso1','','','left',1,589-2, 611-23)
;~ 		Sleep(200)
;~ 		ControlClick('cuaso1','','','left',1,514-2, 356-23)
;~ 		Sleep(200)
;~ 		ControlClick('cuaso1','','','left',1,245-2, 321-23)
;~ 		Sleep(200)
;~ 		ControlClick('cuaso1','','','left',1,343-2, 398-23)
;~ 		Sleep(200)
;~ 		ControlClick('cuaso1','','','left',1,408-2, 321-23)
;~ 		Sleep(200)
;~ 		ControlClick('cuaso1','','','left',1,404-2, 319-23)
;~ 		Sleep(200)
;~ 		ControlClick('cuaso1','','','left',1,343-2, 398-23)
;~ 		Sleep(200)
;~ 		If Hex(PixelGetColor(327, 415))='00C018F6' Then
;~ 			ControlClick('cuaso1','','','left',1,327-2, 415-23)
;~ 			Sleep(1000)
;~ 			ControlSend('cuaso1','','','{enter}')
;~ 			ControlSend('cuaso1','','','{enter}')
;~ 			ControlSend('cuaso1','','','{enter}')
;~ 			ControlSend('cuaso1','','','{enter}')
;~ 		Else
;~ 			ControlSend('cuaso1','','','{enter}')
;~ 			ControlSend('cuaso1','','','{enter}')
;~ 			ControlSend('cuaso1','','','{enter}')
;~ 			ControlSend('cuaso1','','','{enter}')
;~ 		EndIf

		Send('{f9}')
;~ 	EndIf





WEnd


Func _exit()
	Exit
EndFunc