ENT.Type = "anim"
ENT.Base = "base_entity"
ENT.PrintName = "Chemical Bomb"
ENT.Author = ""
ENT.Information = ""
ENT.Spawnable = false
ENT.AdminSpawnable = false

ENT.Model = "models/items/ar2_grenade.mdl"
ENT.FuseTime = 2
ENT.ArmTime = 0
ENT.FireTime = 22
ENT.ImpactFuse = false

ENT.Armed = false

ENT.NextDamageTick = 0

ENT.Ticks = 0

AddCSLuaFile()

function ENT:SetupDataTables()
    self:NetworkVar( "Bool", 0, "Armed" )

    if SERVER then
        self:SetArmed(false)
    end
end

function ENT:Initialize()
    if SERVER then
        self:SetModel( self.Model )
        self:SetMoveType( MOVETYPE_VPHYSICS )
        self:SetSolid( SOLID_VPHYSICS )
        self:PhysicsInit( SOLID_VPHYSICS )
        self:DrawShadow( true )

        local phys = self:GetPhysicsObject()
        if phys:IsValid() then
            phys:Wake()
            phys:SetBuoyancyRatio(0)
        end

        self.SpawnTime = CurTime()

        timer.Simple(0.1, function()
            if !IsValid(self) then return end
            self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
        end)
    end
end

function ENT:PhysicsCollide(data, physobj)
    if SERVER then
        if data.Speed > 75 then
            self:EmitSound(Sound("physics/metal/metal_grenade_impact_hard" .. math.random(1,3) .. ".wav"))
        elseif data.Speed > 25 then
            self:EmitSound(Sound("physics/metal/metal_grenade_impact_soft" .. math.random(1,3) .. ".wav"))
        end

        if (CurTime() - self.SpawnTime >= self.ArmTime) and self.ImpactFuse then
            self:Detonate()
        end
    end
end

function ENT:Think()
    if !self.SpawnTime then self.SpawnTime = CurTime() end

    if SERVER and CurTime() - self.SpawnTime >= self.FuseTime and !self.Armed then
        self:Detonate()
        self:SetArmed(true)
    end

    if self:GetArmed() then

        if SERVER then
            if self.NextDamageTick > CurTime() then return end

            local dmg = DamageInfo()
            dmg:SetDamageType(DMG_NERVEGAS)
            dmg:SetDamage(12.5)
            dmg:SetInflictor(self)
            dmg:SetAttacker(self.Owner)
            util.BlastDamageInfo(dmg, self:GetPos(), 384)

            self.NextDamageTick = CurTime() + 0.25

            self.ArcCW_Killable = false
        end

    end
end

function ENT:OnRemove()
    if !self.FireSound then return end
    self.FireSound:Stop()
end

function ENT:Detonate()
    if !self:IsValid() then return end

    self.Armed = true
	
			self:EmitSound("weapons/arccw/smokegrenade/smoke_emit.wav", 70, 80, 1, CHAN_AUTO)

			local cloud = ents.Create( "arccw_fes_smoke" )

			if !IsValid(cloud) then return end

			cloud:SetPos(self:GetPos())
			cloud:Spawn()

    timer.Simple(self.FireTime, function()
        if !IsValid(self) then return end

        self:Remove()
    end)
end

function ENT:Draw()
    if CLIENT then
        self:DrawModel()
    end
end