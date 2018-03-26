
if SERVER then return; end
/*
chat.AddText( Color( 0, 255, 0, 255 ), "[BunnyWare]", Color( 255, 255, 0, 255 ), "Welcome",Color( math.random(0, 255), math.random(0, 255), math.random(0, 255), 255 ), " ",LocalPlayer():Name()  )
chat.AddText( Color( 0, 255, 0, 255 ), "[BunnyWare]", Color( 255, 255, 0, 255 ), "Change logs can be find at : https://github.com/demonicPbunny/BunnyWare/commits/master")
chat.AddText( Color( 0, 255, 0, 255 ), "[BunnyWare]", Color( 255, 255, 255, 255 ), "Current Build: Mar 22, 2018, 16:32 GMT+1")
chat.AddText( Color( 0, 255, 0, 255 ), "[BunnyWare]", Color( 255, 255, 255, 255 ), "Latest Update: [ESP] Barrel Tweak, Color now works")
*/
chat.AddText( Color( 0, 255, 0, 255 ), "[BunnyWare]", Color( 255, 255, 0, 255 ), "Welcome",Color( math.random(0, 255), math.random(0, 255), math.random(0, 255), 255 ), " ",LocalPlayer():Name()  )

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
			{"Accuracy", 20, 20, 250, 140, 120},
			{"Smooth", "Slider", 0, 25, 100},
			{"Fov", "Slider", 0, 180, 100},
			{"Anti Recoil", "Checkbox", false, 0},
		},
		{
			{"Filter", 20, 180, 250, 140, 120},
			{"Head", "Checkbox", false, 0},
			{"Chest", "Checkbox", false, 0},
			{"Pelvis", "Checkbox", false, 0},
			{"Legs", "Checkbox", false, 0},
			
		},
		{
			{"Target Filter", 20, 330, 250, 140, 120},
			{"NPC", "Checkbox", false, 0},
			{"Players", "Checkbox", false, 0},

		},
		{
			{"Aimbot", 275, 20, 250, 140, 120},
			{"Enabled", "Checkbox", false, 0},
			{"Auto Pistol", "Checkbox", false, 0},
			{"Auto Fire", "Checkbox", false, 0},
			{"Friendly Fire", "Checkbox", false, 0},
	},
	{
		{"TriggerBot", 275, 180, 250, 50, 140},
		{"Enabled", "Checkbox", false, 0},	
    },
    	{
		{"TriggerBot Filter", 275, 245, 250, 75, 140},
		{"NPC", "Checkbox", false, 0},
		{"Players", "Checkbox", false, 0},

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
			{"Classic ESP", "Checkbox", false, 0},
			{"ESP Style", "Selection", "2D Box", {"2D Box", "Edges", "Circle"}, 100},
			{"Name", "Checkbox", false, 0},
			-- {"Health", "Checkbox", false, 0},
			{"Health", "Selection", "Off", {"Off", "Bar", "Number", "Both"}, 100},
			{"Weapon", "Checkbox", false, 0},
			--{"Ammo", "Checkbox", false, 0},
			{"XQZ", "Checkbox", false, 0},
			{"Chams", "Checkbox", false, 0},
			{"Skeleton", "Checkbox", false, 0},
			{"Glow ", "Selection", "Off", {"Off", "On", "Rainbow"}, 100},
		    {"Weapon Chams", "Checkbox", false, 0},
		    {"No Hands", "Checkbox", false, 0},
		    {"Barrel", "Checkbox", false, 0},
		    {"Wire Models", "Checkbox", false, 0},
		},
		{
			{"Filter", 290, 20, 250, 550, 120},
			{"NPC", "Checkbox", false, 0},
			{"Local Player", "Checkbox", false, 0},
			{"Players", "Checkbox", false, 0},
			{"Enemies only", "Checkbox", false, 0},
			{"Distance", "Checkbox", false, 0},
			{"Max Distance", "Slider", 0, 10000, 100},

			{"Weapons", "Checkbox", false, 0},
			{"Items", "Checkbox", false, 0},
			{"Dark RP", "Checkbox", false, 0},
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
			{"ASUS Walls", "Slider2", 100, 100, 100},
			{"Night Mode", "Slider2", 100, 100, 100},
			{"Thirdperson ", "Slider", 0, -1000, 100},
			{"View Fov", "Slider", 0, 150, 100},
   		    {"Viewmodel Fov", "Slider", 0, 150, 100},
			{"Speed Indicator", "Checkbox", false, 0},
			{"Wire Weapon", "Checkbox", false, 0},
			//{"Wire World", "Checkbox", false, 0},
			{"Damage Log", "Selection", "Off", {"Off", "Console", "Chat"}, 100},
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
			--{"Instant Unduck", "Checkbox", false, 54},
			--{"Instant Duck", "Checkbox", false, 54},
			
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
			{"Players", 20, 205, 250, 175, 130},
			{"R", "Slider", 255, 255, 88},
			{"G", "Slider", 0, 255, 88},
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
			{"Player - Chams", 290, 205, 250, 175, 130},
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
       {
			{"Weapons", 20, 405, 250, 175, 130},
			{"R", "Slider", 0, 255, 54},
			{"G", "Slider", 0, 255, 54},
			{"B", "Slider", 255, 255, 54},
			
		},
         {
			{"Items", 290, 405, 250, 175, 130},
			{"R", "Slider", 0, 255, 54},
			{"G", "Slider", 255, 255, 54},
			{"B", "Slider", 255, 255, 54},
			
		},	
		 {
			{"NPC", 550, 405, 230, 175, 130},
			{"R", "Slider", 0, 255, 54},
			{"G", "Slider", 255, 255, 54},
			{"B", "Slider", 0, 255, 54},
			
		},		
	},
	["Gui"] = {
		{
			{"Border", 20, 20, 180, 175, 25},
			{"R", "Slider", 182, 255, 130},
			{"G", "Slider", 0, 255, 130},
			{"B", "Slider", 0, 255, 130},
		},
		{
			{"Button Background", 20, 205, 180, 175, 25},
			{"R", "Slider", 0, 255, 130},
			{"G", "Slider", 0, 255, 130},
			{"B", "Slider", 0, 255, 130},
		},
		{
			{"Buttons", 20, 405, 180, 175, 25},
			{"R", "Slider", 51, 255, 130},
			{"G", "Slider", 51, 255, 130},
			{"B", "Slider", 51, 255, 130},
		},
		{
			{"Button Mouse Over", 205, 20, 180, 175, 25},
			{"R", "Slider", 124, 255, 130},
			{"G", "Slider", 124, 255, 130},
			{"B", "Slider", 124, 255, 130},
		},
		{
			{"Checkboxes", 205, 205, 180, 175, 25},
			{"R", "Slider", 184, 255, 130},
			{"G", "Slider", 0, 255, 130},
			{"B", "Slider", 0, 255, 130},
		},
		{
			{"Slider Line", 205, 405, 180, 175, 25},
			{"R", "Slider", 163, 255, 130},
			{"G", "Slider", 163, 255, 130},
			{"B", "Slider", 163, 255, 130},
		},
		{
			{"Slider Point", 390, 20, 180, 175, 25},
			{"R", "Slider", 184, 255, 130},
			{"G", "Slider", 0, 255, 130},
			{"B", "Slider", 0, 255, 130},
		},
		{
			{"Background", 390, 205, 180, 175, 25},
			{"R", "Slider", 255, 255, 130},
			{"G", "Slider", 255, 255, 130},
			{"B", "Slider", 255, 255, 130},
		},
		{
			{"Option Colors", 390, 405, 180, 175, 25},
			{"R", "Slider", 255, 255, 130},
			{"G", "Slider", 255, 255, 130},
			{"B", "Slider", 255, 255, 130},
		},	
		{
			{"Feature Border", 580, 20, 180, 175, 25},
			{"R", "Slider", 163, 255, 130},
			{"G", "Slider", 163, 255, 130},
			{"B", "Slider", 163, 255, 130},
		},		
		{
			{"Text", 580, 205, 180, 175, 25},
			{"R", "Slider", 0, 255, 130},
			{"G", "Slider", 0, 255, 130},
			{"B", "Slider", 0, 255, 130},
		},	
				{
			{"Text2", 580, 405, 180, 175, 25},
			{"R", "Slider", 0, 255, 130},
			{"G", "Slider", 0, 255, 130},
			{"B", "Slider", 0, 255, 130},
		},	
	},
	["Info"] = {
		{
			{"BunnyWare Info Box", 20, 20, 350, 240, 100},
           
			{"My Steam ->", "Checkbox", false, 0, 54},
			
			--{"ESP Style", "Selection", "2D Box", {"2D Box", "3D Box"}, 100},
		},
		},
};
// template for pos =  left/right, up/down,
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
	local rb = gInt("Gui", "Background", "R");
	local gb = gInt("Gui", "Background", "G");
	local bb = gInt("Gui", "Background", "B");
	surface.SetDrawColor(rb, gb, bb);
	--surface.DrawRect(4, 31, w-7, h-35);
	draw.RoundedBox( 2, 4, 31, w-7, h-35, Color(rb, gb, bb, 255) )
	local r = gInt("Gui", "Border", "R");
	local g = gInt("Gui", "Border", "G");
	local b = gInt("Gui", "Border", "B");
	local curcol = Color(r, g, b, 150);
	local border = Color(r, g, b, 25);
	for i = 0, 30 do
		surface.SetDrawColor(curcol);
		--curcol.r = curcol.r - 1;
		--surface.DrawLine(0, i, w, i);
        draw.RoundedBox( 9, i-25, i-25, w, 35, border )
	end
	
	surface.SetDrawColor(curcol);
	
	surface.SetFont("CenterPrintText");
	
	local tw, th = surface.GetTextSize("BUNNYWARE for Garry's Mod (BETA)");
	
	surface.SetTextPos(5, 15 - th / 2);
	
	surface.SetTextColor(255, 255, 255);
	
	surface.DrawText("BUNNYWARE for Garry's Mod (BETA)");
	draw.RoundedBox(20, 0, 31, 5, h - 31, curcol ) -- surface.DrawRect(0, 31, 5, h - 31);
	draw.RoundedBox(20, 0, h - 5, w, h, curcol ) -- surface.DrawRect(0, h - 5, w, h);
	draw.RoundedBox(20, w - 5, 31, 5, h, curcol ) --surface.DrawRect(w - 5, 31, 5, h);
	
	
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
				local r = gInt("Gui", "Button Background", "R");
	            local g = gInt("Gui", "Button Background", "G");
	            local b = gInt("Gui", "Button Background", "B");
			local curcol = Color(r, g, b);
			for i = 0, 30 do
				surface.SetDrawColor(curcol);
				curcol.r, curcol.g, curcol.b = curcol.r + 3, curcol.g + 3, curcol.b + 3;
				surface.DrawLine( 5 + maxx, 31 + i, 5 + maxx + sizeper, 31 + i);
			end
		elseif(bMouse) then
				local r = gInt("Gui", "Button Mouse Over", "R");
	            local g = gInt("Gui", "Button Mouse Over", "G");
	            local b = gInt("Gui", "Button Mouse Over", "B");
			local curcol = Color(r, g, b);
			for i = 0, 30 do
				surface.SetDrawColor(curcol);
				curcol.r, curcol.g, curcol.b = curcol.r - 1.7, curcol.g - 1.7, curcol.b - 1.7;
				surface.DrawLine( 5 + maxx, 31 + i, 5 + maxx + sizeper, 31 + i);
			end
		else
				local r = gInt("Gui", "Buttons", "R");
	            local g = gInt("Gui", "Buttons", "G");
	            local b = gInt("Gui", "Buttons", "B");
			local curcol = Color(r, g, b);
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
				local r = gInt("Gui", "Option Colors", "R");
	            local g = gInt("Gui", "Option Colors", "G");
	            local b = gInt("Gui", "Option Colors", "B");		
		surface.SetTextColor(r, g, b);
		local tw, th = surface.GetTextSize(v);
		surface.SetTextPos( 5 + maxx + sizeper / 2 - tw / 2, 31 + 15 - th / 2 );
		surface.DrawText(v);
		maxx = maxx + sizeper;
	end
