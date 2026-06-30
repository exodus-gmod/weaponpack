if SERVER then
    AddCSLuaFile()
end

DEFINE_BASECLASS("tfa_gun_base")

SWEP.Base = "tfa_gun_base"
SWEP.Category = "EXR - Shotguns"
SWEP.Author = "DocZesty"
SWEP.PrintName = "Super Shorty"
SWEP.Type = "Shotgun"
SWEP.Purpose = "A compact, secondary shotgun that can be easily concealed. Lacks range."

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.DrawCrosshair = true
SWEP.DrawCrosshairIS = false
SWEP.Slot = 1
SWEP.SlotPos = 1
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false
SWEP.Weight = 28

if TFA then
    local path = "weapons/msbg500/"
    local pref = "tfa_re9_msbg500"

    TFA.AddFireSound(pref .. ".1", path .. "shotgun_fire_1.wav", true, ")")
    TFA.AddWeaponSound(pref .. ".Boltback", path .. "shotgun_pump_1.wav")
    TFA.AddWeaponSound(pref .. ".Boltrelease", path .. "shotgun_pump_1.wav")
    TFA.AddWeaponSound(pref .. ".ShellInsert", {path .. "shotgun_load_shell_2.wav", path .. "shotgun_load_shell_4.wav"})
    TFA.AddWeaponSound(pref .. ".ShellInsertSingle", {path .. "shotgun_load_shell_2.wav", path .. "shotgun_load_shell_4.wav"})
end

local STAGE_NONE = 0
local STAGE_START = 1
local STAGE_LOOP = 2
local STAGE_END = 3

SWEP.ShotgunReloading = true
SWEP.ReloadStage = STAGE_NONE
SWEP.NextReloadAction = 0
SWEP.ReloadInterruptFire = true
SWEP.ReloadInterruptHandled = true

SWEP.Primary.Sound = Sound("weapons/msbg500/shotgun_fire_1.wav")
SWEP.Primary.Damage = 13
local scale_table = {
    [HITGROUP_HEAD]     = 2,
    [HITGROUP_CHEST]    = 1,
    [HITGROUP_STOMACH]  = 1,
    [HITGROUP_LEFTARM]  = 3.5,
    [HITGROUP_RIGHTARM] = 3.5,
    [HITGROUP_LEFTLEG]  = 3.5,
    [HITGROUP_RIGHTLEG] = 3.5,
}

local function ScaleDamage(ent, hitgroup, dmginfo)
    local scale = scale_table[hitgroup]
    if not IsValid( ent ) or not scale then return end
    dmginfo:ScaleDamage( scale )
end

hook.Add( "ScaleNPCDamage", "AdjustLimbDamageNPC", ScaleDamage )
hook.Add( "ScalePlayerDamage", "AdjustLimbDamagePlayer", ScaleDamage )

SWEP.Primary.DamageTypeHandled = true
SWEP.Primary.PenetrationMultiplier = 1
SWEP.Primary.HullSize = 0
SWEP.Primary.NumShots = 10
SWEP.Primary.Force = 0 --Force value, leave nil to autocalc
SWEP.Primary.Knockback = 0 --Autodetected if nil; this is the velocity kickback
SWEP.Primary.Automatic = false
SWEP.Primary.RPM = 100
SWEP.Primary.ClipSize = 3
SWEP.Primary.DefaultClip = 15
SWEP.Primary.Ammo = "buckshot"
SWEP.Primary.AmmoConsumption = 1
SWEP.Primary.KickUp = 1.15
SWEP.Primary.KickDown = 0
SWEP.Primary.KickHorizontal = 0.7
SWEP.Primary.StaticRecoilFactor = 1
SWEP.Primary.Spread = 0.025
SWEP.Primary.IronAccuracy = 0.025
SWEP.Primary.SpreadMultiplierMax = 0
SWEP.Primary.SpreadIncrement = 0
SWEP.Primary.SpreadRecovery = 0
SWEP.Primary.Range = 1000
SWEP.Primary.RangeFalloff = 1
SWEP.Primary.FalloffMetricBased = true -- Set to true if you set up values below
SWEP.Primary.FalloffByMeter     = 0.35 -- How much damage points will bullet loose when travel
SWEP.Primary.MinRangeStartFalloff = 20 -- How long will bullet travel in Meters before starting to lose damage?
SWEP.Primary.MaxFalloff         = 7 -- Maximal amount of damage to be lost

SWEP.DisableChambering = false
SWEP.FiresUnderwater = false
SWEP.CanBeSilenced = false
SWEP.Silenced = false
SWEP.SelectiveFire = false
SWEP.DefaultFireMode = ""

