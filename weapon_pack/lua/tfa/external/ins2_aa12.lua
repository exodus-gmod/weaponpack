local path, pref

if killicon and killicon.Add then
	killicon.Add("tfa_ins2_aa12", "vgui/killicons/tfa_ins2_aa12", color_white)
end

-- AA-12
path = "weapons/tfa_ins2/aa12/"
pref = "TFA_INS2.WF_SHG21."

TFA.AddFireSound(pref .. "1", {path .. "shg21_fp_fire_11.wav", path .. "shg21_fp_fire_12.wav", path .. "shg21_fp_fire_13.wav", path .. "shg21_fp_fire_14.wav", path .. "shg21_fp_fire_15.wav"}, false, ")")
TFA.AddFireSound(pref .. "2", {path .. "shg21_fp_fire_silencer_11.wav", path .. "shg21_fp_fire_silencer_12.wav", path .. "shg21_fp_fire_silencer_13.wav", path .. "shg21_fp_fire_silencer_14.wav", path .. "shg21_fp_fire_silencer_15.wav"}, false, ")")

TFA.AddWeaponSound(pref .. "WpnUp", path .. "shg21_reload_fp_01_wpnup.wav")
TFA.AddWeaponSound(pref .. "ClipOut", path .. "shg21_reload_fp_02_clipout.wav")
TFA.AddWeaponSound(pref .. "ClipIn", path .. "shg21_reload_fp_03_clipin.wav")
TFA.AddWeaponSound(pref .. "ClipLock", path .. "shg21_reload_fp_04_cliplock.wav")
TFA.AddWeaponSound(pref .. "BoltBack", path .. "shg21_reload_fp_05_cockbk.wav")
TFA.AddWeaponSound(pref .. "BoltForward", path .. "shg21_reload_fp_06_cockfwd.wav")

TFA.AddWeaponSound(pref .. "Empty", path .. "mp5k_empty.wav")