local path = "weapons/tfa_ins2/scarl/"

sound.Add( {
	name = "TFA_INS2_SCARL.2",
	channel = CHAN_WEAPON,
	volume = 1,
	level = 100,
	pitch = { 95, 100 },
	sound = {"weapons/tfa_ins2/scarl/scarl_suppressed.wav"}
} )

sound.Add( {
	name = "TFA_INS2_SCARL.1",
	channel = CHAN_STATIC,
	volume = 0.85,
	level = 96,
	pitch = { 90, 100 },
	sound = { "weapons/tfa_ins2/scarl/scarl_fire.wav" }
} )

TFA.AddWeaponSound("Weapon_SCARL.Empty", path .. "scarl_empty.wav")

TFA.AddWeaponSound("Weapon_SCARL.Magout", path .. "scarl_magout.wav")
TFA.AddWeaponSound("Weapon_SCARL.Magin", path .. "scarl_magin.wav")
TFA.AddWeaponSound("Weapon_SCARL.Hit", path .. "scarl_hit.wav")
TFA.AddWeaponSound("Weapon_SCARL.Hit", path .. "scarl_maghit.wav")
TFA.AddWeaponSound("Weapon_SCARL.Boltback", path .. "scarl_boltback.wav")
TFA.AddWeaponSound("Weapon_SCARL.Boltrelease", path .. "scarl_boltrelease.wav")
TFA.AddWeaponSound("SCARL.Draw", path .. "scarl_draw.wav")
TFA.AddWeaponSound("SCARL.Holster", path .. "scarl_draw.wav")