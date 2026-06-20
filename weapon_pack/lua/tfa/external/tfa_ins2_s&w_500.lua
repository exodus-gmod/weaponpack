local path = "/weapons/sw500/"
local pref = "TFA_INS2.SW500"
local hudcolor = Color(255, 80, 0, 191)

TFA.AddFireSound(pref .. ".Fire", path .. "sw500_fire.wav", true, ")")

TFA.AddWeaponSound(pref .. ".Empty", path .. "revolver_empty.wav")
TFA.AddWeaponSound(pref .. ".CockHammer", path .. "revolver_cock_hammer.wav")

TFA.AddWeaponSound(pref .. ".OpenChamber", path .. "sw500_openchamber.wav")
TFA.AddWeaponSound(pref .. ".CloseChamber", path .. "sw500_closechamber.wav")

TFA.AddWeaponSound(pref .. ".DumpRounds1", path .. "sw500_dumprounds1.wav")
TFA.AddWeaponSound(pref .. ".DumpRounds2", path .. "sw500_dumprounds2.wav")
TFA.AddWeaponSound(pref .. ".RoundIn", path .. "sw500_roundin.wav")
