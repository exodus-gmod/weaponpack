TFA.EFT = TFA.EFT or {}

local useStencils = true

local function defineCanvas(ref)
	render.UpdateScreenEffectTexture()
	render.ClearStencil()
	render.SetStencilEnable(true)
	render.SetStencilCompareFunction(STENCIL_ALWAYS)
	render.SetStencilPassOperation(STENCIL_REPLACE)
	render.SetStencilFailOperation(STENCIL_KEEP)
	render.SetStencilZFailOperation(STENCIL_REPLACE)
	render.SetStencilWriteMask(255)
	render.SetStencilTestMask(255)
	render.SetStencilReferenceValue(ref or 54)
end

local function drawOn()
	render.SetStencilCompareFunction(STENCIL_EQUAL)
end

local function stopCanvas()
	render.SetStencilEnable(false)
end

local CachedMaterials = {}

function TFA.EFT.DrawHoloSight(wep, texture, parent, p, a, s)
	CachedMaterials[texture] = CachedMaterials[texture] or Material(texture, "noclamp nocull smooth")

	if wep.VMRedraw then return end
	wep.VMRedraw = true

	local model
	if isstring(parent) and wep.VElements[parent] and wep.VElements[parent].curmodel then
		model = wep.VElements[parent].curmodel
	end

	if useStencils and IsValid(model) then
		defineCanvas()

		render.SetBlend(0)
			model:DrawModel() -- we "draw" only parent model (for models without any attachments just use rtcircle model with 0 alpha as parent)
		render.SetBlend(1)

		drawOn()
	end

	render.OverrideDepthEnable(true, true)

	render.SetMaterial(CachedMaterials[texture])
	a = Angle(a)
	a:RotateAroundAxis(a:Right(), 90)
	render.DrawQuadEasy(p, a:Forward(), s * 2, s * 2, color_white, a.r + 90)

	render.OverrideDepthEnable(false, false)

	if useStencils and IsValid(model) then
		stopCanvas()
	end

	wep.VMRedraw = false
end

local sights = {}

function TFA.EFT.GetHoloSightReticle(sighttype, rel)
	if isstring(sighttype) and sights[sighttype] then
		local data = table.Copy(sights[sighttype])
		data.rel = rel or sighttype
		data.yuri = true
		return data
	end

	return nil
end

function TFA.EFT.AddHoloSightType(name, material, dist, size, bone)
	assert(name and material and dist and size)

	local tbl = sights[name] or {}
	tbl.type = "Quad"
	tbl.bone = bone or tbl.bone or "A_RenderReticle"
	tbl.pos = Vector(dist, 0, 0)
	tbl.angle = Angle(90, 0, 0)
	tbl.size = size
	tbl.draw_func_outer = function(wep, p, a, s) TFA.EFT.DrawHoloSight(wep, material, name, p, a, s) end
	tbl.active = false

	sights[name] = tbl
end

hook.Add("TFAAttachmentsLoaded", "!TFA_EFT_HoloSights", function()
	sights["debug"] = { type = "Quad", bone = "A_RenderReticle", pos = Vector(0, 0, 0), angle = Angle(90, 0, 0), size = 0.5, draw_func_outer = function(wep,p,a,s) TFA.EFT.DrawHoloSight(wep, "models/weapons/tfa_EFT/optics/mk4_crosshair", nil, p, a, s) end, active = true} -- adding this one manually

	if not render.SupportsPixelShaders_1_4() or not render.SupportsPixelShaders_2_0() or not render.SupportsVertexShaders_2_0() then
		print("[TFA EFT] Your GPU does not support stencils - falling back to flat sights.") -- intel haHAA

		useStencils = false

		TFA.EFT.AddHoloSightType("sight_xps3", "models/weapons/tfa_eft/upgrades/scopes/XPS3/xps3_reticule", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_exps3-2", "models/weapons/tfa_eft/upgrades/scopes/XPS3/xps3_reticule", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_exps3-2_tan", "models/weapons/tfa_eft/upgrades/scopes/XPS3/xps3_reticule", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_553", "models/weapons/tfa_eft/upgrades/scopes/553/553_reticule", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_uh1", "models/weapons/tfa_eft/upgrades/scopes/UH1/uh1_reticule", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_1p87", "models/weapons/tfa_eft/upgrades/scopes/1P87/1p87_reticle", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_m4", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_hs401g5", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_okp7", "models/weapons/tfa_eft/upgrades/scopes/okp7/okp7_reticle", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_srs", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_1", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_ff3", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_t1", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_romeo", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_rmr", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", 0, 0.15, "A_RenderReticle")
		TFA.EFT.AddHoloSightType("sight_dp", "models/weapons/tfa_eft/upgrades/scopes/COMPACT/DP/reticle", 0, 0.15, "A_RenderReticle")

		return
	end

	TFA.EFT.AddHoloSightType("sight_xps3", "models/weapons/tfa_eft/upgrades/scopes/XPS3/xps3_reticule", 10, 0.5, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_exps3-2", "models/weapons/tfa_eft/upgrades/scopes/EXPS3/exps3-2_reticule", 10, 0.5, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_exps3-2_tan", "models/weapons/tfa_eft/upgrades/scopes/EXPS3/exps3-2_reticule", 10, 0.5, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_553", "models/weapons/tfa_eft/upgrades/scopes/553/553_reticule", 10, 0.4, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_uh1", "models/weapons/tfa_eft/upgrades/scopes/UH1/uh1_reticule", 10, 0.5, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_1p87", "models/weapons/tfa_eft/upgrades/scopes/1P87/1p87_reticle", 10, 0.535, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_m4", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", 0, 0.25, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_hs401g5", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", 0, 0.25, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_okp7", "models/weapons/tfa_eft/upgrades/scopes/okp7/okp7_reticle", 5, 0.35, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_srs", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_1", 10, 0.5, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_ff3", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", 10, 0.5, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_t1", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", 10, 0.5, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_romeo", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", 10, 0.5, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_rmr", "models/weapons/tfa_eft/upgrades/scopes/MRS/mrs_reticle_2", 10, 0.5, "A_RenderReticle")
	TFA.EFT.AddHoloSightType("sight_dp", "models/weapons/tfa_eft/upgrades/scopes/COMPACT/DP/reticle", 10, 0.5, "A_RenderReticle")
end)