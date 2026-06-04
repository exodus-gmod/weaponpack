if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "WF501B"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = {}
ATTACHMENT.Icon = "entities/eft_wf501.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "FL"

ATTACHMENT.WeaponTable = {
["VElements"] = {
		["flashlight"] = {
			["active"] = true
		}
	},
	["WElements"] = {
		["flashlight"] = {
			["active"] = true
		}
	},
	["FlashlightAttachment"] = 1,
}

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end