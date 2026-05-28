local event = require("event")
local running = false

function start()
  running = true
  while running do
    event.pull(1)
  end
end

function stop()
  running = false
end
