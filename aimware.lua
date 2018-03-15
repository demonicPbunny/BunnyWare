
if SERVER then return; end
local type = type;
local next = next;
salty = {}
local function Copy(tt, lt)
	local copy = {}
	if lt then
		if type(tt) == "table" then
			for k,v in next, tt do
				copy[k] = Copy(k, v)
			end
		else
			copy = lt
		end
		return copy
	end
	if type(tt) != "table" then
		copy = tt
	else
		for k,v in next, tt do
			copy[k] = Copy(k, v)
		end
	end
	return copy
end

local surface = Copy(surface);
local vgui = Copy(vgui);
local input = Copy(input);
local Color = Color;
local ScrW, ScrH = ScrW, ScrH;
local gui = Copy(gui);
local math = Copy(math);
local file = Copy(file);
local util = Copy(util);

surface.CreateFont("memeyou", {
	font = "Console",
	size = 13,
	weight = 900,
	shadow = true,
	antialias = false,
});

surface.CreateFont("memeyou2", {
	font = "Console",
	size = 13,
	weight = 900,
	shadow = false,
	antialias = false,
});

local options = {
	["LegitBot"] = {
		{
			{"Accuracy", 20, 20, 350, 240, 120},
			{"Smooth", "Slider", 0, 60, 54},
			{"Anti Spread", "Checkbox", false, 0},
			{"Anti Recoil", "Checkbox", false, 0},
		},
		{
			{"Aimbot", 380, 20, 350, 190, 120},
			{"Enabled", "Checkbox", false, 0},
			{"Auto Pistol", "Checkbox", false, 0},
			{"Anti Spread", "Checkbox", false, 0},
			{"Anti Recoil", "Checkbox", false, 0},
		
	},
	{
		{"TriggerBot", 380, 230, 350, 230, 140},
		{"Enabled", "Checkbox", false, 0},
		{"Auto Fire", "Checkbox", false, 0},
		
	
},
	},
	["Ragebot"] = {
		{
			{"Aimbot", 20, 20, 350, 240, 120},
			{"Enabled", "Checkbox", false, 0},
			{"Silent", "Checkbox", false, 0},
			{"Autofire", "Checkbox", false, 0},
			{"Autosnap", "Checkbox", false, 0},
			{"Auto Pistol", "Checkbox", false, 0},
			{"Non-Sticky", "Checkbox", false, 0},
			{"Bullettime", "Checkbox", false, 0},
		},
		{
			{"Target", 20, 280, 350, 180, 120},
			{"Selection", "Selection", "Distance", {"Distance", "Health", "Nextshot"}, 150 },
			{"Bodyaim", "Checkbox", false, 0},
			{"Ignore Bots", "Checkbox", false, 0},
			{"Ignore Team", "Checkbox", false, 0},
			{"Ignore Friends", "Checkbox", false, 0},
			{"Snapline", "Checkbox", false, 0},
		},
		{
			{"Accuracy", 380, 20, 350, 190, 120},
			{"Anti Spread", "Checkbox", false, 0},
			{"Anti Recoil", "Checkbox", false, 0},
		},
		{
			{"Anti-Aim", 380, 230, 350, 230, 140},
			{"Enabled", "Checkbox", false, 0},
			{"X", "Selection", "Emotion", {"Up", "Down", "Jitter", "Emotion"}, 150},
			{"Y", "Selection", "Emotion", {"Forward", "Backwards", "Jitter", "TJitter", "Sideways", "Emotion", "Static", "Towards Players"}, 150},
			{"Max Y", "Slider", 50, 360, 150},
			{"Min Y", "Slider", 0, 360, 150},
			{"Emotion Randomcoin X", "Slider", 50, 100, 150},
			{"Emotion Randomcoin Y", "Slider", 20, 100, 150},
		},
	},
	["Visuals"] = {
		{
			{"ESP", 20, 20, 250, 550, 120},
			{"Enabled", "Checkbox", false, 0},
			{"Box", "Checkbox", false, 0},
			{"Box Type", "Selection", "2D Box", {"2D Box", "3D Box"}, 100},
			{"Name", "Checkbox", false, 0},
			-- {"Health", "Checkbox", false, 0},
			{"Health", "Selection", "Off", {"Off", "Bar", "Number", "Both"}, 100},
			{"Weapon", "Checkbox", false, 0},
			{"XQZ", "Checkbox", false, 0},
			{"Chams", "Checkbox", false, 0},
			{"Skeleton", "Checkbox", false, 0},
			{"Glow ", "Selection", "Off", {"Off", "On", "Rainbow"}, 100},
		    {"Weapon Chams", "Checkbox", false, 0},
		},
		{
			{"Filter", 290, 20, 250, 550, 120},
			{"Enemies only", "Checkbox", false, 0},
			{"Distance", "Checkbox", false, 0},
			{"Max Distance", "Slider", 0, 10000, 100},
			{"NPC", "Checkbox", false, 0}, 
			{"Weapons", "Checkbox", false, 0},
			{"Items", "Checkbox", false, 0},
			{"Dark rp", "Checkbox", false, 0},
			{"TTT", "Checkbox", false, 0},
			{"Pulsar Effect", "Checkbox", false, 0},
		},
		{
			{"Other", 570, 20, 250, 550, 120},
			--{"Crosshair", "Checkbox", false, 0},
			{"Crosshair", "Selection", "Off", {"Off", "Old", "New"}, 100},
			{"Radar", "Checkbox", false, 0},
			{"Radar Size", "Slider", 175, 500, 100},
			{"No Sky", "Checkbox", false, 0},
			{"Wire Models", "Checkbox", false, 0},
			{"ASUS Walls", "Slider2", 100, 100, 100},
			{"Night Mode", "Slider2", 100, 100, 100},
			{"Thirdperson ", "Slider", 0, -1000, 100},
			{"View Fov", "Slider", 0, 150, 100},
   		    {"Viewmodel Fov", "Slider", 0, 150, 100},
			{"Speed Indicator", "Checkbox", false, 0},
			--{"Damage Log", "Checkbox", false, 54},
		},

		
	},
		["Misc"] = {
		{   
			{"Misc", 20, 20, 350, 275, 220},
			
			{"Auto Jump", "Selection", "Off", {"Off", "Perfect"}, 68},
			{"Auto-Strafe", "Checkbox", false, 54},
			{"Edge Jump", "Checkbox", false, 54},
			
			{"Chat Spam", "Selection", "Off", {"Off", "Slow", "Fast"}, 68},
			{"Air Stuck", "Checkbox", false, 54},
			{"Instant Unduck", "Checkbox", false, 54},
			{"Instant Duck", "Checkbox", false, 54},
			
		},
		{
			{"Other", 400, 20, 350, 150, 220},
			{"Kill Message", "Checkbox", false, 54},
			{"God mode", "Checkbox", false, 54},
			{"Set Health ", "Slider", 0, 999, 100},
			{"Set Armor ", "Slider", 0, 999, 100},
			
		},
		{
			{"SpeedHack", 400, 340, 350, 75, 220},
			{"Enable", "Checkbox", false, 54},
			{"Factor ", "Slider", 0, 15, 100},
		},
				{
			{"HitMarkers", 400, 280, 350, 50, 220},
			{"Enable", "Checkbox", false, 54},
		},
		
	},
	["Colors"] = {
		{
			{"Glow", 20, 20, 250, 175, 130},
			{"R", "Slider", 255, 255, 88},
			{"G", "Slider", 255, 255, 88},
			{"B", "Slider", 0, 255, 88},
			{"A", "Slider", 0, -7, 88},
		},
		{
			{"Box - Enemy", 20, 205, 250, 175, 130},
			{"R", "Slider", 180, 255, 88},
			{"G", "Slider", 120, 255, 88},
			{"B", "Slider", 0, 255, 88},
		},
		{
			{"Chams - Team", 290, 20, 250, 175, 130},
			{"Visible R", "Slider", 0, 255, 88},
			{"Visible G", "Slider", 255, 255, 88},
			{"Visible B", "Slider", 0, 255, 88},
			{"Not Visible R", "Slider", 0, 255, 88},
			{"Not Visible G", "Slider", 0, 255, 88},
			{"Not Visible B", "Slider", 255, 255, 88},
		},
		
		{
			{"Chams - Enemy", 290, 205, 250, 175, 130},
			{"Visible R", "Slider", 255, 255, 88},
			{"Visible G", "Slider", 0, 255, 88},
			{"Visible B", "Slider", 0, 255, 88},
			{"Not Visible R", "Slider", 180, 255, 88},
			{"Not Visible G", "Slider", 120, 255, 88},
			{"Not Visible B", "Slider", 0, 255, 88},
		},
				{
			{"Weapon Chams", 550, 205, 230, 175, 130},
			{"R", "Slider", 255, 255, 54},
			{"G", "Slider", 255, 255, 54},
			{"B", "Slider", 0, 255, 54},
			
		},
		{
			{"NPC - Chams", 550, 20, 230, 175, 130},
			{"Visible R", "Slider", 255, 255, 54},
			{"Visible G", "Slider", 0, 255, 54},
			{"Visible B", "Slider", 0, 255, 54},
			{"Not Visible R", "Slider", 180, 255, 54},
			{"Not Visible G", "Slider", 120, 255, 54},
			{"Not Visible B", "Slider", 0, 255, 54},
			
		},
	},
	["Gui"] = {
		{
			{"Work in progress", 20, 20, 250, 175, 130},

		},
	},
	["Info"] = {
		{
			{"Aimware.net/forum", 20, 20, 350, 240, 120},
           -- {"Enable", "Checkbox", false, 0},
			{"Visible R", "Slider", 255, 255, 130},
			{"Box Type", "Selection", "2D Box", {"2D Box", "3D Box"}, 100},
		},
		},
};

local order = {
	"LegitBot",
	"Ragebot",
	"Visuals",
	"Misc",
	"Colors",
	"Gui",
	"Info"
};

local function updatevar( men, sub, lookup, new )
	for aa,aaa in next, options[men] do
		for key, val in next, aaa do
			if(aaa[1][1] != sub) then continue; end
			if(val[1] == lookup) then
				val[3] = new;
			end
		end
	end
end

local function loadconfig()
	if(!file.Exists("memeware.txt", "DATA")) then return; end
	local tab = util.JSONToTable( file.Read("memeware.txt", "DATA") );
	local cursub;
	for k,v in next, tab do
		if(!options[k]) then continue; end
		for men, subtab in next, v do
			for key, val in next, subtab do
				if(key == 1) then cursub = val[1]; continue; end
				updatevar(k, cursub, val[1], val[3]);
			end
		end
	end
end

