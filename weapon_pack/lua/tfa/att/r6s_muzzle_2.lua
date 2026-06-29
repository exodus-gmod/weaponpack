if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Muzzle Brake"
ATTACHMENT.Description = {TFA.AttachmentColors["="], "Muzzle Break",TFA.AttachmentColors["+"],"15% Less Recoil" ,TFA.AttachmentColors["-"],"Slower ADS Speed"}
ATTACHMENT.Icon = "entities/r6s_muzzlebreak.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "MUBREAK"

ATTACHMENT.WeaponTable = {
			["Primary"] = {
                ["KickUp"] = function( wep, stat ) return stat * 0.85 end,
                ["KickHorizontal"] = function( wep, stat ) return stat * 0.85 end,
                ["SpreadMultiplierMax"] = function( wep, stat ) return stat * 1 end
        },
		["IronSightTime"] = function( wep, stat ) return stat * 1.25 end,	
	}
	
if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end