local path = "/weapons/sr2m_veresk/"
local pref = "TFA_INS2.SR2M_Veresk"

TFA.AddFireSound(pref .. ".Fire", {path .. "sr2m_fire.wav"}, true, ")")
TFA.AddFireSound(pref .. ".Fire_Suppressed", {path .. "sr2m_fire_suppressed.wav"})

TFA.AddWeaponSound(pref .. ".Empty", path .. "sr2m_empty.wav")
TFA.AddWeaponSound(pref .. ".BipodSwivel", path .. "sr2m_stock.wav")

TFA.AddWeaponSound(pref .. ".Magout", path .. "sr2m_magout.wav")
TFA.AddWeaponSound(pref .. ".Magrelease", path .. "sr2m_magrelease.wav")
TFA.AddWeaponSound(pref .. ".Magin", path .. "sr2m_magin.wav")

TFA.AddWeaponSound(pref .. ".Boltback", path .. "sr2m_boltback.wav")
TFA.AddWeaponSound(pref .. ".Boltforward", path .. "sr2m_boltrelease.wav")
TFA.AddWeaponSound(pref .. ".Boltlock", path .. "sr2m_boltlock.wav")
TFA.AddWeaponSound(pref .. ".Boltunlock", path .. "sr2m_boltunlock.wav")