local function gBool(men, sub, lookup)
	if(!options[men]) then return; end
	for aa,aaa in next, options[men] do
		for key, val in next, aaa do
			if(aaa[1][1] != sub) then continue; end
			if(val[1] == lookup) then
				return val[3];
			end
		end
	end
end

local function gOption(men, sub, lookup)
	if(!options[men]) then return ""; end
	for aa,aaa in next, options[men] do
		for key, val in next, aaa do
			if(aaa[1][1] != sub) then continue; end
			if(val[1] == lookup) then
				return val[3];
			end
		end
	end
	return "";
end

local function gInt(men, sub, lookup)
	if(!options[men]) then return 0; end
	for aa,aaa in next, options[men] do
		for key, val in next, aaa do
			if(aaa[1][1] != sub) then continue; end
			if(val[1] == lookup) then
				return val[3];
			end
		end
	end
	return 0;
end

local function saveconfig()
	--file.Write("memeware.txt", util.TableToJSON(options));
end

local mousedown;
local candoslider;
local drawlast;

local visible = {};

for k,v in next, order do
	visible[v] = false;
end

local function DrawBackground(w, h)
	surface.SetDrawColor(255, 255, 255);
	surface.DrawRect(0, 0, w, h);
	
	local curcol = Color(182, 0, 0);
	
	for i = 0, 30 do
		surface.SetDrawColor(curcol);
		curcol.r = curcol.r - 1;
		surface.DrawLine(0, i, w, i);
	end
	
	surface.SetDrawColor(curcol);
	
	surface.SetFont("CenterPrintText");
	
	local tw, th = surface.GetTextSize("BUNNYWARE for Garry's Mod (BETA)");
	
	surface.SetTextPos(5, 15 - th / 2);
	
	surface.SetTextColor(255, 255, 255);
	
	surface.DrawText("BUNNYWARE for Garry's Mod (BETA)");
	
	surface.DrawRect(0, 31, 5, h - 31);
	surface.DrawRect(0, h - 5, w, h);
	surface.DrawRect(w - 5, 31, 5, h);
end

local function MouseInArea(minx, miny, maxx, maxy)
	local mousex, mousey = gui.MousePos();
	return(mousex < maxx && mousex > minx && mousey < maxy && mousey > miny);
end

local function DrawOptions(self, w, h)
	local mx, my = self:GetPos();
	
	local sizeper = (w - 10) / #order;
	
	local maxx = 0;
	
	for k,v in next, order do
		local bMouse = MouseInArea(mx + 5 + maxx, my + 31, mx + 5 + maxx + sizeper, my + 31 + 30);
		if(visible[v]) then
			local curcol = Color(0, 0, 0);
			for i = 0, 30 do
				surface.SetDrawColor(curcol);
				curcol.r, curcol.g, curcol.b = curcol.r + 3, curcol.g + 3, curcol.b + 3;
				surface.DrawLine( 5 + maxx, 31 + i, 5 + maxx + sizeper, 31 + i);
			end
		elseif(bMouse) then
			local curcol = Color(124, 124, 124);
			for i = 0, 30 do
				surface.SetDrawColor(curcol);
				curcol.r, curcol.g, curcol.b = curcol.r - 1.7, curcol.g - 1.7, curcol.b - 1.7;
				surface.DrawLine( 5 + maxx, 31 + i, 5 + maxx + sizeper, 31 + i);
			end
		else
			local curcol = Color(51, 51, 51);
			for i = 0, 30 do
				surface.SetDrawColor(curcol);
				curcol.r, curcol.g, curcol.b = curcol.r - 1.7, curcol.g - 1.7, curcol.b - 1.7;
				surface.DrawLine( 5 + maxx, 31 + i, 5 + maxx + sizeper, 31 + i);
			end
		end
		if(bMouse && input.IsMouseDown(MOUSE_LEFT) && !mousedown && !visible[v]) then
			local nb = visible[v];
			for key,val in next, visible do
				visible[key] = false;
			end
			visible[v] = !nb;
		end
		surface.SetFont("CenterPrintText");
		surface.SetTextColor(255, 255, 255);
		local tw, th = surface.GetTextSize(v);
		surface.SetTextPos( 5 + maxx + sizeper / 2 - tw / 2, 31 + 15 - th / 2 );
		surface.DrawText(v);
		maxx = maxx + sizeper;
	end
end

local function DrawCheckbox(self, w, h, var, maxy, posx, posy, dist)
	surface.SetFont("memeyou2");
	surface.SetTextColor(0, 0, 0);
	surface.SetTextPos( 5 + posx + 15 + 5, 61 + posy + maxy );
	local tw, th = surface.GetTextSize(var[1]);
	surface.DrawText(var[1]);
	
	surface.SetDrawColor(163, 163, 163);
	
	surface.DrawOutlinedRect( 5 + posx + 15 + 5 + dist + var[4], 61 + posy + maxy + 2, 14, 14);
	
	local mx, my = self:GetPos();
	
	local bMouse = MouseInArea(mx + 5 + posx + 15 + 5, my + 61 + posy + maxy, mx + 5 + posx + 15 + 5 + dist + 14 + var[4], my + 61 + posy + maxy + 16);
	
	if(bMouse) then
		surface.DrawRect( 5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 4, 10, 10);
	end
	
	if(var[3]) then
		surface.SetDrawColor(184, 0, 0);
		surface.DrawRect( 5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 4, 10, 10);
		surface.SetDrawColor(93, 0, 0);
		surface.DrawOutlinedRect( 5 + posx + 15 + 5 + dist + 2 + var[4], 61 + posy + maxy + 4, 10, 10);
	end
	
	if(bMouse && input.IsMouseDown(MOUSE_LEFT) && !mousedown && !drawlast) then
		var[3] = !var[3];
	end
end

local function DrawSlider2(self, w, h, var, maxy, posx, posy, dist)
	local curnum = var[3];
	local max = var[4];
	local size = var[5];
	surface.SetFont("memeyou2");
	surface.SetTextColor(0, 0, 0);
	surface.SetTextPos( 5 + posx + 15 + 5, 61 + posy + maxy );
	surface.DrawText(var[1]);
	
	local tw, th = surface.GetTextSize(var[1]);
	
	surface.SetDrawColor(163, 163, 163);
	
	surface.DrawRect( 5 + posx + 15 + 5 + dist, 61 + posy + maxy + 9, size, 2);
	
	local ww = math.ceil(curnum * size / max);
	
	surface.SetDrawColor(184, 0, 0);
	
	surface.DrawRect( 3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 9 - 5, 4, 12);
	
	surface.SetDrawColor(93, 0, 0);
	
	local tw, th = surface.GetTextSize(curnum.."%");
	
	surface.DrawOutlinedRect( 3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 4, 4, 12);
	
	surface.SetTextPos( 5 + posx + 15 + 5 + dist + (size / 2) - tw / 2, 61 + posy + maxy + 16);
	
	surface.DrawText(curnum.."%");
	
	local mx, my = self:GetPos();
	
	local bMouse = MouseInArea(5 + posx + 15 + 5 + dist + mx, 61 + posy + maxy + 5 - 5 + my, 5 + posx + 15 + 5 + dist + mx + size, 61 + posy + maxy + 9 - 5 + my + 18);
	
	if(bMouse && input.IsMouseDown(MOUSE_LEFT) && !drawlast && !candoslider) then
		local mw, mh = gui.MousePos();
	
		local new = math.ceil( ((mw - (mx + posx + 25 + dist - size)) - (size + 1)) / (size - 2) * max);
		var[3] = new;
	end
end

local function DrawSlider(self, w, h, var, maxy, posx, posy, dist)
	local curnum = var[3];
	local max = var[4];
	local size = var[5];
	surface.SetFont("memeyou2");
	surface.SetTextColor(0, 0, 0);
	surface.SetTextPos( 5 + posx + 15 + 5, 61 + posy + maxy );
	surface.DrawText(var[1]);
	
	local tw, th = surface.GetTextSize(var[1]);
	
	surface.SetDrawColor(163, 163, 163);
	
	surface.DrawRect( 5 + posx + 15 + 5 + dist, 61 + posy + maxy + 9, size, 2);
	
	local ww = math.ceil(curnum * size / max);
	
	surface.SetDrawColor(184, 0, 0);
	
	surface.DrawRect( 3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 9 - 5, 4, 12);
	
	surface.SetDrawColor(93, 0, 0);
	
	local tw, th = surface.GetTextSize(curnum..".00");
	
	surface.DrawOutlinedRect( 3 + posx + 15 + 5 + dist + ww, 61 + posy + maxy + 4, 4, 12);
	
	surface.SetTextPos( 5 + posx + 15 + 5 + dist + (size / 2) - tw / 2, 61 + posy + maxy + 16);
	
	surface.DrawText(curnum..".00");
	
	local mx, my = self:GetPos();
	
	local bMouse = MouseInArea(5 + posx + 15 + 5 + dist + mx, 61 + posy + maxy + 5 - 5 + my, 5 + posx + 15 + 5 + dist + mx + size, 61 + posy + maxy + 9 - 5 + my + 18);
	
	if(bMouse && input.IsMouseDown(MOUSE_LEFT) && !drawlast && !candoslider) then
		local mw, mh = gui.MousePos();
	
		local new = math.ceil( ((mw - (mx + posx + 25 + dist - size)) - (size + 1)) / (size - 2) * max);
		var[3] = new;
	end
end

local notyetselected;