end

local function DrawCheckbox(self, w, h, var, maxy, posx, posy, dist)
	surface.SetFont("memeyou2");
			local rt = gInt("Gui", "Text", "R");
	    local gt = gInt("Gui", "Text", "G");
	    local bt = gInt("Gui", "Text", "B");
	surface.SetTextColor(rt, gt, bt);
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
		local r = gInt("Gui", "Checkboxes", "R");
	    local g = gInt("Gui", "Checkboxes", "G");
	    local b = gInt("Gui", "Checkboxes", "B");		
		surface.SetDrawColor(r, g, b);
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
			local rt = gInt("Gui", "Text", "R");
	    local gt = gInt("Gui", "Text", "G");
	    local bt = gInt("Gui", "Text", "B");
	surface.SetTextColor(rt, gt, bt);
	surface.SetTextPos( 5 + posx + 15 + 5, 61 + posy + maxy );
	surface.DrawText(var[1]);
	
	local tw, th = surface.GetTextSize(var[1]);
		local r = gInt("Gui", "Slider Line", "R");
	    local g = gInt("Gui", "Slider Line", "G");
	    local b = gInt("Gui", "Slider Line", "B");	
	surface.SetDrawColor(r, g, b);
	
	surface.DrawRect( 5 + posx + 15 + 5 + dist, 61 + posy + maxy + 9, size, 2);
	
	local ww = math.ceil(curnum * size / max);
		local rp = gInt("Gui", "Slider Point", "R");
	    local gp = gInt("Gui", "Slider Point", "G");
	    local bp = gInt("Gui", "Slider Point", "B");	
	surface.SetDrawColor(rp, gp, bp);
	
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
			local rt = gInt("Gui", "Text", "R");
	    local gt = gInt("Gui", "Text", "G");
	    local bt = gInt("Gui", "Text", "B");
	surface.SetTextColor(rt, gt, bt);
	surface.SetTextPos( 5 + posx + 15 + 5, 61 + posy + maxy );
	surface.DrawText(var[1]);
	
	local tw, th = surface.GetTextSize(var[1]);
			local r = gInt("Gui", "Slider Line", "R");
	    local g = gInt("Gui", "Slider Line", "G");
	    local b = gInt("Gui", "Slider Line", "B");	
	surface.SetDrawColor(r, g, b);
	
	surface.DrawRect( 5 + posx + 15 + 5 + dist, 61 + posy + maxy + 9, size, 2);
	
	local ww = math.ceil(curnum * size / max);
	
			local rp = gInt("Gui", "Slider Point", "R");
	    local gp = gInt("Gui", "Slider Point", "G");
	    local bp = gInt("Gui", "Slider Point", "B");	
	surface.SetDrawColor(rp, gp, bp);
	
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

		local rt = gInt("Gui", "Text", "R");
	    local gt = gInt("Gui", "Text", "G");
	    local bt = gInt("Gui", "Text", "B");
	surface.SetTextColor(rt, gt, bt);
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
		local r = gInt("Gui", "Feature Border", "R");
	    local g = gInt("Gui", "Feature Border", "G");
	    local b = gInt("Gui", "Feature Border", "B");
	surface.SetDrawColor(r, g, b);
	
	local startpos = 61 + posy;
			local rt = gInt("Gui", "Text", "R");
	    local gt = gInt("Gui", "Text", "G");
	    local bt = gInt("Gui", "Text", "B");
	surface.SetTextColor(rt, gt, bt);
	
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
		local r = gInt("Gui", "Text2", "R");
	    local g = gInt("Gui", "Text2", "G");
	    local b = gInt("Gui", "Text2", "B");
	surface.SetTextColor(r, g, b);
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
			local r = gInt("Gui", "Text2", "R");
	    local g = gInt("Gui", "Text2", "G"); 
	    local b = gInt("Gui", "Text2", "B");
	surface.SetTextColor(r, g, b);
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
			local r = gInt("Gui", "Text2", "R");
	    local g = gInt("Gui", "Text2", "G");
	    local b = gInt("Gui", "Text2", "B");
	surface.SetTextColor(r, g, b);
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
	--	Drawcheatsbutton(self, w, h);
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
	local pre = "Player - Chams";
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
	local r = gInt("Colors", "Players", "R");
	local g = gInt("Colors", "Players", "G");
	local b = gInt("Colors", "Players", "B");
	return(Color(r, g, b, 220));
end
function GetAmmoForCurrentWeapon( pm )
	if ( !IsValid( pm ) ) then return -1 end

	local wep = pm:GetActiveWeapon()
	if ( !IsValid( wep ) ) then return -1 end

	return pm:GetAmmoCount( wep:GetPrimaryAmmoType() )
end
/*
local function ESP(v)
	local pos = em.GetPos(v);
	local pos, pos2 = vm.ToScreen(pos - Vector(0, 0, 5)), vm.ToScreen( pos + Vector(0, 0, 70 ) );
	local h = pos.y - pos2.y;
	local w = h / 2.2;
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "2D Box") then	
		
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
*/
local aimtarget;
local Name = ""
/*
hook.Add("HUDPaint", "test", function()
if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "2D Box") then	
for k,v in pairs ( ents.GetAll() ) do
 
		local Position = ( v:GetPos() + Vector( 0,0,80 ) ):ToScreen()
		local Name = ""
 
		if v == LocalPlayer() then Name = "" else Name = v:Name() end
 
		draw.DrawText( Name, "MenuLarge", Position.x, Position.y, Color( 255, 255, 255, 255 ), 1 )
end
		end
end)
*/
/*
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
		--ESP(v);
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
*/
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
	
	if(cm.CommandNumber(ucmd) == 0 || !gBool("Ragebot", "Aimbot", "Enabled")) then return end;
	gettarget();
	aa = false;
	if(aimtarget && (input.IsKeyDown(KEY_LALT) || gBool("Ragebot", "Aimbot", "Autosnap")) && WeaponCanFire() && WeaponShootable() ) then
		aa = true;
		local pos = GetPos(aimtarget) - em.EyePos(me);
		PredictPos(pos);
		local ang = vm.Angle( PredictSpread(ucmd, vm.Angle(pos)));
		--NormalizeAngle(ang);
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
	--if(gBool("LegitBot", "Aimbot", "Enabled")) then
	if(!fa) then fa = cm.GetViewAngles(ucmd); end
	fa = fa + Angle(cm.GetMouseY(ucmd) * .023, cm.GetMouseX(ucmd) * -.023, 0);
	NormalizeAngle(fa);
	if(cm.CommandNumber(ucmd) == 0 && gBool("Ragebot", "Aimbot", "Silent")) then

		cm.SetViewAngles(ucmd, GetAngle(fa));

		return;
--end

	--if(cm.KeyDown(ucmd, 2) && !em.IsOnGround(me)) then
	--	cm.SetButtons(ucmd, bit.band( cm.GetButtons(ucmd), bit.bnot( 2 ) ) );
	end
