local status_ok, _ = pcall(require, "nnn")
if not status_ok then
    return
end

require('nnn').setup ({})
