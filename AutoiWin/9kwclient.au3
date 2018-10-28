#include <WinHTTP.au3>
#Include <Base64.au3>

#cs ----------------------------------------------------------------------------

	  Captcha 9kw.eu API Port for autoit

	  DE: http://www.9kw.eu/api_de.html
	  EN: http://www.9kw.eu/api_en.html

#ce ----------------------------------------------------------------------------

Global $9kwDebug = ""
Global $9kwMsgBox = ""
Global $9kwApiKey = "VWKB6FRQBSJOMZ1QHI"
Global $9kwOptions[11]
Global $9kwCredits = ""
Global $hSession, $hConnect

Func _9kwMsg($newmsg)
	if $9kwMsgBox = "1" Then
		MsgBox(4096, "Captcha 9kw.eu", $newmsg)
	Else
		ConsoleWrite($newmsg);
	EndIf
	Exit
EndFunc

Func _9kwCheckApiKey()
	If $9kwApiKey = "" Or Not StringRegExp($9kwApiKey, "\A([a-zA-Z0-9]{5,50})\z", 0) Then
		_9kwMsg("No correct API-Key or Type/Value set")
	EndIf
EndFunc

Func _9kwGetBalance()
	_9kwCheckApiKey()

	local $hSession = _WinHttpOpen("")
	local $hConnect = _WinHttpConnect($hSession, "www.9kw.eu")
    $sReturn = _WinHttpSimpleRequest($hConnect, "GET", "index.cgi?action=usercaptchaguthaben&source=autoitapi&apikey=" & $9kwApiKey)
    _WinHttpCloseHandle($hConnect)
    _WinHttpCloseHandle($hSession)

    If StringRegExp($sReturn, "\A([0-9]{4}) ", 0) Then
		_9kwMsg("No correct API-Key or Type/Value set")
		Return 0
	EndIf

	Return $sReturn
EndFunc

Func _9kwGetServerdata()
	_9kwCheckApiKey()

	local $hSession = _WinHttpOpen("")
	local $hConnect = _WinHttpConnect($hSession, "www.9kw.eu")
    $sReturn = _WinHttpSimpleRequest($hConnect, "GET", "grafik/servercheck.txt")
    _WinHttpCloseHandle($hConnect)
    _WinHttpCloseHandle($hSession)

	Return $sReturn
EndFunc

Func _9kw_usercaptchanew()
	_9kwCheckApiKey()

	local $hSession = _WinHttpOpen("")
	local $hConnect = _WinHttpConnect($hSession, "www.9kw.eu")
    $sReturn = _WinHttpSimpleRequest($hConnect, "GET", "index.cgi?action=usercaptchanew&source=autoitapi&debug="&$9kwDebug&"&nocaptcha=1&apikey=" & $9kwApiKey)
    _WinHttpCloseHandle($hConnect)
    _WinHttpCloseHandle($hSession)
	Return $sReturn
 EndFunc

Func _9kw_usercaptchacorrect($captcha,$antwortnew)
	_9kwCheckApiKey()

	local $hSession = _WinHttpOpen("")
	local $hConnect = _WinHttpConnect($hSession, "www.9kw.eu")
	local $answer = _URIEncode($antwortnew)
	$sReturn = _WinHttpSimpleRequest($hConnect, "GET", "index.cgi?action=usercaptchacorrect&source=autoitapi&debug="&$9kwDebug&"&id="&$captcha&"&antwort="&$answer&"&apikey=" & $9kwApiKey)
	_WinHttpCloseHandle($hConnect)
	_WinHttpCloseHandle($hSession)
	Return $sReturn
EndFunc


Func _9kw_usercaptchaskip($captcha,$end)
	_9kwCheckApiKey()

	local $hSession = _WinHttpOpen("")
	local $hConnect = _WinHttpConnect($hSession, "www.9kw.eu")
	$sReturn = _WinHttpSimpleRequest($hConnect, "GET", "index.cgi?action=usercaptchaskip&source=autoitapi&end="&$end&"&debug="&$9kwDebug&"&id="&$captcha&"&apikey=" & $9kwApiKey)
	_WinHttpCloseHandle($hConnect)
	_WinHttpCloseHandle($hSession)
	Return $sReturn
