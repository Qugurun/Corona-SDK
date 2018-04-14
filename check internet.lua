local socket = require("socket")    
local internet = socket.tcp()
internet:settimeout(5000)                 
          
local function testNetworkConnection()
	local internetResult = internet:connect("www.google.com", 80)       
	
	if not(internetResult == nil) then
		return true
	else
		return false
	end   
	
	internet:close()
	internet = nil
end

if testNetworkConnection() == false then
	print("Internet false")
else
	print("Internet true")	
end
