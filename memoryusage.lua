-- DEBUG monitor Memory Usage
TextMemUsage = display.newText("myData", 10, 10, native.systemFont, 24)
	local printMemUsage = function()  
	    local memUsed = (collectgarbage("count"))
	    local texUsed = system.getInfo( "textureMemoryUsed" ) / 1048576 
	    text1 = "System Memory: ".. string.format("%.00f", memUsed).. "KB"
	    text2 = "Texture Memory:".. string.format("%.03f", texUsed).. "MB"
	   	TextMemUsage.text = text1 .." | " .. text2
	end	
