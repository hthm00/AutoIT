#RequireAdmin
#include <FF.au3>
#include <String.au3>
#include <Array.au3>
#include <WinHttp.au3>
#include <String.au3>

Global $debugmode=0

HotKeySet('{f4}','_exit')
Func _exit()
	Exit
EndFunc
$ff = __FFStartProcess('http://infinitytrafficboost.com/dashboard.php', False, 'Profile1', False, False, 4243)

$cookie=_FFGetCookie('infinitytrafficboost.com')
;~ MsgBox(0,'',$cookie)
;~ $cookie1=StringSplit($cookie,';')
;~ If UBound($cookie1)>=25 Then
;~ 	$cookie=$cookie1[1]&'; '&$cookie1[8]&'; '&$cookie1[15]&'; '&$cookie1[23]&'; '&$cookie1[3]&'; '&$cookie1[7]&'; '&$cookie1[24]&'; '&$cookie1[14]&'; '&$cookie1[21]&'; '&$cookie1[16]&'; '&$cookie1[17]&'; '&$cookie1[18]&'; '&$cookie1[19]&'; '&$cookie1[20]&'; '&$cookie1[22]
;~ Else
;~ 	MsgBox(0,'Error', 'Không thể lấy cookie',3)
;~ 	ExitLoop(2)
;~ EndIf

$open = _WinHttpOpen()
$connect = _WinHttpConnect($open, 'infinitytrafficboost.com')
$request = _WinHttpOpenRequest($connect, 'GET', '/dashboard3.php',Default,'https://infinitytrafficboost.com/dashboard.php',Default,$WINHTTP_FLAG_SECURE)
_WinHttpAddRequestHeaders($request,'Host: infinitytrafficboost.com')
_WinHttpAddRequestHeaders($request,'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0')
_WinHttpAddRequestHeaders($request,'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8')
_WinHttpAddRequestHeaders($request,'Accept-Language: en-US,en;q=0.5')
_WinHttpAddRequestHeaders($request,'Cookie: '&$cookie)
_WinHttpAddRequestHeaders($request,'Connection: keep-alive')
_WinHttpAddRequestHeaders($request,'Upgrade-Insecure-Requests: 1')
_WinHttpSendRequest($request)
_WinHttpReceiveResponse($request)
$response = _WinHttpSimpleReadData($request)
$sHeader = _WinHttpQueryHeaders($Request)
;~ ClipPut($response)
;~ MsgBox(0,'',$response)
;~ MsgBox(0,'',$response&@CRLF&$sHeader)
$id=_StringBetween($response,"http://infinitytrafficboost.com/recommends.php?","'")
If Not @error Then
	$id=$id[0]
;~ 	MsgBox(0,'',$id)
Else
	MsgBox(0,'','')
EndIf
;~ $cookie='__cfduid=d3b453666f0e41f80feae7aab2d5a21cb1491107480; random=1; emailx=davidhthm%40gmail.com; login=yes; viralLikePage=1; key=%2AAffiliateLink; MSB_test=1; MSB_7230_2680=1; MSB_7230_2859=1; MSB_7230_2962=1; MSB_7230_3053=1; MSB_7230_629=1; MSB_7230_1250=1; aff=0; MSB_7230_2724=1; MSB_7230_2838=1; MSB_7230_728=1; PHPSESSID=7c5c1445096b948e989daa6254f981c6'
$request = _WinHttpOpenRequest($connect, 'GET', '/recommends.php?'&$id,Default,Default,Default)
_WinHttpAddRequestHeaders($request,'Host: infinitytrafficboost.com')
_WinHttpAddRequestHeaders($request,'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0')
_WinHttpAddRequestHeaders($request,'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8')
_WinHttpAddRequestHeaders($request,'Accept-Language: en-US,en;q=0.5')
_WinHttpAddRequestHeaders($request,'Cookie: '&$cookie)
_WinHttpAddRequestHeaders($request,'Connection: keep-alive')
_WinHttpAddRequestHeaders($request,'Upgrade-Insecure-Requests: 1')
_WinHttpSendRequest($request)
_WinHttpReceiveResponse($request)
$response = _WinHttpSimpleReadData($request)
$sHeader = _WinHttpQueryHeaders($Request)
;~ ClipPut($response)
;~ MsgBox(0,'',$response&@CRLF&$sHeader&$cookie)
$recommend2=_StringBetween($response,'<frame src="//','"')
If Not @error Then
	$recommend2='http://'&$recommend2[0]
