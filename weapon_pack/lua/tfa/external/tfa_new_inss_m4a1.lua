local path = "weapons/inss_m4a1/"
local pref = "TFA_INSS_M4A1"

TFA.AddFireSound(pref .. ".Fp", path .. "m4a1_fp.wav", ")")
TFA.AddFireSound(pref .. ".Suppressed_Fp", path .. "m4a1_suppressed_fp.wav", true, ")")

TFA.AddWeaponSound(pref .. ".MagRelease", path .. "m4a1_magrelease.wav")
TFA.AddWeaponSound(pref .. ".ROF", path .. "m4a1_fireselect.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "m4a1_magout.wav")
TFA.AddWeaponSound(pref .. ".Hit", path .. "m4a1_hit.wav")
TFA.AddWeaponSound(pref .. ".Empty", path .. "m4a1_empty.wav")
TFA.AddWeaponSound(pref .. ".Magrelease", path .. "m4a1_magrelease.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "m4a1_magin.wav")
TFA.AddWeaponSound(pref .. ".Boltback", path .. "m4a1_boltback.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "m4a1_boltrelease.wav")