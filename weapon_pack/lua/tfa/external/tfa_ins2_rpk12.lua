local path = "weapons/tfa_ins2_rpk_12/"
local pref = "Weapon_RPK12"
local hudcolor = Color(255, 255, 255, 255)

TFA.AddFireSound(pref .. ".1", {path .. "fire_1.wav", path .. "fire_2.wav", path .. "fire_3.wav"}, false, ")")
TFA.AddFireSound(pref .. ".2", path .. "fire_sil.wav", false, ")")

TFA.AddWeaponSound(pref .. ".Boltback", path .. "rpk_boltback.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "rpk_boltrelease.wav")
TFA.AddWeaponSound(pref .. ".Empty", path .. "rpk_empty.wav")
TFA.AddWeaponSound(pref .. ".MagRelease", path .. "rpk_magrelease.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "rpk_magout.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "rpk_magin.wav")
TFA.AddWeaponSound(pref .. ".Rattle", path .. "rpk_rattle.wav")
TFA.AddWeaponSound(pref .. ".MagoutRattle", path .. "rpk_magout_rattle.wav")
TFA.AddWeaponSound(pref .. ".FetchMag", path .. "rpk_fetchmag.wav")
TFA.AddWeaponSound(pref .. ".ROF", path .. "rpk_fireselect_1.wav")


if killicon and killicon.Add then
	killicon.Add("tfa_ins2_rpk12", "vgui/hud/tfa_ins2_rpk12", hudcolor)
end