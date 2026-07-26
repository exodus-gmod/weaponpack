if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name        = "Long Barrel"
ATTACHMENT.ShortName   = "Long"

ATTACHMENT.Icon        = "entities/remington_870_barrel_long.png" 

ATTACHMENT.Description = { 
TFA.AttachmentColors["+"], "+15% Range", "-15% Aim Spread", "+2 Shells",
TFA.AttachmentColors["-"], "-15% Hipfire Spread", "-5% Move Speed", "-5% Aim Move Speed", "Increases Aim Time" } 

ATTACHMENT.WeaponTable = {

	["Bodygroups_V"] = {
		[2] = 1
	},
	
	["Bodygroups_W"] = {
		[1] = 1
	},
	
	["ViewModelBoneMods"] = {
		["b_wpn_muzzle"] = { scale = Vector(1, 1, 1), pos = Vector(0, -3.1, 0), angle = Angle(0, 0, 0) },
		["A_Suppressor"] = { scale = Vector(0.9, 0.9, 0.9), pos = Vector(0, -3, 0), angle = Angle(0, 0, 0) },
	},
	
    ["WorldModelBoneMods"] = {
		["ATTACH_Muzzle"] = { scale = Vector(1, 1, 1), pos = Vector(0, -3.2, 0), angle = Angle(0, 0, 0) },
	},

	["Primary"] = {
		["IronAccuracy"] = function(wep,stat) return stat * 0.85 end,
		["Spread"] = function(wep,stat) return stat * 1.15 end,
		
		["MinRangeStartFalloff"] = function(wep,stat) return stat * 1.15 end,
		
		["ClipSize"] = function(wep,stat) return stat + 2 end,
	},
	
	["MoveSpeed"] = function(wep,stat) return stat * 0.95 end,
	["IronSightsMoveSpeed"] = function(wep,stat) return stat * 0.95 end,
	["IronSightTime"] = function(wep, val) return val * 1.4 end,
}

function ATTACHMENT:Attach(wep)
    if CLIENT then return end
    timer.Simple(0.01, function()
        if IsValid(wep) then
            local current_clip = wep:Clip1()
            local new_max = wep:GetStat("Primary.ClipSize")
            local owner = wep:GetOwner()

            if current_clip > new_max then
                -- Decreased size: Clamp the current clip to the lower max capacity
                wep:SetClip1(new_max)
            elseif current_clip < new_max and IsValid(owner) then
                -- Increased size: Calculate the difference and pull from reserves
                local needed = new_max - current_clip
                local reserve = owner:GetAmmoCount(wep:GetPrimaryAmmoType())
                local give = math.min(needed, reserve)

                if give > 0 then
                    wep:SetClip1(current_clip + give)
                    owner:RemoveAmmo(give, wep:GetPrimaryAmmoType())
                end
            end
        end
    end)
end

function ATTACHMENT:Detach(wep)
    if CLIENT then return end
    timer.Simple(0.01, function()
        if IsValid(wep) then
            local current_clip = wep:Clip1()
            local new_max = wep:GetStat("Primary.ClipSize")
            local owner = wep:GetOwner()

            if current_clip > new_max then
                -- Decreased size: Refund extra bullets back into reserve ammo
                if IsValid(owner) then
                    local overflow = current_clip - new_max
                    owner:GiveAmmo(overflow, wep:GetPrimaryAmmoType(), true)
                end
                wep:SetClip1(new_max)
            elseif current_clip < new_max and IsValid(owner) then
                -- Increased size: Pull ammo to top off the mag if possible
                local needed = new_max - current_clip
                local reserve = owner:GetAmmoCount(wep:GetPrimaryAmmoType())
                local give = math.min(needed, reserve)

                if give > 0 then
                    wep:SetClip1(current_clip + give)
                    owner:RemoveAmmo(give, wep:GetPrimaryAmmoType())
                end
            end
        end
    end)
end

if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end