if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Magpul Handguard"
--ATTACHMENT.ID = "base" -- normally this is just your filename
ATTACHMENT.Description = { TFA.AttachmentColors["+"], "5% Increased Movement Speed", TFA.AttachmentColors["-"], "10% Reduced Range" }
ATTACHMENT.Icon = "entities/ar15_att_moe_b.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "MOEB"

ATTACHMENT.WeaponTable = {
	["VElements"] = {
		["basebarrel"] = {
			["active"] = false
		},
		["magpulbarrel"] = {
			["active"] = true
		}
	},
	["Bodygroups_W"] = {
		[2] = 2
	},
	["Primary"] = {
		["Range"] = function(wep,stat) return stat * 0.9 end,
	},
	["MoveSpeed"] = function(wep,stat) return stat * 1.05 end,
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 1.05 end
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