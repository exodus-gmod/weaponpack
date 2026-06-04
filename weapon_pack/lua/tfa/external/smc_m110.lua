

TFA.AddFireSound("TFA_INS2_M110.FIRE", "weapons/wow/m14_fp.wav")

TFA.AddWeaponSound("TFA_INS2_M110.FIRE_SUPPRESSED", "weapons/wow/m14_suppressed_fp.wav")

TFA.AddWeaponSound("SMC_m110.OUTDOORS1", "weapons/wow/m14_dist.wav")

TFA.AddWeaponSound("SMC_SR25.INDOORS1", "^smc/sr25/M110_Indoors.wav")

TFA.AddWeaponSound("M14_MAGIN", "weapons/m14/handling/m14_reloadcomplet.wav")

TFA.AddWeaponSound("M14_MAGIN2", "weapons/m14/handling/m14_reloadcomplet2.wav")

TFA.AddWeaponSound("M14_MAGOUT", "weapons/m14/handling/m14_magout.wav")

TFA.AddWeaponSound("M14_EMPTY", "weapons/m14/handling/m14_empty.wav")



local hudcolor = Color(255, 180, 0, 20)
if killicon and killicon.Add then
	killicon.Add("tfa_smc_m110", "vgui/hud/tfa_smc_M110", hudcolor)
end

