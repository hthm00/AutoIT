#RequireAdmin
HotKeySet('{F4}','_exit')
ToolTip('F4: exit - Auto By Minh Huynh',0,0)
$ten=InputBox('Tên cửa sổ','Nhập tên cửa sổ','Boom')
While 1

	ControlClick($ten,'','','left',1,333-2, 433-23)
	Sleep(200)
	ControlClick($ten,'','','left',1,377-2, 433-23)
	Sleep(200)
WEnd

Func _exit()
   Exit
EndFunc