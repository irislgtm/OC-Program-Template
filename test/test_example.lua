local function test_parse_args()
  local args = require("src.lib.args")
  local positional, opts = args.parse({depth = "number"})
  assert(type(positional) == "table")
  assert(type(opts) == "table")
  print("OK: args.parse works")
end

test_parse_args()
print("all tests passed")