local function DrawSelect(self, w, h, var, maxy, posx, posy, dist)

	local size = var[5];
	local curopt = var[3];
	
	surface.SetFont("memeyou2");
	surface.SetTextColor(0, 0, 0);
	surface.SetTextPos( 5 + posx + 15 + 5, 61 + posy + maxy );
	local tw, th = surface.GetTextSize(var[1]);
	surface.DrawText(var[1]);
	
	surface.SetDrawColor(163, 163, 163);
	
	surface.DrawOutlinedRect( 25 + posx + dist, 61 + posy + maxy, size, 16);
	
	local mx, my = self:GetPos();
	
	local bMouse = MouseInArea( mx + 25 + posx + dist, my + 61 + posy + maxy, mx + 25 + posx + dist + size, my + 61 + posy + maxy + 16)
	
	local check = dist..posy..posx..w..h..maxy;
	
	if(bMouse || notyetselected == check) then
		
		surface.DrawRect(25 + posx + dist + 2, 61 + posy + maxy + 2, size - 4, 12);
		
	end
	
	local tw, th = surface.GetTextSize(curopt);
	
	surface.SetTextPos( 25 + posx + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2);
	
	surface.DrawText(curopt);
	
	if(bMouse && input.IsMouseDown(MOUSE_LEFT) && !drawlast && !mousedown || notyetselected == check) then
		notyetselected = check;
		drawlast = function()
			local maxy2 = 16;
			for k,v in next, var[4] do
				surface.SetDrawColor(163, 163, 163);
				surface.DrawRect( 25 + posx + dist, 61 + posy + maxy + maxy2, size, 16);
				local bMouse2 = MouseInArea( mx + 25 + posx + dist, my + 61 + posy + maxy + maxy2, mx + 25 + posx + dist + size, my + 61 + posy + maxy + 16 + maxy2)
				if(bMouse2) then
					surface.SetDrawColor(200, 200, 200);
					surface.DrawRect( 25 + posx + dist, 61 + posy + maxy + maxy2, size, 16);
				end
				local tw, th = surface.GetTextSize(v);
				surface.SetTextPos( 25 + posx + dist + 5, 61 + posy + maxy + 6 - th / 2 + 2 + maxy2);
				surface.DrawText(v);
				maxy2 = maxy2 + 16;
				if(bMouse2 && input.IsMouseDown(MOUSE_LEFT) && !mousedown) then
					var[3] = v;
					notyetselected = nil;
					drawlast = nil;
					return;
				end
			end
			local bbMouse = MouseInArea( mx + 25 + posx + dist, my + 61 + posy + maxy, mx + 25 + posx + dist + size, my + 61 + posy + maxy + maxy2);
			if(!bbMouse && input.IsMouseDown(MOUSE_LEFT) && !mousedown) then
				 notyetselected = nil;
				 drawlast = nil;
				 return;
			end
		end
	end
	
	
end

local function DrawSubSub(self, w, h, k, var)
	local opt, posx, posy, sizex, sizey, dist = var[1][1], var[1][2], var[1][3], var[1][4], var[1][5], var[1][6];
	
	surface.SetDrawColor(163, 163, 163);
	
	local startpos = 61 + posy;
	
	surface.SetTextColor(0, 0, 0);
	
	surface.SetFont("memeyou2");
	
	local tw, th = surface.GetTextSize(opt);
	
	surface.DrawLine( 5 + posx, startpos, 5 + posx + 15, startpos);
	
	surface.SetTextPos( 5 + posx + 15 + 5, startpos - th / 2 );
	
	surface.DrawLine( 5 + posx + 15 + 5 + tw + 5, startpos, 5 + posx + sizex, startpos);
	
	surface.DrawLine( 5 + posx, startpos, 5 + posx, startpos + sizey);
	
	surface.DrawLine(5 + posx, startpos + sizey, 5 + posx + sizex, startpos + sizey );
	
	surface.DrawLine( 5 + posx + sizex, startpos, 5 + posx + sizex, startpos + sizey);
	
	surface.DrawText(opt);
	
	local maxy = 15;
	
	for k,v in next, var do
		if(k == 1) then continue; end
		if(v[2] == "Checkbox") then
			DrawCheckbox(self, w, h, v, maxy, posx, posy, dist);
		elseif(v[2] == "Slider") then
			DrawSlider(self, w, h, v, maxy, posx, posy, dist);
		elseif(v[2] == "Slider2") then
			DrawSlider2(self, w, h, v, maxy, posx, posy, dist);
		elseif(v[2] == "Selection") then
			DrawSelect(self, w, h, v, maxy, posx, posy, dist);
		end
		maxy = maxy + 25;
	end
end

local function DrawSub(self, w, h)
	for k, v in next, visible do 
		if(!v) then continue; end
		for _, var in next, options[k] do
			DrawSubSub(self, w, h, k, var);
		end
	end
end

local function DrawSaveButton(self, w, h)
	local curcol = Color(235, 235, 235);
	local mx, my = self:GetPos();
	local bMouse = MouseInArea(mx + 30, my + h - 50, mx + 30 + 200, my + h - 50 + 30);
	if(bMouse) then
		curcol = Color(200, 200, 200);
	end
	for i = 0, 30 do
		surface.SetDrawColor(curcol);
		surface.DrawLine( 30, h - 50 + i, 30 + 200, h - 50 + i );
		for k,v in next, curcol do
			curcol[k] = curcol[k] - 2;
		end
	end
	surface.SetFont("memeyou2");
	surface.SetTextColor(0, 0, 0);
	local tw, th = surface.GetTextSize("Save Configuration");
	surface.SetTextPos( 30 + 100 - tw / 2, h - 50 + 15 - th / 2 );
	surface.DrawText("Save Configuration");
	if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
		saveconfig();
	end
end

local function DrawLoadButton(self, w, h)
	local curcol = Color(235, 235, 235);
	local mx, my = self:GetPos();
	local bMouse = MouseInArea(mx + 250, my + h - 50, mx + 250 + 200, my + h - 50 + 30);
	if(bMouse) then
		curcol = Color(200, 200, 200);
	end
	for i = 0, 30 do
		surface.SetDrawColor(curcol);
		surface.DrawLine( 250, h - 50 + i, 250 + 200, h - 50 + i );
		for k,v in next, curcol do
			curcol[k] = curcol[k] - 2;
		end
	end
	surface.SetFont("memeyou2");
	surface.SetTextColor(0, 0, 0);
	local tw, th = surface.GetTextSize("Load Configuration");
	surface.SetTextPos( 250 + 100 - tw / 2, h - 50 + 15 - th / 2 );
	surface.DrawText("Load Configuration");
	if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
		loadconfig();
	end
end

loadconfig();
local function Drawcheatsbutton(self, w, h)
	local curcol = Color(235, 235, 235);
	local mx, my = self:GetPos();
	local bMouse = MouseInArea(mx + 500, my + h - 50, mx + 500 + 200, my + h - 50 + 30);
	if(bMouse) then
		curcol = Color(200, 200, 200);
	end
	for i = 0, 30 do
		surface.SetDrawColor(curcol);
		surface.DrawLine( 500, h - 50 + i, 500 + 200, h - 50 + i );
		for k,v in next, curcol do
			curcol[k] = curcol[k] - 2;
		end
	end
	surface.SetFont("memeyou2");
	surface.SetTextColor(0, 0, 0);
	local tw, th = surface.GetTextSize("Bypass sv_cheats");
	surface.SetTextPos( 500 + 100 - tw / 2, h - 50 + 15 - th / 2 );
	surface.DrawText("Bypass sv_cheats");
	if(bMouse && input.IsMouseDown(MOUSE_LEFT)) then
		MsgC( Color( 255, 0, 0 ), "Sorry work in progress! :/" )
	end
end

local insertdown2, insertdown, menuopen;

local function menu()
	local frame = vgui.Create("DFrame");
	frame:SetSize(1000, 700);
	frame:Center();
	frame:SetTitle("");
	frame:MakePopup();
	frame:ShowCloseButton(false);
	
	frame.Paint = function(self, w, h)
		if(candoslider && !mousedown && !drawlast && !input.IsMouseDown(MOUSE_LEFT)) then
			candoslider = false;
		end
		DrawBackground(w, h);
		DrawOptions(self, w, h);
		DrawSub(self, w, h);
		DrawSaveButton(self, w, h);
		DrawLoadButton(self, w, h);
		Drawcheatsbutton(self, w, h);
		if(drawlast) then
			drawlast();
			candoslider = true;
		end
		mousedown = input.IsMouseDown(MOUSE_LEFT);
	end
	
	frame.Think = function()
		if (input.IsKeyDown(KEY_INSERT) && !insertdown2) then
			frame:Remove();
			menuopen = false;
			candoslider = false;
			drawlast = nil;
		end
	end
end


local function Think()
	if (input.IsKeyDown(KEY_INSERT) && !menuopen && !insertdown) then
		menuopen = true;
		insertdown = true;
		menu();
	elseif (!input.IsKeyDown(KEY_INSERT) && !menuopen) then
		insertdown = false;
	end
	if (input.IsKeyDown(KEY_INSERT) && insertdown && menuopen) then
		insertdown2 = true;
	else
		insertdown2 = false;
	end
end



hook.Add("Think", "", Think);


--[[
Actual codens
]]

local FindMetaTable = FindMetaTable;

local em = FindMetaTable"Entity";
local nm = FindMetaTable"NPC";
local pm = FindMetaTable"Player";
local cm = FindMetaTable"CUserCmd";
local wm = FindMetaTable"Weapon";
local am = FindMetaTable"Angle";
local vm = FindMetaTable"Vector";

local Vector = Vector;
local player = Copy(player);
local Angle = Angle;
local me = LocalPlayer();
local render = Copy(render);
local cma = Copy(cam);
local Material = Material;
local CreateMaterial = CreateMaterial;

--[[
esp
]]

local function Filter(v)
	local enemy = gBool("Visuals", "Filter", "Enemies only");
	local dist = gBool("Visuals", "Filter", "Distance")
	if(enemy) then
		if(pm.Team(v) == pm.Team(me)) then return false; end
	end
	if(dist) then
		local maxdist = gBool("Visuals", "Filter", "Max Distance");
		if( vm.Distance( em.GetPos(v), em.GetPos(me) ) > (maxdist * 5) ) then return false; end
	end
	return true;
end


local chamsmat = CreateMaterial("a", "VertexLitGeneric", {
	["$ignorez"] = 1,
	["$model"] = 1,
	["$basetexture"] = "models/debug/debugwhite",
});

local chamsmat2 = CreateMaterial("@", "vertexlitgeneric", {
	["$ignorez"] = 0,
	["$model"] = 1,
	["$basetexture"] = "models/debug/debugwhite",
});

local function GetChamsColor(v, vis)
	local pre = "Chams - Enemy";
	if(pm.Team(v) == pm.Team(me)) then
		pre = "Chams - Team";
	end
	if(vis) then
		local r = gInt("Colors", pre, "Visible R") / 255;
		local g = gInt("Colors", pre, "Visible G") / 255;
		local b = gInt("Colors", pre, "Visible B") / 255;
		return r,g,b;
	end
	local r = gInt("Colors", pre, "Not Visible R") / 255;
	local g = gInt("Colors", pre, "Not Visible G") / 255;
	local b = gInt("Colors", pre, "Not Visible B") / 255;
	return r,g,b;
end

local function Chams(v)
	if(gBool("Visuals", "ESP", "XQZ")) then
		cam.Start3D();
			cam.IgnoreZ(true);
			em.DrawModel(v);
			cam.IgnoreZ(false);
		cam.End3D();
	end
	if(gBool("Visuals", "ESP", "Chams")) then
		cam.Start3D();
			
			render.MaterialOverride(chamsmat);
			render.SetColorModulation(GetChamsColor(v));
				
			em.DrawModel(v);
				
			render.SetColorModulation(GetChamsColor(v, true));
			render.MaterialOverride(chamsmat2);
				
			em.DrawModel(v);
			
		cam.End3D();
	end
