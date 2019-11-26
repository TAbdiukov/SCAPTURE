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
      Name            =   "System"
      Size            =   9.75
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
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
Dim last As String


Private Sub Command1_Click()
 Timer1.Enabled = Not Timer1.Enabled
 Text1.Text = user_output
End Sub

Private Sub Form_Load()
 Timer1.Interval = 1
 Timer1.Enabled = True
 
End Sub

Private Sub Timer1_Timer()
 Dim s As printsc_logic.pic_container
 
 s = printsc_logic.get_pic_from_clipboard(Clipboard)
 If (s.is_pic = True) Then
  Beep
  last = auto_save(s)
 End If
 Text1.Text = user_output()
 
 Me.Caption = watch() & "<- wait is this Christmas 2019?"
End Sub

Function user_output() As String
 Dim s As String
 
 s = formal_appname & vbCrLf & _
  "Status: " & IIf(Timer1.Enabled, "ON", "OFF") & vbCrLf & _
  "Last saved: " & IIf(Len(last), last, "None, try pressing Printscreen") & vbCrLf
  
 user_output = s
End Function

Function formal_appname() As String
 formal_appname = App.Title & " v" & App.Major & "." & App.Minor & App.Revision
End Function

Function watch() As String
 watch = get_unix_time_mod(Now)
End Function
