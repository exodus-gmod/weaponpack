local path = "weapons/tfa_ins2/mwr_p90/"
local pref = "TFA_INS2.MWR_P90"
local hudcolor = Color(255, 80, 0, 191)

TFA.AddFireSound(pref .. ".1", {path .. "p90_fire1.wav", path .. "p90_fire2.wav", path .. "p90_fire3.wav", path .. "p90_fire4.wav"}, true, ")")
TFA.AddFireSound(pref .. ".2", path .. "p90_sil1.wav", true, ")")

TFA.AddFireSound(pref .. ".1N", {path .. "p90_fire1_noecho.wav", path .. "p90_fire2_noecho.wav", path .. "p90_fire3_noecho.wav", path .. "p90_fire4_noecho.wav"}, true, ")")
TFA.AddFireSound(pref .. ".2N", path .. "p90_sil1_noecho.wav", true, ")")

TFA.AddWeaponSound(pref .. ".TailInside", path .. "smg_indoor_trail.wav")
TFA.AddWeaponSound(pref .. ".TailOutside", path .. "p90_outside_trail.wav")

TFA.AddWeaponSound(pref .. ".Lift", path .. "wpfoly_p90_pickup_lift_v1.wav")
TFA.AddWeaponSound(pref .. ".ClipOut", path .. "wpfoly_p90_reload_clipout_v1.wav")
TFA.AddWeaponSound(pref .. ".ClipIn", path .. "wpfoly_p90_reload_clipin_v1.wav")
TFA.AddWeaponSound(pref .. ".Hit", path .. "wpfoly_p90_reload_hit_v1.wav")
TFA.AddWeaponSound(pref .. ".Chamber", path .. "wpfoly_p90_reload_chamber_v1.wav")
TFA.AddWeaponSound(pref .. ".Look1", path .. "wpn_h1_ak74u_ins_look_01.wav")
TFA.AddWeaponSound(pref .. ".Look2", path .. "wpn_h1_ak74u_ins_look_02.wav")
TFA.AddWeaponSound(pref .. ".Look3", path .. "wpn_h1_ak74u_ins_rest.wav")

if killicon and killicon.Add then
	killicon.Add("tfa_ins2_mwr_p90", "vgui/killicons/tfa_ins2_mwr_p90", hudcolor)
end