end

local function GetColor(v)
	if(pm.Team(v) == pm.Team(me)) then
		local r = gInt("Colors", "Glow", "R");
		local g = gInt("Colors", "Glow", "G");
		local b = gInt("Colors", "Glow", "B");
		return(Color(r, g, b, 220));
	end
	local r = gInt("Colors", "Box - Enemy", "R");
	local g = gInt("Colors", "Box - Enemy", "G");
	local b = gInt("Colors", "Box - Enemy", "B");
	return(Color(r, g, b, 220));
end
function GetAmmoForCurrentWeapon( pm )
	if ( !IsValid( pm ) ) then return -1 end

	local wep = pm:GetActiveWeapon()
	if ( !IsValid( wep ) ) then return -1 end

	return pm:GetAmmoCount( wep:GetPrimaryAmmoType() )
end

local function ESP(v)
	local pos = em.GetPos(v);
	local pos, pos2 = vm.ToScreen(pos - Vector(0, 0, 5)), vm.ToScreen( pos + Vector(0, 0, 70 ) );
	local h = pos.y - pos2.y;
	local w = h / 2.2;
	if(gBool("Visuals", "ESP", "Box") && gOption("Visuals", "ESP", "Box Type") == "2D Box") then	
		
		surface.SetDrawColor(GetColor(v));
		surface.DrawOutlinedRect( pos.x - w / 2, pos.y - h, w, h);
		surface.SetDrawColor(255, 0, 0, 225);
		surface.DrawOutlinedRect( pos.x - w / 2 - 1, pos.y - h - 1, w + 2, h + 2);
		surface.DrawOutlinedRect( pos.x - w / 2 + 1, pos.y - h + 1, w - 2, h - 2);
		
	end
	
	if(gBool("Visuals", "ESP", "Health")) then
		local hp = nm.Health(v) * h / 100;
		if(hp > h) then hp = h; end
		local diff = h - hp;
		surface.SetDrawColor(0, 0, 0, 255);
		surface.DrawRect(pos.x - w / 2 - 5, pos.y - h - 1, 3, h + 2);
		surface.SetDrawColor( ( 100 - em.Health(v) ) * 2.55, em.Health(v) * 2.55, 0, 255);
		surface.DrawRect(pos.x - w / 2 - 4, pos.y - h + diff, 1, hp);
	end

		
	surface.SetFont("BudgetLabel");
	
	surface.SetTextColor(255, 255, 255);
	
	if(gBool("Visuals", "ESP", "Name")) then
	
		local tw, th = surface.GetTextSize(nm.Name(v));
		
		surface.SetTextPos( pos.x - tw / 2, pos.y - h + 2 - th );
		
		surface.DrawText(nm.Name(v));
		
	end
	
	if(gBool("Visuals", "ESP", "Weapon")) then
		
		local w = pm.GetActiveWeapon(v);
		if(w && em.IsValid(w)) then
			local tw,  th = surface.GetTextSize(em.GetClass(w));
			surface.SetTextPos( pos.x - tw / 2, pos.y - th / 2 + 5 );
			surface.DrawText(em.GetClass(w)); 
		end
		
	end
	
	if(gBool("Visuals", "ESP", "Skeleton")) then
		local origin = em.GetPos(v);
		for i = 1, em.GetBoneCount(v) do
			local parent = em.GetBoneParent(v, i);
			if(!parent) then continue; end
			local bonepos, parentpos = em.GetBonePosition(v, i), em.GetBonePosition(v, parent);
			if(!bonepos || !parentpos || bonepos == origin) then continue; end
			local bs, ps = vm.ToScreen(bonepos), vm.ToScreen(parentpos);
			surface.SetDrawColor(255, 255, 255);
			surface.DrawLine(bs.x, bs.y, ps.x, ps.y);
		end
		
	end

	
end

local aimtarget;
local Name = ""
hook.Add("HUDPaint", "", function()
if(gBool("Visuals", "ESP", "Box") && gOption("Visuals", "ESP", "Box Type") == "2D Box") then	
for k,v in pairs ( ents.GetAll() ) do
 
		local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
		local Name = ""
 
		if v == LocalPlayer() then Name = "" else Name = v:Name() end
 
		draw.DrawText( Name, "MenuLarge", Position.x, Position.y, Color( 255, 255, 255, 255 ), 1 )
end
		end
end)

hook.Add("HUDPaint", "", function()
	if(aimtarget && gBool("Ragebot", "Target", "Snapline")) then
		local pos = vm.ToScreen(em.LocalToWorld(aimtarget, em.OBBCenter(aimtarget)));
		surface.SetDrawColor(255, 255, 255);
		surface.DrawLine(ScrW() / 2, ScrH() / 2, pos.x, pos.y);
	end
	if(!gBool("Visuals", "ESP", "Enabled")) then return; end
	for k,v in next, player.GetAll() do
		if(!em.IsValid(v) || em.Health(v) < 1 || v == me || em.IsDormant(v)) then continue; end
		if(!Filter(v)) then continue; end
		ESP(v);
	end
end);

hook.Add("RenderScreenspaceEffects", "", function()
	if(!gBool("Visuals", "ESP", "Enabled")) then return; end
	for k,v in next, player.GetAll() do
		if(!em.IsValid(v) || em.Health(v) < 1 || v == me || em.IsDormant(v)) then continue; end
		if(!Filter(v)) then continue; end
		Chams(v);
	end
end);

saveconfig();

--[[
memes
]]

local fa;
local aa;

local function FixMovement(ucmd, aaaaa)
	--local move = Vector(cm.GetForwardMove(ucmd), cm.GetSideMove(ucmd), 0);
	--local move = am.Forward( vm.Angle(move) + ( cm.GetViewAngles(ucmd) - fa ) ) * vm.Length(move);
	local move = Vector(cm.GetForwardMove(ucmd), cm.GetSideMove(ucmd), cm.GetUpMove(ucmd));
	local speed = math.sqrt(move.x * move.x + move.y * move.y);
	local ang = vm.Angle(move);
	local yaw = math.rad(cm.GetViewAngles(ucmd).y - fa.y + ang.y);
	cm.SetForwardMove(ucmd, (math.cos(yaw) * speed) * ( aaaaa && -1 || 1 ));
	cm.SetSideMove(ucmd, math.sin(yaw) * speed);
	--cm.SetForwardMove(ucmd, move.x);
	--cm.SetSideMove(ucmd, (aaaaa && move.y * -1 || move.y));
end

local function Clamp(val, min, max)
	if(val < min) then
		return min;
	elseif(val > max) then
		return max;
	end
	return val;
end

local function NormalizeAngle(ang)
	ang.x = math.NormalizeAngle(ang.x);
	ang.p = math.Clamp(ang.p, -89, 89);
end

--[[
aimer
]]

local table = Copy(table);
local dists = {};

local function GetPos(v)

	if(gBool("Ragebot", "Target", "Bodyaim")) then return( em.LocalToWorld(v, em.OBBCenter(v)) ); end

	local eyes = em.LookupAttachment(v, "eyes");
	
	if(!eyes) then return( em.LocalToWorld(v, em.OBBCenter(v)) ); end
	
	local pos = em.GetAttachment(v, eyes);
	
	if(!pos) then return( em.LocalToWorld(v, em.OBBCenter(v)) ); end
	
	return(pos.Pos);
end

local aimignore;

local function Valid(v)
	if(!v || !em.IsValid(v) || v == me || em.Health(v) < 1 || em.IsDormant(v) || pm.Team(v) == 1002 || (v == aimignore && gOption("Ragebot", "Target", "Selection") == "Nextshot")) then return false; end
	if(gBool("Ragebot", "Target", "Ignore Bots")) then
		if(pm.IsBot(v)) then return false; end
	end
	if(gBool("Ragebot", "Target", "Ignore Team")) then
		if(pm.Team(v) == pm.Team(me)) then return false; end
	end
	if(gBool("Ragebot", "Target", "Ignore Friends")) then
		if(pm.GetFriendStatus(v) == "friend") then return false; end
	end
	local tr = {
		start = em.EyePos(me),
		endpos = GetPos(v),
		mask = MASK_SHOT,
		filter = {me, v},
	};
	return(util.TraceLine(tr).Fraction == 1);
end

