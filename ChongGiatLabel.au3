

    #include <WindowsConstants.au3>
    #include <EditConstants.au3>

    #Region <Use input control as fake label to avoid flickering on update>
            ; Started by KaFu - autoscript.com
            ; Cách thức: SetData lên Input (giả label) cùng lúc với 1 label ảo (ẩn - không dùng)
    #EndRegion


    Example1()
    Example2()
    Example3()
    Example4()


    Func Example1()
            GUICreate("My GUI 1")
            GUISetBkColor(0)
            GUISetFont(20)
            GUICtrlCreateLabel('SetData liên tục lên 1 Label.' & @CRLF & 'Rất giật.', 10, 100)
            GUICtrlSetBkColor(-1, 0xffffff)

            $c_Label = GUICtrlCreateLabel(0, 10, 10, 300, 30)
            GUICtrlSetBkColor(-1, 0xffffff)
            GUISetState(@SW_SHOW)
            While GUIGetMsg() <> -3
                    GUICtrlSetData($c_Label, TimerInit())
            WEnd
    EndFunc


    Func Example2()
            GUICreate("My GUI 2")
            GUISetBkColor(0)
            GUISetFont(20)
            GUICtrlCreateLabel('SetData liên tục lên 1 Input.' & @CRLF & 'Độ giật thấp.', 10, 100)
            GUICtrlSetBkColor(-1, 0xffffff)

            $c_Input = GUICtrlCreateInput(0, 10, 10, 300, 30, $ES_READONLY, $WS_EX_TRANSPARENT)
            GUICtrlSetBkColor(-1, 0xffffff)
            GUISetState(@SW_SHOW)
            While GUIGetMsg() <> -3
                    GUICtrlSetData($c_Input, TimerInit())
            WEnd
    EndFunc


    Func Example3()
            GUICreate("My GUI 3")
            GUISetBkColor(0)
            GUISetFont(20)
            GUICtrlCreateLabel('SetData liên tục lên' & @CRLF & ' 1 Label và 1 Label ẩn.' & @CRLF & 'Độ giật giảm so với Example 1', 10, 100)
            GUICtrlSetBkColor(-1, 0xffffff)

            $c_Label1 = GUICtrlCreateLabel(0, 0, 10, 10)
            GUICtrlSetState(-1, 32)
            $c_Label2 = GUICtrlCreateLabel(0, 10, 10, 300, 30)
            GUICtrlSetBkColor(-1, 0xffffff)
            GUISetState(@SW_SHOW)
            While GUIGetMsg() <> -3
                    GUICtrlSetData($c_Label1, TimerInit())
                    GUICtrlSetData($c_Label2, TimerInit())
            WEnd
    EndFunc


    Func Example4()
            GUICreate("My GUI 4")
            GUISetBkColor(0)
            GUISetFont(20)
            GUICtrlCreateLabel('SetData liên tục lên' & @CRLF & ' 1 Input (giả Label) và 1 Label ẩn.' & @CRLF & 'Chạy mượt.', 10, 100)
            GUICtrlSetBkColor(-1, 0xffffff)

            $c_Label = GUICtrlCreateLabel(0, 0, 10, 10)
            GUICtrlSetState(-1, 32)
            $c_Input = GUICtrlCreateInput(0, 10, 10, 300, 30, $ES_READONLY, $WS_EX_TRANSPARENT)
            GUICtrlSetBkColor(-1, 0xffffff)
            GUISetState(@SW_SHOW)
            While GUIGetMsg() <> -3
                    GUICtrlSetData($c_Label, TimerInit())
                    GUICtrlSetData($c_Input, TimerInit())
            WEnd
    EndFunc

