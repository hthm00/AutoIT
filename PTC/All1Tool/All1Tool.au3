#RequireAdmin
#include <String.au3>



HotKeySet('{f3}','get')
HotKeySet('{f4}','dung')
HotKeySet('{f6}','_exit')
HotKeySet('{f2}','_script1')
Opt('WinTitleMatchMode',3)
$xong=True
Func _exit()
	Exit
EndFunc
$i=0
While 1
	Sleep(50)
WEnd

Func get()
	Send('document.cookie')
	Send('{enter}')
EndFunc

Func dung()
	Send('^{c}')
	Sleep(300)
	$xong=Not $xong
EndFunc

Func _script()
	$i+=1
	ToolTip($i,0,0)
	$txt=FileReadLine(@ScriptDir&'\PTC list all1tool.txt',$i)
	$str=StringSplit($txt,',')
	$site=$str[2]
	$script=$str[3]
	$min=$str[4]
	WinSetState('All1Tool (Version: 2.113) - ','',@SW_MINIMIZE)
	If $script='Aurora' Then
		ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.c39d32_r11_ad1; INSTANCE: 115]')
	ElseIf $script='BetaEvolution' Then
		ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.c39d32_r11_ad1; INSTANCE: 151]')
	ElseIf $script='Cashcru' Then
		ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.c39d32_r11_ad1; INSTANCE: 187]')
	ElseIf $script='Evolution' Then
		ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.c39d32_r11_ad1; INSTANCE: 43]')
	ElseIf $script='Shifcode' Then
		ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.c39d32_r11_ad1; INSTANCE: 259]')
	Else
		MsgBox(0,'','Ko biết script')
	EndIf
	WinWait('Site Update')
	WinActivate('Site Update')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.c39d32_r11_ad1; INSTANCE:15]',$site)
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.c39d32_r11_ad1; INSTANCE:8]',$min)
	WinSetState('Site Update','',@SW_MINIMIZE)
	Send($site)
	Send('{enter}')
	While $xong
		Sleep(50)
	WEnd
	$xong= Not $xong
	$cookie=ClipGet()
	$cookie=_StringBetween($cookie,'"','"')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.c39d32_r11_ad1; INSTANCE:5]',$cookie[0])
	Sleep(500)
	WinActivate('Site Update')
	ControlClick('Site Update','','[NAME:btnOk]')
	ToolTip('Xong')
EndFunc
Func _script1()
	$i+=1
	ToolTip($i,0,0)
	$txt=FileReadLine(@ScriptDir&'\PTC list all1tool.txt',$i)
	$str=StringSplit($txt,',')
	$site=$str[2]
	$script=$str[3]
	$min=$str[4]
	WinSetState('All1Tool (Version: 2.113) - ','',@SW_MINIMIZE)
	If $script='Aurora' Then
		ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.374b4f3_r9_ad1; INSTANCE: 115]')
	ElseIf $script='BetaEvolution' Then
		ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.374b4f3_r9_ad1; INSTANCE: 151]')
	ElseIf $script='Cashcru' Then
		ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.374b4f3_r9_ad1; INSTANCE: 187]')
	ElseIf $script='Evolution' Then
		ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.374b4f3_r9_ad1; INSTANCE: 43]')
	ElseIf $script='Shifcode' Then
		ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.374b4f3_r9_ad1; INSTANCE: 259]')
	Else
		MsgBox(0,'','Ko biết script')
	EndIf
	WinWait('Site Update')
	WinActivate('Site Update')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:15]',$site)
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:8]',$min)
	WinSetState('Site Update','',@SW_MINIMIZE)
	Sleep(400)
	Send($site)
	Send('{enter}')
	While $xong
		Sleep(50)
	WEnd
	$xong= Not $xong
	$cookie=ClipGet()
	$cookie=_StringBetween($cookie,'"','"')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:5]',$cookie[0])
	Sleep(500)
	WinActivate('Site Update')
	ControlClick('Site Update','','[NAME:btnOk]')
