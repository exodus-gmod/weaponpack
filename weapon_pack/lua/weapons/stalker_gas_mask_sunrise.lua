AddCSLuaFile()

if SERVER then
    SWEP.Weight = 1
    SWEP.AutoSwitchTo = false
    SWEP.AutoSwitchFrom = false
    if not ConVarExists("VNT_STALKER_GasMask_Filter_Ammo") then
        CreateConVar("VNT_STALKER_GasMask_Filter_Ammo", 0, { FCVAR_REPLICATED, FCVAR_ARCHIVE })
    end
end

if CLIENT then
    local _SELFENTNAME = "stalker_gas_mask_sunrise"
    local _INFONAME = "Gas Mask"
    SWEP.Category = "EXR - Equipment"
    SWEP.PrintName = _INFONAME
    SWEP.Author = "Lucho"
    SWEP.Contact = ""
    SWEP.Instructions = "RELOAD: Mask On/Off"
    SWEP.Slot = 5
    SWEP.SlotPos = 64

    SWEP.ViewModelFOV = 85
    SWEP.BounceWeaponIcon = false
    SWEP.DrawWeaponInfoBox = true
    SWEP.DrawCrosshair = true
    SWEP.DrawAmmo = true
    SWEP.SwayScale = 1
    SWEP.BobScale = 1

    language.Add(_SELFENTNAME, _INFONAME)
    language.Add("gasmaskfilters_ammo", "Gas Mask Filters")
    killicon.Add(_SELFENTNAME, "vgui/entities/" .. _SELFENTNAME, Color(255, 255, 255))
end

game.AddAmmoType({ name = "gasmaskfilters", dmgtype = DMG_GENERIC })

SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.AccurateCrosshair = true
SWEP.ViewModel = Model("models/gmod4phun/c_contagion_gasmask.mdl")
SWEP.WorldModel = Model("models/gmod4phun/w_contagion_gasmask_equipped.mdl")
SWEP.UseHands = true

SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "gasmaskfilters"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

sound.Add({
    name = "VNT_GaskMask.On",
    channel = CHAN_BODY,
    level = 75,
    volume = 1.0,
    pitch = { 95, 105 },
    sound = {"jessev92/items/gas_mask_on.wav"},
})

sound.Add({
    name = "VNT_GaskMask.Off",
    channel = CHAN_BODY,
    level = 75,
    volume = 1.0,
    pitch = { 95, 105 },
    sound = {"jessev92/items/gas_mask_off.wav"},
})

local ActionDelay = CurTime()
local AnimDelay = CurTime()

-- Ajoutez cette variable globale pour stocker l'état de l'overlay
local gasMaskOverlay = false

-- Utilisez ce hook pour appliquer l'overlay
hook.Add("RenderScreenspaceEffects", "GasMaskOverlayEffect", function()
    if gasMaskOverlay then
        local overlayMaterial = Material("jessev92/ui/overlays/mask_gas01")
        render.UpdateScreenEffectTexture()
        overlayMaterial:SetFloat("$alpha", 1)
        render.SetMaterial(overlayMaterial)
        render.DrawScreenQuad()
    end
end)

function SWEP:Initialize()
    self:SetHoldType("camera")
end

function SWEP:GrabEarAnim()
    AnimDelay = CurTime() + 1.5
    self.Owner.ChatGestureWeight = self.Owner.ChatGestureWeight or 0

    if (AnimDelay >= CurTime()) then
        self.Owner.ChatGestureWeight = math.Approach(self.Owner.ChatGestureWeight, 1, 1)
    else
        self.Owner.ChatGestureWeight = math.Approach(self.Owner.ChatGestureWeight, 0, 1)
    end

    if (self.Owner.ChatGestureWeight > 0) then
        self.Owner:AnimRestartGesture(GESTURE_SLOT_VCD, ACT_GMOD_IN_CHAT, true)
        self.Owner:AnimSetGestureWeight(GESTURE_SLOT_VCD, self.Owner.ChatGestureWeight)
    end
end

