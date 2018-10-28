
#RequireAdmin
Run(@ComSpec & " /c " & 'Net User ' & 'XTC' & " xxx"  & " /add", "", @SW_HIDE)
Run(@ComSpec & " /c " & "Net Localgroup Guest " & 'XTC'  & " /add", "", @SW_HIDE)
Sleep(188)
RunAs("XTC",@ComputerName,"xxx",0,"E:\Programs\Boom\ca.exe")
Sleep(888)
RunWait("net user XTC /DELETE","", @SW_HIDE)