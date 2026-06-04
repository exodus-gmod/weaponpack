if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = ".357 SIG Conversion"
ATTACHMENT.Description = {
TFA.AttachmentColors["="], "Pow'RBall 100gr .357 SIG", 
TFA.AttachmentColors["+"],"15% damage increase", 
TFA.AttachmentColors["-"],"Magazine capacity decreased to 14", "25% increased vertical recoil", "10% increased horizontal recoil"
}
ATTACHMENT.Icon = "entities/357sig.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "357SIG"

ATTACHMENT.WeaponTable = {
		["Primary"] = {
                ["ClipSize"] = function( wep, stat) return stat - 3 end,
				["Damage"] = function( wep, stat ) return stat * 1.15 end,
				["KickUp"] = function( wep, stat ) return stat * 1.25 end,
				["KickHorizontal"] = function( wep, stat ) return stat * 1.1 end,				
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