end

local function Triggerbotnpc(ucmd)
	if(gBool("LegitBot", "TriggerBot", "Enabled") && gBool("LegitBot", "TriggerBot Filter", "NPC")) then 
local ply = LocalPlayer()
local pweapon = ply:GetActiveWeapon():GetClass()
if (pweapon ~= "weapon_crowbar" && pweapon ~= "gmod_tool" 
&& pweapon ~= "weapon_physgun" && pweapon ~= "gmod_camera"
 && pweapon ~= "weapon_physcannon" && pweapon ~= "weapon_frag" && pweapon ~= "weapon_slam"
 && pweapon ~= "laserpointer" && pweapon ~= "laserpointer"
 && pweapon ~= "laserpointer" ) then
if ply:GetEyeTrace().Entity:IsNPC() then

cm.SetButtons(ucmd, bit.bor( cm.GetButtons(ucmd), 1 ) );
	else
cm.SetButtons(ucmd, bit.band( cm.GetButtons(ucmd), bit.bnot( 1 ) ) );
	end
end
end
end

local function Triggerbot(ucmd)
	if(gBool("LegitBot", "TriggerBot", "Enabled") && gBool("LegitBot", "TriggerBot Filter", "Players")) then 
local ply = LocalPlayer()
local pweapon = ply:GetActiveWeapon():GetClass()
if (pweapon ~= "weapon_crowbar" && pweapon ~= "gmod_tool" 
&& pweapon ~= "weapon_physgun" && pweapon ~= "gmod_camera"
 && pweapon ~= "weapon_physcannon" && pweapon ~= "weapon_frag" && pweapon ~= "weapon_slam"
 && pweapon ~= "laserpointer" && pweapon ~= "laserpointer"
 && pweapon ~= "laserpointer" ) then
local trace = LocalPlayer():GetEyeTrace()
--if trace.HitWorld == false then continue end
if ply:GetEyeTrace().Entity:IsPlayer() && trace.HitWorld == false && gBool("LegitBot", "Filter", "Head") && trace.HitBox == 0 then
cm.SetButtons(ucmd, bit.bor( cm.GetButtons(ucmd), 1 ) );
	else
cm.SetButtons(ucmd, bit.band( cm.GetButtons(ucmd), bit.bnot( 1 ) ) );
	end
if ply:GetEyeTrace().Entity:IsPlayer() && trace.HitWorld == false && gBool("LegitBot", "Filter", "Chest") && trace.HitBox == 16 then
	cm.SetButtons(ucmd, bit.bor( cm.GetButtons(ucmd), 1 ) );

	end
if ply:GetEyeTrace().Entity:IsPlayer() && trace.HitWorld == false && gBool("LegitBot", "Filter", "Pelvis") && trace.HitBox == 15 then
	cm.SetButtons(ucmd, bit.bor( cm.GetButtons(ucmd), 1 ) );

	end			                                                                                                                 //&& trace.HitBox == 10 && trace.HitBox == 8 && trace.HitBox == 7 && trace.HitBox == 11 && trace.HitBox == 12  
	if ply:GetEyeTrace().Entity:IsPlayer() && trace.HitWorld == false && gBool("LegitBot", "Filter", "Legs") then
	if trace.HitBox == 14 or trace.HitBox == 10 or trace.HitBox == 8 or trace.HitBox == 7 or trace.HitBox == 11 or trace.HitBox == 12   then
	cm.SetButtons(ucmd, bit.bor( cm.GetButtons(ucmd), 1 ) );
end
end
end
end
end

local function gethead(ent)
        if ent:LookupBone("ValveBiped.Bip01_Head1") then
        local pos = ent:GetBonePosition(ent:GetHitBoxBone(0, 0))
                return pos
        end
        return ent:LocalToWorld(ent:OBBCenter())
end
 

local function aimer2(ucmd)
	
	if(cm.CommandNumber(ucmd) == 0 || !gBool("LegitBot", "Aimbot", "Enabled")) then return end;
	gettarget();
	aa = false;
	if(aimtarget && WeaponCanFire() && WeaponShootable() && input.IsMouseDown(MOUSE_LEFT) ) then
		aa = true;
		local myang = LocalPlayer():GetAngles()
                local ply = LocalPlayer()
                local target = nil;
                for k, ent in next, player.GetAll() do
                        local ang = (ent:GetPos() - LocalPlayer():GetPos()):Angle()
                        local angdiffy = math.abs(math.NormalizeAngle(myang.y - ang.y ))
                        local angdiffp = math.abs(math.NormalizeAngle(myang.p - ang.p ))
               
                        if (angdiffy < 55 and angdiffp < 55) then
                                target = ent
                        end
                end
                if (target != nil) then
                        local angle = (gethead(target) - LocalPlayer():GetShootPos()):Angle()
                        angle.p = math.NormalizeAngle(angle.p)
                        angle.y = math.NormalizeAngle(angle.y)

                       ucmd:SetViewAngles(Lerp(0.05, ucmd:GetViewAngles(), angle))
fa = ang;

end
-- 		local pos = GetPos(aimtarget) - em.EyePos(me);
-- 		PredictPos(pos);
-- 		local ang = vm.Angle( PredictSpread(ucmd, vm.Angle(pos)));
-- 		--NormalizeAngle(ang);
-- 		--cm.SetViewAngles(ucmd, ang);
-- ucmd:SetViewAngles(Lerp(0.05, ucmd:GetViewAngles(), ang))
-- 			fa = ang;
		
	
end
end



local function memee(ucmd)
	meme(ucmd);
	aimer(ucmd);
	aimer2(ucmd);
	antiaimer(ucmd);
	salty.edgejump(ucmd);
	Triggerbotnpc(ucmd);	
	Triggerbot(ucmd);
	
end
hook.Add("CreateMove", "memmeme", memee)
/*
local function Bugfix(ucmd)
if(ucmd:KeyDown(IN_USE)) then
hook.Remove("CreateMove", "memmeme")
end
if(!ucmd:KeyDown(IN_USE)) then
hook.Add("CreateMove", "memmeme", memee)
end
end
hook.Add("CreateMove","PhysgunE", Bugfix)
*/

local function aimfix(ucmd)
if(!gBool("Ragebot", "Aimbot", "Enabled")) then
--hook.Remove("CreateMove", "memmeme")

end
if(gBool("Ragebot", "Aimbot", "Enabled")) then
--hook.Add("CreateMove", "memmeme", memee)
end
end
hook.Add("CreateMove","any identifier", aimfix)

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
	--if(!gBool("Ragebot", "Aimbot", "Enabled")) then	return end
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
if(gOption("Misc", "Misc", "Auto Jump") == "Perfect" && LocalPlayer():GetMoveType( MOVETYPE_NOCLIP ) == 2) then	
	
		if(!me:IsOnGround() && cmd:KeyDown(IN_JUMP)) then
			cmd:RemoveKey(IN_JUMP);
			
			end
			else if(gOption("Misc", "Misc", "Auto Jump") == "Off") then
			return
		end
		end
	if(gBool("Misc", "Misc", "Auto-Strafe") && LocalPlayer():GetMoveType( MOVETYPE_NOCLIP ) == 2) then
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

// Auto Jump
//r():GetVelocity():Angle().y,LocalPlayer():GetVelocity():Angle().z )) <-Just for safe keeping
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
if (GetConVar( "sv_cheats" ):GetBool() == true) then
if(gOption("Misc", "Misc", "Air Stuck")) then
RunConsoleCommand("net_fakeloss", "99")
else if(!gOption("Misc", "Misc", "Air Stuck")) then
	if (GetConVar( "sv_cheats" ):GetBool() == true) then
	RunConsoleCommand("net_fakeloss", "0")	
else return;
end
end
end
end
end
hook.Add( "Think", "astuvk", airstuck )

local function viewmodelfov()
if (GetConVar( "sv_cheats" ):GetBool() == true) then	
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

local function radarbackground(w, h)
	local rb = gInt("Gui", "Background", "R");
	local gb = gInt("Gui", "Background", "G");
	local bb = gInt("Gui", "Background", "B");
	surface.SetDrawColor(rb, gb, bb);
	--surface.DrawRect(4, 31, w-7, h-35);
	--draw.RoundedBox( 2, 4, 31, w-7, h-35, Color(rb, gb, bb, 255) )
	local r = gInt("Gui", "Border", "R");
	local g = gInt("Gui", "Border", "G");
	local b = gInt("Gui", "Border", "B");
	local curcol = Color(r, g, b, 150);
	local border = Color(r, g, b, 25);
	for i = 0, 30 do
		surface.SetDrawColor(curcol);
		--curcol.r = curcol.r - 1;
		--surface.DrawLine(0, i, w, i);
        draw.RoundedBox( 9, i-25, i-35, w, 35, border )
	end
	
	surface.SetDrawColor(curcol);
	
	surface.SetFont("CenterPrintText");
	
	local tw, th = surface.GetTextSize("Radar");
	
	surface.SetTextPos(5, 15 - th / 2);
	
	surface.SetTextColor(255, 255, 255);
	--draw.RoundedBox(number cornerRadius,number x,number y,number width,number height,table color)
	surface.DrawText("Radar");
	draw.RoundedBox(20, 0, 2, 5, h, curcol ) -- surface.DrawRect(0, 31, 5, h - 31);
	draw.RoundedBox(20, -3, h - 5, w + 7, h, curcol ) -- surface.DrawRect(0, h - 5, w, h);
	draw.RoundedBox(20, w - 5, 2, 5, h, curcol ) --surface.DrawRect(w - 5, 31, 5, h);
	
	