local function gettarget()

	local opt = gOption("Ragebot", "Target", "Selection");
	
	local sticky = gOption("Ragebot", "Aimbot", "Non-Sticky");
	
	if(opt == "Distance") then

		if( !sticky && Valid(aimtarget) ) then return; end

		dists = {};
		
		for k,v in next, player.GetAll() do
			if(!Valid(v)) then continue; end
			dists[#dists + 1] = { vm.Distance( em.GetPos(v), em.GetPos(me) ), v };
		end
		
		table.sort(dists, function(a, b)
			return(a[1] < b[1]);
		end);
		
		aimtarget = dists[1] && dists[1][2] || nil;
		
	elseif(opt == "Health") then
		
		if( !sticky && Valid(aimtarget) ) then return; end

		dists = {};
		
		for k,v in next, player.GetAll() do
			if(!Valid(v)) then continue; end
			dists[#dists + 1] = { em.Health(v), v };
		end
		
		table.sort(dists, function(a, b)
			return(a[1] < b[1]);
		end);
		
		aimtarget = dists[1] && dists[1][2] || nil;
		
	elseif(opt == "Nextshot") then
		if( !sticky && Valid(aimtarget) ) then return; end
		aimtarget = nil;
		local allplys = player.GetAll();
		local avaib = {};
		for k,v in next,allplys do
			avaib[math.random(100)] = v;
		end
		
		for k,v in next, avaib do
			if(Valid(v)) then
				aimtarget = v;
			end
		end
	end
		
end


local cones = {};

local pcall = pcall;
local require = require;

local nullvec = Vector() * -1;

local IsFirstTimePredicted = IsFirstTimePredicted;
local CurTime = CurTime;
local servertime=0;
local bit = Copy(bit);
--pcall(require, "dickwrap");

hook.Add("Move", "", function()
	if(!IsFirstTimePredicted()) then return; end
	servertime = CurTime();
end);


GAMEMODE["EntityFireBullets"] = function(self, p, data)
	aimignore = aimtarget;
	local w = pm.GetActiveWeapon(me);
	local Spread = data.Spread * -1;
	if(!w || !em.IsValid(w) || cones[em.GetClass(w)] == Spread || Spread == nullvec) then return; end
	cones[em.GetClass(w)] = Spread;
end

local function PredictSpread(ucmd, ang)
	local w = pm.GetActiveWeapon(me);
	if(!w || !em.IsValid(w) || !cones[em.GetClass(w)] || !gBool("Ragebot", "Accuracy", "Anti Spread")) then return am.Forward(ang); end
	return(dickwrap.Predict(ucmd, am.Forward(ang), cones[em.GetClass(w)]));
end

local function Autofire(ucmd)
	if(pm.KeyDown(me, 1) && gBool("Ragebot", "Aimbot", "Auto Pistol")) then
		cm.SetButtons(ucmd, bit.band( cm.GetButtons(ucmd), bit.bnot( 1 ) ) );
	else
		cm.SetButtons(ucmd, bit.bor( cm.GetButtons(ucmd), 1 ) );
	end
end

local function WeaponCanFire()
	local w = pm.GetActiveWeapon(me);
	if(!w || !em.IsValid(w) || !gBool("Ragebot", "Aimbot", "Bullettime")) then return true; end
	return( servertime >= wm.GetNextPrimaryFire(w) );
end

local function WeaponShootable()
    local wep = pm.GetActiveWeapon(me);
    if( em.IsValid(wep) ) then // I would never get lazy..
	     local n = string.lower(wep:GetPrintName())
	     if( wep:Clip1() <= 0 ) then
		    return false;
		 end
		 
		 
		 
		 if( string.find(n,"knife") or string.find(n,"grenade") or string.find(n,"sword") or string.find(n,"bomb") or string.find(n,"ied") or string.find(n,"c4") or string.find(n,"slam") or string.find(n,"climb") or string.find(n,"hand") or string.find(n,"fist") ) then
		    return false;
		 end
		  
		  
		  return true;
	end
end

local function PredictPos(pos)
local myvel = LocalPlayer():GetVelocity()
local pos = pos - (myvel * engine.TickInterval()); 
return pos;
end


local function aimer(ucmd)
	if(cm.CommandNumber(ucmd) == 0 || !gBool("Ragebot", "Aimbot", "Enabled")) then return; end
	gettarget();
	aa = false;
	if(aimtarget && (input.IsKeyDown(KEY_LALT) || gBool("Ragebot", "Aimbot", "Autosnap")) && WeaponCanFire() && WeaponShootable() ) then
		aa = true;
		local pos = GetPos(aimtarget) - em.EyePos(me);
		PredictPos(pos);
		local ang = vm.Angle( PredictSpread(ucmd, vm.Angle(pos)));
		NormalizeAngle(ang);
		cm.SetViewAngles(ucmd, ang);
		if(gBool("Ragebot", "Aimbot", "Autofire")) then
			Autofire(ucmd);
		end
		if(gBool("Ragebot", "Aimbot", "Silent")) then
			FixMovement(ucmd);
		else
			fa = ang;
		end
	end
end

--[[
antiaimer
]]



local ox=-181;
local oy=0;

local function RandCoin()
	local randcoin = math.random(0,1);
	if(randcoin == 1) then return 1; else return -1; end
end

local function GetX()
	local opt = gOption("Ragebot", "Anti-Aim", "X");
	if(opt == "Emotion") then
		local randcoin = gInt("Ragebot", "Anti-Aim", "Emotion Randomcoin X");
		if( math.random(100) < randcoin ) then
			ox = RandCoin() * 181;
		end
	elseif( opt == "Up" ) then
		ox = -181;
	elseif( opt == "Down" ) then
		ox = 181;
	elseif(opt == "Jitter") then
		ox = ox * -1;
	end
end

local function GetClosest()
	local ddists = {};
	
	local closest;
		
	for k,v in next, player.GetAll() do
	if(!Valid(v)) then continue; end
		ddists[#ddists + 1] = { vm.Distance( em.GetPos(v), em.GetPos(me) ), v };
	end
		
	table.sort(ddists, function(a, b)
		return(a[1] < b[1]);
	end);
		
	closest = ddists[1] && ddists[1][2] || nil;
	
	if(!closest) then return fa.y; end
	
	local pos = em.GetPos(closest);
	
	local pos = vm.Angle(pos - em.EyePos(me));
	
	return( pos.y );
end

local function GetY()
	local opt = gOption("Ragebot", "Anti-Aim", "Y");
	if(opt == "Emotion") then
		local randcoin = gInt("Ragebot", "Anti-Aim", "Emotion Randomcoin Y");
		if( math.random(100) < randcoin ) then
			oy = fa.y + math.random(-180, 180);
		end
	elseif( opt == "Eye Angles" ) then
		oy = fa.y;
	elseif( opt == "Sideways" ) then
		oy = fa.y - 90;
	elseif(opt == "Jitter") then
		oy = fa.y + math.random(-90, 90);
	elseif(opt == "TJitter") then
		oy = fa.y - 180 + math.random(-90, 90);
	elseif(opt == "Static") then
		oy = 0;
	elseif(opt == "Forward") then
		oy = fa.y;
	elseif(opt == "Backwards") then
		oy = fa.y - 180;
	elseif(opt == "Towards Players") then
		oy = GetClosest();
	end
end

local function walldetect()
	local eye = em.EyePos(me);
	local tr = util.TraceLine({
		start = eye,
		endpos = (eye + (am.Forward(fa) * 10)),
		mask = MASK_ALL,
	});
	if(tr.Hit) then
		ox = -181;
		oy = -90;	
	end
end

local function antiaimer(ucmd)
	if( (cm.CommandNumber(ucmd) == 0 && (tonumber(gBool("Visuals", "Other", "Thirdperson "))) > -1) || cm.KeyDown(ucmd, 1) || cm.KeyDown(ucmd, 32) || aa || !gBool("Ragebot", "Anti-Aim", "Enabled")) then return; end
	GetX();
	GetY();
	walldetect();
	local aaang = Angle(ox, oy, 0);
	cm.SetViewAngles(ucmd, aaang);
	FixMovement(ucmd, true);
end

local function GetAngle(ang)
	if(!gBool("Ragebot", "Accuracy", "Anti Recoil")) then return ang + pm.GetPunchAngle(me); end
	return ang;
end

local function rapidfire(ucmd)
	if(pm.KeyDown(me, 1) && gBool("Ragebot", "Aimbot", "Auto Pistol")) then
		cm.SetButtons(ucmd, bit.band( cm.GetButtons(ucmd), bit.bnot( 1 ) ) );
	end
end

local function meme(ucmd)
	if(!fa) then fa = cm.GetViewAngles(ucmd); end
	fa = fa + Angle(cm.GetMouseY(ucmd) * .023, cm.GetMouseX(ucmd) * -.023, 0);
	NormalizeAngle(fa);
	if(cm.CommandNumber(ucmd) == 0) then
		cm.SetViewAngles(ucmd, GetAngle(fa));
		return;
	end

	--if(cm.KeyDown(ucmd, 2) && !em.IsOnGround(me)) then
	--	cm.SetButtons(ucmd, bit.band( cm.GetButtons(ucmd), bit.bnot( 2 ) ) );
	--end
end


hook.Add("CreateMove", "memmeme", function(ucmd)
	meme(ucmd);
	aimer(ucmd);
	antiaimer(ucmd);
	salty.edgejump(ucmd);
	
end);

local function bhoops(ucmd)

bunnyhop(ucmd);
end

local function bhopbrain()
if(gOption("Misc", "Misc", "Auto Jump") == "Perfect") then	
hook.Add("CreateMove", "bhopbrain", bhoops)

else if(gOption("Misc", "Misc", "Auto Jump") == "Off") then	
hook.Remove("CreateMove", "bhopbrain")
end
end
end
hook.Add("Think","bhopstartbrain", bhopbrain)
local maxdist2 = gBool("Misc", "Misc", "Thirdperson ");
hook.Add("CalcView", "", function(p, o, a, f)
	return({ 
		angles = GetAngle(fa),
		--local maxdist2 = gBool("Visuals", "Filter", "Thirdperson Distance");
		
	--print(maxdist2)
	     maxdist2 = gBool("Visuals", "Other", "Thirdperson ");
		origin = (o + am.Forward(fa) * (tonumber(gBool("Visuals", "Other", "Thirdperson "))) || o),
		fov = f,
	});
end);

hook.Add("ShouldDrawLocalPlayer", "", function()
	local maxdist2 = gBool("Misc", "Misc", "Thirdperson ");
	return((tonumber(gBool("Visuals", "Other", "Thirdperson "))) < -1)
end);
// Auto Jump
function bunnyhop(cmd)
if(gOption("Misc", "Misc", "Auto Jump") == "Perfect") then	
	
		if(!me:IsOnGround() && cmd:KeyDown(IN_JUMP)) then
			cmd:RemoveKey(IN_JUMP);
			
			end
			else if(gOption("Misc", "Misc", "Auto Jump") == "Off") then
			return
		end
		end
	if(gBool("Misc", "Misc", "Auto-Strafe")) then
		if(!em.IsOnGround(me)) then
			local mouseX = cmd:GetMouseX()
				if(cmd:GetMouseX() > 1 || cmd:GetMouseX() < -1) then
				cmd:SetSideMove(cmd:GetMouseX() > 1 && 400 || -400);
	else
	cmd:SetForwardMove(6200 / me:GetVelocity():Length2D());
	cmd:SetSideMove((cmd:CommandNumber() % 2 == 0) && -400 || 400);           
				end
				elseif(cmd:KeyDown(IN_JUMP) && gBool("Misc", "Misc", "Auto-Strafe")) then
				cmd:SetForwardMove(6200);
			end
		end
	end

function salty.edgejump(cmd)
if(gBool("Misc", "Misc", "Edge Jump")) then 
if LocalPlayer():IsOnGround() then

	local WalkAngle
	if LocalPlayer():GetVelocity():Length() != 0 then
		WalkAngle = Angle( 0, LocalPlayer():GetVelocity():Angle().y, 0 )
	else
		WalkAngle = Angle( 0, LocalPlayer():EyeAngles().y, 0 )
	end
	local FinPos = LocalPlayer():EyePos() + (WalkAngle:Forward()*(1) )
	FinPos.z = LocalPlayer():GetPos().z-5
	local GroundDetect = {
			start = LocalPlayer():GetShootPos(),
			endpos = FinPos,
			filter = LocalPlayer(),
			mask = MASK_PLAYERSOLID
		}
	if util.TraceLine(GroundDetect).Fraction == 1 then
		RunConsoleCommand("+jump")
	
			 			timer.Create("hopedge", 0, 0.01, function()
	 		 	RunConsoleCommand("-jump")
				end)
				
		--print("jump")
	end
end
//LocalPlayer():SetEyeAngles(Angle( 0,LocalPlayer():GetVelocity():Angle().y,LocalPlayer():GetVelocity():Angle().z )) <-Just for safe keeping
end
end
local function spamfast()
if(gOption("Misc", "Misc", "Chat Spam") == "Fast") then	
RunConsoleCommand("say", "BUNNYWARE | For All Your Cheat Needs")
end
end	
timer.Create("Spamminsfast", 0.1,0,spamfast)

local function spamslow()
if(gOption("Misc", "Misc", "Chat Spam") == "Slow") then	
RunConsoleCommand("say", "BUNNYWARE | For All Your Cheat Needs")
end
end	
timer.Create("SpamminsSlow", 1.3,0,spamslow)

local function airstuck()
if(gOption("Misc", "Misc", "Air Stuck")) then
RunConsoleCommand("net_fakeloss", "99")
else if(!gOption("Misc", "Misc", "Air Stuck")) then
	RunConsoleCommand("net_fakeloss", "0")	
else return;
end
end

end
hook.Add( "Think", "astuvk", airstuck )

local function viewmodelfov()
	local fovdist = gBool("Visuals", "Other", "Viewmodel Fov");
	--if(gOption("Misc", "Misc", "Viewmodel Fov Active")) then
	if fovdist > 0 then
	local ply = LocalPlayer()
	--print(fovdist)
	--local fovdist = tonumber(arguments[2])
	
	RunConsoleCommand("viewmodel_fov", tonumber(fovdist))
	end
	if fovdist == 0 then
	RunConsoleCommand("viewmodel_fov", 54)
	
end 
end
hook.Add( "Think", "vfov", viewmodelfov )
 
local function viewfov()
    local viewfovdist = gBool("Visuals", "Other", "View Fov");
	 
	if viewfovdist > 0 then
	local ply = LocalPlayer()
	ply:SetFOV(tonumber(viewfovdist), "0")
end
    if viewfovdist == 0 then
	ply = LocalPlayer()
	ply:SetFOV("90", "0")
end	
end
hook.Add( "Think", "wfov", viewfov) 




local failsafe2, failsafe, radaropen;
local function radar()
	local frame = vgui.Create("DFrame");
	local rdist = gBool("Visuals", "Other", "Radar Size");
	frame:SetSize(rdist, rdist);
	frame:SetPos(50,175);
	frame:SetTitle("radar");
	frame:SetVisible( true )
	--frame:MakePopup();
	frame:ShowCloseButton(false);
	
	frame.PaintOver = function()
    local center = Vector( frame:GetTall() / 2, frame:GetWide() / 2, 0 )
	local scale = Vector( 50, 50, 0 )
	local segmentdist = 360 / ( 2 * math.pi * math.max( scale.x, scale.y ) / 2 )
	surface.SetDrawColor( 255, 0, 0, 255 )

	    surface.DrawLine(frame:GetWide()/2, (frame:GetTall()/2)-65, frame:GetWide()/2, (frame:GetTall()/2)+90)
		surface.DrawLine((frame:GetWide()/2)-150, frame:GetTall()/1.9, (frame:GetWide()/2)+150, frame:GetTall()/1.9)
		for k, v in pairs(ents.FindByClass("npc_*")) do
		local ply = LocalPlayer()
		local theirPos = v:GetPos()
		local myPos = ply:GetPos()
		local ply = LocalPlayer()
		local myAngles = ply:EyeAngles()
		local theirX = (frame:GetWide() / 2) + ((theirPos.x - myPos.x) / 40)
        local theirY = (frame:GetTall() / 2) + ((myPos.y - theirPos.y) / 40)
		local myRotation = myAngles.y - 90
		myRotation = math.rad(myRotation)
		 theirX = theirX - (frame:GetWide() / 2)
         theirY = theirY - (frame:GetTall() / 2)
		 local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
    local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
     newX = newX + (frame:GetWide() / 2)
     newY = newY +  (frame:GetTall() / 2)
	     
      draw.RoundedBox(1,newX, newY,5,5,(Color(255,0,0)))
	  
		--surface.SetDrawColor(255, 0, 0 )
	end
end

	frame.Think = function()
		if (!gBool("Visuals", "Other", "Radar")) then 
		
			frame:Remove();
			radaropen = false;
			--candoslider = false;
			--drawlast = nil;
		end
	end
end


local function radarbrain()
	if (gBool("Visuals", "Other", "Radar") && !radaropen && !failsafe) then 
	
		radaropen = true;
		failsafe = true;
		radar();
	elseif (!gBool("Visuals", "Other", "Radar") && !radaropen) then
		failsafe = false;
	end
	if (gBool("Visuals", "Other", "Radar") && failsafe && radaropen) then
		failsafe2 = true;
	else
		failsafe3 = false;
	end
	end


hook.Add("Think", "radar", radarbrain);









  hook.Add("HUDPaint", "crosshairp1", function()
  if (gOption("Visuals", "Other", "Crosshair") == "Old") then
				surface.SetDrawColor(Color(255, 0, 0, 255))
		
		surface.DrawLine((ScrW()/2)-10, ScrH()/2, (ScrW()/2)+10, ScrH()/2)
		surface.DrawLine(ScrW()/2, (ScrH()/2)-10, ScrW()/2, (ScrH()/2)+10)
						
	//surface.RoundedBox( ScrW() / 2, ScrH() / 2, 5,5, Color(255, 0, 0, 255))
	end

end)
hook.Add("HUDPaint", "crosshairp2", function()
	if (gOption("Visuals", "Other", "Crosshair") == "Old") then
	surface.SetDrawColor(Color(255, 255, 255, 255))

		surface.DrawLine((ScrW()/2)-6, ScrH()/2, (ScrW()/2)+6, ScrH()/2)
		surface.DrawLine(ScrW()/2, (ScrH()/2)-6, ScrW()/2, (ScrH()/2)+6)
						
	//surface.RoundedBox( ScrW() / 2, ScrH() / 2, 5,5, Color(255, 0, 0, 255))
	end

end)

  hook.Add("HUDPaint", "crosshairp3", function()
  if (gOption("Visuals", "Other", "Crosshair") == "New") then
				surface.SetDrawColor(Color(139,0,0, 255))
		
		surface.DrawLine((ScrW()/2)-10, ScrH()/2, (ScrW()/2)+10, ScrH()/2)
		surface.DrawLine(ScrW()/2, (ScrH()/2)-10, ScrW()/2, (ScrH()/2)+10)
						
	//surface.RoundedBox( ScrW() / 2, ScrH() / 2, 5,5, Color(255, 0, 0, 255))
	end

end)
hook.Add("HUDPaint", "crosshairp4", function()
	if (gOption("Visuals", "Other", "Crosshair") == "New") then
	surface.SetDrawColor(Color(139,0,0, 255))

		surface.DrawLine((ScrW()/2)-6, ScrH()/2, (ScrW()/2)+6, ScrH()/2)
		surface.DrawLine(ScrW()/2, (ScrH()/2)-6, ScrW()/2, (ScrH()/2)+6)
						
	//surface.RoundedBox( ScrW() / 2, ScrH() / 2, 5,5, Color(255, 0, 0, 255))
	end

end)
hook.Add( "HUDPaint", "crosshairp5", function()
	if (gOption("Visuals", "Other", "Crosshair") == "New") then
	local center = Vector( ScrW() / 2, ScrH() / 2, 0 )
	local scale = Vector( 5, 5, 0 )
	local segmentdist = 360 / ( 2 * math.pi * math.max( scale.x, scale.y ) / 2 )
	surface.SetDrawColor( 255, 0, 0, 255 )

	for a = 0, 360 - segmentdist, segmentdist do
		surface.DrawLine( center.x + math.cos( math.rad( a ) ) * scale.x, center.y - math.sin( math.rad( a ) ) * scale.y, center.x + math.cos( math.rad( a + segmentdist ) ) * scale.x, center.y - math.sin( math.rad( a + segmentdist ) ) * scale.y )
	end
end
end )

gameevent.Listen( "entity_killed" )
hook.Add("entity_killed","Killmsg", function()
if (gOption("Misc", "Other", "Kill Message")) then
	messagetable = { 
	"Get raped by Bunnyware",
	"Rage quit already",
	"What are you doing???",
	"Rekt",
	"raped by furries",
	"Get cucked",
	"Wtf are you doing?",
	"You just got 9/11,d",
	"Noob"
	 }
RunConsoleCommand("say", messagetable[math.random( 1, #messagetable )])

end
end)
hook.Add("HUDPaint", "gunlabbox", function()
if(gBool("Visuals", "Filter", "Dark rp")) then
	if(gBool("Visuals", "ESP", "Box") && gOption("Visuals", "ESP", "Box Type") == "2D Box") then	
	for k, v in pairs(ents.FindByClass("gun*")) do
		--print("func works")
		
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y / 5.0 - penemy.y / 5.0;
		local w = h / 2.2;
		surface.SetDrawColor(255, 255, 0, 255);
		surface.DrawOutlinedRect( enemyPos.x - w / 2, enemyPos.y - h, w, h);
		surface.SetDrawColor(255, 0, 0, 225);
		surface.DrawOutlinedRect( enemyPos.x - w / 2 - 1, enemyPos.y - h - 1, w + 2, h + 2);
		surface.DrawOutlinedRect( enemyPos.x - w / 2 + 1, enemyPos.y - h + 1, w - 2, h - 2);
	--	draw.RoundedBox(2,enemyPos.x-5,enemyPos.y-5,10,10,Color(240,20,20,200))
	end
end
end
end )
hook.Add("HUDPaint", "gunlabname", function()
		if(gBool("Visuals", "ESP", "Name") && gBool("Visuals", "Filter", "Dark rp")) then
	    for k, v in pairs(ents.FindByClass("gun")) do
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y - penemy.y;
		local w = h / 2.2;
		local tw, th = surface.GetTextSize(v:GetClass());
	
		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - h + 2 - th );
		
		surface.DrawText(v:GetClass());
end
end
end)
hook.Add("HUDPaint", "moneyprinterbox", function()
if(gBool("Visuals", "Filter", "Dark rp")) then
	if(gBool("Visuals", "ESP", "Box") && gOption("Visuals", "ESP", "Box Type") == "2D Box") then	
	for k, v in pairs(ents.FindByClass("money_printer")) do
		--print("func works")
		
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y / 5.0 - penemy.y / 5.0;
		local w = h / 2.2;
		surface.SetDrawColor(255, 255, 0, 255);
		surface.DrawOutlinedRect( enemyPos.x - w / 2, enemyPos.y - h, w, h);
		surface.SetDrawColor(255, 0, 0, 225);
		surface.DrawOutlinedRect( enemyPos.x - w / 2 - 1, enemyPos.y - h - 1, w + 2, h + 2);
		surface.DrawOutlinedRect( enemyPos.x - w / 2 + 1, enemyPos.y - h + 1, w - 2, h - 2);
	--	draw.RoundedBox(2,enemyPos.x-5,enemyPos.y-5,10,10,Color(240,20,20,200))
	end
end
end
end )

hook.Add("HUDPaint", "moneyprintername", function()
		if(gBool("Visuals", "ESP", "Name") && gBool("Visuals", "Filter", "Dark rp")) then
	    for k, v in pairs(ents.FindByClass("money_printer")) do
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y - penemy.y;
		local w = h / 2.2;
		local tw, th = surface.GetTextSize(v:GetClass());
	
		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - h + 2 - th );
		
		surface.DrawText(v:GetClass());
end
end
end)
hook.Add("HUDPaint", "darkrpspawnedbox", function()
if(gBool("Visuals", "Filter", "Dark rp")) then
	if(gBool("Visuals", "ESP", "Box") && gOption("Visuals", "ESP", "Box Type") == "2D Box") then	
	for k, v in pairs(ents.FindByClass("spawned_*")) do
		--print("func works")
		
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y / 5.0 - penemy.y / 5.0;
		local w = h / 2.2;
		surface.SetDrawColor(255, 255, 0, 255);
		surface.DrawOutlinedRect( enemyPos.x - w / 2, enemyPos.y - h, w, h);
		surface.SetDrawColor(255, 0, 0, 225);
		surface.DrawOutlinedRect( enemyPos.x - w / 2 - 1, enemyPos.y - h - 1, w + 2, h + 2);
		surface.DrawOutlinedRect( enemyPos.x - w / 2 + 1, enemyPos.y - h + 1, w - 2, h - 2);
	--	draw.RoundedBox(2,enemyPos.x-5,enemyPos.y-5,10,10,Color(240,20,20,200))
	end
end
end
end )
hook.Add("HUDPaint", "darkrpspawnedname", function()
		if(gBool("Visuals", "ESP", "Name") && gBool("Visuals", "Filter", "Dark rp")) then
	    for k, v in pairs(ents.FindByClass("spawned_*")) do
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y - penemy.y;
		local w = h / 2.2;
		local tw, th = surface.GetTextSize(v:GetClass());
	
		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - h + 2 - th );
		
		surface.DrawText(v:GetClass());
end
end
end)
hook.Add("HUDPaint", "Weaponbox", function()
if(gBool("Visuals", "Filter", "Weapons")) then
	if(gBool("Visuals", "ESP", "Box") && gOption("Visuals", "ESP", "Box Type") == "2D Box") then	
	for k, v in pairs(ents.FindByClass("weapon_*")) do
		
				local pheight = v:OBBMaxs(v)

		local plow = v:OBBMins(v)
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y / 5.0 - penemy.y / 5.0;

		local w = h + v:GetModelRadius() + 15;
		surface.SetDrawColor(255, 255, 0, 255);
		surface.DrawOutlinedRect( enemyPos.x - w / 2, enemyPos.y - h, w, h);
		surface.SetDrawColor(255, 0, 0, 225);
		surface.DrawOutlinedRect( enemyPos.x - w / 2 - 1, enemyPos.y - h - 1, w + 2, h + 2);
		surface.DrawOutlinedRect( enemyPos.x - w / 2 + 1, enemyPos.y - h + 1, w - 2, h - 2);
	--	draw.RoundedBox(2,enemyPos.x-5,enemyPos.y-5,10,10,Color(240,20,20,200))
	end
end
end
end )
hook.Add("HUDPaint", "weaponname", function()
		if(gBool("Visuals", "ESP", "Name") && gBool("Visuals", "Filter", "Weapons")) then
	    for k, v in pairs(ents.FindByClass("weapon_*")) do
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y - penemy.y;
		local w = h / 2.2;
		local tw, th = surface.GetTextSize(v:GetClass());
	
		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - h + 2 - th );
		
		surface.DrawText(v:GetClass());
end
end
end)


hook.Add("HUDPaint", "weaponname", function()
		if(gBool("Visuals", "ESP", "Name") && gBool("Visuals", "Filter", "Items")) then
	    for k, v in pairs(ents.FindByClass("item_*")) do
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y - penemy.y;
		local w = h / 2.2;
		local tw, th = surface.GetTextSize(v:GetClass());
	
		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - h + 2 - th );
		
		surface.DrawText(v:GetClass());
end
end
end)

hook.Add("HUDPaint", "npcbox", function()
	if(gBool("Visuals", "ESP", "Box") && gOption("Visuals", "ESP", "Box Type") == "2D Box" && gBool("Visuals", "Filter", "NPC")) then	
	for k, v in pairs(ents.FindByClass("npc_*")) do

		--print("func works")
		local center = v:OBBCenter()
	
		local pheight = v:OBBMaxs(v)
		local plow = v:OBBMins(v)
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - plow), vm.ToScreen( enemyPos + pheight );
		local h = enemyPos.y - penemy.y;
		local w = h / 2;
		surface.SetDrawColor(255, 255, 0, 255);
		surface.DrawOutlinedRect( enemyPos.x - w / 2, enemyPos.y - h, w, h);
		surface.SetDrawColor(255, 0, 0, 225);
		surface.DrawOutlinedRect( enemyPos.x - w / 2 - 1, enemyPos.y - h - 1, w + 2, h + 2);
		surface.DrawOutlinedRect( enemyPos.x - w / 2 + 1, enemyPos.y - h + 1, w - 2, h - 2);
	--	draw.RoundedBox(2,enemyPos.x-5,enemyPos.y-5,10,10,Color(240,20,20,200))
	
end
end
end )

