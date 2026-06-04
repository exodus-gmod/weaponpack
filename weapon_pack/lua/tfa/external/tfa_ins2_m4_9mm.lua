local generic = "weapons/eft/generic/"
local mpx = "weapons/eft/mpx/"
local pref = "Weapon_M4_9MM"

TFA.AddFireSound(pref .. ".1", mpx .. "mpx_outdoor_close.wav")
TFA.AddFireSound(pref .. ".2", mpx .. "mpx_outdoor_close_silenced.wav")

TFA.AddWeaponSound(pref .. ".Empty", generic .. "weap_trigger_empty.wav")

TFA.AddWeaponSound(pref .. ".Magrelease", generic .. "weap_magrelease_button.wav")
TFA.AddWeaponSound(pref .. ".Magout", mpx .. "mpx_weap_magout_plastic.wav")
TFA.AddWeaponSound(pref .. ".Magin", mpx .. "mpx_weap_magin_plastic.wav")

TFA.AddWeaponSound(pref .. ".Hit", generic .. "generic_hand_hit.wav")

TFA.AddWeaponSound(pref .. ".Boltrelease", generic .. "weap_bolt_in.wav")
TFA.AddWeaponSound(pref .. ".ROF", generic .. "weap_fireselctor.wav")
TFA.AddWeaponSound(pref .. ".Draw", generic .. "weap_in.wav")
TFA.AddWeaponSound(pref .. ".Holster", generic .. "weap_out.wav")

TFA.AddWeaponSound(pref .. ".Handon", generic .. "weap_handon.wav")
TFA.AddWeaponSound(pref .. ".Handoff", generic .. "weap_handoff.wav")