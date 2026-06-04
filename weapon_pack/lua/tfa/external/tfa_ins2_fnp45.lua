local path = "/weapons/fnp/"
local pref = "TFA_INS2.FNP45"
local hudcolor = Color(255, 80, 0, 191)

TFA.AddFireSound(pref .. ".Fire", path .. "fnp_fire.wav", true, ")")
TFA.AddFireSound(pref .. ".Fire_Suppressed", path .. "fnp_suppressed.wav", false, ")")

TFA.AddWeaponSound(pref .. ".Safety", path .. "fnp_safety.wav")
TFA.AddWeaponSound(pref .. ".Boltback", path .. "fnp_boltback.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "fnp_boltrelease.wav")
TFA.AddWeaponSound(pref .. ".Empty", path .. "fnp_empty.wav")
TFA.AddWeaponSound(pref .. ".Magrelease", path .. "fnp_magrelease.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "fnp_magout.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "fnp_magin.wav")
TFA.AddWeaponSound(pref .. ".MagHit", path .. "fnp_maghit.wav")
TFA.AddWeaponSound(pref .. ".Boltslap", path .. "fnp_boltback.wav")

-- FIX THE FUCKING SOUND IN THE LINE 42 MOTHER FUCKING YAN
-- REMEMBER 42 TO 46 !!!
