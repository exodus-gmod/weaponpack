if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "9x19mm RIP Ammunition"
ATTACHMENT.Description = {
TFA.AttachmentColors["="], "92gr G2 Research R.I.P. 9x19mm Hollow-Point Ammunition", 
TFA.AttachmentColors["+"], "Damage Increased to 32",
TFA.AttachmentColors["-"], "80% More vertical recoil", "50% More horizontal recoil", "Only usuable in Handguns"  }
ATTACHMENT.Icon = "entities/9mmrip.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "9mm RIP"

ATTACHMENT.WeaponTable = {
		["Primary"] = {
	    		["Damage"] = 32,
				["KickUp"] = function( wep, stat ) return stat * 2 end,
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