local args = {}

function args.parse(cfg)
  cfg = cfg or {}
  local opts = {}
  local positional = {}
  local i = 1
  while i <= #arg do
    local a = arg[i]
    if a:sub(1, 2) == "--" then
      local k = a:sub(3)
      if cfg[k] then
        i = i + 1
        opts[k] = arg[i]
      else
        opts[k] = true
      end
    elseif a:sub(1, 1) == "-" then
      for j = 2, #a do
        opts[a:sub(j, j)] = true
      end
    else
      positional[#positional + 1] = a
    end
    i = i + 1
  end
  return positional, opts
end

return args
