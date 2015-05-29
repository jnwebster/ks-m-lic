assert(Version >= 155, "This level requires a newer version of KS Ex")

local TemplateIndex = ...

local Path = path.dir(debug.FunctionFile(1))

ReplaceGraphics({BaseIndex = 0, Path.."GemBlue", 1}, 254, TemplateIndex)
AnimateObjects(nil, {1, 4, Loop = true, Delay = 7}, 254, TemplateIndex)

events.global["NewTemplate"..TemplateIndex] = function(o)
	if vars.GemBlue then
		o:Destroy()
	else
		local function update()
			if o:CheckOverlap(Objects.PlayerPos) then
				local power = NewPower("GemBlue", TemplateIndex)
				ReplaceGraphics({BaseIndex = 0, Path.."Power", 0}, power)
				power:Animate(nil)
				vars.GemBlue = true
				PickUpLight(o:GetPosition())
				o:Destroy()
				PlaySound(41)
			end			
		end
		o:event("Timer", update)
		update()
	end
end
