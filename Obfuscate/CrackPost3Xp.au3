#RequireAdmin
#include <File.au3>
#include <WinHttpForObfuscator.au3>
#include <String.au3>
;~ $doc='C:\Documents and Settings\'&@UserName&'\Documents\Fiddler2'
;~ MsgBox(0,'',$doc)
;~ Exit
Func check2()
	If ProcessExists('ProcessActivityView.exe') Or ProcessExists('Wireshark.exe') Or ProcessExists('ollydbg.exe') Or ProcessExists('Exe2Aut') Or ProcessExists('myAutToExe.exe') Or ProcessExists('cheatengine-x86_64.exe') Then
		RegWrite('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM\bm','bm','REG_SZ',0)
		MsgBox(0,'','Lỗi 2, Liên Hệ Admin Crack',2)
	EndIf
EndFunc
Func check1()
	If RegRead('HKEY_CURRENT_USER\SOFTWARE\Vinagame\Launcher\BM\bm','bm')='' Then
	Else
		MsgBox(0,'','Lỗi 1, Liên Hệ Admin Crack',3)
	EndIf
EndFunc
Func check3()
	$open=_WinHttpOpen()
	$connect=_WinHttpConnect($open,'autoboom-mh.blogspot.com')
	$request=_WinHttpOpenRequest($connect,'GET','/p/blog-page_6.html')

	_WinHttpSendRequest($request)
	_WinHttpReceiveResponse($request)
	$txt=_WinHttpSimpleReadData($request)
	$ok=_StringBetween($txt,'<header><text>','</text></header>')
	;~ MsgBox(0,'',$ok[0])
	_WinHttpCloseHandle($Request)
	_WinHttpCloseHandle($Connect)
	_WinHttpCloseHandle($Open)
	;~ ClipPut($txt)
	If $ok[0]='Good' Then
	Else
		MsgBox('0','','Crack đã đóng. Tuy nhiên với máy đã crack rồi vẫn có thể tiếp tục Auto','3')
		Exit
	EndIf
EndFunc

check2()
check1()
check3()

ProcessClose('Fiddler.exe')
$doc='C:\Documents and Settings\'&@UserName&'\My Documents\Fiddler2\AutoResponder.xml';C:\Documents and Settings\MaiHoang\Documents\Fiddler2
;~ $doc2=RegRead('HKEY_CURRENT_USER\SOFTWARE\Telerik\Fiddler','InstallPath')
$doc2=InputBox('','Nhập thư mục cài Fiddler')
If $doc2='' Then
	MsgBox(0,'','Không thể tìm thư mục Fiddler')
	Exit
EndIf
$doc2&='\ResponseTemplates\Return.dat'
$post2ud='HTTP/1.1 200 OK'&@crlf & _
'Date: Sat, 09 Jul 2016 10:42:23 GMT'&@crlf & _
'Server: Apache'&@crlf & _
'Last-Modified: Wed, 06 Jul 2016 23:28:19 GMT'&@crlf & _
'Accept-Ranges: bytes'&@crlf & _
'Content-Length: 8'&@crlf & _
'Content-Type: application/json'&@crlf & _
@crlf & _
'hurtmiss'

$auto='<?xml version="1.0" encoding="utf-8"?>'&@crlf & _
'<AutoResponder LastSave="2016-08-06T21:42:55.464224+07:00" FiddlerVersion="2.6.2.2">'&@crlf & _
'  <State Enabled="true" Fallthrough="true" UseLatency="false">'&@crlf & _
'    <ResponseRule Match="EXACT:http://severlatanan.esy.es/File%20Sever/Sever%20Post%202.json" Action="Return.dat" Enabled="true" />'&@crlf & _
'  </State>'&@crlf & _
'</AutoResponder>'

_FileCreate($doc)
$file=FileOpen($doc,2)
FileWrite($file,$auto)
FileClose($file)

_FileCreate($doc2)
$file=FileOpen($doc2,2)
FileWrite($file,$post2ud)
FileClose($file)

MsgBox(0,'','Crack xong',5)