#RequireAdmin
Global $i[4]=['{left}','{right}','{up}','{down}']
While 1
	ControlSend('Boom','','','{F5}')
	Sleep(500)
	ControlSend('Boom','','','{enter}')
	Sleep(500)
	ControlSend('Boom','','','{enter}')
	Sleep(500)
	ControlSend('Boom','','','{enter}')
;~ 	Sleep(500)
;~ 	Opt('SendKeyDelay',5000)
;~ 	ControlSend('Boom','','',$i[Random(0,3,1)])
;~ 	Opt('SendKeyDelay',5)
;~ 	Sleep(500)
;~ 	ControlSend('Boom','','','{space}')
;~ 	Sleep(500)
;~ 	ControlSend('Boom','','','{enter}')
;~ 	Sleep(500)
;~ 	ControlSend('Boom','','','{space}')
;~ 	Sleep(500)
;~ 	ControlSend('Boom','','','{enter}')
;~ 	Sleep(500)
WEnd