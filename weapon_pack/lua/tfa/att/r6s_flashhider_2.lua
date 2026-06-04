if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Flash Hider"
ATTACHMENT.Description = {TFA.AttachmentColors["="],"Flash Hider",TFA.AttachmentColors["+"],"Removes Muzzle Flash",TFA.AttachmentColors["+"],"5% Less Recoil",TFA.AttachmentColors["-"],"Slower ADS Speed"}
ATTACHMENT.Icon = "entities/r6s_flashhider.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "FLHIDER"

ATTACHMENT.WeaponTable = {
	["MuzzleAttachmentMod"] = 1,--Muzzle flash attachment
	["MuzzleFlashEffect"] = "tfa_muzzleflash_silenced",
				["Primary"] = {
                ["KickUp"] = function( wep, stat ) return stat * 0.95 end,
                ["KickHorizontal"] = function( wep, stat ) return stat * 0.95 end,
				["IronSightTime"] = function( wep, stat ) return stat * 1.35 end,		
                ["SpreadMultiplierMax"] = function( wep, stat ) return stat * 1 end
        }
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end