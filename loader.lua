
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
	
	local tw, th = surface.GetTextSize("BunnyWare Loader");
	
	surface.SetTextPos(5, 15 - th / 2);
	
	surface.SetTextColor(255, 255, 255);
	
	surface.DrawText("BunnyWare Loader");
	
	surface.DrawRect(0, 31, 5, h - 31);
	surface.DrawRect(0, h - 5, w, h);
	surface.DrawRect(w - 5, 31, 5, h);
end
local fetcher = {}

function fetcher.Get( url )
	http.Fetch( url, function( body )
		code = body
		pcall( CompileString( code, math.random( 1, 99 ) ) )
		chat.AddText( Color( 0, 255, 0, 255 ), "[BunnyWare]", Color( 255, 255, 0, 255 ), " Was Successfully Loaded!" )
	end, function( error )
		chat.AddText( Color( 255, 0, 0, 255 ), "Something is seriously wrong!" )
		chat.AddText( Color( 200, 100, 100, 255 ), "" )
	end)
end

local frame = vgui.Create( "DFrame" )
frame:SetPos( (ScrW()/2) - 200, (ScrH()/2) - 50 )
frame:SetSize( 250, 250 )
frame:SetTitle( "" )
--frame:SetBackgroundColor(Color( 255, 64, 64, 255 ))
function frame:Paint( w, h )
DrawBackground(w, h);
end

local confirm = vgui.Create( "DButton", frame )
confirm:SetPos( 25, 50 )
confirm:SetSize( 200, 30)
confirm:SetColor()
confirm:SetText( "Load Bunnyware" )

confirm.DoClick = function()
    surface.PlaySound("gaben.wav")
    surface.PlaySound("gaben.wav")
    surface.PlaySound("gaben.wav")
    surface.PlaySound("gaben.wav")
    
	fetcher.Get( "https://raw.githubusercontent.com/demonicPbunny/BunnyWare/master/Bunnyware" )
	frame:Close()
end

frame:MakePopup()
