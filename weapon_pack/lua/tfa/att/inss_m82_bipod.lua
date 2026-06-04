if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name        = "M82 Bipod"
ATTACHMENT.ShortName   = "Bip"
ATTACHMENT.Icon        = "entities/tfa_qmark.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"

ATTACHMENT.Description = { 
    TFA.AttachmentColors["+"], "Now more Barrett", 
    TFA.AttachmentColors["+"], "Bipod", 
    TFA.AttachmentColors["="], "Only cosmetic", 
    TFA.AttachmentColors["-"], "Will clip through arms", 
}

ATTACHMENT.WeaponTable = {

	["VElements"] = {
		["bipod"] = {
			["active"] = true
		},
	},
	
	["WElements"] = {
		["bipod"] = {
			["active"] = true
		},
	},
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end