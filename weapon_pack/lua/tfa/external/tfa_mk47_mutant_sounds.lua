local path = "weapons/tfa_ins2_mk47mutant/"
local pref = "TFA_INS2_MK47"
local hudcolor = Color(255, 255, 255, 255)

sound.Add( {
	name = "TFA_INS2_MK47MUTANT.1",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 93,
	pitch = { 100 },
	sound = {"weapons/tfa_ins2_mk47mutant/mk47-1.wav", "weapons/tfa_ins2_mk47mutant/mk47-2.wav", "weapons/tfa_ins2_mk47mutant/mk47-3.wav"}
} )

sound.Add( {
	name = "TFA_INS2_MK47MUTANT_SUPP.1",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 93,
	pitch = { 100 },
	sound = {"weapons/tfa_ins2_mk47mutant/mk47_sup-1.wav", "weapons/tfa_ins2_mk47mutant/mk47_sup-2.wav", "weapons/tfa_ins2_mk47mutant/mk47_sup-3.wav"}
} )

TFA.AddWeaponSound(pref .. ".Magin", path .. "ak47_magin.wav")
TFA.AddWeaponSound(pref .. ".Boltback", path .. "ak47_boltback.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "ak47_boltrelease.wav")
TFA.AddWeaponSound(pref .. ".MagRelease", path .. "ak47_magrelease.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "ak47_magout.wav")
TFA.AddWeaponSound(pref .. ".Empty", path .. "ak47_empty.wav")

if killicon and killicon.Add then
	killicon.Add("tfa_ins2_mk47", "vgui/hud/tfa_ins2_mk47", hudcolor)
end