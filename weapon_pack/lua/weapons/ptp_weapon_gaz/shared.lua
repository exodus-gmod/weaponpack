if (SERVER) then
  
	AddCSLuaFile ("shared.lua")
	SWEP.Weight 			= 5
	SWEP.AutoSwitchTo 		= false
	SWEP.AutoSwitchFrom 		= false
end

if (CLIENT) then

	SWEP.PrintName 			= "Tear Gas Grenade"
	SWEP.Slot 				= 4
	SWEP.SlotPos 			= 1
	SWEP.DrawAmmo 			= true
	SWEP.DrawCrosshair 		= false
	SWEP.ViewModelFOV			= 60
	SWEP.ViewModelFlip		= false
	SWEP.CSMuzzleFlashes		= false
	SWEP.Category			= "EXR - Equipment"
	SWEP.IconLetter 			= "Q"
	killicon.AddFont("ptp_weapon_smoke", "CSKillIcons", SWEP.IconLetter, Color( 255, 80, 0, 255 ))
end


SWEP.Category			= "EXR - Equipment"

SWEP.Base 					= "ptp_weapon_grenade"

SWEP.HoldType				= "grenade"


SWEP.Spawnable 				= true
SWEP.AdminSpawnable 			= true

SWEP.ViewModel 				= "models/weapons/cstrike/c_eq_smokegrenade.mdl"
SWEP.WorldModel 			= "models/weapons/w_eq_smokegrenade.mdl"
SWEP.UseHands				= true

SWEP.Primary.ClipSize 			= 1
SWEP.Primary.DefaultClip 		= 1
SWEP.Primary.Automatic 			= true
SWEP.Primary.Ammo 			= "AR2AltFire"

SWEP.Secondary.ClipSize 		= -1
SWEP.Secondary.DefaultClip 		= -1
SWEP.Secondary.Automatic 		= true
SWEP.Secondary.Ammo 			= "none"

/*---------------------------------------------------------
ThrowFar
---------------------------------------------------------*/
function SWEP:ThrowFar()

	if self.Primed != 2 then return end

	local tr = self.Owner:GetEyeTrace()

	if (!SERVER) then return end

	local ent = ents.Create("cse_ent_shortgasgrenade1")
			ent:SetOwner(self.Owner)
			ent.Owner = self.Owner
			ent:SetPos(self.Owner:GetShootPos())
			ent:SetAngles(Angle(1,0,0))
			if (self.Weapon:GetNWBool("upgraded") && SERVER) then
				ent:Upgrade()
				ent:SetNWBool("upgraded", true)
			end
			ent:Spawn()

	local phys = ent:GetPhysicsObject()
			phys:SetVelocity(self.Owner:GetAimVector() * 850)
			phys:AddAngleVelocity(Vector(math.random(-100,100),math.random(-100,100),math.random(-100,100)))
			
			self.Owner:RemoveAmmo(1,self.Primary.Ammo)
			
			if self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then
				self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
				else 
							timer.Simple(1, function() self.Owner:StripWeapon(self:GetClass()) end) -- Delay so anim is displayed, tends to look better
			end

	self:TakePrimaryAmmo(1)
	-- self:Reload()

	timer.Simple(0.6,
	function()

		if self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then
			--self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
			self.Primed = 0
		else
			self.Primed = 0
		--	self.Weapon:Remove()
		--	self.Owner:ConCommand("lastinv")
		end
	end)
end

/*---------------------------------------------------------
ThrowShort
---------------------------------------------------------*/
function SWEP:ThrowShort()

	if self.Primed != 2 then return end

	local tr = self.Owner:GetEyeTrace()

	if (!SERVER) then return end

	local ent = ents.Create("cse_ent_shortgasgrenade1")
			ent:SetOwner(self.Owner)
			ent.Owner = self.Owner
			ent:SetPos(self.Owner:GetShootPos())
			ent:SetAngles(Angle(1,0,0))
			if (self.Weapon:GetNWBool("upgraded") && SERVER) then
				ent:Upgrade()
				ent:SetNWBool("upgraded", true)
			end
			ent:Spawn()

	local phys = ent:GetPhysicsObject()
			phys:SetVelocity(self.Owner:GetAimVector() * 850)
			phys:AddAngleVelocity(Vector(math.random(-100,100),math.random(-100,100),math.random(-100,100)))
			
			self.Owner:RemoveAmmo(1,self.Primary.Ammo)
			
			if self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then
				self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
				else 
							timer.Simple(1, function() self.Owner:StripWeapon(self:GetClass()) end) -- Delay so anim is displayed, tends to look better
			end

	self:TakePrimaryAmmo(1)
	-- self:Reload()

	timer.Simple(0.6,
	function()

		if self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then
			--self.Weapon:SendWeaponAnim(ACT_VM_DRAW)
			self.Primed = 0
		else
			self.Primed = 0
		--	self.Weapon:Remove()
		--	self.Owner:ConCommand("lastinv")
		end
	end)

end