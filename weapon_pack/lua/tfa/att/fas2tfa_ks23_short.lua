if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "KS23M Barrel"
ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "+10% movement speed", "+10% ADS Movement Speed",
	TFA.AttachmentColors["-"], "+35% recoil", "20% Wider spread", "-1 Ammo Capacity"
}
ATTACHMENT.Icon = "entities/ks23short.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "SBS"

ATTACHMENT.WeaponTable = {
	["ViewModelBoneMods"] = {
	["A_Suppressor"] = { scale = Vector(.85, .85, .85), pos = Vector(13.75, 13.55, 4.27), angle = Angle(180, -90, 90)  },
	["A_Muzzle"] = { scale = Vector(1, 1, 1), pos = Vector(-9, 0, 0), angle = Angle(0, 0, 0)  },
	["A_MuzzleSupp"] = { scale = Vector(1, 1, 1), pos = Vector(-5, 0, 0), angle = Angle(0, 0, 0)  },	},
	["WorldModelBoneMods"] = {
	["ATTACH_Muzzle"] = { scale = Vector(.9, .9, .9), pos = Vector(0, 8.25, 0), angle = Angle(0, 0, 0)  },
},
	["VElements"] = {
		["short"] = {
			["active"] = true
		},
	},
	["IronSightsPos"] = Vector(-2.7285, -7.035, 1.847),
	["IronSightsAng"] = Vector(1.05, 0.015, 0),
	["Bodygroups_V"] = {[1] = 1},
	["Bodygroups_W"] = {[1] = 1},
	["Primary"] = {
		["KickUp"] = function( wep, stat ) return stat * 1.15 end,
		["Spread"] = function(wep,stat) return stat * 1.2 end,
		["IronAccuracy"] = function( wep, stat ) return stat * 1.2 end,
		["ClipSize"] = function(wep, stat)
			return stat - 2
		end,
	},
	["MoveSpeed"] = function( wep, stat ) return stat * 1.1 end,
	["IronSightsMoveSpeed"] = function( wep, stat ) return stat * 1.1 end,
	["IronSightsSensitivity"] = function( wep, stat ) return stat * 1 end,
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


if not TFA_ATTACHMENT_ISUPDATING then
	TFAUpdateAttachments()
end