EndFunc

Func _9kw_usercaptchacorrectdata($captcha)
	_9kwCheckApiKey()

	local $hSession = _WinHttpOpen("")
	local $hConnect = _WinHttpConnect($hSession, "www.9kw.eu")
	$sReturn = _WinHttpSimpleRequest($hConnect, "GET", "index.cgi?action=usercaptchacorrectdata&source=autoitapi&debug="&$9kwDebug&"&id="&$captcha&"&apikey=" & $9kwApiKey)
	_WinHttpCloseHandle($hConnect)
	_WinHttpCloseHandle($hSession)
	Return $sReturn
EndFunc

Func _9kw_report($captcha,$correct)
	Return _9kw_usercaptchacorrectback($captcha,$correct)
EndFunc

Func _9kw_usercaptchacorrectback($captcha,$correct)
	_9kwCheckApiKey()

	local $hSession = _WinHttpOpen("")
	local $hConnect = _WinHttpConnect($hSession, "www.9kw.eu")
	$sReturn = _WinHttpSimpleRequest($hConnect, "GET", "index.cgi?action=usercaptchacorrectback&source=autoitapi&debug="&$9kwDebug&"&correct="&$correct&"&id="&$captcha&"&apikey=" & $9kwApiKey)
	_WinHttpCloseHandle($hConnect)
	_WinHttpCloseHandle($hSession)
	Return $sReturn
EndFunc

Func _9kw_usercaptchashow($captcha)
	_9kwCheckApiKey()

	local $hSession = _WinHttpOpen("")
	local $hConnect = _WinHttpConnect($hSession, "www.9kw.eu")
	$sReturn = _WinHttpSimpleRequest($hConnect, "GET", "index.cgi?action=usercaptchashow&source=autoitapi&debug="&$9kwDebug&"&id="&$captcha&"&apikey=" & $9kwApiKey, Default, Default, Default, Default, 2)
	_WinHttpCloseHandle($hConnect)
	_WinHttpCloseHandle($hSession)

	Return $sReturn
EndFunc

Func _9kwUploadAndGetText($value, ByRef $refvalue)
	local $result[2];
	_9kwCheckApiKey()

	$result[0] = _9kw_usercaptchaupload($value,$refvalue);

    If Not StringRegExp($result[0], "\A([0-9]+)\z", 0) Then
		_9kwMsg($result[0])
	EndIf
	Sleep(10000)

	For $counter = 10 to 1000
		$result[1] = _9kw_usercaptchacorrectdata($result[0])

		If Not $result[1] = "" Then
			ExitLoop
		EndIf
		Sleep(4000)
	Next

	return $result;
EndFunc

Func _9kw_usercaptchaupload($value, ByRef $refvalue)
	Local $aRet[2]
	_9kwCheckApiKey()

	local $maxtimeout = $refvalue[10]
	If Not StringRegExp($maxtimeout, "\A([0-9]+)\z", 0) Then
		$maxtimeout = 900
	EndIf
	local $confirm = $refvalue[8]
	local $math = $refvalue[1]
	local $mouse = $refvalue[2]
	local $phrase = $refvalue[3]
	local $numeric = $refvalue[4]
	local $min_len = $refvalue[5]
	local $max_len = $refvalue[6]
	local $case_sensitive = $refvalue[7]
	local $prio = $refvalue[9]


	local $hSession = _WinHttpOpen("")
	local $hConnect = _WinHttpConnect($hSession, "www.9kw.eu")

	$fh=FileOpen($value,16)
	$image=FileRead($fh)
	FileClose($fh)
	$newresult = _Base64Encode($image)

	Dim $aFields[16][3] = [["apikey", $9kwApiKey],["prio", $prio],["confirm", $confirm],["mouse", $mouse],["phrase", $phrase],["numeric", $numeric],["min_len", $min_len],["max_len", $max_len],["case-sensitive", $case_sensitive],["nomd5", "1"],["maxtimeout", $maxtimeout],["source", "autoitapi"],["base64", "1"],["file-upload-01", $newresult],["debug", $9kwDebug],["action", "usercaptchaupload"]]
	$aMultiPart = __EncodeMultipartFormData($aFields)
	$sReturn = _WinHttpSimpleRequest($hConnect, "POST", "/index.cgi", "", $aMultiPart[1], "Content-Type: multipart/form-data; boundary=" & $aMultiPart[0])
	_WinHttpCloseHandle($hConnect)
	_WinHttpCloseHandle($hSession)

	Return $sReturn
