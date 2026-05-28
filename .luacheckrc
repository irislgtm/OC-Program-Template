std = "lua53"
ignore = {"212", "411", "421", "431", "432", "561"}

globals = {
  "_G", "print", "dofile", "load", "loadfile", "require", "module",
  "select", "type", "unpack", "package",
  "math", "string", "table", "os", "io", "coroutine", "debug",
}

read_globals = {
  "component", "computer", "event", "filesystem", "shell", "term",
  "gpu", "internet", "serialization", "sides", "text", "thread",
  "process", "rc", "unicode", "buffer", "colors", "uuid", "note",
  "transforms", "robot", "bit32", "inspect",
  "component.gpu", "component.screen", "component.keyboard",
  "component.redstone", "component.modem", "component.filesystem",
  "component.drive", "component.robot", "component.internet",
  "component.eeprom", "component.data", "component.database",
  "component.inventory_controller", "component.transposer",
  "component.generator", "component.geolyzer", "component.navigation",
  "component.tunnel", "component.crafting", "component.tank_controller",
  "component.chunkloader", "component.debug", "component.drone",
  "component.sides",

  "event.listen", "event.ignore", "event.timer", "event.cancel",
  "event.pull", "event.pullFiltered", "event.pullMultiple",
  "event.push", "event.onError",

  "computer.address", "computer.uptime", "computer.energy",
  "computer.maxEnergy", "computer.freeMemory", "computer.totalMemory",
  "computer.shutdown", "computer.beep", "computer.pushSignal",
  "computer.pullSignal", "computer.getBootAddress", "computer.setBootAddress",
  "computer.runlevel", "computer.users", "computer.addUser",
  "computer.removeUser", "computer.getDeviceInfo", "computer.tmpAddress",

  "filesystem.canonical", "filesystem.segments", "filesystem.concat",
  "filesystem.path", "filesystem.name", "filesystem.proxy",
  "filesystem.mount", "filesystem.mounts", "filesystem.umount",
  "filesystem.isLink", "filesystem.link", "filesystem.get",
  "filesystem.exists", "filesystem.size", "filesystem.isDirectory",
  "filesystem.lastModified", "filesystem.list", "filesystem.makeDirectory",
  "filesystem.remove", "filesystem.rename", "filesystem.copy",
  "filesystem.open", "filesystem.isAutorunEnabled",
  "filesystem.setAutorunEnabled",

  "term.isAvailable", "term.getViewport", "term.gpu", "term.pull",
  "term.getCursor", "term.setCursor", "term.getCursorBlink",
  "term.setCursorBlink", "term.clear", "term.clearLine", "term.read",
  "term.write", "term.bind", "term.screen", "term.keyboard",

  "shell.getAlias", "shell.setAlias", "shell.aliases",
  "shell.getWorkingDirectory", "shell.setWorkingDirectory",
  "shell.getPath", "shell.setPath", "shell.resolve", "shell.execute",
  "shell.parse",

  "sides.top", "sides.bottom", "sides.left", "sides.right",
  "sides.front", "sides.back",

  "robot.forward", "robot.back", "robot.up", "robot.down",
  "robot.turnLeft", "robot.turnRight", "robot.turnAround",
  "robot.detect", "robot.detectUp", "robot.detectDown",
  "robot.select", "robot.count", "robot.space", "robot.inventorySize",
  "robot.transferTo", "robot.compareTo", "robot.compare",
  "robot.compareUp", "robot.compareDown",
  "robot.drop", "robot.dropUp", "robot.dropDown",
  "robot.suck", "robot.suckUp", "robot.suckDown",
  "robot.place", "robot.placeUp", "robot.placeDown",
  "robot.swing", "robot.swingUp", "robot.swingDown",
  "robot.use", "robot.useUp", "robot.useDown",
  "robot.durability", "robot.name",
  "robot.tankCount", "robot.selectTank", "robot.tankLevel",
  "robot.tankSpace", "robot.compareFluidTo", "robot.transferFluidTo",
  "robot.compareFluid", "robot.compareFluidUp", "robot.compareFluidDown",
  "robot.drain", "robot.drainUp", "robot.drainDown",
  "robot.fill", "robot.fillUp", "robot.fillDown",
}

files["src/bin/"] = {
  module = true,
}

files["src/lib/"] = {
  module = true,
}
