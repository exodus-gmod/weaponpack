if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Safety 2"
ATTACHMENT.ShortName = "Safety"
ATTACHMENT.Icon = "entities/tb2.png"
ATTACHMENT.Description = {
	Color(50, 255, 50), "[+] SafetyPos = Vector(0, 0, 3) ",
	Color(50, 255, 50), "[+] SafetyAng = Vector(-25, 0, 0) ",
}


ATTACHMENT.WeaponTable = {
}
	
function ATTACHMENT:Attach(wep)
	wep.SafetyPos = Vector(0, 0, 3)  
	wep.SafetyAng = Vector(-25, 0, 0)
end

function ATTACHMENT:Detach(wep)
	wep.SafetyPos = Vector(2.522, -1.721, -3.036) 
	wep.SafetyAng = Vector(-14.344, 35.99, -33.807)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end