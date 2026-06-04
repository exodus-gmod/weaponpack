local path = "weapons/tfa_ins2/aek971/"
local pref = "TFA_INS2.AEK971"
local hudcolor = Color(255, 80, 0, 191)

TFA.AddSound(pref .. ".1", CHAN_WEAPON, 1, 140, {100, 105}, path .. "Fire-1.wav", ")")
TFA.AddSound(pref .. ".2", CHAN_WEAPON, 1, 140, {100, 105}, path .. "ak47_suppressed_fire1.wav", ")")

TFA.AddWeaponSound(pref .. ".Boltback", path .. "handling/ak74_boltback.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "handling/ak74_boltrelease.wav")
TFA.AddWeaponSound(pref .. ".Empty", path .. "handling/ak74_empty.wav")
TFA.AddWeaponSound(pref .. ".MagRelease", path .. "handling/ak74_magrelease.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "handling/ak74_magin.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "handling/ak74_magout.wav")
TFA.AddWeaponSound(pref .. ".MagoutRattle", path .. "handling/ak74_magout_rattle.wav")
TFA.AddWeaponSound(pref .. ".ROF", path .. "handling/m14_fireselect.wav")
TFA.AddWeaponSound(pref .. ".Rattle", path .. "handling/ak74_rattle.wav")

if killicon and killicon.Add then
	killicon.Add("tfa_ins2_aek971", "vgui/killicons/tfa_ins2_aek971", hudcolor)
end