end


local failsafe2, failsafe, radaropen;
local function radar()
	local frame = vgui.Create("DFrame");
	local rdist = gBool("Visuals", "Other", "Radar Size");
	frame:SetSize(rdist, rdist);

	frame:SetPos(50,175);
	frame:SetTitle("Radar");
	frame:SetVisible( true )
     frame:SetDraggable(true)
	--frame:MakePopup();
	frame:ShowCloseButton(false);
	
	frame.PaintOver = function(self, w, h)
    local center = Vector( frame:GetTall() / 2, frame:GetWide() / 2, 0 )
	local scale = Vector( 50, 50, 0 )
	local segmentdist = 360 / ( 2 * math.pi * math.max( scale.x, scale.y ) / 2 )
	radarbackground(w, h);
	function frame:OnMousePressed()
	if self.m_bSizable and gui.MouseX() > ( self.x + self:GetWide() - 20 ) and gui.MouseY() > ( self.y + self:GetTall() - 20 ) then
		self.Sizing = { gui.MouseX() - self:GetWide(), gui.MouseY() - self:GetTall() }
		self:MouseCapture( true )
		return
	end
	if self:GetDraggable() then
		self.Dragging = { gui.MouseX() - self.x, gui.MouseY() - self.y }
		self:MouseCapture( true )
		return
	end
end
	surface.SetDrawColor( 255, 0, 0, 255 )

	    surface.DrawLine(frame:GetWide()/1.94, (frame:GetTall()/2)-250, frame:GetWide()/1.94, (frame:GetTall()/2)+260)
		surface.DrawLine((frame:GetWide()/2)-250, frame:GetTall()/1.94, (frame:GetWide()/2)+260, frame:GetTall()/1.94)
        if (gBool("Visuals", "Filter", "NPC")) then 
		for k, pnpc in pairs(ents.FindByClass("npc_*")) do
			// colors
         local rnpc = gInt("Colors", "NPC", "R");
		local gnpc = gInt("Colors", "NPC", "G");
		local bnpc = gInt("Colors", "NPC", "B");	

			// colors
		local ply = LocalPlayer()
		local theirPos = pnpc:GetPos()
		local myPos = ply:GetPos()
		local ply = LocalPlayer()
		local myAngles = ply:EyeAngles()
		local theirX = (frame:GetWide() / 2) + ((theirPos.x - myPos.x) / 20)
        local theirY = (frame:GetTall() / 2) + ((myPos.y - theirPos.y) / 20)
		local myRotation = myAngles.y - 90
		myRotation = math.rad(myRotation)
		 theirX = theirX - (frame:GetWide() / 2)
         theirY = theirY - (frame:GetTall() / 2)
		 local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
    local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
     newX = newX + (frame:GetWide() / 2)
     newY = newY +  (frame:GetTall() / 2)
	     
      draw.RoundedBox(1,newX, newY,4,4,(Color(rnpc,gnpc,bnpc)))
      end
     end 
     if (gBool("Visuals", "Filter", "Players")) then 
	  for k, v in pairs(player.GetAll()) do
	  	// colors
        local pred = gInt("Colors", "Players", "R");
		local pgreen = gInt("Colors", "Players", "G");
		local bblue = gInt("Colors", "Players", "B");
	  	// colors
		local ply = LocalPlayer()
		local theirPos = v:GetPos()
		local myPos = ply:GetPos()
		local ply = LocalPlayer()
		local myAngles = ply:EyeAngles()
		local theirX = (frame:GetWide() / 2) + ((theirPos.x - myPos.x) / 20)
        local theirY = (frame:GetTall() / 2) + ((myPos.y - theirPos.y) / 20)
		local myRotation = myAngles.y - 90
		myRotation = math.rad(myRotation)
		 theirX = theirX - (frame:GetWide() / 2)
         theirY = theirY - (frame:GetTall() / 2)
		 local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
    local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
     newX = newX + (frame:GetWide() / 2)
     newY = newY +  (frame:GetTall() / 2)
	     
      draw.RoundedBox(1,newX, newY,3,3,(Color(pred,pgreen,bblue)))
end
end

      if (gBool("Visuals", "Filter", "Weapons")) then 
	  for k, pweapon in pairs(ents.FindByClass("weapon_*")) do
	  	if ( pweapon:GetOwner() == NULL ) then
	  	// colors
        local pweaponred = gInt("Colors", "Weapons", "R");
		local pweapongreen = gInt("Colors", "Weapons", "G");
		local pweaponblue = gInt("Colors", "Weapons", "B");
	  	// colors
		local ply = LocalPlayer()
		local theirPos = pweapon:GetPos()
		local myPos = ply:GetPos()
		local ply = LocalPlayer()
		local myAngles = ply:EyeAngles()
		local theirX = (frame:GetWide() / 2) + ((theirPos.x - myPos.x) / 20)
        local theirY = (frame:GetTall() / 2) + ((myPos.y - theirPos.y) / 20)
		local myRotation = myAngles.y - 90
		myRotation = math.rad(myRotation)
		 theirX = theirX - (frame:GetWide() / 2)
         theirY = theirY - (frame:GetTall() / 2)
		 local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
    local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
     newX = newX + (frame:GetWide() / 2)
     newY = newY +  (frame:GetTall() / 2)
	     
      draw.RoundedBox(1,newX, newY,4,4,(Color(pweaponred,pweapongreen,pweaponblue)))
	end
end
	      if (gBool("Visuals", "Filter", "Items")) then 
	  for k, pitem in pairs(ents.FindByClass("item_*")) do
	 
	  	// colors
        local pitemred = gInt("Colors", "Items", "R");
		local pitemgreen = gInt("Colors", "Items", "G");
		local pitemblue = gInt("Colors", "Items", "B");
	  	// colors
		local ply = LocalPlayer()
		local theirPos = pitem:GetPos()
		local myPos = ply:GetPos()
		local ply = LocalPlayer()
		local myAngles = ply:EyeAngles()
		local theirX = (frame:GetWide() / 2) + ((theirPos.x - myPos.x) / 20)
        local theirY = (frame:GetTall() / 2) + ((myPos.y - theirPos.y) / 20)
		local myRotation = myAngles.y - 90
		myRotation = math.rad(myRotation)
		 theirX = theirX - (frame:GetWide() / 2)
         theirY = theirY - (frame:GetTall() / 2)
		 local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
    local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
     newX = newX + (frame:GetWide() / 2)
     newY = newY +  (frame:GetTall() / 2)
	     
      draw.RoundedBox(1,newX, newY,4,4,(Color(pitemred,pitemgreen,pitemblue)))

end
   end
   	      if (gBool("Visuals", "Filter", "Dark RP")) then 
	  for k, pdarkrp in pairs(ents.FindByClass("spawned_*")) do
	 
	  	// colors
        local pitemred = gInt("Colors", "Items", "R");
		local pitemgreen = gInt("Colors", "Items", "G");
		local pitemblue = gInt("Colors", "Items", "B");
	  	// colors
		local ply = LocalPlayer()
		local theirPos = pdarkrp:GetPos()
		local myPos = ply:GetPos()
		local ply = LocalPlayer()
		local myAngles = ply:EyeAngles()
		local theirX = (frame:GetWide() / 2) + ((theirPos.x - myPos.x) / 20)
        local theirY = (frame:GetTall() / 2) + ((myPos.y - theirPos.y) / 20)
		local myRotation = myAngles.y - 90
		myRotation = math.rad(myRotation)
		 theirX = theirX - (frame:GetWide() / 2)
         theirY = theirY - (frame:GetTall() / 2)
		 local newX = theirX * math.cos(myRotation) - theirY * math.sin(myRotation)
    local newY = theirX * math.sin(myRotation) + theirY * math.cos(myRotation)
     newX = newX + (frame:GetWide() / 2)
     newY = newY +  (frame:GetTall() / 2)
	     
      draw.RoundedBox(1,newX, newY,4,4,(Color(pitemred,pitemgreen,pitemblue)))
      end
         end
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
local function Get2DBounds(v)
	local min,max = v:OBBMins(),v:OBBMaxs()

	local corners = {
		Vector(min.x,min.y,min.z),
		Vector(min.x,min.y,max.z),
		Vector(min.x,max.y,min.z),
		Vector(min.x,max.y,max.z),
		Vector(max.x,min.y,min.z),
		Vector(max.x,min.y,max.z),
		Vector(max.x,max.y,min.z),
		Vector(max.x,max.y,max.z)
	}

	local minx,miny,maxx,maxy = math.huge, math.huge, -math.huge, -math.huge;

	for _, corner in next, corners do
		local screen = v:LocalToWorld(corner):ToScreen();
		minx,miny = math.min(minx,screen.x),math.min(miny,screen.y);
		maxx,maxy = math.max(maxx,screen.x),math.max(maxy,screen.y);
	end
	return minx,miny,maxx,maxy;
end

hook.Add("HUDPaint", "gunlabbox", function()
if(gBool("Visuals", "Filter", "Dark RP")) then
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "2D Box") then	
	for k, v in pairs(ents.FindByClass("gunlab*")) do
		--print("func works")
		
	
		    local r = gInt("Colors", "Items", "R");
		   local g = gInt("Colors", "Items", "G");
		  local b = gInt("Colors", "Items", "B");
			local x1,y1,x2,y2 = Get2DBounds(v);
			
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);
            surface.SetDrawColor(r,g,b)
			surface.DrawOutlinedRect(x1-1,y1-1,diff+2,diff2+2)
	end
