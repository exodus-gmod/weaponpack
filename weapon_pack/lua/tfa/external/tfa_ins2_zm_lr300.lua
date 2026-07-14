local generic = "weapons/eft/generic/"
local m4 = "weapons/eft/m4/"
local pref = "Weapon_ZM_LR300"

TFA.AddFireSound(pref .. ".1", m4 .. "m4_fire_outdoor.wav")
TFA.AddFireSound(pref .. ".2", m4 .. "m4a1_fire_silenced_close.wav")

TFA.AddWeaponSound(pref .. ".Empty", generic .. "weap_trigger_empty.wav")
TFA.AddWeaponSound(pref .. ".Boltback", generic .. "weap_bolt_out.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", generic .. "weap_bolt_in.wav")
TFA.AddWeaponSound(pref .. ".Magrelease", generic .. "weap_magrelease_button.wav")
TFA.AddWeaponSound(pref .. ".Magout", generic .. "weap_magout_plastic.wav")
TFA.AddWeaponSound(pref .. ".Magin", generic .. "weap_magin_plastic.wav")
TFA.AddWeaponSound(pref .. ".Hit", generic .. "generic_hand_hit.wav")

TFA.AddWeaponSound(pref .. ".Draw", generic .. "weap_out.wav")
TFA.AddWeaponSound(pref .. ".Holster", generic .. "weap_in.wav")

TFA.AddWeaponSound(pref .. ".Handon", generic .. "weap_handon.wav")
TFA.AddWeaponSound(pref .. ".Handoff", generic .. "weap_handoff.wav")

TFA.AddWeaponSound(pref .. ".ROF", generic .. "weap_fireselctor.wav")