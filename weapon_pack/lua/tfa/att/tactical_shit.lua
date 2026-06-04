if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Tactical Style"
ATTACHMENT.ShortName = "Tactic"
ATTACHMENT.Icon = "entities/tactical.png"
ATTACHMENT.Description = {
	Color(50, 255, 50), "[+] VMPos = Vector(-2.35, -1, 0)",
	Color(50, 255, 50), "[+] VMAng = Vector(0, 0, -15) ",
}


ATTACHMENT.WeaponTable = {
}
	
function ATTACHMENT:Attach(wep)
	wep.VMPos = Vector(-2.35, -1, 0)    
	wep.VMAng = Vector(0, 0, -15) 
	wep.CrouchPos = Vector(-2.35, -1, -0.5)
	wep.CrouchAng = Vector(0, 0, -13)
end

function ATTACHMENT:Detach(wep)
	wep.VMPos = Vector(0, 0, 0)    
	wep.VMAng = Vector(0, 0, 0) 
	wep.CrouchPos = Vector(-2.35, 0, -1)
	wep.CrouchAng = Vector(0, 0, -12.5)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end