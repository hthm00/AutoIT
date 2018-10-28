#RequireAdmin
While 1
	If WinExists('HTTP Protocol Violation') Then
		WinClose('HTTP Protocol Violation')
	EndIf
	Sleep(50)
WEnd