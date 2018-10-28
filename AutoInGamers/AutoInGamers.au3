#RequireAdmin
#include <FF.au3>
#include <String.au3>
#include <Array.au3>

Global $debugmode=1

HotKeySet('{f4}','_exit')
Func _exit()
	Exit
EndFunc
$ff = __FFStartProcess('http://ingamers.net/', False, 'Profile1', False, False, 4243)
$txt=_FFReadHTML()
$id=_StringBetween($txt,'http://ingamers.net/games/single/','"')
If Not @error Then
	For $temp2=3 To UBound($id)-1
		_FFOpenURL('http://ingamers.net/games/single/'&$id[$temp2])
		_FFCmd(".getElementById('gameContainer').innerHTML=''")
;~ 		MsgBox(0,'','')
		For $temp=1 To Random(2000,4000,1)
			_FFClick('btn btn-primary','class',2)
	;~ 		Sleep(Random(1000,3000,1))
		Next
	Next
ElseIf $debugmode Then
	ClipPut($txt)
EndIf


;~ While 1
;~ 	$txt=_FFReadHTML()
;~ 	$id=_StringBetween($txt,'http://infinitytrafficboost.com/recommends.php','"')
;~ 	If Not @error Then
;~ 		_FFTabAdd('http://infinitytrafficboost.com/recommends.php'&$id[0])
;~ 		ExitLoop
;~ 	EndIf
;~ WEnd