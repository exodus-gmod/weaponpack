local path = "weapons/tfa_new_inss_mk18/mk18/"
local pref = "Weapon_MK18"
local hudcolor = Color(255, 80, 0, 191)

TFA.AddFireSound(pref .. ".Fp", path .. "mk18_fp.wav", ")")
TFA.AddFireSound(pref .. ".Suppressed_Fp", path .. "mk18_suppressed_fp.wav", false, ")")

TFA.AddWeaponSound(pref .. ".MagRelease", path .. "mk18_magrelease.wav")
TFA.AddWeaponSound(pref .. ".ROF", path .. "mk18_fireselect.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "mk18_magout.wav")
TFA.AddWeaponSound(pref .. ".Hit", path .. "mk18_hit.wav")
TFA.AddWeaponSound(pref .. ".Empty", path .. "mk18_empty.wav")
TFA.AddWeaponSound(pref .. ".Magrelease", path .. "mk18_magrelease.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "mk18_magin.wav")
TFA.AddWeaponSound(pref .. ".Boltback", path .. "mk18_boltback.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "mk18_boltrelease.wav")

if killicon and killicon.Add then
	killicon.Add("tfa_new_inss_mk18", "vgui/hud/tfa_new_inss_mk18", hudcolor)
end