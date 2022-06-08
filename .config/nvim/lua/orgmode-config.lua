local status_ok, _ = pcall(requires, "orgmode")
if not status_ok then
    return
end

require('orgmode').setup_ts_grammar()
