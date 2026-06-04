local path = "weapons/tfa_ins2/hk416/"
local pref = "TFA_INS2.HK416"
local hudcolor = Color(255, 80, 0, 191)

TFA.AddFireSound(pref .. ".1", path .. "m16a4_fp.wav", false, ")")
TFA.AddFireSound(pref .. ".2", path .. "m16a4_suppressed_fp.wav", false, ")")

TFA.AddWeaponSound(pref .. ".Boltback", path .. "m16_boltback.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "m16_boltrelease.wav")
TFA.AddWeaponSound(pref .. ".Empty", path .. "m16_empty.wav")
TFA.AddWeaponSound(pref .. ".ROF", path .. "m16_fireselect.wav")
TFA.AddWeaponSound(pref .. ".Magrelease", path .. "m16_magrelease.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "m16_magout.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "m16_magin.wav")
TFA.AddWeaponSound(pref .. ".Hit", path .. "m16_hit.wav")
