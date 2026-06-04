if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "140gr 9x19mm FMJ Subsonic Ammunition"
ATTACHMENT.ShortName = "9mm Sub" --Abbreviation, 5 chars or less please
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { 
TFA.Attachments.Colors["="], "9x19mm Sellier & Bellot 140 grain subsonic FMJ.", 
TFA.Attachments.Colors["-"], "5% less damage",  "10% more spread", "10% range fall off",
TFA.Attachments.Colors["+"], "15% less recoil",
}
ATTACHMENT.Icon = "entities/9mmsubsonic.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = function( wep, stat ) return stat * 0.95 end,
		["Spread"] = function( wep, stat ) return stat * 1.1 end,
		["IronAccuracy"] = function( wep, stat ) return stat * 1.05 end,
		["KickUp"] = function( wep, stat ) return stat * 0.9 end,
		["KickDown"] = function( wep, stat ) return stat * 0.9 end,
		["RangeFalloff"] = function( wep, stat ) return stat * 0.9 end
	}
}

function ATTACHMENT:Attach(wep)
	wep:Unload()
end

function ATTACHMENT:Detach(wep)
	wep:Unload()
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end
