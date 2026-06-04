if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "RIS Handguard"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "Activates Laser Sight and GL", TFA.AttachmentColors["-"], "Reduced Hipfire Accuracy" }
ATTACHMENT.Icon = "entities/ar15_att_ris.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "RIS"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["basebarrel"] = {
			["active"] = false
		},
		["risbarrel"] = {
			["active"] = true
		}
	},
	["Bodygroups_W"] = {
		[2] = 1
	},
	["Primary"] = {
		["MoveSpeed"] = function(wep,stat) return stat * 1 end,
		["Spread"] = function (wep,stat) return stat + 0.01 end,
		["KickHorizontal"] = function (wep,stat) return stat * 1 end,
	},	["KickUp"] = function(wep,stat) return stat * 1 end,
}

function ATTACHMENT:Attach( wep )
	if TFA.Enum.ReadyStatus[wep:GetStatus()] then
		wep:ChooseIdleAnim()
		if game.SinglePlayer() then
			wep:CallOnClient("ChooseIdleAnim","")
		end
	end
end

function ATTACHMENT:Detach( wep )
	if TFA.Enum.ReadyStatus[wep:GetStatus()] then
		wep:ChooseIdleAnim()
		if game.SinglePlayer() then
			wep:CallOnClient("ChooseIdleAnim","")
		end
	end
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end