end
end
end )
hook.Add("HUDPaint", "gunlabname", function()
		if(gBool("Visuals", "ESP", "Name") && gBool("Visuals", "Filter", "Dark RP")) then
	    for k, v in pairs(ents.FindByClass("gunlab")) do
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
if(gBool("Visuals", "Filter", "Dark RP")) then
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "2D Box") then	
	for k, v in pairs(ents.FindByClass("money_printer")) do
		--print("func works")
	
		    local r = gInt("Colors", "Items", "R");
		   local g = gInt("Colors", "Items", "G");
		  local b = gInt("Colors", "Items", "B");
			local x1,y1,x2,y2 = Get2DBounds(v);
			
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);
            surface.SetDrawColor(r,g,b)
			surface.DrawOutlinedRect(x1-1,y1-1,diff+2,diff2+2)

	end
end
end
if(gBool("Visuals", "Filter", "Dark RP")) then
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "Edges") then	
	for k, v in pairs(ents.FindByClass("money_printer")) do
		--print("func works")
	
		    local r = gInt("Colors", "Items", "R");
		   local g = gInt("Colors", "Items", "G");
		  local b = gInt("Colors", "Items", "B");
			local x1,y1,x2,y2 = Get2DBounds(v);
			
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);
            surface.SetDrawColor(r,g,b)
        surface.DrawLine( x1, y1, math.min( x1 + 10, x2 ), y1 )
        surface.DrawLine( x1, y1, x1, math.min( y1 + 10, y2 ) )
        surface.DrawLine( x2, y1, math.max( x2 - 10, x1 ), y1 )
        surface.DrawLine( x2, y1, x2, math.min( y1 + 10, y2 ) )
        surface.DrawLine( x1, y2, math.min( x1 + 10, x2 ), y2 )
        surface.DrawLine( x1, y2, x1, math.max( y2 - 10, y1 ) )
        surface.DrawLine( x2, y2, math.max( x2 - 10, x1 ), y2 )
        surface.DrawLine( x2, y2, x2, math.max( y2 - 10, y1 ) )
            end
            end
            end
end )

hook.Add("HUDPaint", "moneyprintername", function()
		if(gBool("Visuals", "ESP", "Name") && gBool("Visuals", "Filter", "Dark RP")) then
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
if(gBool("Visuals", "Filter", "Dark RP")) then
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "2D Box") then	
	for k, v in pairs(ents.FindByClass("spawned_*")) do

		    local r = gInt("Colors", "Items", "R");
		   local g = gInt("Colors", "Items", "G");
		  local b = gInt("Colors", "Items", "B");
			local x1,y1,x2,y2 = Get2DBounds(v);
			
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);
            surface.SetDrawColor(r,g,b)
			surface.DrawOutlinedRect(x1-1,y1-1,diff+2,diff2+2)
	end
end
end
if(gBool("Visuals", "Filter", "Dark RP")) then
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "Edges") then	
	for k, v in pairs(ents.FindByClass("spawned_*")) do

		    local r = gInt("Colors", "Items", "R");
		   local g = gInt("Colors", "Items", "G");
		  local b = gInt("Colors", "Items", "B");
			local x1,y1,x2,y2 = Get2DBounds(v);
			
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);
            surface.SetDrawColor(r,g,b)
            		surface.DrawLine( x1, y1, math.min( x1 + 10, x2 ), y1 )
        surface.DrawLine( x1, y1, x1, math.min( y1 + 10, y2 ) )
        surface.DrawLine( x2, y1, math.max( x2 - 10, x1 ), y1 )
        surface.DrawLine( x2, y1, x2, math.min( y1 + 10, y2 ) )
        surface.DrawLine( x1, y2, math.min( x1 + 10, x2 ), y2 )
        surface.DrawLine( x1, y2, x1, math.max( y2 - 10, y1 ) )
        surface.DrawLine( x2, y2, math.max( x2 - 10, x1 ), y2 )
        surface.DrawLine( x2, y2, x2, math.max( y2 - 10, y1 ) )
            end
            end
            end
end )
hook.Add("HUDPaint", "darkrpspawnedname", function()
		if(gBool("Visuals", "ESP", "Name") && gBool("Visuals", "Filter", "Dark RP")) then
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
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "2D Box") then	
	for k, v in pairs(ents.FindByClass("weapon_*")) do
		
           if ( v:GetOwner() == NULL ) then
		    local r = gInt("Colors", "Weapons", "R");
		   local g = gInt("Colors", "Weapons", "G");
		  local b = gInt("Colors", "Weapons", "B");
			local x1,y1,x2,y2 = Get2DBounds(v);
			
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);
            surface.SetDrawColor(r,g,b)
			surface.DrawOutlinedRect(x1-1,y1-1,diff+2,diff2+2)
end
	end		
         end
             end
if(gBool("Visuals", "Filter", "Weapons")) then
if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "Edges") then	
		for k, v in pairs(ents.FindByClass("weapon_*")) do
		
           if ( v:GetOwner() == NULL ) then
		    local r = gInt("Colors", "Weapons", "R");
		   local g = gInt("Colors", "Weapons", "G");
		  local b = gInt("Colors", "Weapons", "B");
			local x1,y1,x2,y2 = Get2DBounds(v);
			
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);
            surface.SetDrawColor(r,g,b)
		surface.DrawLine( x1, y1, math.min( x1 + 10, x2 ), y1 )
        surface.DrawLine( x1, y1, x1, math.min( y1 + 10, y2 ) )
        surface.DrawLine( x2, y1, math.max( x2 - 10, x1 ), y1 )
        surface.DrawLine( x2, y1, x2, math.min( y1 + 10, y2 ) )
        surface.DrawLine( x1, y2, math.min( x1 + 10, x2 ), y2 )
        surface.DrawLine( x1, y2, x1, math.max( y2 - 10, y1 ) )
        surface.DrawLine( x2, y2, math.max( x2 - 10, x1 ), y2 )
        surface.DrawLine( x2, y2, x2, math.max( y2 - 10, y1 ) )
		end
		end
end
end
end )
hook.Add("HUDPaint", "weaponname", function()
		if(gBool("Visuals", "ESP", "Name") && gBool("Visuals", "Filter", "Weapons")) then
	    for k, v in pairs(ents.FindByClass("weapon_*")) do
	    	if ( v:GetOwner() == NULL ) then
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y - penemy.y;
		local w = h / 2.2;
		local tw, th = surface.GetTextSize(v:GetClass());
	
		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - h + 25 - th );
		
		surface.DrawText(v:GetClass());
	end
end
end
end)



hook.Add("HUDPaint", "itemname", function()
		if(gBool("Visuals", "ESP", "Name") && gBool("Visuals", "Filter", "Items")) then
	    for k, v in pairs(ents.FindByClass("item_*")) do
		local enemyPos = v:GetPos(v)
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y - penemy.y;
		local w = h / 2.2;
		local tw, th = surface.GetTextSize(v:GetClass());
	
		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - h + 25 - th );
		
		surface.DrawText(v:GetClass());
end
end
end)

hook.Add("HUDPaint", "itembox", function()
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "2D Box" && gBool("Visuals", "Filter", "Items")) then	
	for k, v in pairs(ents.FindByClass("item_*")) do

		    local r = gInt("Colors", "Items", "R");
		   local g = gInt("Colors", "Items", "G");
		  local b = gInt("Colors", "Items", "B");
			local x1,y1,x2,y2 = Get2DBounds(v);
			
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);
            surface.SetDrawColor(r,g,b)
			surface.DrawOutlinedRect(x1-1,y1-1,diff+2,diff2+2)
	
end
end
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "Edges" && gBool("Visuals", "Filter", "Items")) then	
	for k, v in pairs(ents.FindByClass("item_*")) do

		    local r = gInt("Colors", "Items", "R");
		   local g = gInt("Colors", "Items", "G");
		  local b = gInt("Colors", "Items", "B");
			local x1,y1,x2,y2 = Get2DBounds(v);
			
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);
            surface.SetDrawColor(r,g,b)
					surface.DrawLine( x1, y1, math.min( x1 + 10, x2 ), y1 )
        surface.DrawLine( x1, y1, x1, math.min( y1 + 10, y2 ) )
        surface.DrawLine( x2, y1, math.max( x2 - 10, x1 ), y1 )
        surface.DrawLine( x2, y1, x2, math.min( y1 + 10, y2 ) )
        surface.DrawLine( x1, y2, math.min( x1 + 10, x2 ), y2 )
        surface.DrawLine( x1, y2, x1, math.max( y2 - 10, y1 ) )
        surface.DrawLine( x2, y2, math.max( x2 - 10, x1 ), y2 )
        surface.DrawLine( x2, y2, x2, math.max( y2 - 10, y1 ) )
	
end
end
end )

hook.Add("HUDPaint", "npcbox", function()
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "2D Box" && gBool("Visuals", "Filter", "NPC")) then	
	for k, v in pairs(ents.FindByClass("npc_*")) do

		    local r = gInt("Colors", "NPC", "R");
		   local g = gInt("Colors", "NPC", "G");
		  local b = gInt("Colors", "NPC", "B");
			local x1,y1,x2,y2 = Get2DBounds(v);
			
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);
            surface.SetDrawColor(r,g,b)
			surface.DrawOutlinedRect(x1-1,y1-1,diff+2,diff2+2)
	
