local status_ok, _ = pcall(require, "telescope")
if not status_ok then
    return
end

vim.g.dashboard_default_executire = 'telescope'
