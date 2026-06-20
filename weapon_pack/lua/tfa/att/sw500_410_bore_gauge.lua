if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name        = ".410 Bore Gauge"
ATTACHMENT.ShortName   = ".410 Shells"

ATTACHMENT.Icon        = "entities/sw500_410_bore_gauge.png" 

ATTACHMENT.Description = { 
TFA.AttachmentColors["+"], "+5 Pellets", "Decreases Recoil in 25%", "Increases Spread Recovery",  
TFA.AttachmentColors["-"], "Decreases Damage in 85%", "Decreases Range", "Decreases Bullet Velocity", "Increases Spread", 
}

ATTACHMENT.WeaponTable = {

	["Bodygroups_V"] = {
		[1] = 1
	},
	
	["VElements"] = {
		["500_shells"] = {
			["active"] = false,
		},
		["410_shells"] = {
			["active"] = true,
		}
	},
	
	["Primary"] = {
		["Velocity"] = function(wep,stat) return stat * 0.64 end,
		["KickUp"] = function(wep,stat) return stat * 0.75 end,
		["KickDown"] = function(wep,stat) return stat * 0.75 end,
		["KickHorizontal"] = function(wep,stat) return stat * 0.75 end,
		["Damage"] = function(wep,stat) return stat * 0.15 end,
		["NumShots"] = function(wep,stat) return stat * 5 end,
		["IronAccuracy"] = function(wep,stat) return stat * 4.2 end,
		["Spread"] = function(wep,stat) return stat * 1.65 end,
		["SpreadRecovery"] = function(wep,stat) return stat * 1.5 end,
		["Range"] = function(wep,stat) return stat * 0.1 end,
		["RangeFalloff"] = function(wep,stat) return stat * 0.65 end,
		
        ["RangeFalloffLUT"] = {
	        bezier     = true,
	        range_func = "quintic",
	        units      = "meters",
	
	        lut = {
		        {range = 30, damage = 1},
		        {range = 50, damage = 0.9},
		        {range = 100, damage = 0.65},
		        {range = 150, damage = 0.45},
		        {range = 200, damage = 0.45},
		        {range = 250, damage = 0.45},
		        {range = 500, damage = 0.45},
		        {range = 600, damage = 0.45},
		        {range = 800, damage = 0.45},
	        }
        },
	},
}

function ATTACHMENT:Attach(wep)
	if not wep.IsFirstDeploy then
		wep:Unload()
	end
end

function ATTACHMENT:Detach(wep)
	wep:Unload()
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end