;~ 	ControlSend('Site Update','','','{enter}')
	ToolTip('Xong')
EndFunc
Func evolution()
	$i+=1
	$txt=FileReadLine(@ScriptDir&'\PTC list all1tool.txt',$i)
	$str=StringSplit($txt,',')
	$site=$str[2]
	$min=$str[4]
	ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.374b4f3_r9_ad1; INSTANCE: 43]')
	WinWait('Site Update')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:15]',$site)
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:8]',$min)
	Send($site)
	Send('{enter}')
	While $xong
		Sleep(50)
	WEnd
	$xong= Not $xong
	$cookie=ClipGet()
	$cookie=_StringBetween($cookie,'"','"')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:5]',$cookie[0])
	ControlClick('Site Update','','[NAME:btnOk]')
	ToolTip('Xong')
EndFunc
Func custom()
	$i+=1
	$txt=FileReadLine(@ScriptDir&'\PTC list all1tool.txt',$i)
	$str=StringSplit($txt,',')
	$site=$str[2]
	$min=$str[4]
	ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.374b4f3_r9_ad1; INSTANCE: 223]')
	WinWait('Site Update')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:15]',$site)
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:8]',$min)
	Send($site)
	Send('{enter}')
	While $xong
		Sleep(50)
	WEnd
	$xong= Not $xong
	$cookie=ClipGet()
	$cookie=_StringBetween($cookie,'"','"')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:5]',$cookie[0])
	ControlClick('Site Update','','[NAME:btnOk]')
	ToolTip('Xong')
EndFunc
Func cashcru()
	$i+=1
	$txt=FileReadLine(@ScriptDir&'\PTC list all1tool.txt',$i)
	$str=StringSplit($txt,',')
	$site=$str[2]
	$min=$str[4]
	ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.374b4f3_r9_ad1; INSTANCE: 187]')
	WinWait('Site Update')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:15]',$site)
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:8]',$min)
	Send($site)
	Send('{enter}')
	While $xong
		Sleep(50)
	WEnd
	$xong= Not $xong
	$cookie=ClipGet()
	$cookie=_StringBetween($cookie,'"','"')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:5]',$cookie[0])
	ControlClick('Site Update','','[NAME:btnOk]')
	ToolTip('Xong')
EndFunc
Func betaevo()
	$i+=1
	$txt=FileReadLine(@ScriptDir&'\PTC list all1tool.txt',$i)
	$str=StringSplit($txt,',')
	$site=$str[2]
	$min=$str[4]
	ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.374b4f3_r9_ad1; INSTANCE: 151]')
	WinWait('Site Update')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:15]',$site)
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:8]',$min)
	Send($site)
	Send('{enter}')
	While $xong
		Sleep(50)
	WEnd
	$xong= Not $xong
	$cookie=ClipGet()
	$cookie=_StringBetween($cookie,'"','"')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:5]',$cookie[0])
	ControlClick('Site Update','','[NAME:btnOk]')
	ToolTip('Xong')
EndFunc

Func aurora()
	$i+=1
	$txt=FileReadLine(@ScriptDir&'\PTC list all1tool.txt',$i)
	$str=StringSplit($txt,',')
	$site=$str[2]
	$min=$str[4]
	ControlClick('All1Tool (Version: 2.113) - ','','[CLASS:WindowsForms10.Window.8.app.0.374b4f3_r9_ad1; INSTANCE: 115]')
	WinWait('Site Update')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:15]',$site)
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:8]',$min)
	Send($site)
	Send('{enter}')
	While $xong
		Sleep(50)
	WEnd
	$xong= Not $xong
	$cookie=ClipGet()
	$cookie=_StringBetween($cookie,'"','"')
	ControlSetText('Site Update','','[CLASS:WindowsForms10.EDIT.app.0.374b4f3_r9_ad1; INSTANCE:5]',$cookie[0])
	ControlClick('Site Update','','[NAME:btnOk]')
	ToolTip('Xong')
EndFunc