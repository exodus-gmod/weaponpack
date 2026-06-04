if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "9x19mm Major Ammunition"
ATTACHMENT.Description = {
TFA.AttachmentColors["="], "124gr JHP 9x19mm Major +P+ Ammunition", 
TFA.AttachmentColors["+"],"25% More Damage",
TFA.AttachmentColors["-"], "80% More vertical recoil", "50% More horizontal recoil",  }
ATTACHMENT.Icon = "entities/9mmjhp.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "9mm M"

ATTACHMENT.WeaponTable = {
		["Primary"] = {
				["Damage"] = function( wep, stat ) return stat * 1.25 end,
				["KickUp"] = function( wep, stat ) return stat * 1.8 end,
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