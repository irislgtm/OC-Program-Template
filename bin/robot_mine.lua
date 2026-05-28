--!/usr/bin/env luaf

local robot = require("robot")
local computer = require("computer")
local shell = require("shell")

shell.parse(...)

local function refuel()
  robot.select(1)
  if robot.count() > 0 then
    robot.refuel(robot.count())
  end
end

local function mine()
  while true do
    if computer.energy() < 100 then
      refuel()
      if computer.energy() < 100 then
        io.stderr:write("out of energy\n")
        return false
      end
    end

    local moved, reason = robot.forward()
    if not moved then
      if reason == "impossible move" then
        return false
      end
      local ok = robot.swing()
      if not ok then return false end
      robot.forward()
    end
  end
end

local ok, err = pcall(mine)
if not ok then
  io.stderr:write(tostring(err) .. "\n")
  return 1
end
return 0
