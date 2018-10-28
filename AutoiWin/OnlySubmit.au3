#Include <9kwclient.au3>
#cs ----------------------------------------------------------------------------

	  Captcha 9kw.eu API Port for autoit (only submit)

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

; Captcha einreichen und daten holen / Submit captcha and get data
$9kwResult = _9kwUploadAndGetText("test.png",$9kwOptions); Bild / Picture

; Ergebnis / Result
;~ ConsoleWrite ( "CaptchaID: " & $9kwResult[0] & @CRLF)
;~ ConsoleWrite ( "Text: " & $9kwResult[1] & @CRLF)

; Rückmeldung / Feedback / Report (OK/NotOK)
;~ If $9kwResult[1] == "2C888V" Or $9kwResult[1] == "2c888v" Then
;~ 	ConsoleWrite ( "Correct answer: " & $9kwResult[1] & @CRLF); Richtige Antwort / Correct answer
;~ 	_9kw_report($9kwResult[0],"1"); 1=OK
;~ Else
;~ 	ConsoleWrite ( "Wrong answer: " & $9kwResult[1] & @CRLF); Falsche Antwort / Wrong answer
;~ 	_9kw_report($9kwResult[0],"2"); 2=NotOK
;~ EndIf
exit