SWEP.MaxPenetrationCounter = 0
SWEP.IronRecoilMultiplier = 1 --Multiply recoil by this factor when we're in ironsights.  This is proportional, not inversely.
SWEP.CrouchAccuracyMultiplier = 1 --Less is more.  Accuracy * 0.5 = Twice as accurate, Accuracy * 0.1 = Ten times as accurate
SWEP.CrouchRecoilMultiplier = 1
SWEP.MoveSpeed = 0.9
SWEP.IronSightsMoveSpeed = 0.9
SWEP.IronSightTime = 0.4
SWEP.ProceduralHoslterEnabled = true
SWEP.ProceduralHolsterTime = 0.4
SWEP.ProceduralHolsterPos = Vector(3, 0, -5)
SWEP.ProceduralHolsterAng = Vector(-40, -30, 10)

SWEP.ViewModel = "models/v_models/v_msbg.mdl"
SWEP.WorldModel = "models/w_models/w_msbg.mdl"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.UseHands = true

SWEP.VMPos = Vector(0, -4, 0)
SWEP.VMAng = Vector(0, 0, 0)
SWEP.VMPos_Additive = true

SWEP.HoldType = "shotgun"
SWEP.Offset = {
    Pos = {
        Up = 0,
        Right = 2.2,
        Forward = 1.5
    },
    Ang = {
        Up = 8,
        Right = -10,
        Forward = 180
    },
    Scale = 0.9
}

SWEP.IronSightsSensitivity = 1
SWEP.BoltAction = false
SWEP.Scoped = false
SWEP.ScopeOverlayThreshold = 0.875
SWEP.BoltTimerOffset = 0.25
SWEP.ScopeScale = 0.5
SWEP.ReticleScale = 0.7

SWEP.Shotgun = true
SWEP.ShellTime = 1

SWEP.RunSightsPos = Vector(12, -4.8, 0)
SWEP.RunSightsAng = Vector(-12, 48, -4.8)

SWEP.data = { ironsights = 1 }
SWEP.Secondary.IronFOV = 65
SWEP.IronSightsPos = Vector(-3.05, 3, 1.8)
SWEP.IronSightsAng = Vector(0.78, 0, 0)

SWEP.InspectPos = Vector(13, -10.25, -5)
SWEP.InspectAng = Vector(22.5, 45, 5)

SWEP.AllowViewAttachment = true

SWEP.BlowbackEnabled = false
SWEP.BlowbackVector = Vector(0, -1, 0)
SWEP.BlowbackCurrentRoot = 0
SWEP.BlowbackCurrent = 0
SWEP.Blowback_Only_Iron = true
SWEP.Blowback_PistolMode = false
SWEP.Blowback_Shell_Enabled = true
SWEP.Blowback_Shell_Effect = "ShellEject"

SWEP.DoProceduralReload = false
SWEP.ProceduralReloadTime = 1

SWEP.Sights_Mode = TFA.Enum.LOCOMOTION_HYBRID
SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_ANI
SWEP.Idle_Mode = TFA.Enum.IDLE_BOTH
SWEP.Idle_Blend = 0.25
SWEP.Idle_Smooth = 0.05

SWEP.IronAnimation = {
    ["shoot"] = {
        ["type"] = TFA.Enum.ANIMATION_SEQ,
        ["value"] = "fire",
        ["value_last"] = "fire",
        ["value_empty"] = "fire"
    }
}

SWEP.SprintAnimation = {
    ["loop"] = {
        ["type"] = TFA.Enum.ANIMATION_SEQ,
        ["value"] = "idle",
        ["is_idle"] = true
    }
}
SWEP.Attachments={[1]={atts={"re9_msbg500_aim"}, order = 1 },
		  [2]={atts={ "r6s_muzzle_2", "r6s_flashhider_2"}, order = 2},
		  [3] = { atts = { "sg_slug", "sg_bird", "sg_flech" }, order = 4 },
          [4] = { offset = { 0, 0 }, atts = { "ins2_br_heavy", "ins2_br_light"  }, order = 3 },
}
SWEP.MuzzleAttachment = "muzzle"
SWEP.ShellAttachment = "shell"
SWEP.MuzzleFlashEnabled = true
SWEP.MuzzleAttachmentRaw = 1
SWEP.AutoDetectMuzzleAttachment = false
SWEP.MuzzleFlashEffect = "tfa_muzzleflash_shotgun"
SWEP.EjectionSmokeEnabled = false
SWEP.LuaShellEject = false
SWEP.LuaShellEjectDelay = 0
SWEP.LuaShellEffect = "ShotgunShellEject"
SWEP.TracerCount = 0


SWEP.EventTable = {
    ["deploy"] = {
        { ["time"] = 0.1, ["type"] = "sound", ["value"] = "weapons/msbg500/shotgun_deploy_1.wav" }
    }
}

SWEP.RTOpaque = false
SWEP.AnimCycle = 0

if CLIENT then
    SWEP.WepSelectIcon = surface.GetTextureID("vgui/entities/tfa_re9_msbg500")
end

function SWEP:FireAnimationEvent()
    return true
end

