if not ATTACHMENT then
	ATTACHMENT = {}
end

ATTACHMENT.Name = "Extended Tube, 6rnd"
ATTACHMENT.Description = {
	TFA.AttachmentColors["+"], "Increases internal magazine capacity", "+10% Range", TFA.Attachments.Colors["-"],"-5% Movement Speed", "Slower ADS Time",
}
ATTACHMENT.Icon = "entities/ks23tube.png" --Revers to label, please give it an icon though!  This should be the path to a png, like "entities/tfa_ammo_match.png"
ATTACHMENT.ShortName = "+MAG"

ATTACHMENT.WeaponTable = {
	["Bodygroups_V"] = {[2] = 1},
	["Bodygroups_W"] = {[2] = 1},
	["Primary"] = {
		["ClipSize"] = function(wep, stat)
			return stat + 2
		end,
		["Range"] = function (wep, stat) return stat * 1.1 end,
	},
	["MoveSpeed"] = function (wep, stat) return stat * 0.95 end,
	["IronSightsMoveSpeed"] = function (wep, stat) return stat * 0.95 end,
	["IronSightTime"] = function (wep, stat) return stat * 1.35 end,
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
