#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include <WinAPI.au3>
#include <WindowsConstants.au3>
#include <StructureConstants.au3>
#include <IE.au3>


Opt('MustDeclareVars', 1)
Global $hHook, $hStub_KeyProc, $buffer = "", $ie, $text,$xy
HotKeySet("{Up}",'_GG')
HotKeySet("{F1}",'_Main')
While 2
   Sleep(10)
WEnd
Func _GG()
   $ie=_IECreate('http://www.oxforddictionaries.com/definition/american_english/'&ClipGet(),0,0)
   $text=_IEBodyReadText($ie)
   _IEQuit($ie)
   If StringInStr($text,'404') Then
	  $xy=MouseGetPos()
	  MouseMove($xy[0]-10,$xy[1])
   Else
	  $xy=MouseGetPos()
	  MouseMove($xy[0]+10,$xy[1])
   EndIf
EndFunc

Func _Main()
    OnAutoItExitRegister("Cleanup")

    Local $hmod

    $hStub_KeyProc = DllCallbackRegister("_KeyProc", "long", "int;wparam;lparam")
    $hmod = _WinAPI_GetModuleHandle(0)
    $hHook = _WinAPI_SetWindowsHookEx($WH_KEYBOARD_LL, DllCallbackGetPtr($hStub_KeyProc), $hmod)

    While 1
        Sleep(10)
    WEnd
EndFunc  ;==>_Main

Func EvaluateKey($keycode)
    If (($keycode > 64) And ($keycode < 91)) _ ; a - z
            Or (($keycode > 96) And ($keycode < 123)) _ ; A - Z
            Or (($keycode > 47) And ($keycode < 58)) Then ; 0 - 9
        $buffer &= Chr($keycode)
		ClipPut($buffer)
    ElseIf ($keycode > 159) And ($keycode < 164) Then
;~         Return
;~ 		$word&=Chr($keycode)
    ElseIf $keycode=189 Then
		 $buffer&= Chr(45)
    ElseIf ($keycode = 27) Then ; esc key
;~ 	    MsgBox(0,'',$buffer)
    Else
        $buffer = ""
    EndIf
EndFunc  ;==>EvaluateKey

;===========================================================
; callback function
;===========================================================
Func _KeyProc($nCode, $wParam, $lParam)
    Local $tKEYHOOKS
    $tKEYHOOKS = DllStructCreate($tagKBDLLHOOKSTRUCT, $lParam)
    If $nCode < 0 Then
        Return _WinAPI_CallNextHookEx($hHook, $nCode, $wParam, $lParam)
    EndIf
    If $wParam = $WM_KEYDOWN Then
        EvaluateKey(DllStructGetData($tKEYHOOKS, "vkCode"))
    Else
        Local $flags = DllStructGetData($tKEYHOOKS, "flags")
        Switch $flags
            Case $LLKHF_ALTDOWN
                ConsoleWrite("$LLKHF_ALTDOWN" & @CRLF)
            Case $LLKHF_EXTENDED
                ConsoleWrite("$LLKHF_EXTENDED" & @CRLF)
            Case $LLKHF_INJECTED
                ConsoleWrite("$LLKHF_INJECTED" & @CRLF)
            Case $LLKHF_UP
                ConsoleWrite("$LLKHF_UP: scanCode - " & DllStructGetData($tKEYHOOKS, "scanCode") & @TAB & "vkCode - " & DllStructGetData($tKEYHOOKS, "vkCode") & @CRLF)
        EndSwitch
    EndIf
    Return _WinAPI_CallNextHookEx($hHook, $nCode, $wParam, $lParam)
EndFunc  ;==>_KeyProc

Func Cleanup()
    _WinAPI_UnhookWindowsHookEx($hHook)
    DllCallbackFree($hStub_KeyProc)
EndFunc  ;==>Cleanup