function SWEP:PlayVMSequence(seqName)
    local owner = self:GetOwner()
    if not IsValid(owner) then return 0.5 end

    local vm = owner:GetViewModel()
    if not IsValid(vm) then return 0.5 end

    local seq = vm:LookupSequence(seqName)
    if not seq or seq < 0 then
        print("[MSBG500] Missing sequence: " .. tostring(seqName))
        return 0.5
    end

    vm:SendViewModelMatchingSequence(seq)
    vm:SetPlaybackRate(1)
    vm:SetCycle(0)

    local dur = vm:SequenceDuration(seq)
    return (dur and dur > 0) and dur or 0.5
end

function SWEP:BeginReloadStage(seqName, stage, snd)
    local owner = self:GetOwner()
    if not IsValid(owner) then return end

    self.ReloadStage = stage
    local animTime = self:PlayVMSequence(seqName)

    owner:SetAnimation(PLAYER_RELOAD)

    if seqName == "reload" or seqName == "reload_loop" then
        snd = math.random(1, 2) == 1
            and "weapons/msbg500/shotgun_load_shell_2.wav"
            or "weapons/msbg500/shotgun_load_shell_4.wav"
    end

    if snd then
        owner:EmitSound(snd, 70, 100, 0.5)
    end

    self.NextReloadAction = CurTime() + animTime
    self:SetNextPrimaryFire(self.NextReloadAction)
    self:SetNextSecondaryFire(self.NextReloadAction)

    if self.SetNextIdle then
        self:SetNextIdle(self.NextReloadAction)
    end
end

function SWEP:ResetReloadState()
    self.ShotgunReloading = false
    self.ReloadStage = STAGE_NONE
    self.NextReloadAction = 0
    self.ReloadInterruptFire = false
    self.ReloadInterruptHandled = false
end

function SWEP:Deploy()
    self:ResetReloadState()
    BaseClass.Deploy(self)

    self:EmitSound("weapons/msbg500/shotgun_deploy_1.wav", 70, 100, 0.25)
    self:SetNextPrimaryFire(CurTime() + 0.35)
    self:SetNextSecondaryFire(CurTime() + 0.35)

    timer.Simple(0, function()
        if not IsValid(self) then return end

        local owner = self:GetOwner()
        if not IsValid(owner) or owner:GetActiveWeapon() ~= self then return end

        local dur = self:PlayVMSequence("deploy")
        self:SetNextPrimaryFire(CurTime() + dur)
        self:SetNextSecondaryFire(CurTime() + dur)

        if self.SetNextIdle then
            self:SetNextIdle(CurTime() + dur)
        end
    end)

    return true
end

function SWEP:PrimaryAttack()
    if self.ShotgunReloading then
        self.ReloadInterruptFire = true
        if self.ReloadStage ~= STAGE_END then
            self:FinishShotgunReload()
        end
        return
    end

    return BaseClass.PrimaryAttack(self)
end

function SWEP:Reload()
    local owner = self:GetOwner()
    if not IsValid(owner) then return end
    if self.ShotgunReloading then return end
    if self:Clip1() >= self.Primary.ClipSize then return end
    if owner:GetAmmoCount(self.Primary.Ammo) <= 0 then return end
    if self:GetNextPrimaryFire() > CurTime() then return end

    self.ShotgunReloading = true
    self.ReloadInterruptFire = false
    self.ReloadInterruptHandled = false

    self:BeginReloadStage("reload", STAGE_START)
end

function SWEP:HandleReloadInterruptInput()
    local owner = self:GetOwner()
    if not IsValid(owner) or not owner:IsPlayer() then return end
    if not self.ShotgunReloading or self.ReloadInterruptHandled then return end

    if owner:KeyPressed(IN_ATTACK) or owner:KeyDown(IN_ATTACK) then
        self.ReloadInterruptFire = true
        self.ReloadInterruptHandled = true

        if self.ReloadStage ~= STAGE_END then
            self:FinishShotgunReload()
        end
    end
end

function SWEP:Think()
    if self.ShotgunReloading then
        self:HandleReloadInterruptInput()
        self:HandleShotgunReload()
    end

    return BaseClass.Think(self)
end

function SWEP:HandleShotgunReload()
    local owner = self:GetOwner()
    if not IsValid(owner) then
        self:ResetReloadState()
        return
    end

    if CurTime() < self.NextReloadAction then return end

    if self.ReloadStage == STAGE_START or self.ReloadStage == STAGE_LOOP then
        if self:Clip1() < self.Primary.ClipSize and owner:GetAmmoCount(self.Primary.Ammo) > 0 then
            self:SetClip1(self:Clip1() + 1)
            owner:RemoveAmmo(1, self.Primary.Ammo)
        end

        if self.ReloadInterruptFire or self:Clip1() >= self.Primary.ClipSize or owner:GetAmmoCount(self.Primary.Ammo) <= 0 then
            self:FinishShotgunReload()
            return
        end

        self:BeginReloadStage("reload_loop", STAGE_LOOP)
        return
    end

    if self.ReloadStage == STAGE_END then
        self:ResetReloadState()
    end
end

function SWEP:FinishShotgunReload()
    if not self.ShotgunReloading then return end

    self.ReloadInterruptHandled = true
    self:BeginReloadStage("reload_end", STAGE_END, nil)
end