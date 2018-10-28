#RequireAdmin
#include <WinHTTP.au3>

Local $hopen=_WinHttpOpen()
Local $hconnect=_WinHttpConnect($hopen, 'https://sheets.googleapis.com')
;~ Global $hrequest=_WinHttpOpenRequest($hconnect,'GET','/18U6q41ysceOy83urHuB4HO52gA_me3ZV3DMuIw9UBLM')
Local $hrequest=_WinHttpOpenRequest($hconnect,'GET','/v4/spreadsheets/18U6q41ysceOy83urHuB4HO52gA_me3ZV3DMuIw9UBLM?ranges=A1:C10')
;GET https://sheets.googleapis.com/v4/spreadsheets/spreadsheet_id/values/range

_WinHttpSendRequest($hrequest)

_WinHttpReceiveResponse($hrequest)

Local $header=_WinHttpQueryHeaders($hrequest)

_WinHttpCloseHandle($hRequest)
_WinHttpCloseHandle($hConnect)
_WinHttpCloseHandle($hOpen)

MsgBox(0,'',$header)
ClipPut($header)