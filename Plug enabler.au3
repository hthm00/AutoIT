#RequireAdmin
For $i=1 to 10
	$txt='[Class:TRadio; Instance:'&$i&']'
ControlEnable('Plug 6.19','',"[Class:TTRadioButton; Instance:1]")

;~ ControlCommand('Plug 6.19','',$txt,'Check')
;BAOCB94C3F74638E2769F04AB73C732BA64

;~ ControlSetText('Serial Number','','[Class:TInput; Instance:3]','1')
Next