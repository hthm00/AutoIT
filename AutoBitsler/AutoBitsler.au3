#RequireAdmin
#include <FF.au3>
#include 'BigNum.au3'

Global $debugmode=0
Global $bet1='0.00000001',$bet2=$bet1
Global $lan=1,$tang=1.9,$gioihan=9

HotKeySet('{f4}','_exit')
Func _exit()
	Exit
EndFunc
$ff = __FFStartProcess('https://www.bitsler.com/play', False, 'Profile1', False, False, 4243)
;~ ClipPut(_FFReadHTML())
$balance1=_FFCmd(".getElementsByClassName('text-thin mar-no balance-btc-html')[0].innerHTML")
;~ $balanceobj=_FFObjGet('text-thin mar-no balance-btc-html','class')
;~ $balance1=Execute(_FFGetValue($balanceobj))
If $debugmode Then MsgBox(0,'',$balance1)
_FFSetValue($bet1,'amount','id')
While 1
	Do
		$roll=_FFCmd(".getElementById('btn-bet-dice').innerHTML")
	Until Not StringInStr($roll,'Rolling...')
	_FFClick('btn-bet-dice','id')
	While 1
		$balance2=_FFCmd(".getElementsByClassName('text-thin mar-no balance-btc-html')[0].innerHTML")
		$compare=_BigNum_Compare($balance1,$balance2)
		If $compare=0 Then
		ElseIf $compare=-1 Then
			$lan=1
			If $debugmode Then MsgBox(0,'',$balance1&' '&$balance2)
			$balance1=$balance2
			$bet1=$bet2
			If $debugmode Then MsgBox(0,'','Tăng'&$bet1)
			_FFSetValue($bet1,'amount','id')
			ExitLoop
		ElseIf $compare=1 Then
			$lan+=1
			If $debugmode Then MsgBox(0,'',$balance1&' '&$balance2)
			$balance1=$balance2
			$bet1=_BigNum_Mul($bet1,$tang)
			If $lan=$gioihan Then
				$bet1=$bet2
				$lan=1
			EndIf
			If $debugmode Then MsgBox(0,'','Giảm'&$bet1)
			_FFSetValue($bet1,'amount','id')
			ExitLoop
		EndIf
	WEnd
	If $debugmode Then MsgBox(0,'','Xong')
	Sleep(1000)
WEnd
