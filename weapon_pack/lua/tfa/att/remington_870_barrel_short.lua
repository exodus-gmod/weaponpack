if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name        = "Short Barrel"
ATTACHMENT.ShortName   = "Short"

ATTACHMENT.Icon        = "entities/remington_870_barrel_short.png" 

ATTACHMENT.Description = { 
TFA.AttachmentColors["+"], "+10% Move Speed", "+10% Aim Move Speed", "Decreases Aim Time", 
TFA.AttachmentColors["-"], "-15% Range", "+10% Spread", "+10% Aim Spread", "-2 Shells" }

ATTACHMENT.WeaponTable = {

	["Bodygroups_V"] = {
		[2] = 2
	},
	
	["Bodygroups_W"] = {
		[1] = 2
	},
	
	["ViewModelBoneMods"] = {
		["b_wpn_muzzle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 2.9, 0), angle = Angle(0, 0, 0) },
		["A_Suppressor"] = { scale = Vector(0.9, 1, 0.9), pos = Vector(0, 3.05, 0), angle = Angle(0, 0, 0) },
		["A_LaserFlashlight"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 90) },
	},
	
    ["WorldModelBoneMods"] = {
		["ATTACH_Muzzle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 3.05, 0), angle = Angle(0, 0, 0) },
	},
	
	["Primary"] = {
		["IronAccuracy"] = function(wep,stat) return stat * 1.1 end,
		["Spread"] = function(wep,stat) return stat * 1.1 end,
		
		["Range"] = function(wep,stat) return stat * 0.85 end,

		["ClipSize"] = function(wep,stat) return stat - 2 end,
	},
	
	["MoveSpeed"] = function(wep,stat) return stat * 1.1 end,
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 1.1 end,
	["IronSightTime"] = function(wep, val) return val * 0.6 end,
}

function ATTACHMENT:Attach(wep)
	if not wep.IsFirstDeploy then
		wep:Unload()
	end
end

function ATTACHMENT:Attach(wep)
	wep:Unload()
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end