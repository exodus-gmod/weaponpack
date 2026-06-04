

include('shared.lua')


/*---------------------------------------------------------
   Name: Draw
   Desc: Draw it!
---------------------------------------------------------*/
function ENT:Draw()
	self.Entity:DrawModel()
end


/*---------------------------------------------------------
   Name: IsTranslucent
   Desc: Return whether object is translucent or opaque
---------------------------------------------------------*/
function ENT:IsTranslucent()
	return true
end
local effEnd = -100
local DSPReset = false
hook.Add("RenderScreenspaceEffects", "yellowEffect", function()
   if effEnd+10 <= CurTime() then
      if !DSPReset then
         LocalPlayer():SetDSP(0, false)
         DSPReset = true
      end
      return
   end
   local tab = {
      [ "$pp_colour_addr" ] = 0,
      [ "$pp_colour_addg" ] = 0,
      [ "$pp_colour_addb" ] = 0,
      [ "$pp_colour_brightness" ] = -0.3-0.3*((effEnd-CurTime())/10),
      [ "$pp_colour_contrast" ] = 1,
      [ "$pp_colour_colour" ] = 1,
      [ "$pp_colour_mulr" ] = 0,
      [ "$pp_colour_mulg" ] = 0,
      [ "$pp_colour_mulb" ] = 0}
     DrawColorModify(tab)
     DrawMotionBlur(0.15, 0.78, 0.07+0.07*((effEnd-CurTime())/10))	
end)

net.Receive("IsInside", function()
   effEnd = CurTime()
	LocalPlayer():SetDSP(15, false)
	DSPReset = false
end)