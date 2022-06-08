local status_ok, _ = pcall(require, "nvim-tree")
if not status_ok then
    return
end

require'nvim-tree'.setup {
}
