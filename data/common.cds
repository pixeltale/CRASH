; Common Commands
; The commands defined in this file will be appended to every character's command list.
; Commands used by common states should be placed here to prevent crashing due to missing commands.
; Most of these are kept blank so that they won't interfere with a character trying to remap them.

[Command]
name = "recovery"
command = 
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "TagShiftBack"
command = d
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "TagShiftFwd"
command = w
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "holdfwd"
command = /F
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "holdback"
command = /B
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "back"
command = B
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1
[Command]
name = "downback"
command = DB
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "holdup"
command =
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "holddown"
command = /$D
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 0

; Every common command below this point is deprecated.
; It is recommended that a character that doesn't need commands for itself but still wishes to use the command trigger should still define the necessary commands in its own command file.

[Command]
name = "x"
command = x
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "THROW"
command = x
time = 1
buffer.time = 5
buffer.hitpause = 1
buffer.pauseend = 1
[Command]
name = "THROW"
command = a+b
time = 2
buffer.time = 5
buffer.hitpause = 1
buffer.pauseend = 1
[Command]
name = "THROWTECH"
command = x
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1
[Command]
name = "THROWTECH"
command = a+b
time = 2
buffer.time = 5
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "y"
command = y
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "z"
command = z
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "a"
command = a
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "ATTACK"
command = a
time = 1
buffer.time = 5
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "b"
command = b
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "SPECIAL"
command = b
time = 1
buffer.time = 5
buffer.hitpause = 1
buffer.pauseend = 1
[Command]
name = "HOLD_SPECIAL"
command = /b
time = 1
buffer.time = 0
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "c"
command = c
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "EVADE"
command = c
time = 1
buffer.time = 5
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "EVADE_NOBUFFER"
command = c
time = 1
buffer.time = 0
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "ULTIMATE"
command = z
time = 1
buffer.time = 5
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "ES"
command = a + b
time = 1
buffer.time = 5
buffer.hitpause = 1
buffer.pauseend = 1
[Command]
name = "ES"
command = y
time = 1
buffer.time = 5
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "start"
command = s
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "d"
command = d
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "w"
command = w
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "m"
command =
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

[Command]
name = "menu"
command =
time = 1
buffer.time = 1
buffer.hitpause = 1
buffer.pauseend = 1

;====== DOUBLE TAP =========
[Command]
name = "66"
command = F, F
time = 10
buffertime = 15
[Command]
name = "66"
command = ~F, F
time = 5
buffertime = 5
[Command]
name = "a66"
command = ~F, F
time = 10
buffertime = 15


[Command]
name = "44"
command = B, B
time = 10
buffertime = 15
[Command]
name = "a44"
command = ~B, B
time = 10
buffertime = 15

[Command]
name = "28"
command = $D, U
time = 10
buffer.time = 10
[Command]
name = "29"
command = $D, UF
time = 10
buffer.time = 10
[Command]
name = "29"
command = $D, DF, F, U
time = 10
buffer.time = 10
[Command]
name = "29"
command = $D, U, F
time = 10
buffer.time = 10
[Command]
name = "29"
command = $D, F, U
time = 10
buffer.time = 10
[Command]
name = "27"
command = $D, UB
time = 10
buffer.time = 10
[Command]
name = "27"
command = $D, U, B
time = 10
buffer.time = 10
[Command]
name = "27"
command = $D, B, U
time = 10
buffer.time = 10
[Command]
name = "27"
command = $D, DB, B, U
time = 10
buffer.time = 10
[Command]
name = "27"
command = $D, DB, B, N, U
time = 10
buffer.time = 10