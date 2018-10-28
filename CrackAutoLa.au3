#RequireAdmin
#include <File.au3>
;~ Run('E:\Minh\Compressed\La 6-8-16\##LoginPopup##\Minhh\Auto Post 2\Auto Post 2.exe')
;~ Do
;~ Until WinExists('Auto Post 2.exe')
;~ Sleep(600)
;~ ControlClick('Start New Process','','[CLASS:Button; INSTANCE:1]')
;~ Sleep(400)
;~ Run(@ScriptDir&'\pssuspend.exe "Auto Post 2.exe" ')
;~ $post2=@UserProfileDir&'\AppData\Local\Microsoft\Windows\INetCache\IE\7BDNPLO7\Sever%20Post%202[1].txt'
;~ _FileCreate($post2)
;~ $txtpots2=FileOpen($post2,2)
;~ FileWrite($txtpots2,'Post 2 New')
;~ FileClose($txtpots2)
;~ MsgBox(0,'','')
;~ Run(@ScriptDir&'\pssuspend.exe "Auto Post 2.exe" -r')

$session=DllCall('E:\Programs\FiddlerCoreAPI\FiddlerCore.dll','int','ReadSessions')
MsgBox(0,'',$session)

