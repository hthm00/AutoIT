Run('E:\Minh\AutoIT\AutoYes24.exe')
;~ While 1
;~ 	Sleep(500)
;~ 	If WinExists('Choose File to Upload') Then
;~ 		Sleep(1000)
;~ 		Send('captcha.jpg')
;~ 		Send('{enter}')
;~ 		$ii=FileRead(@DesktopDir&'\Yes24.txt')
;~ 		$yes24h=FileOpen(@DesktopDir&'\Yes24.txt',2)
;~ 		FileWrite($yes24h,$ii+1)
;~ 		FileClose($yes24h)
;~ 		Exit
;~ 	EndIf
;~ WEnd