hook.Add("HUDPaint", "npchealth", function()
		if(gOption("Visuals", "ESP", "Health") == "Bar" && gBool("Visuals", "Filter", "NPC") or gOption("Visuals", "ESP", "Health") == "Both" && gBool("Visuals", "Filter", "NPC")) then
		for k, v in pairs(ents.FindByClass("npc_*")) do
		--print("func works")
		
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y - penemy.y;
		local w = h / 2.2;
		local hp = v:Health() * h / 100;
		if(hp > h) then hp = h; end
		local diff = h - hp;
		surface.SetDrawColor(0, 0, 0, 255);
		surface.DrawRect(enemyPos.x - w / 2 - 5, enemyPos.y - h - 1, 3, h + 2);
		surface.SetDrawColor( ( 100 - v.Health(v) ) * 2.55, v.Health(v) * 2.55, 0, 255);
		surface.DrawRect(enemyPos.x - w / 2 - 4, enemyPos.y - h + diff, 1, hp);
	end
end
end)

hook.Add("HUDPaint", "npchealthnum", function()
		if(gOption("Visuals", "ESP", "Health") == "Number" && gBool("Visuals", "Filter", "NPC") or gOption("Visuals", "ESP", "Health") == "Both" && gBool("Visuals", "Filter", "NPC")) then
		for k, v in pairs(ents.FindByClass("npc_*")) do
		--print("func works")
		
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y - penemy.y;
		local w = h / 2.2;
		local hp = v:Health() * h / 100;
		if(hp > h) then hp = h; end
		local diff = h - hp;
		surface.SetTextColor( 255, 255, 255, 255 )
		surface.SetTextPos( enemyPos.x - w / 1 - 5, enemyPos.y - h - 1, 3, h + 2 )
		surface.DrawText(v:Health())
		surface.SetDrawColor(0, 0, 0, 255);
		--surface.DrawRect(enemyPos.x - w / 2 - 5, enemyPos.y - h - 1, 3, h + 2);
		--surface.SetDrawColor( ( 100 - v.Health(v) ) * 2.55, v.Health(v) * 2.55, 0, 255);
		--surface.DrawRect(enemyPos.x - w / 2 - 4, enemyPos.y - h + diff, 1, hp);
	end
end
end)

