if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "9x19mm Self Defense"
ATTACHMENT.Description = {
TFA.AttachmentColors["="], "147gr JHP 9x19mm Subsonic Ammunition", 
TFA.AttachmentColors["+"],"15% More Damage",
TFA.AttachmentColors["-"], "10% More vertical recoil", "50% More horizontal recoil",  }
ATTACHMENT.Icon = "entities/wtr_9mm_hornady.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "Horn"

ATTACHMENT.WeaponTable = {
		["Primary"] = {
				["Damage"] = function( wep, stat ) return stat * 1.15 end,
				["KickUp"] = function( wep, stat ) return stat * 1.1 end,
				["KickHorizontal"] = function( wep, stat ) return stat * 1.5 end,				
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