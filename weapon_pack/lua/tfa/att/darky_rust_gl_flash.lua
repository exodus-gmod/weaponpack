if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "40mm flash Grenade"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = {
	TFA.AttachmentColors["-"], "0 DMG",
}
ATTACHMENT.Icon = "entities/ammo.grenadelauncher.buckshot.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "FLASH"

ATTACHMENT.WeaponTable = {
	["Primary"] = {
		["Damage"] = 0,
		["Projectile"] = "flash_lucho",
	},
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
