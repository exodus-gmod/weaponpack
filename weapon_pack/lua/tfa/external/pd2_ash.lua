//this part is for making kill icons
local icol = Color( 255, 255, 255, 255 ) 
if CLIENT then
       killicon.Add(  "tfa_at_shak_12","vgui/hud/tfa_at_shak_12", icol  )
	end
local path = "weapons/ash12.7/"
local pref = "TFA_PD2_ASh12"

TFA.AddFireSound(pref .. ".1", path .. "fph12.wav", false, ")")
TFA.AddFireSound(pref .. ".2", path .. "suppressed_fph12.wav", false, ")")

TFA.AddWeaponSound(pref .. ".Empty", path .. "ak74_empty.wav")
TFA.AddWeaponSound(pref .. ".Boltback", path .. "boltbackh12.wav")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "boltreleaseh12.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "clipouth12.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "clipinh12.wav")
TFA.AddWeaponSound(pref .. ".ROF", path .. "fireh12.wav")
