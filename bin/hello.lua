--!/usr/bin/env luaf

local component = require("component")
local shell = require("shell")
local event = require("event")

local _, opts = shell.parse(...)

local function main()
  if not component.isAvailable("gpu") then
    io.stderr:write("no gpu available\n")
    return 1
  end

  local gpu = component.gpu
  local w, h = gpu.getResolution()
  local cx = math.floor(w / 2) - 10
  local cy = math.floor(h / 2)

  gpu.setForeground(0xFFAA00)
  gpu.set(cx, cy, "hello from opencomputers")

  if opts.q then return 0 end

  event.pull("interrupted")
  return 0
end

local ok, err = pcall(main)
if not ok and err ~= "interrupted" then
  io.stderr:write(tostring(err) .. "\n")
  return 1
end
return 0