EndFunc

Func _URIEncode($sData)
    Local $aData = StringSplit(BinaryToString(StringToBinary($sData,4),1),"")
    Local $nChar
    $sData=""
    For $i = 1 To $aData[0]
	   ; ConsoleWrite($aData[$i] & @CRLF)
        $nChar = Asc($aData[$i])
        Switch $nChar
            Case 45, 46, 48 To 57, 65 To 90, 95, 97 To 122, 126
                $sData &= $aData[$i]
            Case 32
                $sData &= "+"
            Case Else
                $sData &= "%" & Hex($nChar,2)
        EndSwitch
    Next
    Return $sData
EndFunc

Func _URIDecode($sData)
    Local $aData = StringSplit(StringReplace($sData,"+"," ",0,1),"%")
    $sData = ""
    For $i = 2 To $aData[0]
        $aData[1] &= Chr(Dec(StringLeft($aData[$i],2))) & StringTrimLeft($aData[$i],2)
    Next
    Return BinaryToString(StringToBinary($aData[1],1),4)
EndFunc

 Func __EncodeMultipartFormData($aFields)
    #cs Arrayaufbau:
        [x][0] = Name
        [x][1] = Content (normal: "")
        [x][2] = File (normal: "")
    #ce

    Local $sBoundary = StringFormat("%s%.5f", "----BoundaryLine_", Random(10000, 99999))
    Local $sData, $hOpen, $sFile, $aTempArray

    For $i = 0 To UBound($aFields, 1) - 1
        If $aFields[$i][2] <> '' Then
            $hOpen = FileOpen($aFields[$i][2], 0)
            $sFile = FileRead($hOpen)
            FileClose($hOpen)
            $sData &= "--" & $sBoundary & @CRLF & _
                    'Content-Disposition: form-data; name="' & $aFields[$i][0] & '"; filename="' & StringRegExpReplace($aFields[$i][2], ".*\\", "") & '"' & @CRLF & _
                    "Content-Type: " & __MIMEType($aFields[$i][2]) & @CRLF & @CRLF & _
                    $sFile & @CRLF
        Else
            $sData &= "--" & $sBoundary & @CRLF & _
                    'Content-Disposition: form-data; name="' & $aFields[$i][0] & '"' & @CRLF & @CRLF & _
                    $aFields[$i][1] & @CRLF
        EndIf
    Next
    $sData &= "--" & $sBoundary & "--"
    Dim $aTempArray[2] = [$sBoundary, $sData]
    Return $aTempArray
 EndFunc

