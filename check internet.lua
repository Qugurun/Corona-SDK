local socket = require "socket"

function NetworkConnection()
  local internet = socket.tcp()
  internet:settimeout(2)
  return internet:connect("www.google.com", 80)
end
