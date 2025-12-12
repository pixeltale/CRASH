; The CMD file.
;-| Default Values |-------------------------------------------------------
[Defaults]
command.time = 15
command.buffer.time = 3

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1
buffer.time = 0

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1
buffer.time = 0
[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1
buffer.time = 0

[Command]
name = "HOLD_UP" ;Required (do not remove)
command = /$U
time = 1
buffer.time = 0
[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1
buffer.time = 0

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1
buffer.time = 0

[Statedef -1]

[State -1, Reset Special Cancel Variable]
type = VarSet
trigger1 = 1
var(1) = 0
[State -1, Reset ES Cancel Variable]
type = VarSet
trigger1 = 1
var(2) = 0
[State -1, Reset ES Cancel Variable]
type = VarSet
trigger1 = 1
var(3) = 0

[State -1, Special Cancel Check]
type = VarSet
trigger1 = ctrl || stateno = [60,66]
trigger2 = stateno = [200,699] && movecontact
var(1) = 1
[State -1, ES Cancel Check]
type = VarSet
triggerall = map(BreakPoints) >= 2
trigger1 = var(1)
trigger2 = stateno = [1000, 1999] && movecontact
trigger3 = map(Eva_WhiffCancel)
var(2) = 1
[State -1, ULTIMATE Cancel Check]
type = VarSet
triggerall = map(BreakPoints) >= 4
trigger1 = var(2)
var(3) = 1

;===============================================================================
;---------------------------------------------------------------------------

;Super Jump
[State -1, Super Jump]
type = ChangeState
value = 55
triggerall = statetype != A
triggerall = command = "28" || command = "27" || command = "29"
trigger1 = ctrl
trigger2 = Map(JC)
[State -1,JC]
type = ChangeState
value = 40
triggerall = statetype != A && map(AirActions) < const(AirActionMax)
triggerall = command = "holdup"
trigger1 = map(JC)
trigger2 = ctrl 

;Double Jump Raw
[State -1,DJC]
type = ChangeState
value = 45
triggerall = statetype = A && map(AirActions) < const(AirActionMax)
triggerall = command = "up" && map(doubleJump_BUFFFIX) < 2
trigger1 = ctrl
[State -1,DJC]
type = ChangeState
value = 45
triggerall = movecontact && command = "holdup"
triggerall = statetype = A && map(AirActions) < const(AirActionMax)
trigger1 = ctrl && stateno!= [40,55] && !(stateno = 56 && time < 20)
trigger2 = movecontact && hitdefattr = A, NA
trigger3 =  stateno=45 || stateno=46|| stateno=50
trigger3 = vel y>.1

;Dash
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = command != "holdback"
triggerall = command = "66"
triggerall = stateno !=100
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 250
;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "44"
triggerall = stateno!=105
triggerall = statetype != A
trigger1 = ctrl
trigger2 = stateno = 250


;===========================================================================
;ULTIMATE - HEIAN ERA HATECRIMES
[State -1, FUUUUUGA.]
type 	= changeState
value 	= 3000
triggerall 	= command = "ULTIMATE"
triggerall 	= statetype != A && stateno != 3000
trigger1 		= var(3)
;===========================================================================
;ES1 - FLAMAGRA BURNOUT
[State -1, FUUUUUGA.]
type = changeState
value = 2000
triggerall = map(ES_SELECT) = 1
triggerall = command = "ES"
triggerall = statetype != A && stateno != 2000
trigger1 = var(2)

;ES2 - FLYING LOTUS
[State -1, PROJECTILE CUT]
type = changeState
value = 2010
triggerall = map(ES_SELECT) = 2
triggerall = command = "ES"
triggerall = statetype != A && stateno != 2010
trigger1 = var(2)


;===========================================================================
;j2S: Overheel
[State -1, OVERKICK!]
type = changeState
value = 1035
triggerall = command = "SPECIAL" && command = "holddown"
triggerall = statetype = A
trigger1 = var(1) || stateno = 1040 && MoveContact
;j5S: Shatterspleen
[State -1, OVERKICK!]
type = changeState
value = 1040
triggerall = command = "SPECIAL" && command != "holddown"
triggerall = statetype = A
trigger1 = var(1)

;6S: Hunter Dievermillion
[State -1, COP DESTROYER!]
type = changeState
value = 1020
triggerall = command = "SPECIAL" && command = "holdfwd"
triggerall = statetype != A
trigger1 = var(1)

;4S: Midnight Snack
[State -1, RAZORWIRE!]
type = changeState
value = 1010
triggerall = command = "SPECIAL" && command = "holdback"
triggerall = statetype != A
trigger1 = var(1)

;2S: Overheel
[State -1, OVERKICK!]
type = changeState
value = 1030
triggerall = command = "SPECIAL" && command = "holddown"
triggerall = statetype != A
trigger1 = var(1)

;5S: Bat
[State -1, DICER]
type = changeState
value = 1000
triggerall = command = "SPECIAL"
triggerall = statetype != A && !numhelper(1005)
trigger1 = var(1)


;===========================================================================
;NORMALS
;===========================================================================
;6A - Standing Attack
[State -1, Standing Attack]
type = ChangeState
value = 205
triggerall = command = "ATTACK" && command = "holdfwd" && command != "holddown"
triggerall = statetype != A
trigger1 = ctrl || (stateno = 400 || stateno = 200) && movecontact

;4A - Standing Attack
[State -1, Standing Attack]
type = ChangeState
value = 210
triggerall = command = "ATTACK" && command = "holdback" && command != "holddown"
triggerall = statetype != A
trigger1 = ctrl || (stateno = 400 || stateno = 200) && movecontact

;5A - Standing Attack
[State -1, Standing Attack]
type = ChangeState
value = 200
triggerall = command = "ATTACK" && command != "holddown"
triggerall = statetype != A
trigger1 = ctrl || (stateno = 400 || stateno = 200) && movecontact && prevstateno != 200

;2A - Crouching Attack
[State -1, Crouching Attack]
type = ChangeState
value = 400
triggerall = command = "ATTACK" && command = "holddown"
triggerall = statetype != A
trigger1 = ctrl || stateno = 200 && movecontact && prevstateno != 400 && prevstateno != 200

;j.5L: Jumping Light
[State -1, Jumping Light] ;jL
type = ChangeState
value = 600
triggerall = command = "ATTACK"
triggerall = statetype = A
trigger1 = ctrl || stateno = [60, 61]
