#RequireAdmin
#include <File.au3>
#include <IE.au3>
#include <String.au3>
#include <Array.au3>
#include <FF.au3>

HotKeySet('{F4}','pause')
Global $ten,$link,$id

Func pause()
	$a=MsgBox(4,'Cập nhật không?',$ten)
	If $a=6 Then
		_IECreate($link)
		_FFStart('http://phimtuan.net/admin/films/'&$id&'/episodes')
	EndIf
	MsgBox(0,'','Cập nhật đi!!')
EndFunc

Global $str1[100],$u,$stt,$iii,$tapmoi,$stt1,$str2=''
$file=@ScriptDir&'\tenfile.txt'
$line=_FileCountLines($file)
Local $tenfile[$line+1]
For $i=1 To $line
	$tenfile[$i]=FileReadLine($file,$i)
Next

For $ii=1 To UBound($tenfile)-1
	$file=@ScriptDir&'\'&$tenfile[$ii]&'.csv'
	$line=_FileCountLines($file)
	TrayTip('Renew',$tenfile[$ii],2)
	$str2&=$tenfile[$ii]&@CRLF
	For $i=2 To $line
		Local $dong[$line+1]
		$dong[$i]=FileReadLine($file,$i)
		$muc=StringSplit($dong[$i],',')
		$id=$muc[1]
		$title=$muc[2]
		If $id<>'' Then
			$link=$muc[4]
			$banquyen=$muc[7]
			$tap=$muc[8]
			$status=$muc[9]
			If StringInStr($status,'xong')<>0 Or StringInStr($banquyen,'bản quyền')<>0 Then
			ElseIf $tap='' Or $tap=' ' Then
			Else
				$a=StringRegExp($muc[8], '\d+', 1)
				$tap=$a[0]
				$str2&=$id&','&$title&','&renewtap()&@CRLF
			EndIf
		EndIf
	Next
	$str2&=@CRLF
Next
$hopen=FileOpen(@ScriptDir&'\renew.txt',2)
FileClose($hopen)
FileWrite(@ScriptDir&'\renew.txt',$str2)
Run('notepad.exe'&' '&@ScriptDir&'\renew.txt',@WindowsDir,@SW_MAXIMIZE)
MsgBox(0,'','Xong',3)

Func renewtap()
	$linkrenew='http://phimtuan.net/admin/films/'&$id&'/episodes/create'
	$ie1=_IECreate($linkrenew,0,0)
	$txt=_IEBodyReadHTML($ie1)
	$string=_StringBetween($txt,'<input name="name"','</div>')
	$string=_StringBetween($string[0],'value="','">')
	_IEQuit($ie1)
	Return $string[0]-1
EndFunc
