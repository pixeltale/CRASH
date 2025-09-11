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

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "up" ;Required (do not remove)
command = $U
time = 1
[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

[Statedef -1]

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
triggerall = command = "up" && vel y>.1
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
triggerall = stateno!=100
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250

;Backdash
[State -1, Backdash]
type = ChangeState
value = 105
triggerall = command = "44"
triggerall = stateno!=105
trigger1 = statetype = S
trigger1 = ctrl
trigger2 = stateno = 250

;===========================================================================
;Air Evade Forward
[State -1, Airdash]
type = ChangeState
value = 60
triggerall = command != "holdback"
triggerall = command = "EVADE"
triggerall = statetype = A
triggerall = pos y<-30 || vel y > 0
trigger1 = ctrl && map(AirActions) < const(AirActionMax) || map(EvaCancel) && map(BreakPoints) >= 2

;Air Evade Back
[State -1, Airdash]
type = ChangeState
value = 61
triggerall = command = "holdback"
triggerall = command = "EVADE"
triggerall = statetype = A
triggerall = pos y<-30 || vel y > 0
trigger1 = ctrl && map(AirActions) < const(AirActionMax) || map(EvaCancel) && map(BreakPoints) >= 2

;Evade Forward
[State -1, Airdash]
type = ChangeState
value = 65
triggerall = command != "holdback"
triggerall = command = "EVADE"
triggerall = statetype != A && stateno != 65
trigger1 = ctrl || map(EvaCancel) && map(BreakPoints) >= 2

;Evade Back
[State -1, Airdash]
type = ChangeState
value = 66
triggerall = command = "holdback"
triggerall = command = "EVADE"
triggerall = statetype != A && stateno != 66
trigger1 = ctrl || map(EvaCancel) && map(BreakPoints) >= 2
;===========================================================================
;6S: Divider
[State -1, COP DESTROYER!]
type = changeState
value = 1020
triggerall = command = "SPECIAL" && command = "holdfwd"
triggerall = statetype != A || pos y < 20
trigger1 = ctrl || (stateno = 200 || stateno = 400 || stateno = 600) && movecontact || stateno = [60,61]

;4S: Divider
[State -1, RAZORWIRE!]
type = changeState
value = 1010
triggerall = command = "SPECIAL" && command = "holdback"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [200,220] || stateno = [400,431]) && movecontact

;2S: Divider
[State -1, UPPERKICK!]
type = changeState
value = 1030
triggerall = command = "SPECIAL" && command = "holddown"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [200,220] || stateno = [400,431]) && movecontact

;5S: Divider
[State -1, DICER]
type = changeState
value = 1000
triggerall = command = "SPECIAL"
triggerall = statetype != A
trigger1 = ctrl || (stateno = [200,220] || stateno = [400,431]) && movecontact
;5S: Divider
[State -1, DICER ALTERNATIVE]
type = changeState
value = 1005
triggerall = command = "SPECIAL"
triggerall = statetype = A
trigger1 = ctrl || (stateno = 600) && movecontact || stateno = [60,61]



;===========================================================================
;NORMALS
;===========================================================================
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
