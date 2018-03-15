--CreateClientConVar("hitmarker_enabled", 1, true, false);
-- For BUNNYWARE Server sided Features

concommand.Add("Healthvar", function(ply, cmd, args)
	if args[1] then	
		ply:SetHealth(tonumber(args[1]))
	end
end)

concommand.Add("Armorvar", function(ply, cmd, args)
	if args[1] then	
		ply:SetArmor(tonumber(args[1]))
	end
end)

concommand.Add("Speedhackvar", function(ply, cmd, args)
	if args[1] then	
		ply:SetWalkSpeed(tonumber(args[1]))
		ply:SetRunSpeed(tonumber(args[1]))
		ply:SetMaxSpeed(tonumber(args[1]))
		ply:SetCrouchedWalkSpeed(tonumber(args[1]))
	end
end)

concommand.Add( "resetspeedvar", function( ply, cmd, args )

        ply:SetWalkSpeed("200")
		ply:SetRunSpeed("400")
		ply:SetMaxSpeed("200")
		ply:SetCrouchedWalkSpeed("0.30000001192093")

end)

concommand.Add( "resetduckvar", function( ply, cmd, args )
        ply:SetDuckSpeed("0.10000000149012")
end)
concommand.Add( "resetunduckvar", function( ply, cmd, args )
        ply:SetUnDuckSpeed("0.10000000149012")
end)



concommand.Add("instantduckvar", function(ply, cmd, args)
	if args[1] then	
		ply:SetDuckSpeed(tonumber(args[1]))
	end
end)

concommand.Add("instantunduckvar", function(ply, cmd, args)
	if args[1] then	
		ply:SetUnDuckSpeed(tonumber(args[1]))
	end
end)
