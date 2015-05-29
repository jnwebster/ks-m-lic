if not Version or Version < 140 then
	error("This level requires a newer version of Knytt Stories Ex")
end

-- loads ghosts immediately when eye is taken, no screen reload is needed
LoadGhostsWhenEyeIsTaken = true

-- deny walking on air for creatures
NoWalkOnAir()

-- deny swimming through walls for fish
NoFishInWalls()

-- precise scrolling
ScreenScrollDetectionDelta = 0

-- load objects at the same time as tiles
NoLoadScreenDelay =  true

-- this gets rid of the keys, since we won't be using them in this story
function events.global.LoadGame()
	--RemovePower(0)	-- run
	--RemovePower(1)	-- climb
	--RemovePower(2)	-- high jump
	--RemovePower(3)	-- double jump
	--RemovePower(4)	-- eye
	RemovePower(5)	-- detector
	--RemovePower(6)	-- umbrella
	--RemovePower(7)	-- hologram
	RemovePower(8)	-- red key
	RemovePower(9)	-- yellow key
	RemovePower(10)	-- blue key
	RemovePower(11)	-- purple key
end

-- hero tower, bottom floor
function x1001y993()
	Objects.Player.Run = 1
	Objects.Player.Climb = 1
	Objects.Player.HighJump = 1
	Objects.Player.DoubleJump = 1

	-- only display the spinning gems that we've collected
	local numberOfGems = 6

	if not vars.GemGreen then
		Objects.Find{Bank = 255, Obj = 2}:Destroy();
		numberOfGems = numberOfGems - 1;
	end

	if not vars.GemRed then
		Objects.Find{Bank = 255, Obj = 3}:Destroy();
		numberOfGems = numberOfGems - 1;
	end

	if not vars.GemBlue then
		Objects.Find{Bank = 255, Obj = 4}:Destroy();
		numberOfGems = numberOfGems - 1;
	end

	if not vars.GemCyan then
		Objects.Find{Bank = 255, Obj = 5}:Destroy();
		numberOfGems = numberOfGems - 1;
	end

	if not vars.GemOrange then
		Objects.Find{Bank = 255, Obj = 6}:Destroy();
		numberOfGems = numberOfGems - 1;
	end

	if not vars.GemYellow then
		Objects.Find{Bank = 255, Obj = 7}:Destroy();
		numberOfGems = numberOfGems - 1;
	end

	if numberOfGems == 0 then
		-- don't play the singing gems ambiance if there aren't any gems present
		Objects.ScreenValues.AtmosB = 0;
	end

	if numberOfGems < 6 then
		-- only have the glowy shifter (for cutscene) present when all gems collected
		Objects.Find{Bank = 0, Obj = 14}:Destroy();
	end
end

-- hero tower, middle floor
function x1001y992()
	Objects.Player.Hologram = 1
	Objects.Player.Eye = 1

	-- only display the spinning gems that we've collected
	local numberOfGems = 2

	if not vars.GemBlack then
		Objects.Find{Bank = 255, Obj = 8}:Destroy();
		numberOfGems = numberOfGems - 1;
	end

	if not vars.GemWhite then
		Objects.Find{Bank = 255, Obj = 9}:Destroy();
		numberOfGems = numberOfGems - 1;
	end

	if numberOfGems == 0 then
		-- don't play the singing gems ambiance if there aren't any gems present
		Objects.ScreenValues.AtmosB = 0;
	end

	if numberOfGems < 2 then
		-- only have the glowy shifter (for cutscene) present when all gems collected
		Objects.Find{Bank = 0, Obj = 14}:Destroy();
	end
end

-- hero tower, upper floor
function x1001y991()
	if not vars.GemMagenta then
		Objects.Find{Bank = 255, Obj = 10}:Destroy();
		-- don't play the singing gems ambiance if there aren't any gems present
		Objects.ScreenValues.AtmosB = 0;	
		-- only have the glowy shifter (for cutscene) present when all gems collected
		Objects.Find{Bank = 0, Obj = 14}:Destroy();
	end
end

-- hero tower, final floor
function x1003y988()
	-- deactivate the gained powers, once a way to do this is possible
end