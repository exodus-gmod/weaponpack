-- Variables that are used on both client and server
SWEP.Gun = ("tfa_nam_m79") -- must be the name of your swep but NO CAPITALS!
SWEP.Category				= "EXR - Equipment" --Category where you will find your weapons
SWEP.MuzzleAttachment			= "1" 	-- Should be "1" for CSS models or "muzzle" for hl2 models
SWEP.ShellEjectAttachment			= "1" 	-- Should be "2" for CSS models or "1" for hl2 models
SWEP.Author				= "Lucho"
SWEP.Contact				= ""
SWEP.Purpose				= ""
SWEP.Instructions				= ""
SWEP.PrintName				= "Grenade Launcher"		-- Weapon name (Shown on HUD)	
SWEP.Slot				= 3				-- Slot in the weapon selection menu
SWEP.SlotPos				= 1			-- Position in the slot
SWEP.DrawAmmo				= true		-- Should draw the default HL2 ammo counter
SWEP.DrawWeaponInfoBox		= false		-- Should draw the weapon info box
SWEP.BounceWeaponIcon   	= false		-- Should the weapon icon bounce?
SWEP.DrawCrosshair			= true		-- set false if you want no crosshair
SWEP.Weight					= 89		-- rank relative ot other weapons. bigger is better
SWEP.AutoSwitchTo			= true		-- Auto switch to if we pick it up
SWEP.AutoSwitchFrom			= true		-- Auto switch from if you pick up a better weapon
SWEP.HoldType 				= "ar2"		-- how others view you carrying the weapon
-- normal melee melee2 fist knife smg ar2 pistol rpg physgun grenade shotgun crossbow slam passive 
-- you're mostly going to use ar2, smg, shotgun or pistol. rpg makes for good sniper rifles

SWEP.ViewModelFOV			= 62
SWEP.ViewModelFlip			= false
SWEP.ViewModel				= "models/weapons/v_nam_m79.mdl"	-- Weapon view model
SWEP.WorldModel				= "models/weapons/w_m79.mdl"	-- Weapon world model
SWEP.ShowWorldModel			= true
SWEP.Base				= "tfa_gun_base" --the Base this weapon will work on. PLEASE RENAME THE BASE! 
SWEP.Spawnable				= true
SWEP.AdminSpawnable			= true
SWEP.FiresUnderwater = false
SWEP.UseHands = true
SWEP.Type ="Grenade Launcher"

SWEP.Primary.Sound			= Sound("weapons/tfa_nam_m79/m79_fp.wav")
SWEP.Primary.RPM			=  156			-- This is in Rounds Per Minute
SWEP.Primary.ClipSize			= 1		-- Size of a clip
SWEP.Primary.DefaultClip		= 8		-- Bullets you start with
SWEP.Primary.KickUp				= 1.2		-- Maximum up recoil (rise)
SWEP.Primary.KickDown			= 0.1	-- Maximum down recoil (skeet)
SWEP.Primary.KickHorizontal		= 0.06	-- Maximum up recoil (stock)
SWEP.Primary.Automatic			= false	-- Automatic = true; Semi Auto = false
SWEP.Primary.Ammo			= "smg1_grenade"			-- pistol, 357, smg1, ar2, buckshot, slam, SniperPenetratedRound, AirboatGun
SWEP.SelectiveFire		= false
SWEP.CanBeSilenced		= false

SWEP.Secondary.IronFOV			= 70		-- How much you 'zoom' in. Less is more! 	

SWEP.data 				= {}				--The starting firemode

SWEP.Primary.Damage		= 05	-- Base damage per bullet
SWEP.Primary.Spread		= .028	-- Define from-the-hip accuracy 1 is terrible, .0001 is exact)
SWEP.Primary.IronAccuracy = .015 -- Ironsight accuracy, should be the same for shotguns

-- Enter iron sight info and bone mod info below
SWEP.SightsPos = Vector(-2.26, 0, -1.64)
SWEP.SightsAng = Vector(7.5, 0, 0)
SWEP.InspectPos = Vector(7.76, -5.178, 0.016)
SWEP.InspectAng = Vector(1, 37.277, 3.2)

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_Spine4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(1.297, -1.167, 0) }
}

