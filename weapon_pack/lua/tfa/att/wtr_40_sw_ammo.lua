if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "40 S&W Conversion"
ATTACHMENT.ShortName = "40SW" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
TFA.Attachments.Colors["="], "Remington 165gr 40 S&W",
TFA.Attachments.Colors["+"], "30% increased damage", 
TFA.Attachments.Colors["-"], "20% lower spread recovery", "40% higher vertical upwards recoil", "10% higher vertical downwards recoil", "Magazine capacity decreased by 3",
}
ATTACHMENT.Icon = "entities/40sw.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["SpreadIncrement"] = function( wep, stat ) return stat * 0.9 end,
		["SpreadRecovery"] = function( wep, stat ) return stat * 0.8 end,
		["Damage"] = function( wep, stat ) return stat * 1.3 end,
		["ClipSize"] = function( wep, stat) return stat - 3 end,
		["KickUp"] = function( wep, stat ) return stat * 1.4 end,
		["KickDown"] = function( wep, stat ) return stat * 1.1 end,
	}
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end

function ATTACHMENT:Attach(wep)
	wep:Unload()
end

function ATTACHMENT:Detach(wep)
	wep:Unload()
end
		