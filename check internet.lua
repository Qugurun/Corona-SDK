local socket = require "socket"

function NetworkConnection()
   local internet = socket.tcp()
   internet:settimeout( 2 )
    if not(internet:connect("www.google.com", 80) == nil) then
		return true
	else
		return false
	end  
end
