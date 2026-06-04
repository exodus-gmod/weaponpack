local path = "weapons/tfa_ins2/eftak74/"
local pref = "TFA_INS2.EFTAK74"

TFA.AddFireSound(pref .. ".1", path .. "ak74_fp.wav", false, ")")
TFA.AddFireSound(pref .. ".2", path .. "ak74_suppressed_fp.wav", false, ")")

TFA.AddFireSound(pref .. ".LOOP.1", path .. "ak105_close_loop.wav", false, ")")
TFA.AddFireSound(pref .. ".LOOP.2", path .. "ak74_loop_outdoor_close_silenced.wav", false, ")")
TFA.AddFireSound(pref .. ".LOOP.TAIL.1", path .. "ak105_close_loop_tail.wav", false, ")")
TFA.AddFireSound(pref .. ".LOOP.TAIL.2", path .. "ak74_loop_outdoor_close_silenced_tail.wav", false, ")")

TFA.AddWeaponSound(pref .. ".Empty", path .. "ak74_empty.wav")
TFA.AddWeaponSound(pref .. ".Boltback", path .. "ak74_boltback.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "ak74_boltrelease.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "ak74_magout.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "ak74_magin.wav")
TFA.AddWeaponSound(pref .. ".Magrelease", path .. "ak74_magrelease.wav")
TFA.AddWeaponSound(pref .. ".ROF", {path .. "ak74_fireselect_1.wav", path .. "ak74_fireselect_2.wav"})