end
end
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "Edges" && gBool("Visuals", "Filter", "NPC")) then	
	for k, v in pairs(ents.FindByClass("npc_*")) do

		    local r = gInt("Colors", "NPC", "R");
		   local g = gInt("Colors", "NPC", "G");
		  local b = gInt("Colors", "NPC", "B");
			local x1,y1,x2,y2 = Get2DBounds(v);
			
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);
            surface.SetDrawColor(r,g,b)
		surface.DrawLine( x1, y1, math.min( x1 + 10, x2 ), y1 )
        surface.DrawLine( x1, y1, x1, math.min( y1 + 10, y2 ) )
        surface.DrawLine( x2, y1, math.max( x2 - 10, x1 ), y1 )
        surface.DrawLine( x2, y1, x2, math.min( y1 + 10, y2 ) )
        surface.DrawLine( x1, y2, math.min( x1 + 10, x2 ), y2 )
        surface.DrawLine( x1, y2, x1, math.max( y2 - 10, y1 ) )
        surface.DrawLine( x2, y2, math.max( x2 - 10, x1 ), y2 )
        surface.DrawLine( x2, y2, x2, math.max( y2 - 10, y1 ) )
	
end
end
end )

/// ply 
hook.Add("HUDPaint", "playerbox", function()
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "2D Box" && gBool("Visuals", "Filter", "Players")) then	
	for k, v in pairs(player.GetAll()) do
    if v == LocalPlayer() then continue end
   
		local r = gInt("Colors", "Players", "R");
		local g = gInt("Colors", "Players", "G");
		local b = gInt("Colors", "Players", "B");
			local x1,y1,x2,y2 = Get2DBounds(v);
			
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);
            surface.SetDrawColor(r,g,b)
			surface.DrawOutlinedRect(x1-1,y1-1,diff+2,diff2+2)
	end
end
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "Edges" && gBool("Visuals", "Filter", "Players")) then	
	for k, v in pairs(player.GetAll()) do
       if v == LocalPlayer() then continue end
		local r = gInt("Colors", "Players", "R");
		local g = gInt("Colors", "Players", "G");
		local b = gInt("Colors", "Players", "B");
			local x1,y1,x2,y2 = Get2DBounds(v);
			
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);
            surface.SetDrawColor(r,g,b)
		surface.DrawLine( x1, y1, math.min( x1 + 10, x2 ), y1 )
        surface.DrawLine( x1, y1, x1, math.min( y1 + 10, y2 ) )
        surface.DrawLine( x2, y1, math.max( x2 - 10, x1 ), y1 )
        surface.DrawLine( x2, y1, x2, math.min( y1 + 10, y2 ) )
        surface.DrawLine( x1, y2, math.min( x1 + 10, x2 ), y2 )
        surface.DrawLine( x1, y2, x1, math.max( y2 - 10, y1 ) )
        surface.DrawLine( x2, y2, math.max( x2 - 10, x1 ), y2 )
        surface.DrawLine( x2, y2, x2, math.max( y2 - 10, y1 ) )
	
end
end
end )

hook.Add("HUDPaint", "plyhealth", function()
		if(gOption("Visuals", "ESP", "Health") == "Bar" && gBool("Visuals", "Filter", "Players") or gOption("Visuals", "ESP", "Health") == "Both" && gBool("Visuals", "Filter", "Players")) then
			for k, v in pairs(player.GetAll()) do
       if v == LocalPlayer() then continue end
		
					local x1,y1,x2,y2 = Get2DBounds(v);
			local color = Color(255,45,255)
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);

			surface.SetDrawColor(0, 0, 0, 255);
			surface.DrawLine(x1-4, y1+1,x1-4,y2-1)
			surface.SetDrawColor(255 - 2.55 * v:Health(), 2.55 * v:Health(),0)
			surface.DrawRect(x1-5, y2-(diff2/100 * v:Health()),3,diff2/100*(v:Health()))
			surface.SetDrawColor(5,5,5)

	end
end
end)

hook.Add("HUDPaint", "plyhealthnum", function()
		if(gOption("Visuals", "ESP", "Health") == "Number" && gBool("Visuals", "Filter", "Players") or gOption("Visuals", "ESP", "Health") == "Both" && gBool("Visuals", "Filter", "Players")) then
			for k, v in pairs(player.GetAll()) do
       if v == LocalPlayer() then continue end
		
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
		--surface.SetDrawColor(0, 0, 0, 255);
		--surface.DrawRect(enemyPos.x - w / 2 - 5, enemyPos.y - h - 1, 3, h + 2);
		--surface.SetDrawColor( ( 100 - v.Health(v) ) * 2.55, v.Health(v) * 2.55, 0, 255);
		--surface.DrawRect(enemyPos.x - w / 2 - 4, enemyPos.y - h + diff, 1, hp);
	end
end
end)


hook.Add("HUDPaint", "plyname", function()
		if(gBool("Visuals", "ESP", "Name") && gBool("Visuals", "Filter", "Players")) then
			for k, v in pairs(player.GetAll()) do
       if v == LocalPlayer() then continue end
		local enemyPos = v:GetPos()
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y - penemy.y;
		local w = h / 2.2;
		surface.SetTextColor( 255, 255, 255, 255 )
		local tw, th = surface.GetTextSize(v:Name());
		
		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - h - 25 - th );
		
		surface.DrawText(v:Name());

end
end
end)

-- hook.Add("HUDPaint", "plyammo", function()
-- 		if(gBool("Visuals", "ESP", "Ammo") && gBool("Visuals", "Filter", "Players")) then
-- 	    for k, v in pairs(player.GetAll()) do
--        if v == LocalPlayer() then continue end
-- 			local w = v:GetActiveWeapon():Clip1(v);
-- 		--if(w && v.IsValid(w)) then 
-- 		local enemyPos = v:GetPos()
-- 		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
-- 		local h = enemyPos.y - penemy.y;
-- 		local w = h / 2.2;
-- 		surface.SetTextColor( 255, 255, 255, 255 )
-- 		local tw,  th = surface.GetTextSize(v:GetActiveWeapon():Clip1(w));
-- 		surface.SetDrawColor(255,255,255,255)
-- 		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - th / 2 + 35 );
		
-- 		surface.DrawText(v:GetActiveWeapon():Clip1(w));
-- --end
-- end
-- end
-- end)

hook.Add("HUDPaint", "plyweapon", function()
		if(gBool("Visuals", "ESP", "Weapon") && gBool("Visuals", "Filter", "Players")) then
	    for k, v in pairs(player.GetAll()) do
       if v == LocalPlayer() then continue end
	
		local enemyPos = v:GetPos()
		local enemyPos, penemy = vm.ToScreen(enemyPos - Vector(0, 0, 5)), vm.ToScreen( enemyPos + Vector(0, 0, 70 ) );
		local h = enemyPos.y - penemy.y;
		local w = h / 2.2;
		surface.SetTextColor( 255, 255, 255, 255 )
		if (v:GetActiveWeapon():GetClass() == Null) then continue end
		local tw,  th = surface.GetTextSize(v:GetActiveWeapon():GetClass());
		surface.SetDrawColor(255,255,255,255)
		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - th / 2 + 25 );
		
		surface.DrawText(v:GetActiveWeapon():GetClass());

end
end
end)



hook.Add("HUDPaint", "npchealth", function()
		if(gOption("Visuals", "ESP", "Health") == "Bar" && gBool("Visuals", "Filter", "NPC") or gOption("Visuals", "ESP", "Health") == "Both" && gBool("Visuals", "Filter", "NPC")) then
		for k, v in pairs(ents.FindByClass("npc_*")) do
		--print("func works")
		
					local x1,y1,x2,y2 = Get2DBounds(v);
			local color = Color(255,45,255)
			local diff = math.abs(x2 - x1);
			local diff2 = math.abs(y2 - y1);

			surface.SetDrawColor(0, 0, 0, 255);
			surface.DrawLine(x1-4, y1+1,x1-4,y2-1)
			surface.SetDrawColor(255 - 2.55 * v:Health(), 2.55 * v:Health(),0)
			surface.DrawRect(x1-5, y2-(diff2/100 * v:Health()),3,diff2/100*(v:Health()))
			surface.SetDrawColor(5,5,5)

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
		
		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - h - 25 - th );
		
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
		
		surface.SetTextPos( enemyPos.x - tw / 2, enemyPos.y - th / 2 + 25 );
		
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

