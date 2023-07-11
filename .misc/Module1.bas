Attribute VB_Name = "Module1"
Option Explicit

Type clipboard_payload
 is_pic As Boolean
 pic As PictureBox
End Type

Function grab_pic_from_clipboard(ByRef c As Object) As clipboard_payload
' func is errors friendly, to get around some limitations
 On Error GoTo fin

 Dim b As Boolean
 b = False
 
 ' Better early than late
 Dim r As clipboard_payload
 r = new
 
  ' Clipboard.GetData.Type
 ' 0 - Text/File/Number/Everything else
 ' 1 - Pic
 
 ' Str(Clipboard.GetFormat(1)) & Str(Clipboard.GetFormat(2)) - only those **appear** valid
 ' type | GetFormat(1) | GetFormat(2) |
 ' -----|--------------|--------------|
 ' Text | True         | False        |
 ' Pic  | False        | True         |
 ' Clr  | False        | False        |
 '
 ' GetFormat appears to be the vuln subject to arbitrary reading and writing, but what the hell, its the bloody vb
 ' VB is also the subject to signed ints only, so gotta be careful (I check if not zero vs non-negative/ez check of `if(variable)`)
 ' VB also doesn't support short if checks, so if statements are much longer than need be
 
 
 'Test results on checks
 ' Handle - good choice but occasionally crashes
 ' hPal - whatever it is, checking for it really often causes crashes
 ' wight & height  - OK. Added
 
 ' danger = 0
 If (c.GetFormat(1) = False) Then
  If (c.GetFormat(2) = True) Then
   ' danger = 1
   If (c.GetData.Type = 1) Then
    'danger = 2
    If (c.GetData.Width <> 0) Then
     If (c.GetData.Height <> 0) Then
      ' danger = 3
      If (c.GetData.Handle <> 0) Then ' chk against no first pic
       ' pay
       b = True
      End If
     End If
    End If
   End If
  End If
 End If
 
fin:
 Err.Clear
 isPicInClipBoard = result
 
End Function

