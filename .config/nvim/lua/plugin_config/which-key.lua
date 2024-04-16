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
        name = "files",
        f = { "<cmd>Telescope find_files<cr>", "Find file" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
        s = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    },
    s = {
        name = "Search",
    },
    T = {
        name = "Toggles",
        t = { "<cmd>DashboardChangeColorScheme<cr>", "Colorsche change" },
    },
    q = { ":q<cr>", "Quit" },
    w = { ":w<cr>", "Save" },

}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)


