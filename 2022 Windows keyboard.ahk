SetWorkingDir %A_ScriptDir%

orderdetails =
topleft =
topright =
bottomleft =
bottomright =
rightscreen =
leftscreen =



;main program
; gui, font, s10
; gui, add, button, gpopout, Popout
; gui, font, s10
; gui, add, button, gexitapp, Exit
; gui, add, edit,w790 h150 ys wrap veditclip
; gui, add, edit,w790 h300 wrap vtempnotes
; gui, show, w880 h510
; return


; f1::
; send ^c
; newclip = %Clipboard%
; GuiControl, ,editclip, %newclip%
; return

; f2:: 
; GuiControlGet, editclip
; Clipboard = %editclip%
; send ^v
; return

; f3:: 
; GuiControlGet, tempnotes
; Clipboard = %tempnotes%
; send ^v
; return
f1::
if(RegExMatch(Clipboard, ".+? <", out_var))
   {
   StringReplace, out_var, out_var, <, , All
;    MsgBox, % out_var
   StringSplit, OutputArray, out_var, %A_Space%
   wordcount := OutputArray0 - 2
   firstname := ""
   Loop, %wordcount%
    {   
        varblah := OutputArray%A_Index%
        firstname = %firstname% %varblah%
    }
;    MsgBox, % firstname
    send %firstname%
   }
   Else
   {
      StringSplit, OutputArray, Clipboard, `r`n
    ;   StringReplace, out_var, OutputArray3, ame?, , All
    ;   StringReplace, out_var, out_var, `r`n, , All

      ; write code for the alternative format
      send %OutputArray9%

      ; StringReplace, out_var, out_var, What is your name?, , All

      ; MsgBox, %out_var%
   }
return


f2::
if(RegExMatch(Clipboard, " \w+? <", out_var))
   StringReplace, out_var, out_var, %A_Space%, , All
   StringReplace, out_var, out_var, <, , All

;    MsgBox, % out_var
   send %out_var%
; else
;    MsgBox, % "Failed to match#"
return


; email
f3::
if(RegExMatch(Clipboard, "<.+?>", out_var))
   {
      StringReplace, out_var, out_var, <, , All
   StringReplace, out_var, out_var, >, , All
;    MsgBox, % out_var
   send %out_var%
   }
   Else if (RegExMatch(Clipboard, "\b.+?@.+?\s", out_var))
   {
      ; StringSplit, OutputArray, Clipboard, 'n
      ; StringReplace, out_var, OutputArray1, What is your work email address?, , All
      ; MsgBox, %OutputArray1%

      ; StringReplace, out_var, out_var, `r`n, , All

      send %out_var%


      ; MsgBox, %out_var%
   }
return


; company
f4::
if (RegExMatch(Clipboard, "@(.+?)\.", out_var))
   {

   }
Else if (RegExMatch(Clipboard, "\b.+?@.+?\s", out_var))
   {
   
   }
StringReplace, out_var, out_var, @, , All
StringReplace, out_var, out_var, .com, , All
StringReplace, out_var, out_var, .net, , All
StringReplace, out_var, out_var, .io, , All
StringReplace, out_var, out_var, ., , All
StringUpper, out_var, out_var, T

send %out_var%
return


!1::
WinActivate, ahk_id %onescreen%
return

#1::
WinGet, onescreen, ID, A
return

!2::
WinActivate, ahk_id %twoscreen%
return

#2::
WinGet, twoscreen, ID, A
return

!3::
WinActivate, ahk_id %threescreen%
return

#3::
WinGet, threescreen, ID, A
return

!4::
WinActivate, ahk_id %fourscreen%
return

#4::
WinGet, fourscreen, ID, A
return

!a::
WinActivate, ahk_id %leftscreen%
return

#a::
WinGet, leftscreen, ID, A
return

!s::
WinActivate, ahk_id %rightscreen%
return

#s::
WinGet, rightscreen, ID, A
return

!q::
WinActivate, ahk_id %topleft%
return

#q::
WinGet, topleft, ID, A
return

!w::
WinActivate, ahk_id %topright%
return

#w::
WinGet, topright, ID, A
return

!e::
WinActivate, ahk_id %bottomleft%
return

#e::
WinGet, bottomleft, ID, A
return

!r::
WinActivate, ahk_id %secondorder%
return

#r::
WinGet, secondorder, ID, A
return

!d::
WinActivate, ahk_id %dscreen%
return

#d::
WinGet, dscreen, ID, A
return

!f::
WinActivate, ahk_id %fscreen%
return

#f::
WinGet, fscreen, ID, A
return

popout:
filedelete tempnotes.txt
gui, submit, nohide
FileAppend,
(
%tempnotes%
),tempnotes.txt
run notepad.exe tempnotes.txt
return

exitapp:
DetectHiddenWindows,on
exitapp
return


























