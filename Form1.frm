VERSION 5.00
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "meaning of life"
   ClientHeight    =   3090
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   204
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Switch ON/OFF"
      Height          =   615
      Left            =   360
      TabIndex        =   2
      Top             =   1680
      Width           =   3975
   End
   Begin VB.TextBox Text1 
      Enabled         =   0   'False
      Height          =   1335
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Form1.frx":0ECA
      Top             =   240
      Width           =   4455
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      Height          =   375
      Left            =   960
      ScaleHeight     =   315
      ScaleWidth      =   435
      TabIndex        =   0
      Top             =   2400
      Visible         =   0   'False
      Width           =   495
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   240
      Top             =   2400
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim pic_last As String
Dim timebase_last As Long
Dim seed As Long
Dim s As printsc_logic.pic_container

Private Sub Command1_Click()
 Timer1.Enabled = Not Timer1.Enabled
 Text1.Text = user_output
End Sub

Private Sub Form_Load()
 Timer1.Interval = 1
 Timer1.Enabled = True
 
End Sub

Private Sub Timer1_Timer()
 Dim timebase_current As Long
 
 'Timer1.Enabled = False
 timebase_current = printsc_logic.get_unix_time(Now)
 If (timebase_current = timebase_last) Then
  seed = (seed + 1) Mod 1000
 Else
  seed = 0
 End If
 
 s = printsc_logic.get_pic_from_clipboard(Clipboard)
 If (s.is_pic = True) Then
  Beep
  pic_last = auto_save(s, seed)
 End If
 Text1.Text = user_output()
 
 Me.Caption = watch(seed) & "<- wait is this 2021?"
 timebase_last = timebase_current
 'Timer1.Enabled = True
End Sub

Function user_output() As String
 Dim s As String
 
 s = formal_appname & vbCrLf & _
  "Status: " & IIf(Timer1.Enabled, "ON", "OFF") & vbCrLf & _
  "last saved: " & IIf(Len(pic_last), pic_last, "None, try pressing Printscreen") & vbCrLf
  
 user_output = s
End Function

Function formal_appname() As String
 formal_appname = App.Title & " v" & App.Major & "." & App.Minor & App.Revision
End Function

Function watch(seed As Long) As String
 watch = get_fancy_timecode(get_unix_time(Now), seed)
End Function