function SWEP:Think()
    local vm = self.Owner:GetViewModel()
    if self.Owner:KeyPressed(IN_RELOAD) and ActionDelay <= CurTime() then
        if self.Owner:GetNWBool("STALKER_PlyGasMaskOn") == false then
            self:GrabEarAnim()
            if CLIENT and self.Owner == LocalPlayer() then
                self.Owner.MaskMDL = ClientsideModel("models/gmod4phun/w_contagion_gasmask_equipped.mdl", RENDERGROUP_BOTH)
                local MaskMDL = self.Owner.MaskMDL
                MaskMDL:SetParent(self.Owner)
                MaskMDL:AddEffects(EF_BONEMERGE)
                surface.PlaySound("jessev92/items/gas_mask_on.wav")
                gasMaskOverlay = true  -- Activer l'overlay
                print("[DEBUG] Gas mask equipped - Overlay applied")
            end
            if SERVER then
                self.Owner:ViewPunch(Angle(1, 0, 0))
                self.Owner:SetNWBool("STALKER_PlyGasMaskOn", true)
                self:SendEquipedToAll(self.Owner, true)
            end
            vm:SendViewModelMatchingSequence(vm:LookupSequence("on"))
        elseif self.Owner:GetNWBool("STALKER_PlyGasMaskOn") == true then
            self:GrabEarAnim()
            if CLIENT and self.Owner == LocalPlayer() then
                surface.PlaySound("jessev92/items/gas_mask_off.wav")
                gasMaskOverlay = false  -- Désactiver l'overlay
                if IsValid(self.Owner.MaskMDL) then
                    self.Owner.MaskMDL:Remove()
                end
                print("[DEBUG] Gas mask unequipped - Overlay removed")
            end
            if SERVER then
                self.Owner:ViewPunch(Angle(1, 0, 0))
                self.Owner:SetNWBool("STALKER_PlyGasMaskOn", false)
                self:SendEquipedToAll(self.Owner, false)
            end
            vm:SendViewModelMatchingSequence(vm:LookupSequence("off"))
        end
        ActionDelay = CurTime() + 3
    end
end

function SWEP:PrimaryAttack()
    return false
end

function SWEP:SecondaryAttack()
    return false
end

function SWEP:Reload()
    return false
end

function SWEP:OnDrop()
    if CLIENT and IsValid(self.Owner) and self.Owner == LocalPlayer() then
        surface.PlaySound("jessev92/items/gas_mask_off.wav")
        gasMaskOverlay = false -- Désactiver l'overlay
        if IsValid(self.Owner.MaskMDL) then
            self.Owner.MaskMDL:Remove()
        end
    end

    if SERVER and IsValid(self.Owner) then
        self.Owner:SetNWBool("STALKER_PlyGasMaskOn", false)
        self:SendEquipedToAll(self.Owner, false)
    end
end

function SWEP:OnRemove()
    self:OnDrop()
end

function SWEP:SendEquipedToAll(ply, boolean)
    net.Start("GasMask:Equip")
    net.WriteBool(boolean)
    net.WriteEntity(ply)
    net.Broadcast()
end

if SERVER then
    util.AddNetworkString("GasMask:Equip")
    util.AddNetworkString("GasMask:DeathCleanup")
end

net.Receive("GasMask:Equip", function(len)
    local boolean = net.ReadBool()
    local ply = net.ReadEntity()
    if not IsValid(ply) then return end
    if ply == LocalPlayer() then return end
    ply:SetNWBool("STALKER_PlyGasMaskOn", boolean)

    if not boolean and ply.MaskMDL and IsValid(ply.MaskMDL) then
        ply.MaskMDL:Remove()
        return
    end

    ply.MaskMDL = ClientsideModel("models/gmod4phun/w_contagion_gasmask_equipped.mdl", RENDERGROUP_BOTH)
    local MaskMDL = ply.MaskMDL
    MaskMDL:SetParent(ply)
    MaskMDL:AddEffects(EF_BONEMERGE)
end)

-- Cleanup function for death
local function GasMaskDeathCleanup()
    for _, _P in pairs(player.GetAll()) do
        if (not _P:Alive() or not IsValid(_P)) and _P:GetNWBool("STALKER_PlyGasMaskOn") ~= false then
            if CLIENT and _P == LocalPlayer() then
                gasMaskOverlay = false  -- Désactiver l'overlay
                if IsValid(_P.MaskMDL) then
                    _P.MaskMDL:Remove()
                end
            end
            if SERVER then
                _P:SetNWBool("STALKER_PlyGasMaskOn", false)
                net.Start("GasMask:DeathCleanup")
                net.WriteEntity(_P)
                net.Broadcast()
            end
        end
    end
end

timer.Create("STALKERGasMaskDeathRemovalTimer", 2, 0, GasMaskDeathCleanup)

if CLIENT then
    net.Receive("GasMask:DeathCleanup", function()
        local ply = net.ReadEntity()
        if IsValid(ply) and ply == LocalPlayer() then
            gasMaskOverlay = false  -- Désactiver l'overlay
            if ply.MaskMDL and IsValid(ply.MaskMDL) then
                ply.MaskMDL:Remove()
            end
        end
    end)
end
