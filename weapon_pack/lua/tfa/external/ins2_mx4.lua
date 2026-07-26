local path = "weapons/tfa_ins2/mx4/"
local pref = "TFA_INS2.MX4"
local hudcolor = Color(255, 80, 0, 191)

TFA.AddFireSound(pref .. ".1", {path .. "fire_1.wav", path .. "fire_2.wav", path .. "fire_3.wav", path .. "fire_4.wav"}, true, ")")
TFA.AddFireSound(pref .. ".2", {path .. "sil_fire_1.wav", path .. "sil_fire_2.wav", path .. "sil_fire_3.wav", path .. "sil_fire_4.wav"}, true, ")")
TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "check_button.wav")
TFA.AddWeaponSound(pref .. ".Magout", path .. "reload_mag_out.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "reload_mag_in.wav")
TFA.AddWeaponSound(pref .. ".MagoutHalf", path .. "reload_half_mag_out.wav")
TFA.AddWeaponSound(pref .. ".MaginHalf", path .. "reload_half_mag_in.wav")
TFA.AddWeaponSound(pref .. ".Boltback", path .. "check_handle_back.wav")
TFA.AddWeaponSound(pref .. ".Boltforward", path .. "check_handle_fwd.wav")
TFA.AddWeaponSound(pref .. ".Rustle", {path .. "rustle_1.wav", path .. "rustle_2.wav", path .. "rustle_3.wav"})