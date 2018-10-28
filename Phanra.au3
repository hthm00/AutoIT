#RequireAdmin
HotKeySet('{f4}','_exit')
While 1
ControlClick('BAO1','','','left',1,150-2, 191-23)
ControlClick('BAO1','','','left',1,408-2, 414-23)
ControlClick('BAO1','','','left',1,408-2, 414-23)
ControlClick('BAO1','','','left',1,403-2, 446-23)
WEnd
Func _exit()
	Exit
EndFunc