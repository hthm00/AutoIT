;#RequireAdmin

#include <File.au3>

HotKeySet('{f1}', 'copyCard')
HotKeySet('{f2}', 'fillIn')
HotKeySet('{f4}', '_exit')
HotKeySet('{f3}', '_switch')

Global $true = True

While 1
	Sleep(400)
WEnd

Func _switch()
	$true = Not $true
EndFunc

Func _exit()
	Exit
EndFunc

Func copyCard()
	$liveCard = ClipGet()
	_FileCreate(@ScriptDir & '\liveCard.txt')
	$file = FileOpen(@ScriptDir & '\liveCard.txt', 2)
	FileWrite($file, $liveCard)

EndFunc

Func fillIn()
	$file = FileOpen(@ScriptDir & '\liveCard.txt')
	For $i = 1 To _FileCountLines(@ScriptDir & '\liveCard.txt')
		$line = FileReadLine($file, $i)
		$str = StringSplit($line, '|')
		$cc = StringRight($str[2], 16)
		$month = $str[3]
		$year = StringRight($str[4], 2)
		$ccv = StringLeft($str[5], 3)
		;ConsoleWrite($cc & ' ' & $month & ' ' & $year & ' ' & $ccv & @CRLF)
		Send('^{a}')
		Sleep(100)
		Send($cc)
		Sleep(100)
		Send('{tab}')
		Send($month)
		Sleep(100)
		Send('{tab}')
		Send('y')
		For $ii = 0 To $year-18
			Send('{down}')
		Next
		Sleep(100)
		Send('{tab}')
		Send($ccv)
		Sleep(100)
		Send('{tab}')
		Send('{tab}')
		;Sleep(100)
		Send('{tab}')
		;Sleep(100)
		Send('{tab}')
		;Sleep(100)
		Send('{enter}')
		Sleep(4000); www.spotify.com/purchase/campaign/sixty-days-trial
		Send('+{tab}')
		Send('+{tab}')
		Send('+{tab}')
		Send('+{tab}')
		Send('+{tab}')
		Send('+{tab}')
		Send('+{tab}')
		Sleep(100)
		;;$true = True
		;;While $true
			Sleep(400)
		;;WEnd
	Next

EndFunc