SWEP.Idle_Mode = TFA.Enum.IDLE_BOTH --TFA.Enum.IDLE_DISABLED = no idle, TFA.Enum.IDLE_LUA = lua idle, TFA.Enum.IDLE_ANI = mdl idle, TFA.Enum.IDLE_BOTH = TFA.Enum.IDLE_ANI + TFA.Enum.IDLE_LUA
SWEP.Sprint_Mode = TFA.Enum.LOCOMOTION_ANI -- ANI = mdl, HYBRID = ani + lua, Lua = lua only
SWEP.SprintAnimation = {
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "base_sprint", --Number for act, String/Number for sequence
		["value_empty"] = "empty_sprint",
		["is_idle"] = true
	}
}

SWEP.IronAnimation = {
	["loop"] = {
		["type"] = TFA.Enum.ANIMATION_SEQ, --Sequence or act
		["value"] = "base_idle", --Number for act, String/Number for sequence
		["value_empty"] = "iron_empty"
	},
	["shoot"] = {
		["type"] = TFA.Enum.ANIMATION_ACT, --Sequence or act
		["value"] = ACT_VM_PRIMARYATTACK, --Number for act, String/Number for sequence
		["value_last"] = ACT_VM_ISHOOT_LAST,
		["value_empty"] = ACT_VM_ISHOOTDRY
	} --What do you think
}

SWEP.Offset = {
	Pos = {
		Up = -0.789,
		Right = 0.6,
		Forward = 3.348
	},
	Ang = {
		Up = -180,
		Right = -163.792,
		Forward = 0
	},
	Scale = 1
}

SWEP.ProjectileEntity = "rust_luchogaz" --Entity to shoot
SWEP.ProjectileVelocity = 1600 --Entity to shoot's velocity
SWEP.ProjectileModel = "models/weapons/darky_m/rust/gl_ammo.mdl" --Entity to shoot's model


function SWEP:ShootBulletInformation()
	if self:IsAttached("darky_rust_gl_shotgun") then
		BaseClass.ShootBulletInformation(self)
	else
		if SERVER then
			if not self:IsValid() then return end

			local ent = ents.Create(self:GetStat("Primary.Projectile"))
			
			if ent:IsValid() then
				local aimcone = 0
				local dir
				local ang = self.Owner:EyeAngles()
				ang:RotateAroundAxis(ang:Right(), -aimcone / 2 + math.Rand(0, aimcone))
				ang:RotateAroundAxis(ang:Up(), -aimcone / 2 + math.Rand(0, aimcone))
				dir = ang:Forward()
				ent:SetPos(self.Owner:GetShootPos())
				ent.Owner = self.Owner
				ent:SetAngles(ang)

				ent:SetModel(self:GetStat("Primary.ProjectileModel"))
				ent:SetPhysicsAttacker(self:GetOwner())
				ent:SetOwner(self:GetOwner())
				ent.damage = self:GetStat("Primary.Damage")
				ent.radius = self:GetStat("Primary.Radius")
				ent.owner = self:GetOwner()
				ent:Spawn()
				
				local phys = ent:GetPhysicsObject()

				if IsValid(phys) then
					phys:SetVelocity(dir * self:GetStat("Primary.ProjectileVelocity"))
				end

				self:GetOwner():SetAnimation(PLAYER_ATTACK1)
			end
		end
	end
end





SWEP.Attachments = {
                        [2] = { offset = { 0, 0 }, atts = { "tfa_nam_sling" }, order = 3 },
						[1] = { offset = { 0, 0 }, atts = { "darky_rust_gl_smoke", "darky_rust_gl_flash" }, order = 1 },
}

SWEP.VElements = {
	["sling"] = { type = "Model", model = "models/weapons/upgrades/a_m79_sling.mdl", bone = "sling1", rel = "", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false }
}

SWEP.WElements = {
	["world_model"] = { type = "Model", model = SWEP.WorldModel, bone = "oof", rel = "", pos = Vector(3.848, 0.574, -2.241), angle = Angle(-163.625, -180, 0), size = Vector(0.921, 0.921, 0.921), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {}, bonemerge = true, active = false }
}


SWEP.DisableChambering = true
