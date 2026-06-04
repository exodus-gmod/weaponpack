AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")


// this was a cse flashbang.


local nbDamages = 0 
util.AddNetworkString( "IsInside" )
function ENT:Initialize()

	self.Entity:SetModel("models/weapons/w_eq_smokegrenade.mdl")
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow( false )

	self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	local phys = self.Entity:GetPhysicsObject()

	if (phys:IsValid()) then
		phys:Sleep()
	end
	
	self.timer = CurTime() + 3
	self.solidify = CurTime() + 1
	self.Bastardgas = nil
	self.Spammed = false
end
local bounces = 0
function ENT:PhysicsCollide( data, phys )
	bounces = bounces + 1
	if bounces == 1 then
		self.Entity:GetPhysicsObject():Sleep()
	end
end

local function Poison(ent,owner)
	if IsValid(ent) then
		local madeCestIciPourLaVie = 30 
		madeCestIciPourLaVie = madeCestIciPourLaVie+1 
		local pd = DamageInfo()
		pd:SetDamage(math.random(5)/10)
		pd:SetAttacker(owner)
		pd:SetDamageType(DMG_NERVEGAS)
		nbDamages = nbDamages+1
		if (ent:Health() >= madeCestIciPourLaVie) then
			ent:TakeDamageInfo(pd)
		end
		if nbDamages >= 100 then
			ent:EmitSound("ambient/voices/cough" .. math.random(4) .. ".wav")
			nbDamages =0
		end 
	end
end


function ENT:Think()
	if (IsValid(self.Owner)==false) then
		self.Entity:Remove()
	end
	if (self.solidify<CurTime()) then
		self.Entity:SetOwner(self.Owner) -- Ici
	end
	
	if self.timer < CurTime() then
		if !IsValid(self.Bastardgas) && !self.Spammed then
			self.Spammed = true
			self.Bastardgas = ents.Create("env_dusttrail")
			self.Bastardgas:SetOwner(self.Owner)
			self.Bastardgas:SetPos(self.Entity:GetPos())
			self.Bastardgas:SetKeyValue("spawnradius","225")
			self.Bastardgas:SetKeyValue("minspeed","0.5")
			self.Bastardgas:SetKeyValue("maxspeed","2")
			self.Bastardgas:SetKeyValue("startsize","16536")
			self.Bastardgas:SetKeyValue("endsize","256")
			self.Bastardgas:SetKeyValue("color","225 216 160")
			self.Bastardgas:SetKeyValue("opacity","1")
			self.Bastardgas:SetKeyValue("spawnrate","50")
			self.Bastardgas:SetKeyValue("lifetime","7")
			self.Bastardgas:SetParent(self.Entity)
			self.Bastardgas:Spawn()
			self.Bastardgas:Activate()
			self.Entity:EmitSound(Sound("BaseSmokeEffect.Sound"))
		end

		local pos = self.Entity:GetPos()
		local maxrange = 250
		local maxstun = 10
		for k,v in pairs(ents.FindInSphere( pos, maxrange) ) do
			if v:GetNWBool( "STALKER_PlyGasMaskOn" ) == true then return end
				if  v:IsPlayer()&& IsValid(v) then
					net.Start("IsInside")
					net.WriteBool(true)
					net.Send(v)
					v:ViewPunch( Angle( math.random()*3.5, math.random()*3.5, math.random()*2.5 ))
				end
				Poison(v, self.Owner)
		end
		if (self.timer+60<CurTime()) then
			if IsValid(self.Bastardgas) then
				self.Bastardgas:Remove()
			end
		end
		if (self.timer+65<CurTime()) then
			self.Entity:Remove()
		end
		self.Entity:NextThink(CurTime()+0.5)
		return true
	end
end