;~ 	MsgBox(0,'',$recommend2)
Else
	MsgBox(0,'','')
EndIf
$request = _WinHttpOpenRequest($connect, 'GET', '/recommends2.php?'&$id&'&gvid=',Default,$recommend2,Default)
_WinHttpAddRequestHeaders($request,'Host: infinitytrafficboost.com')
_WinHttpAddRequestHeaders($request,'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0')
_WinHttpAddRequestHeaders($request,'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8')
_WinHttpAddRequestHeaders($request,'Accept-Language: en-US,en;q=0.5')
_WinHttpAddRequestHeaders($request,'Cookie: '&$cookie)
_WinHttpAddRequestHeaders($request,'Connection: keep-alive')
_WinHttpAddRequestHeaders($request,'Upgrade-Insecure-Requests: 1')
_WinHttpSendRequest($request)
_WinHttpReceiveResponse($request)
$response = _WinHttpSimpleReadData($request)
$sHeader = _WinHttpQueryHeaders($Request)
;~ ClipPut($response)
;~ MsgBox(0,'',$response&@CRLF&$sHeader)
While 1
surf()
WEnd
Func surf()
$multisurf=_StringBetween($response,'src="','"')
If Not @error Then
	$multisurf='/'&$multisurf[0]
;~ 	MsgBox(0,'',$multisurf)
Else
	MsgBox(0,'','')
