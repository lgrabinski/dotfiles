local wk = require("which-key")
local mappings = {
   a = {
        name = "applications",
        t = { "<cmd>NvimTreeToggle<cr>", "NvimTree" },
    },
    b = {
        name = "buffers",
        d = { "<cmd>Dashboard<cr>", "Dashboard" },
    },
    f = {
        name = "file",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
        s = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    },
    p = {
        name = "Packer",
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
    },
    s  = {
        name = "Search",
    },
    t = {
        name = "toggles",
        t = { "<cmd>DashboardChangeColorscheme<cr>", "Colorscheme change" },
    },
    q = { ":q<cr>", "Quit" },
    w = { ":w<cr>", "Save" },
}
local opts = { prefix = '<leader>' }
wk.register(mappings, opts)

-- wk.register({
--    f = {
--        name = "file", -- optional group name
--        f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
--    },
--}, { prefix = "<leader>" })
