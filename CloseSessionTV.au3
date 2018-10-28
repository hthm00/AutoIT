While 1
   If WinExists('Sponsored session') Then
	  WinSetState('Sponsored session','',@SW_HIDE)
   EndIf
   Sleep(10)
WEnd