EndIf
$request = _WinHttpOpenRequest($connect, 'GET', $multisurf,Default,'http://infinitytrafficboost.com/recommends2.php?'&$id&'&gvid=',Default)
_WinHttpAddRequestHeaders($request,'Host: infinitytrafficboost.com')
_WinHttpAddRequestHeaders($request,'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0')
_WinHttpAddRequestHeaders($request,'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8')
_WinHttpAddRequestHeaders($request,'Accept-Language: en-US,en;q=0.5')
_WinHttpAddRequestHeaders($request,'Cookie: '&$cookie)
_WinHttpAddRequestHeaders($request,'Connection: keep-alive')
_WinHttpAddRequestHeaders($request,'Upgrade-Insecure-Requests: 1')
_WinHttpSendRequest($request)
_WinHttpReceiveResponse($request)
$response = _WinHttpSimpleReadData($request)
$sHeader = _WinHttpQueryHeaders($Request)
;~ ClipPut($response)
;~ MsgBox(0,'',$response&@CRLF&$sHeader)
$cl=_StringBetween($response,"submitform(\'",'\')
If @error Then
	MsgBox(0,'','')
Else
	$cl=$cl[0]
EndIf
$credit=_StringBetween($response,'name="credits" value="','"')
If @error Then
	MsgBox(0,'',1)
Else
	$credit=$credit[0]
EndIf
$lid=_StringBetween($response,'name="lid" value="','"')
If @error Then
	MsgBox(0,'',2)
Else
	$lid=$lid[0]
EndIf

$datapost=$id&'&lid='&$lid&'&cl='&$cl&'&credits='&$credit
;~ MsgBox(0,'',$datapost)

$request = _WinHttpOpenRequest($connect, 'GET', '/banneraddisplay.php?'&$id&'&type=1',Default,'http://infinitytrafficboost.com'&$multisurf,Default)
_WinHttpAddRequestHeaders($request,'Host: infinitytrafficboost.com')
_WinHttpAddRequestHeaders($request,'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0')
_WinHttpAddRequestHeaders($request,'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8')
_WinHttpAddRequestHeaders($request,'Accept-Language: en-US,en;q=0.5')
_WinHttpAddRequestHeaders($request,'Cookie: '&$cookie)
_WinHttpAddRequestHeaders($request,'Connection: keep-alive')
_WinHttpAddRequestHeaders($request,'Upgrade-Insecure-Requests: 1')
_WinHttpSendRequest($request)
_WinHttpReceiveResponse($request)
$response = _WinHttpSimpleReadData($request)
$sHeader = _WinHttpQueryHeaders($Request)
;~ MsgBox(0,'',$response&@CRLF&$sHeader)
$timer=TimerInit()
Do
	Sleep(500)
Until TimerDiff($timer)>=15000
$request = _WinHttpOpenRequest($connect, 'POST', '/recommends2.php',Default,'http://infinitytrafficboost.com'&$multisurf,Default)
_WinHttpAddRequestHeaders($request,'Host: infinitytrafficboost.com')
_WinHttpAddRequestHeaders($request,'User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101 Firefox/52.0')
_WinHttpAddRequestHeaders($request,'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8')
_WinHttpAddRequestHeaders($request,'Accept-Language: en-US,en;q=0.5')
_WinHttpAddRequestHeaders($request,'Cookie: '&$cookie)
_WinHttpAddRequestHeaders($request,'Connection: keep-alive')
_WinHttpAddRequestHeaders($request,'Upgrade-Insecure-Requests: 1')
_WinHttpSendRequest($request,'Content-Type: application/x-www-form-urlencoded',$datapost,StringLen($datapost))
_WinHttpReceiveResponse($request)
$response = _WinHttpSimpleReadData($request)
$sHeader = _WinHttpQueryHeaders($Request)
;~ MsgBox(0,'',$response&@CRLF&$sHeader)
ConsoleWrite($credit&@CRLF)
EndFunc



Func _FFGetCookie($sUrl)
    Local $aArray, $sString

    $aArray = _FFGetCookieGroup($sUrl)

    For $i = 0 To UBound($aArray) - 1
        $sString &= $aArray[$i][0] & "=" & $aArray[$i][1] & "; "
    Next

    Return $sString
EndFunc
Func _FFGetCookieGroup($sUrl)
    Local $aCookies, $iCounter, $iPlace

    $aCookies = _FFGetAllCookies()

    For $i = 0 To UBound($aCookies) - 1
        If StringRegExp($aCookies[$i][2], $sURL, 0) Then $iCounter += 1
    Next

    Dim $aCookieGroup[$iCounter][2]

    For $i = 0 To UBound($aCookies) - 1
        If StringRegExp($aCookies[$i][2], $sURL, 0) Then
            $aCookieGroup[$iPlace][0] = $aCookies[$i][0]
            $aCookieGroup[$iPlace][1] = $aCookies[$i][1]
            $iPlace += 1
        EndIf
    Next

    Return $aCookieGroup
EndFunc
Func _FFGetAllCookies()
    ;~  © 4ggr35510n ©

    Local $aT, $aTA
    $sCS = _FFCmd("var cookiestring='';var cookieManager=Components.classes['@mozilla.org/cookiemanager;1'].getService(Components.interfaces.nsICookieMana"& _
    "ger);var iter=cookieManager.enumerator;while(iter.hasMoreElements()){var cookie=iter.getNext();if(cookie instanceof Components.interfaces.nsICookie){"& _
    "cookiestring+=cookie.name+'='+cookie.value+'='+cookie.host+';';}};cookiestring;")
    $aTA = StringSplit($sCS, ';')
    Local $aCA[$aTA[0]-1][3]
    For $i = 1 to $aTA[0] - 1
        $aT = StringSplit($aTA[$i], '=')
        $aCA[$i-1][0] = $aT[1]
        If $aT[0] > 3 Then  ; in case that cookie.value contains equals signs '=' [ it's more common then you think! ]
            For $j = 2 to $aT[0] - 1
                $aCA[$i-1][1] &= $aT[$j] & '='
            Next
            $aCA[$i-1][1] &= $aT[$aT[0]-1]
        Else
            $aCA[$i-1][1] &= $aT[2]
        EndIf
        $aCA[$i-1][2] = $aT[$aT[0]]
    Next
    Return $aCA

    ;~  © 4ggr35510n ©
EndFunc
;~ While 1
;~ 	$txt=_FFReadHTML()
;~ 	$id=_StringBetween($txt,'http://infinitytrafficboost.com/recommends.php','"')
;~ 	If Not @error Then
;~ 		_FFTabAdd('http://infinitytrafficboost.com/recommends.php'&$id[0])
;~ 		ExitLoop
;~ 	EndIf
;~ WEnd