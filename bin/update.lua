--!/usr/bin/env luaf
-- auto-updater: fetches manifest from Pages and downloads outdated files

local BASE_URL = "https://irislgtm.github.io/OC-Program-Template"
local MANIFEST_URL = BASE_URL .. "/manifest.lua"

local component = require("component")
if not component.isAvailable("internet") then
  io.stderr:write("update: internet card required\n")
  return 1
end

local internet = require("internet")
local filesystem = require("filesystem")
local shell = require("shell")

local updated = 0

local function fetch(url)
  local result, err = internet.request(url)
  if not result then return nil, err end
  local chunks = {}
  for chunk in result do
    chunks[#chunks + 1] = chunk
  end
  return table.concat(chunks)
end

local function main()
  io.stderr:write("checking for updates...\n")

  local raw, err = fetch(MANIFEST_URL)
  if not raw then
    io.stderr:write("fetch failed: " .. tostring(err) .. "\n")
    return
  end

  local ok, manifest = pcall(load("return " .. raw))
  if not ok then
    io.stderr:write("bad manifest\n")
    return
  end
  manifest = manifest()

  for _, entry in ipairs(manifest) do
    local path = entry.path
    local url = BASE_URL .. path

    if filesystem.exists(path) and filesystem.size(path) == entry.size then
      goto continue
    end

    local dir = filesystem.path(path)
    if not filesystem.exists(dir) then
      filesystem.makeDirectory(dir)
    end

    local dest = shell.resolve(path)
    os.execute("wget -f " .. url .. " " .. dest)

    io.stderr:write("updated: " .. path .. "\n")
    updated = updated + 1

    ::continue::
  end

  if updated == 0 then
    io.stderr:write("up to date\n")
  else
    io.stderr:write("updated " .. tostring(updated) .. " file(s)\n")
  end
end

local ok, err = pcall(main)
if not ok then
  io.stderr:write("update failed: " .. tostring(err) .. "\n")
  return 1
end
return 0
