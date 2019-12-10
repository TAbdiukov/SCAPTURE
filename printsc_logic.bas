Attribute VB_Name = "printsc_logic"
Option Explicit

Public Const MAX_INT_MOD = -2147483647

Public Type pic_container
 is_pic As Boolean ' foolproof header
 pic As StdPicture
End Type


Function get_pic_from_clipboard(ByRef c As Object) As pic_container
 ' error friendly
 On Error GoTo fin
 
 Dim s As pic_container
 s.is_pic = False ' foolproof
 
 If ((c.GetData.Handle <> 0) And (c.GetData.Width <> 0) And (c.GetData.Height <> 0)) Then
  ' http://www.vbforums.com/showthread.php?277579-Saving-a-clipboard-image-to-a-file
  Set s.pic = c.GetData(vbCFBitmap)
  DoEvents ' idk if need be
  s.is_pic = True
  c.Clear
 End If
  
fin: get_pic_from_clipboard = s
End Function

Function save_pic_container_to_file(ByRef s As pic_container, ByRef path_no_ext As String)
 Dim real_path As String
 real_path = path_no_ext
 
 SavePicture s.pic, real_path
End Function

Function get_app_path() As String
 ' https://stackoverflow.com/questions/12423824/how-to-get-the-full-path-of-the-current-executable-file-in-vb
 get_app_path = App.Path & IIf(Right$(App.Path, 1) <> "\", "\", "")
End Function

' original
Private Function get_unix_time(d As Date) As Long
 get_unix_time = DateDiff("s", "01/01/1970 00:00:00", d)
End Function

' modded
Function get_unix_time_mod(d As Date, seed As Long) As String
 ' seed: [000 ... 999]
 seed = seed Mod 1000
 
 Dim k As Long
 Dim s As String
 
 
 
 k = DateDiff("s", "01/01/1990 00:00:00", d)
 ' for 8:3 compat
 k = k Mod 100000
 s = zfill_long(k, 5) & zfill_long(seed, 3)
 Debug.Assert Len(s) = 8
 
 get_unix_time_mod = s
End Function

' original from exe2wordsize
Function zfill_long(i As Long, n As Byte) As String
 ' format is kinda like zfill,
 ' https://bytes.com/topic/visual-basic/answers/778694-how-format-number-0000-a
 Dim buf As String
 buf = String(n, "0")
 zfill_long = Format(i, buf)
End Function


Function auto_save(ByRef s As pic_container, ByVal seed As Long) As String
 Dim paradigm As String
 paradigm = get_app_path() & get_unix_time_mod(Now, seed) & ".BMP"
 save_pic_container_to_file s, paradigm
 auto_save = paradigm
End Function

Function watch() As String

End Function