hook.Add("HUDPaint", "plyxqz", function()
	if(gBool("Visuals", "ESP", "XQZ") && gBool("Visuals", "Filter", "Players")) then
	for k, v in pairs(player.GetAll()) do
		if v == LocalPlayer() then continue end
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

hook.Add("RenderScreenspaceEffects", "npcchams", function()
	if(!gBool("Visuals", "ESP", "Enabled")) then return; end

		Chamsnpc(v);
	--end
end);


local function Getplychams(v, vis)
	

	if(vis) then
		local r = gInt("Colors", "Player - Chams", "Visible R") / 255;
		local g = gInt("Colors", "Player - Chams", "Visible G") / 255;
		local b = gInt("Colors", "Player - Chams", "Visible B") / 255;
		return r,g,b;
	end
	local r = gInt("Colors", "Player - Chams", "Not Visible R") / 255;
	local g = gInt("Colors", "Player - Chams", "Not Visible G") / 255;
	local b = gInt("Colors", "Player - Chams", "Not Visible B") / 255;
	return r,g,b;
end

local function Chamsply(v)
	if(gBool("Visuals", "ESP", "Chams") && gBool("Visuals", "Filter", "Players")) then
	for k, v in pairs(player.GetAll()) do
		if v == LocalPlayer() then continue end
	local r = gInt("Colors", "Player - Chams", "Not Visible R") / 255;
	local g = gInt("Colors", "Player - Chams", "Not Visible G") / 255;
	local b = gInt("Colors", "Player - Chams", "Not Visible B") / 255;
	---
		local rv = gInt("Colors", "Player - Chams", "Visible R") / 255;
		local gv = gInt("Colors", "Player - Chams", "Visible G") / 255;
		local bv = gInt("Colors", "Player - Chams", "Visible B") / 255;
	
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

hook.Add("RenderScreenspaceEffects", "plychams", function()
	if(!gBool("Visuals", "ESP", "Enabled")) then return; end
        
		Chamsply(v);
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

hook.Add("PreDrawPlayerHands", "nohands", function()
	if(gBool("Visuals", "ESP", "No Hands")) then
		return true
	else
		return false
	end
end )

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

hook.Add("HUDPaint", "plyskeleton", function()
	if(gBool("Visuals", "ESP", "Skeleton") && gBool("Visuals", "Filter", "Players")) then
	for k, v in pairs(player.GetAll()) do
		if v == LocalPlayer() then continue end
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

-- hook.Add("RenderScene", "WireWorld", function()
-- 	if(gBool("Visuals", "Other", "Wire World")) then
--      local asusvalue = gBool("Visuals", "Other", "Wire World");
--       local matweapon = Material("models/wireframe")
-- 	if(#mattable == 0) then
-- 		for k,v in next, game.GetWorld():GetMaterials() do
-- 			mattable[#mattable + 1] = Material(v);
-- 		end
-- 	end

-- 	for k,v in next, mattable do
-- 		v:SetTexture( "$basetexture", "editor/wireframe" )
-- 		if(!gBool("Visuals", "Other", "Wire World")) then
-- 		v:SetTexture( "$basetexture", "" )
-- 	end
-- 	end
-- end
-- end)

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
hook.Add( "PreDrawHalos", "AddHalos5", function()
if(gBool("Visuals","Filter","Players")) then
     if(gOption("Visuals", "ESP", "Glow ") == "On") then
		local r = gInt("Colors", "Glow", "R");
		local g = gInt("Colors", "Glow", "G");
		local b = gInt("Colors", "Glow", "B");
	    local a = gInt("Colors", "Glow", "A");
	    local plys = {}
	    for k,v in pairs(player.GetAll()) do
	    	if v == LocalPlayer() then continue end
	    	table.insert( plys, v )
	    	end
	    halo.Add(plys , Color( r, g, b ), a, a, 1, true, true )	
	    
		
		
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

-- hook.Add("Think", "Instduck", function()
-- 	if(gBool("Misc","Misc","Instant Duck")) then
-- 	RunConsoleCommand("instantduckvar", "0.01")	
-- 	else if(!gBool("Misc","Misc","Instant Duck")) then
-- 		RunConsoleCommand("resetduckvar")
-- 	   end
-- 	end
-- end)
-- hook.Add("Think", "Instunduck", function()
-- 	if(gBool("Misc","Misc","Instant Unduck")) then
-- 	RunConsoleCommand("instantunduckvar", "0.01")	
-- 	else if(!gBool("Misc","Misc","Instant Unduck")) then
-- 		RunConsoleCommand("resetunduckvar")
-- 	   end
-- 	end
-- end)

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
local Laser = Material( "trails/laser" )
hook.Add("PostDrawOpaqueRenderables", "npcbarrel", function()
if(gBool("Visuals", "ESP", "Barrel") && gBool("Visuals", "Filter", "NPC")) then

for k,v in pairs(ents.FindByClass("npc_*")) do
 	
	local startpos = v:EyePos()
	local endpos = v:EyePos() + v:EyeAngles():Forward() * 10000
   		local r = gInt("Colors", "NPC", "R");
		local g = gInt("Colors", "NPC", "G");
		local b = gInt("Colors", "NPC", "B");

	render.SetMaterial( Laser )

	render.DrawBeam(Vector( startpos.x,startpos.y ,startpos.z - 6 ), endpos, 5, 1, 1, Color( r, g, b, 255 ) ) 

       end
    end
end)

hook.Add("PostDrawOpaqueRenderables", "pbarrel", function()
	if(gBool("Visuals", "ESP", "Barrel") && gBool("Visuals", "Filter", "Players")) then
for k,v in pairs(player.GetAll()) do
  if v == LocalPlayer() then continue end
	local startpos = v:EyePos()
	local endpos = v:EyePos() + v:EyeAngles():Forward() * 10000
   		local r = gInt("Colors", "Players", "R");
		local g = gInt("Colors", "Players", "G");
		local b = gInt("Colors", "Players", "B");

	render.SetMaterial( Laser )
   

	render.DrawBeam(Vector( startpos.x,startpos.y ,startpos.z - 6 ), endpos, 5, 1, 1, Color( r, g, b, 255 ) ) 
            
       end
    end
end)

hook.Add("HUDPaint", "wiremodelsnpc", function()
if(gBool("Visuals", "ESP", "Wire Models") && gBool("Visuals", "Filter", "NPC")) then
for k,v in pairs(ents.FindByClass("npc_*")) do
		local r = gInt("Colors", "NPC", "R");
		local g = gInt("Colors", "NPC", "G");
		local b = gInt("Colors", "NPC", "B");	

v:DrawModel() 
v:SetMaterial("models/wireframe")
v:SetColor(Color(r,g,b, 255))
end
else if(!gBool("Visuals", "ESP", "Wire Models") or !gBool("Visuals", "Filter", "NPC")) then

	for k,v in pairs(ents.FindByClass("npc_*")) do
v:SetMaterial("")
v:SetColor(Color(255,255,255, 255))
end
end
end
end)

hook.Add("HUDPaint", "wiremodelsply", function()
if(gBool("Visuals", "ESP", "Wire Models") && gBool("Visuals", "Filter", "Players")) then
for k,v in pairs(player.GetAll()) do
		local r = gInt("Colors", "NPC", "R");
		local g = gInt("Colors", "NPC", "G");
		local b = gInt("Colors", "NPC", "B");
if (!LocalPlayer()) then
v:SetColor(Color(r,g,b, 255))
v:DrawModel() 
v:SetMaterial("models/wireframe")
end
end
else if(!gBool("Visuals", "ESP", "Wire Models") or !gBool("Visuals", "Filter", "Players")) then

	for k,v in pairs(player.GetAll()) do
		if (!LocalPlayer()) then
v:SetMaterial("")
v:SetColor(Color(255,255,255, 255))
end
end
end
end
end)

hook.Add("HUDPaint", "wiremodelsweapons", function()
if(gBool("Visuals", "ESP", "Wire Models") && gBool("Visuals", "Filter", "Weapons")) then
for k,v in pairs(ents.FindByClass("weapon_*")) do
if ( v:GetOwner() == NULL ) then	
		local r = gInt("Colors", "Weapons", "R");
		local g = gInt("Colors", "Weapons", "G");
		local b = gInt("Colors", "Weapons", "B");	

v:DrawModel() 
v:SetMaterial("models/wireframe")
v:SetColor(Color(r,g,b, 255))
end
end
else if(!gBool("Visuals", "ESP", "Wire Models") or !gBool("Visuals", "Filter", "Weapons")) then

	for k,v in pairs(ents.FindByClass("weapon_*")) do
		if ( v:GetOwner() == NULL ) then
v:SetMaterial("")
v:SetColor(Color(255,255,255, 255))
end
end
end
end
end)

hook.Add("HUDPaint", "wiremodelsitems", function()
if(gBool("Visuals", "ESP", "Wire Models") && gBool("Visuals", "Filter", "Items")) then
for k,v in pairs(ents.FindByClass("item_*")) do
	
		local r = gInt("Colors", "Items", "R");
		local g = gInt("Colors", "Items", "G");
		local b = gInt("Colors", "Items", "B");	

v:DrawModel() 
v:SetMaterial("models/wireframe")
v:SetColor(Color(r,g,b, 255))

end
else if(!gBool("Visuals", "ESP", "Wire Models") or !gBool("Visuals", "Filter", "Items")) then

	for k,v in pairs(ents.FindByClass("item_*")) do
		
v:SetMaterial("")
v:SetColor(Color(255,255,255, 255))

end
end
end
end)

hook.Add("HUDPaint", "wiremodelsdarkrp", function()
if(gBool("Visuals", "ESP", "Wire Models") && gBool("Visuals", "Filter", "Dark RP")) then
for k,v in pairs(ents.FindByClass("spawned_*")) do
if ( v:GetOwner() == NULL ) then	
		local r = gInt("Colors", "Items", "R");
		local g = gInt("Colors", "Items", "G");
		local b = gInt("Colors", "Items", "B");	

v:DrawModel() 
v:SetMaterial("models/wireframe")
v:SetColor(Color(r,g,b, 255))
end
end
else if(!gBool("Visuals", "ESP", "Wire Models") or !gBool("Visuals", "Filter", "Dark RP")) then

	for k,v in pairs(ents.FindByClass("spawned_*")) do
		
v:SetMaterial("")
v:SetColor(Color(255,255,255, 255))

end
end
end
end)


hook.Add("PreDrawViewModel", "Wirehandsweap", function()
if(gBool("Visuals", "Other", "Wire Weapon")) then
        local ply = LocalPlayer()

		local r = gInt("Colors", "Weapons", "R");
		local g = gInt("Colors", "Weapons", "G");
		local b = gInt("Colors", "Weapons", "B");	


local matweapon = Material("models/wireframe")
render.MaterialOverride(matweapon)
render.SetColorModulation(r,g,b)

else if(!gBool("Visuals", "Other", "Wire Weapon")) then

	local restoreweap = Material("")
render.MaterialOverride(restoreweap)


end
end
end)

hook.Add("HUDPaint", "wiremodelslcoal", function()
if(gBool("Visuals", "ESP", "Wire Models") && gBool("Visuals", "Filter", "Local Player")) then
for k,v in pairs(player.GetAll()) do
		local r = gInt("Colors", "NPC", "R");
		local g = gInt("Colors", "NPC", "G");
		local b = gInt("Colors", "NPC", "B");
if (LocalPlayer()) then
v:SetColor(Color(r,g,b, 255))
v:DrawModel() 
v:SetMaterial("models/wireframe")
end
end
else if(!gBool("Visuals", "ESP", "Wire Models") or !gBool("Visuals", "Filter", "Local Player")) then

	for k,v in pairs(player.GetAll()) do
		if (LocalPlayer()) then
v:SetMaterial("")
v:SetColor(Color(255,255,255, 255))
end
end
end
end
end)

hook.Add("ScalePlayerDamage", "dmglogconsole", function(ply, hitgroup, dmginfo)
if (gOption("Visuals", "Other", "Damage Log") == "Console") then
MsgC( Color( 0,255,0 ), ""..dmginfo:GetInflictor():Name().." Did "..dmginfo:GetDamage().." Damage To "..ply:Name().. " Health Remaining:"..ply:Health()-dmginfo:GetDamage().. "\n")
end
end);


local function dmglogchat(ply, hitgroup, dmginfo)
if (gOption("Visuals", "Other", "Damage Log") == "Chat") then
local pname = dmginfo:GetInflictor():Name()
local pdamage = tostring(dmginfo:GetDamage())
local phealth = tostring(ply:Health()-dmginfo:GetDamage())
chat.AddText( Color( 0, 255, 0 ), pname, ", Did ", pdamage , " Damage To ", ply:Name(),", HP: ", phealth )
chat.PlaySound()
end	
end
hook.Add("ScalePlayerDamage", "dmglogchat", dmglogchat)

local function circlespnpc()
	if(gBool("Visuals", "Filter", "NPC")) then
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "Circle") then
for k, v in pairs(ents.FindByClass("npc_*")) do
		local r = gInt("Colors", "NPC", "R");
		local g = gInt("Colors", "NPC", "G");
		local b = gInt("Colors", "NPC", "B");
local vec = v:WorldSpaceCenter():ToScreen()
local scale = v:GetModelRadius()
surface.DrawCircle(math.floor(vec.x),math.floor(vec.y),scale,r,g,b,255)
end    
   end
      end
         end
hook.Add("HUDPaint", "circleespnpc",circlespnpc)

local function circleespitem()
    if(gBool("Visuals", "Filter", "Items")) then
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "Circle") then
for k, v in pairs(ents.FindByClass("item_*")) do
		local r = gInt("Colors", "Items", "R");
		local g = gInt("Colors", "Items", "G");
		local b = gInt("Colors", "Items", "B");
local vec = v:WorldSpaceCenter():ToScreen()
local scale = v:GetModelRadius()
surface.DrawCircle(math.floor(vec.x),math.floor(vec.y),scale,r,g,b,255)
end    
   end
      end
         end
hook.Add("HUDPaint", "circleespitem",circleespitem)

local function circleespwep()
    if(gBool("Visuals", "Filter", "Weapons")) then
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "Circle") then
for k, v in pairs(ents.FindByClass("weapon_*")) do
		local r = gInt("Colors", "Weapons", "R");
		local g = gInt("Colors", "Weapons", "G");
		local b = gInt("Colors", "Weapons", "B");
if ( v:GetOwner() == NULL ) then
local vec = v:WorldSpaceCenter():ToScreen()
local scale = v:GetModelRadius()
surface.DrawCircle(math.floor(vec.x),math.floor(vec.y),scale,r,g,b,255)
end    
   end
      end
         end
            end
hook.Add("HUDPaint", "circleespwep",circleespwep)

local function circleespply()
    if(gBool("Visuals", "Filter", "Players")) then
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "Circle") then
for k, v in pairs(player.GetAll()) do
	if v == LocalPlayer() then continue end
		local r = gInt("Colors", "Players", "R");
		local g = gInt("Colors", "Players", "G");
		local b = gInt("Colors", "Players", "B");
local vec = v:WorldSpaceCenter():ToScreen()
local scale = v:GetModelRadius()
surface.DrawCircle(math.floor(vec.x),math.floor(vec.y),scale,r,g,b,255)
end    
   end
      end
         end
hook.Add("HUDPaint", "circleespply",circleespply)

local function circleespdarkrp()
    if(gBool("Visuals", "Filter", "Dark RP")) then
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "Circle") then
for k, v in pairs(ents.FindByClass("spawned_*")) do
		local r = gInt("Colors", "Players", "R");
		local g = gInt("Colors", "Players", "G");
		local b = gInt("Colors", "Players", "B");
if ( v:GetOwner() == NULL ) then
local vec = v:WorldSpaceCenter():ToScreen()
local scale = v:GetModelRadius()
surface.DrawCircle(math.floor(vec.x),math.floor(vec.y),scale,r,g,b,255)
end    
   end
      end
         end
            end
hook.Add("HUDPaint", "circleespdarkrp",circleespdarkrp)

local function circleespdarkrp2()
    if(gBool("Visuals", "Filter", "Dark RP")) then
	if(gBool("Visuals", "ESP", "Classic ESP") && gOption("Visuals", "ESP", "ESP Style") == "Circle") then
for k, v in pairs(ents.FindByClass("money_printer")) do
		local r = gInt("Colors", "Items", "R");
		local g = gInt("Colors", "Items", "G");
		local b = gInt("Colors", "Items", "B");
local vec = v:WorldSpaceCenter():ToScreen()
local scale = v:GetModelRadius()
surface.DrawCircle(math.floor(vec.x),math.floor(vec.y),scale,r,g,b,255)
end    
   end
      end
         end
hook.Add("HUDPaint", "circleespdarkrp2",circleespdarkrp2)




-- local function Legitaimbot(ucmd)
--         local myang = LocalPlayer():GetAngles()
--         local fovvalue = gBool("LegitBot", "Accuracy", "Smooth");
--         if(gBool("LegitBot", "Aimbot", "Enabled")) then
--         if input.IsMouseDown(MOUSE_LEFT) then
--                 local ply = LocalPlayer()
--                 local target = nil;
--                 for k, ent in next, player.GetAll() do
--                         if (!IsValid(ent) || ent:GetFriendStatus() == "friend" || ent:InVehicle() || ent == LocalPlayer() || !ent:Alive() || ent:IsNPC() || ent:Team() == TEAM_SPECTATOR) then
--                                 continue
--                         end
 
--                         local ang = (ent:GetPos() - LocalPlayer():GetPos()):Angle()
--                         local angdiffy = math.abs(math.NormalizeAngle(myang.y - ang.y ))
--                         local angdiffp = math.abs(math.NormalizeAngle(myang.p - ang.p ))
               
--                         if (angdiffy < 55 and angdiffp < 55) then
--                                 target = ent
--                         end
--                 end
--                 if (target != nil) then
--                         local angle = (gethead(target) - LocalPlayer():GetShootPos()):Angle()
--                       --  Normalizeangle(ucmd)
--                         angle.p = math.NormalizeAngle(angle.p)
--                         angle.y = math.NormalizeAngle(angle.y)
                        
--                         ucmd:SetViewAngles(Lerp(0.05, ucmd:GetViewAngles(), angle))
--                 end
--         end
-- end  
-- end

-- hook.Add("CreateMove", "bot6", Legitaimbot)


-- local function legitfix()
-- if(!gBool("LegitBot", "Aimbot", "Enabled")) then
-- hook.Remove("CreateMove", "bot5")
-- end
-- if(gBool("LegitBot", "Aimbot", "Enabled")) then
-- hook.Add("CreateMove", "bot5", Legitaimbot)
-- end
-- end
-- hook.Add("CreateMove","fixaimb", legitfix)


//
local f2, f, htmlopen;
local function htmlpage()
	local frame = vgui.Create("DFrame");
	
	frame:SetSize( ScrW() * 0.75, ScrH() * 0.75 );

	frame:SetPos(50,175);
	frame:SetTitle("My Steam");
	frame:SetVisible( true )
     frame:SetDraggable(true)
	--frame:MakePopup();
	frame:ShowCloseButton(false);
local html = vgui.Create( "HTML", frame )
html:Dock( FILL )
html:OpenURL( "http://steamcommunity.com/id/droddie2/" )

	frame.Think = function()
		if (!gBool("Info", "BunnyWare Info Box", "My Steam ->")) then 

			frame:Remove();
			htmlopen = false;
			--candoslider = false;
			--drawlast = nil;
end
end
end

local function htmlpagebrain()
	if (gBool("Info", "BunnyWare Info Box", "My Steam ->") && !htmlopen && !f) then 
	
		htmlopen = true;
		f = true;
		htmlpage();
	elseif (!gBool("Info", "BunnyWare Info Box", "My Steam ->") && !htmlopen) then
		f = false;
	end
	if (gBool("Info", "BunnyWare Info Box", "My Steam ->") && f && htmlopen) then
		f2 = true;
	else
		f3 = false;
	end
	end
hook.Add("Think", "htmlpb", htmlpagebrain);
//