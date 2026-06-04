if SERVER then return end

local smokeMat = Material( "tfa_csgo/particle/particle_smokegrenade_view" )
local scrw, scrh = ScrW(), ScrH()
local lply = LocalPlayer
local col = Color( 99, 99, 99 )

local maxdist = 400
local maxdist_sqrt = maxdist * maxdist
local blinddist = 200
local blinddist_sqrt = blinddist * blinddist

hook.Add( "OnScreenSizeChanged", "CSGOSmokeBlind.OnScreenSizeChanged", function()
	scrw, scrh = ScrW(), ScrH()
end )

hook.Add( "RenderScreenspaceEffects", "CSGOSmokeBlind", function()
	local ply = lply()
	local insmoke = false
	local smokeamount = 0
	local smokes = ents.FindByClass( "tfa_csgo_thrownsmoke" )

	if #smokes == 0 then return end

	for _, v in ipairs( smokes ) do
		local dist_sqrt = ply:GetPos():DistToSqr( v:GetPos() )
		if not v:GetNWBool( "IsDetonated", false ) or dist_sqrt > maxdist_sqrt then continue end

		insmoke = true
		smokeamount = smokeamount + (1 - (dist_sqrt / (maxdist_sqrt - blinddist_sqrt)))
	end

	if not insmoke then return end

	local oalpha = surface.GetAlphaMultiplier()
	surface.SetAlphaMultiplier( math.Clamp( smokeamount, 0, 1 ) )

	surface.SetMaterial( smokeMat )
	surface.SetDrawColor( col )
	surface.DrawRect( 0, 0, scrw, scrh )

	surface.SetAlphaMultiplier( oalpha )
end )