hook.Add("HUDPaint", "npcname", function()
		if(gBool("Visuals", "ESP", "Name") && gBool("Visuals", "Filter", "NPC")) then
	    for k, v in pairs(ents.FindByClass("npc_*")) do
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y - penemy.y;
		local w = h / 2.2;
		local tw, th = surface.GetTextSize(v.GetClass(v));
		
		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - h + 2 - th );
		
		surface.DrawText(v.GetClass(v));
end
end
end)

hook.Add("HUDPaint", "npcweapon", function()
		if(gBool("Visuals", "ESP", "Weapon") && gBool("Visuals", "Filter", "NPC")) then
	    for k, v in pairs(ents.FindByClass("npc_*")) do
		local w = v.GetActiveWeapon(v);
		if(w && v.IsValid(w)) then
	
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y - penemy.y;
		local w = h / 2.2;
		local tw,  th = surface.GetTextSize(v:GetActiveWeapon():GetClass(w));
		
		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - th / 2 + 5 );
		
		surface.DrawText(v:GetActiveWeapon():GetClass(w));
end
end
end
end)

hook.Add("HUDPaint", "npcxqz", function()
	if(gBool("Visuals", "ESP", "XQZ") && gBool("Visuals", "Filter", "NPC")) then
	for k, v in pairs(ents.FindByClass("npc_*")) do
		cam.Start3D();
			cam.IgnoreZ(true);
			v.DrawModel(v);
			cam.IgnoreZ(false);
		cam.End3D();
		end

	
	end
end)

local function Getnpcchamscolor(v, vis)
	

	if(vis) then
		local r = gInt("Colors", "NPC - Chams", "Visible R") / 255;
		local g = gInt("Colors", "NPC - Chams", "Visible G") / 255;
		local b = gInt("Colors", "NPC - Chams", "Visible B") / 255;
		return r,g,b;
	end
	local r = gInt("Colors", "NPC - Chams", "Not Visible R") / 255;
	local g = gInt("Colors", "NPC - Chams", "Not Visible G") / 255;
	local b = gInt("Colors", "NPC - Chams", "Not Visible B") / 255;
	return r,g,b;
end

