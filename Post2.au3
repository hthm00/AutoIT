#RequireAdmin
;~ WinWait('codeNQB.txt - Notepad')

;~ Exit
HotKeySet('{f4}','_exit')
While 1
	If WinExists('[La-Link] Auto Post 2 SC') Then
		MouseClick('left',1239, 374,1,1)
;~ 		MouseClick('left',1239, 374,1,1)
;~ 		WinSetState('[La-Link] Auto Post 2 SC','',@SW_MAXIMIZE)

		Sleep(500)
		ControlClick('[La-Link] Auto Post 2 SC','','[Class:Button; Instance:4]')

		ControlShow('[La-Link] Auto Post 2 SC','','[Class:Button; Instance:22]')
		ControlClick('[La-Link] Auto Post 2 SC','','[Class:Button; Instance:22]')

;~ 		ControlEnable('[La-Link] Auto Post 2 SC','','[Class:Button; Instance:31]')
		ControlShow('[La-Link] Auto Post 2 SC','','[Class:Button; Instance:31]')
		ControlClick('[La-Link] Auto Post 2 SC','','[Class:Button; Instance:31]')
		ControlClick('[La-Link] Auto Post 2 SC','','[Class:Button; Instance:11]')
		ControlClick('[La-Link] Auto Post 2 SC','','[Class:Button; Instance:15]')
		ControlClick('[La-Link] Auto Post 2 SC','','[Class:Button; Instance:12]')
		ControlClick('[La-Link] Auto Post 2 SC','','[Class:Button; Instance:16]')
		ControlClick('[La-Link] Auto Post 2 SC','','[Class:Static; Instance:3]')
		ControlClick('[La-Link] Auto Post 2 SC','','[Class:Button; Instance:1]')
	EndIf

WEnd

Func _exit()
	Exit
EndFunc