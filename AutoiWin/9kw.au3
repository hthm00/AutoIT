#Include <9kwclient.au3>
#cs ----------------------------------------------------------------------------

	  Captcha 9kw.eu API Port for autoit

	  DE: http://www.9kw.eu/api_de.html
	  EN: http://www.9kw.eu/api_en.html

#ce ----------------------------------------------------------------------------

; Dein API Key / Your API Key: http://www.9kw.eu/userapi.html
$9kwApiKey = ""

; Fehlermeldungen als MsgBox oder in der Konsole / Errormessages as msgbox or consolewrite
$9kwMsgBox = "1";

; Debug (1=On, 0=Off)
$9kwDebug = "0"

; Serverdaten / Servercheck
$9kwServercheck = _9kwGetServerdata()
ConsoleWrite ( "Servercheck: " & $9kwServercheck & @CRLF )

; Guthaben / Credits
$9kwBalance = _9kwGetBalance(); call for check credits
ConsoleWrite ( "Credits: " & $9kwBalance & @CRLF )

;
; Neues Captcha holen / Get new captcha
;
$captchaID = _9kw_usercaptchanew()
ConsoleWrite ( "CaptchaID: " & $captchaID & @CRLF)
    If Not StringRegExp($captchaID, "\A([0-9]+)\z", 0) Then
		MsgBox(4096, "Captcha 9kw.eu", "No correct captchaID !")
		Exit
	EndIf
;
; Captcha skip
;
; 0 = SKIP
; 1 = SKIP + ENDE
;_9kw_usercaptchaskip($captchaID,"1")

;
; Neues Captcha anzeigen / Show new captcha
;

If $captchaID = "" Then
   ConsoleWrite ( "Kein neues Captcha" & @CRLF); No new captcha
Else
   $Bild = _9kw_usercaptchashow($captchaID)
   FileDelete("testdata.png")
   $hFile = FileOpen("testdata.png", 18)
   FileWrite($hFile, $Bild)
   FileClose($hFile)

   ;
   ; Captcha antwort senden / Send captcha answer
   ;
   $antwort = "2C888V"
   $return = _9kw_usercaptchacorrect($captchaID,$antwort)
   ConsoleWrite ( "Antwort: " & $return & @CRLF); Answer (captcha)
EndIf

;
; Captcha einreichen / Submit captcha
;

; Optionen / Options
$9kwOptions[1] = "0";math
$9kwOptions[2] = "0";mouse
$9kwOptions[3] = "0";phrase
$9kwOptions[4] = "0";numeric
$9kwOptions[5] = "1";min_len
$9kwOptions[6] = "50";max_len"
$9kwOptions[7] = "0";case-sensitive

; Bestätigung / Confirm (Cost +6)
$9kwOptions[8] = "0";confirm - 0=Off, 1=On

; Mehr Priorität / More Priority (Cost +1-20)
$9kwOptions[9] = "0";prio 1-20

; Max. Wartezeit in Sekunden / Max. Timeout in seconds
$9kwOptions[10] = "900";maxtimeout 60-3999 (Default 900)

$captchaIDnew = _9kw_usercaptchaupload("test.png",$9kwOptions); Bild / Picture (Submit)
ConsoleWrite ( "CaptchaIDnew: " & $captchaIDnew & @CRLF)
If Not StringRegExp($captchaIDnew, "\A([0-9]+)\z", 0) Then
	MsgBox(4096, "Captcha 9kw.eu", "No correct captchaIDnew !")
	Exit
EndIf
;
; Captcha daten holen / Get captcha data
;
Sleep(10000)

For $counter = 10 to 1000
   $newreturn = _9kw_usercaptchacorrectdata($captchaIDnew)
   ;ConsoleWrite ( "Ergebnis: " & $captchaIDnew & @CRLF); Result

   If $newreturn = "" Then
   Else
	  If $newreturn == "2C888V" Or $newreturn == "2c888v" Then
		 ConsoleWrite ( "Richtige Antwort: " & $newreturn & @CRLF); Correct answer
		 _9kw_usercaptchacorrectback($captchaIDnew,"1"); OK
	  Else
		 ConsoleWrite ( "Falsche Antwort: " & $newreturn & @CRLF); Wrong answer
		 _9kw_usercaptchacorrectback($captchaIDnew,"2"); NOT OK
	  EndIf
	  ExitLoop
   EndIf
    Sleep(1000)
 Next

 exit

