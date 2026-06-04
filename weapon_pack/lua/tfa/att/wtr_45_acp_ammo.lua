if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = ".45 ACP Conversion"
ATTACHMENT.Description = {
TFA.AttachmentColors["="], "Hornady Critical Duty 220gr +P .45 ACP", 
TFA.AttachmentColors["+"], "50% incrteased damage",
TFA.AttachmentColors["-"], "Magazine capacity decreased to 10", "25% lower spread recovery", "70% increased vertical recoil", "30% increased horizontal recoil", "Rate of fire decreased by 30",
 }
ATTACHMENT.Icon = "entities/45acp.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "45ACP"

ATTACHMENT.WeaponTable = {
		["Primary"] = {
		        ["RPM"] = function( wep, stat) return stat - 30 end,
		        ["SpreadRecovery"] = function( wep, stat ) return stat * 0.75 end,
                ["ClipSize"] = function( wep, stat) return  stat - 7 end,
				["Damage"] = function( wep, stat ) return stat * 1.5 end,
				["KickUp"] = function( wep, stat ) return stat * 1.7 end,
				["KickHorizontal"] = function( wep, stat ) return stat * 1.3 end,				
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