local function Chamsnpc(v)
	if(gBool("Visuals", "ESP", "Chams") && gBool("Visuals", "Filter", "NPC")) then
	for k, v in pairs(ents.FindByClass("npc_*")) do
	local r = gInt("Colors", "NPC - Chams", "Not Visible R") / 255;
	local g = gInt("Colors", "NPC - Chams", "Not Visible G") / 255;
	local b = gInt("Colors", "NPC - Chams", "Not Visible B") / 255;
	---
		local rv = gInt("Colors", "NPC - Chams", "Visible R") / 255;
		local gv = gInt("Colors", "NPC - Chams", "Visible G") / 255;
		local bv = gInt("Colors", "NPC - Chams", "Visible B") / 255;
	
		cam.Start3D();
			
			render.MaterialOverride(chamsmat);
			-- notvis
			render.SetColorModulation(r,g,b);
				
			v.DrawModel(v);
				-- vis
			render.SetColorModulation(rv,gv,bv);
			render.MaterialOverride(chamsmat2);
				
			v.DrawModel(v);
			
		cam.End3D();
	
	end
	end
end

hook.Add("RenderScreenspaceEffects", "", function()
	if(!gBool("Visuals", "ESP", "Enabled")) then return; end

		Chamsnpc(v);
	--end
end);

hook.Add("PreDrawViewModel", "weapon chams", function(viewmodel, ply, weapon)
if(gBool("Visuals", "ESP", "Weapon Chams")) then
		local r = gInt("Colors", "Weapon Chams", "R");
		local g = gInt("Colors", "Weapon Chams", "G");
		local b = gInt("Colors", "Weapon Chams", "B");
		
    render.MaterialOverride(chamsmat);
    render.SetColorModulation(r,g,b);
	
	end
end)



hook.Add("HUDPaint", "npcskeleton", function()
	if(gBool("Visuals", "ESP", "Skeleton") && gBool("Visuals", "Filter", "NPC")) then
	for k, v in pairs(ents.FindByClass("npc_*")) do
		local origin = v.GetPos(v);
		for i = 1, v.GetBoneCount(v) do
			local parent = v.GetBoneParent(v, i);
			if(!parent) then continue; end
			local bonepos, parentpos = v.GetBonePosition(v, i), v.GetBonePosition(v, parent);
			if(!bonepos || !parentpos || bonepos == origin) then continue; end
			local bs, ps = vm.ToScreen(bonepos), vm.ToScreen(parentpos);
			surface.SetDrawColor(255, 255, 255);
			surface.DrawLine(bs.x, bs.y, ps.x, ps.y);
		end
	end
	end
	end)
	
local mattable = {};

hook.Add("RenderScene", "asuswalls", function()
     local asusvalue = gBool("Visuals", "Other", "ASUS Walls");

	 if tonumber(asusvalue) > 0 then
	if(#mattable == 0) then
		for k,v in next, game.GetWorld():GetMaterials() do
			mattable[#mattable + 1] = Material(v);
		end
	end

	for k,v in next, mattable do
		v:SetFloat("$alpha", tonumber(asusvalue) / 100);
		if tonumber(asusvalue) == 0 then
		v:SetFloat("$alpha", 100);
	end
	end
end
end)

function nightmode()
local nightnum = gBool("Visuals", "Other", "Night Mode");
if tonumber(nightnum) < 100 then
			render.FogMode( 1 )
			render.FogColor( 0, 0, 0 )
			render.FogStart(tonumber(nightnum))
			render.FogEnd(tonumber(nightnum) * 100)
			render.FogMaxDensity( 0.9 )
			return true

end

end
hook.Add("SetupWorldFog", "nightmode", nightmode)
function nightmode2()
local nightnum = gBool("Visuals", "Other", "Night Mode");
if tonumber(nightnum) < 100 then
			render.FogMode( 1 )
			render.FogColor( 0, 0, 0 )
			render.FogStart(tonumber(nightnum))
			render.FogEnd(tonumber(nightnum) * 7)
			render.FogMaxDensity( 0.9 )
			return true

end

end

hook.Add("SetupSkyboxFog", "nightmode", nightmode2)


hook.Add("PostDraw2DSkyBox", "no sky", function()
	if(!gBool("Visuals", "Other", "No Sky")) then return; end
	render.Clear(0, 0, 0, 0, true, true)
end)
hook.Add("Think", "wireframe", function()
  if(gBool("Visuals","Other","Wire Models")) then
     RunConsoleCommand("r_drawothermodels", "2")
  else if(!gBool("Visuals","Other","Wire Models")) then 
    RunConsoleCommand("r_drawothermodels", "1")
	end
  end
end)

hook.Add( "PreDrawHalos", "AddHalos", function()
if(gBool("Visuals","Filter","NPC")) then
     if(gOption("Visuals", "ESP", "Glow ") == "On") then
		local r = gInt("Colors", "Glow", "R");
		local g = gInt("Colors", "Glow", "G");
		local b = gInt("Colors", "Glow", "B");
	    local a = gInt("Colors", "Glow", "A");	
		halo.Add( ents.FindByClass( "npc_*" ) , Color( r, g, b ), a, a, 1, true, true )
		end
		end
end )
hook.Add( "PreDrawHalos", "AddHalos2", function()
if(gBool("Visuals","Filter","Weapons")) then
     if(gOption("Visuals", "ESP", "Glow ") == "On") then
		local r = gInt("Colors", "Glow", "R");
		local g = gInt("Colors", "Glow", "G");
		local b = gInt("Colors", "Glow", "B");
	    local a = gInt("Colors", "Glow", "A");	
		halo.Add( ents.FindByClass( "weapon_*" ) , Color( r, g, b ), a, a, 1, true, true )
		end
		end
end )
hook.Add( "PreDrawHalos", "AddHalos3", function()
    if(gOption("Visuals", "ESP", "Glow ") == "Rainbow") then	
		local r = math.random( 1, 255 );
		local g = math.random( 1, 255 );
		local b = math.random( 1, 255 );
	    local a = gInt("Colors", "Glow", "A");
		halo.Add( ents.FindByClass( "npc_*" ) , Color( r, g, b ), a, a, 1, true, true )
	end
end )
hook.Add( "PreDrawHalos", "AddHalos4", function()
if(gBool("Visuals","Filter","Items")) then
     if(gOption("Visuals", "ESP", "Glow ") == "On") then
		local r = gInt("Colors", "Glow", "R");
		local g = gInt("Colors", "Glow", "G");
		local b = gInt("Colors", "Glow", "B");
	    local a = gInt("Colors", "Glow", "A");	
		halo.Add( ents.FindByClass( "item_*" ) , Color( r, g, b ), a, a, 1, true, true )
		
		end
		end
end )

CreateClientConVar("hitmarker_enabled", 1, true, false);
CreateClientConVar("hitmarker_sound", 1, true, false);
CreateClientConVar("hitmarker_npc", 1, true, false);
local hitsound = "hitmarker.wav";
util.PrecacheSound(hitsound);

local alpha = 0;
local hx = ScrW() / 2;
local hy = ScrH() / 2;

local function draw_hitmarker()
	alpha = Lerp(0.05, alpha, 0);
	surface.SetDrawColor(255, 255, 255, alpha);
	surface.DrawLine(hx - 7, hy - 6, hx - 12, hy - 11);
	surface.DrawLine(hx + 6, hy - 6, hx + 11, hy - 11);
	surface.DrawLine(hx - 7, hy + 6, hx - 12, hy + 11);
	surface.DrawLine(hx + 6, hy + 6, hx + 11, hy + 11);
end
hook.Add("HUDPaint", "hitmarker", draw_hitmarker);
 
hook.Add("ScalePlayerDamage", "hitmarker_scaleplayerdamage", function(ply, hitgroup, dmginfo)
	if(gBool("Misc","HitMarkers","Enable")) then return; end

	if (dmginfo:GetAttacker():IsPlayer() and dmginfo:GetAttacker() == LocalPlayer()) then
		alpha = 255;
		
		if (GetConVarNumber("hitmarker_sound") == 1) then
			LocalPlayer():EmitSound(hitsound, 500);
		end
   end
end);

local nextFireTime = 0;
hook.Add("CreateMove", "hitmarker_npc", function(cmd)
    if(gBool("Misc","HitMarkers","Enable")) then
	if (!LocalPlayer():Alive() or !LocalPlayer():KeyDown(IN_ATTACK) or LocalPlayer():GetActiveWeapon():Clip1() <= 0 or GetConVarNumber("hitmarker_enabled") != 1 or GetConVarNumber("hitmarker_npc") != 1) then return; end
    
	if (LocalPlayer():GetEyeTrace().Entity:IsNPC()) then
		local next_primary_fire = LocalPlayer():GetActiveWeapon():GetNextPrimaryFire() or 0;
		if (nextFireTime < next_primary_fire) then
			nextFireTime = next_primary_fire;
			alpha = 255;
		
			if(gBool("Misc","HitMarkers","Enable")) then
				LocalPlayer():EmitSound(hitsound, 500, 100);
			end
			end
		end
	end
	
end);	

hook.Add("Think", "Health", function()
	local healthvalue = gBool("Misc","Other","Set Health ");
	if(gBool("Misc","Other","God mode")) then
		if tonumber(healthvalue) > 0 then 
		RunConsoleCommand("Healthvar", tonumber(healthvalue))
	   end
	end
end)

hook.Add("Think", "Armor", function()
	if(gBool("Misc","Other","God mode")) then
	local ArmorValue = gBool("Misc","Other","Set Armor ");
	if tonumber(ArmorValue) > 0 then 	
	RunConsoleCommand("Armorvar", tonumber(ArmorValue))	
	   end
	end
end)

hook.Add("Think", "Speedhack", function()
	if(gBool("Misc","SpeedHack","Enable")) then
		local pfactor = gBool("Misc","SpeedHack","Factor ");
	
	if tonumber(pfactor) > 0 then
	RunConsoleCommand("Speedhackvar", tonumber(pfactor) * 1000)	
	else if tonumber(pfactor) < 1 then
		RunConsoleCommand("resetspeedvar")
	end
	   end
	end
end)

hook.Add("Think", "Instduck", function()
	if(gBool("Misc","Misc","Instant Duck")) then
	RunConsoleCommand("instantduckvar", "0.01")	
	else if(!gBool("Misc","Misc","Instant Duck")) then
		RunConsoleCommand("resetduckvar")
	   end
	end
end)
hook.Add("Think", "Instunduck", function()
	if(gBool("Misc","Misc","Instant Unduck")) then
	RunConsoleCommand("instantunduckvar", "0.01")	
	else if(!gBool("Misc","Misc","Instant Unduck")) then
		RunConsoleCommand("resetunduckvar")
	   end
	end
end)

hook.Add("HUDPaint", "speed indicator", function()
if(gBool("Visuals", "Other", "Speed Indicator")) then
local ply = LocalPlayer()
local speed = ply:GetVelocity():Length()
local pspeed = math.Round(speed)

--surface.SetDrawColor( Color(255, 0, 0, 255 ))
	surface.SetTextPos( 50, 600 )
	surface.DrawText( pspeed )
	end


end) 