Func __MIMEAssocString();Aus der WinHTTP.au3
    Return ";ai|application/postscript;aif|audio/x-aiff;aifc|audio/x-aiff;aiff|audio/x-aiff;asc|text/plain;atom|application/atom+xml;au|audio/basic;avi|video/x-msvideo;bcpio|application/x-bcpio;bin|application/octet-stream;bmp|image/bmp;cdf|application/x-netcdf;cgm|image/cgm;class|application/octet-stream;cpio|application/x-cpio;cpt|application/mac-compactpro;csh|application/x-csh;css|text/css;dcr|application/x-director;dif|video/x-dv;dir|application/x-director;djv|image/vnd.djvu;djvu|image/vnd.djvu;dll|application/octet-stream;dmg|application/octet-stream;dms|application/octet-stream;doc|application/msword;dtd|application/xml-dtd;dv|video/x-dv;dvi|application/x-dvi;dxr|application/x-director;eps|application/postscript;etx|text/x-setext;exe|application/octet-stream;ez|application/andrew-inset;gif|image/gif;gram|application/srgs;grxml|application/srgs+xml;gtar|application/x-gtar;hdf|application/x-hdf;hqx|application/mac-binhex40;htm|text/html;html|text/html;ice|x-conference/x-cooltalk;ico|image/x-icon;ics|text/calendar;ief|image/ief;ifb|text/calendar;iges|model/iges;igs|model/iges;jnlp|application/x-java-jnlp-file;jp2|image/jp2;jpe|image/jpeg;jpeg|image/jpeg;jpg|image/jpeg;js|application/x-javascript;kar|audio/midi;latex|application/x-latex;lha|application/octet-stream;lzh|application/octet-stream;m3u|audio/x-mpegurl;m4a|audio/mp4a-latm;m4b|audio/mp4a-latm;m4p|audio/mp4a-latm;m4u|video/vnd.mpegurl;m4v|video/x-m4v;mac|image/x-macpaint;man|application/x-troff-man;mathml|application/mathml+xml;me|application/x-troff-me;mesh|model/mesh;mid|audio/midi;midi|audio/midi;mif|application/vnd.mif;mov|video/quicktime;movie|video/x-sgi-movie;mp2|audio/mpeg;mp3|audio/mpeg;mp4|video/mp4;mpe|video/mpeg;mpeg|video/mpeg;mpg|video/mpeg;mpga|audio/mpeg;ms|application/x-troff-ms;msh|model/mesh;mxu|video/vnd.mpegurl;nc|application/x-netcdf;oda|application/oda;ogg|application/ogg;pbm|image/x-portable-bitmap;pct|image/pict;pdb|chemical/x-pdb;pdf|application/pdf;pgm|image/x-portable-graymap;pgn|application/x-chess-pgn;pic|image/pict;pict|image/pict;png|image/png;pnm|image/x-portable-anymap;pnt|image/x-macpaint;pntg|image/x-macpaint;ppm|image/x-portable-pixmap;ppt|application/vnd.ms-powerpoint;ps|application/postscript;qt|video/quicktime;qti|image/x-quicktime;qtif|image/x-quicktime;ra|audio/x-pn-realaudio;ram|audio/x-pn-realaudio;ras|image/x-cmu-raster;rdf|application/rdf+xml;rgb|image/x-rgb;rm|application/vnd.rn-realmedia;roff|application/x-troff;rtf|text/rtf;rtx|text/richtext;sgm|text/sgml;sgml|text/sgml;sh|application/x-sh;shar|application/x-shar;silo|model/mesh;sit|application/x-stuffit;skd|application/x-koan;skm|application/x-koan;skp|application/x-koan;skt|application/x-koan;smi|application/smil;smil|application/smil;snd|audio/basic;so|application/octet-stream;spl|application/x-futuresplash;src|application/x-wais-source;sv4cpio|application/x-sv4cpio;sv4crc|application/x-sv4crc;svg|image/svg+xml;swf|application/x-shockwave-flash;t|application/x-troff;tar|application/x-tar;tcl|application/x-tcl;tex|application/x-tex;texi|application/x-texinfo;texinfo|application/x-texinfo;tif|image/tiff;tiff|image/tiff;tr|application/x-troff;tsv|text/tab-separated-values;txt|text/plain;ustar|application/x-ustar;vcd|application/x-cdlink;vrml|model/vrml;vxml|application/voicexml+xml;wav|audio/x-wav;wbmp|image/vnd.wap.wbmp;wbmxl|application/vnd.wap.wbxml;wml|text/vnd.wap.wml;wmlc|application/vnd.wap.wmlc;wmls|text/vnd.wap.wmlscript;wmlsc|application/vnd.wap.wmlscriptc;wrl|model/vrml;xbm|image/x-xbitmap;xht|application/xhtml+xml;xhtml|application/xhtml+xml;xls|application/vnd.ms-excel;xml|application/xml;xpm|image/x-xpixmap;xsl|application/xml;xslt|application/xslt+xml;xul|application/vnd.mozilla.xul+xml;xwd|image/x-xwindowdump;xyz|chemical/x-xyz;zip|application/zip;"
EndFunc

Func __MIMEType($sFileName) ;Aus der WinHTTP.au3
    Local $aArray = StringRegExp(__MIMEAssocString(), "(?i)\Q;" & StringRegExpReplace($sFileName, ".*\.", "") & "\E\|(.*?);", 3)
    If @error Then Return "application/octet-stream"
    Return $aArray[0]
EndFunc