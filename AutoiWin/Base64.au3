Const $BASE64_TABLE = StringToASCIIArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=")

Func _Base64Encode($buf)
    Local $c = 0, $i = 1, $j = 0, $l = BinaryLen($buf), $m = Mod($l, 3)
    Local $dest = ""
    While $i <= $l - $m
        $c = BitOR(BitShift(BinaryMid($buf, $i, 1), -16), BitShift(BinaryMid($buf, $i + 1, 1), -8), BinaryMid($buf, $i + 2, 1))
        $dest &= Chr($BASE64_TABLE[BitShift(BitAND($c, 16515072), 18)])
        $dest &= Chr($BASE64_TABLE[BitShift(BitAND($c, 258048), 12)])
        $dest &= Chr($BASE64_TABLE[BitShift(BitAND($c, 4032), 6)])
        $dest &= Chr($BASE64_TABLE[BitAND($c, 63)])
        $i += 3
        $j += 4
    WEnd
    If 1 = $m Then
        $dest &= Chr($BASE64_TABLE[BitShift(BitAND(BinaryMid($buf, $i, 1), 252), 2)])
        $dest &= Chr($BASE64_TABLE[BitShift(BitAND(BinaryMid($buf, $i, 1), 3), -4)])
        $dest &= Chr($BASE64_TABLE[64])
        $dest &= Chr($BASE64_TABLE[64])
    ElseIf 2 = $m Then
        $c = BitOR(BitShift(BinaryMid($buf, $i, 1), -8), BinaryMid($buf, $i + 1, 1))
        $dest &= Chr($BASE64_TABLE[BitShift(BitAND($c, 64512), 10)])
        $dest &= Chr($BASE64_TABLE[BitShift(BitAND($c, 1008), 4)])
        $dest &= Chr($BASE64_TABLE[BitShift(BitAND($c, 15), -2)])
        $dest &= Chr($BASE64_TABLE[64])
    EndIf
    Return $dest
EndFunc