local path = "weapons/tfa_ins2/groza/"
local pref = "TFA_INS2.GROZA"
local hudcolor = Color(255, 80, 0, 191)

TFA.AddFireSound(pref .. ".1", path .. "normal.wav", false, ")")
TFA.AddFireSound(pref .. ".2", path .. "suppressor.wav", false, ")")

TFA.AddWeaponSound(pref .. ".Boltback", path .. "aks_boltback.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "aks_boltrelease.wav")
TFA.AddWeaponSound(pref .. ".Empty", path .. "aks_empty.wav")
TFA.AddWeaponSound(pref .. ".MagRelease", path .. "aks_magrelease.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "aks_magin.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "aks_magout.wav")
TFA.AddWeaponSound(pref .. ".MagoutRattle", path .. "aks_magout_rattle.wav")
TFA.AddWeaponSound(pref .. ".ROF", {path .. "aks_fireselect_1.wav", path .. "aks_fireselect_2.wav"})
TFA.AddWeaponSound(pref .. ".Rattle", path .. "aks_rattle.wav")

if killicon and killicon.Add then
	killicon.Add("tfa_ins2_groza", "vgui/killicons/tfa_ins2_groza", hudcolor)
end