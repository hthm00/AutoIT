#RequireAdmin
Global $i

For $i=1 To 200
	If WinExists('Join Network') Then
		$txt='csm-pmtt00'&$i
		ControlSetText('Join Network','','[Class:Edit; Instance:1]',$txt)
		ControlSetText('Join Network','','[Class:Edit; Instance:2]','123456')
		ControlClick('Join Network','','[Class:Button; Instance:2]')
		Sleep(1500)
	Else
		$i=$i-1
	EndIf
Next