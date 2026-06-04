if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Extended Tube, 6rnd"
ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "Increases internal magazine capacity", "+10% Range", TFA.Attachments.Colors["-"],"-5% Movement Speed", "Slower ADS Time",
}
ATTACHMENT.Icon = "entities/ks23tube.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "+MAG"

ATTACHMENT.WeaponTable = {
	["Bodygroups_V"] = {[2] = 1},
	["Bodygroups_W"] = {[2] = 1},
	["Primary"] = {
		["ClipSize"] = function(wep, val)
			return wep.Primary.ClipSize_ExtRifle or 7
		end,
		["Range"] = function (wep, stat) return stat * 1.1 end,
	},
	["MoveSpeed"] = function (wep, stat) return stat * 0.95 end,
	["IronSightsMoveSpeed"] = function (wep, stat) return stat * 0.95 end,
	["IronSightTime"] = function (wep, stat) return stat * 1.35 end,
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
