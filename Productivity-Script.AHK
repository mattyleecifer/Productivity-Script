SetWorkingDir %A_ScriptDir%
orderdetails =
topleft =
topright =
bottomleft =
bottomright =
rightscreen =
leftscreen =

;main program
gui, main:font, s10
gui, main:add, button, gpopout, Popout
gui, main:font, s10
gui, main:add, button, gexitapp, Exit
gui, main:add, edit,w790 h500 ys wrap vtempnotes
gui, main:show, w880 h510
return

f3::
newclip =
newclip = %Clipboard% 
Clipboard = %newclip%
send ^v
return

`::
send ^c
return

!a::
WinActivate, ahk_id %leftscreen%
return

!s::
WinActivate, ahk_id %rightscreen%
return

!q::
WinActivate, ahk_id %topleft%
return

!w::
WinActivate, ahk_id %topright%
return

!e::
WinActivate, ahk_id %bottomleft%
return

!+w::
WinActivate, ahk_id %bottomright%
return

!x::
WinActivate, ahk_id %secondorder%
return

#x::
WinGet, secondorder, ID, A
return

!z::
WinActivate, ahk_id %thirdorder%
return

#z::
WinGet, thirdorder, ID, A
return

#q::
WinGet, topleft, ID, A
return

#w::
WinGet, topright, ID, A
return

#+w::
WinGet, bottomright, ID, A
return

#e::
WinGet, bottomleft, ID, A
return

#a::
WinGet, leftscreen, ID, A
return

#s::
WinGet, rightscreen, ID, A
return

!c::
WinActivate, Productivity-Script.AHK
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
