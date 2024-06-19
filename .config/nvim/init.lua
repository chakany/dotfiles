vim.opt.termguicolors = true

-- Notifications
vim.notify = require("notify")

-- Intents
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Highlighting
require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "javascript", "typescript", "go", "html", "css", "json", "jsdoc", "make", "markdown", "markdown_inline", "svelte", "yaml" },
	auto_install = true,
	highlight = {
		enable = true,
	}
}

-- Autocompletion
vim.g.coq_settings = {
    auto_start = "shut-up",
}
local coq = require "coq"

-- LSP
local lsp = require "lspconfig"
lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities())

-- File Explorer
require("oil").setup({
  default_file_explorer = true,
  delete_to_trash = true,
  view_options = {
      show_hidden = true,
  }
})

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

-- Status bar
vim.opt.showmode = false -- removes mode from command bar
local gl = require "galaxyline"
local colors = require("galaxyline.themes.colors").default
gl.short_line_list = { "oil" }
local condition = require "galaxyline.condition"

gl.section.left[1] = {
    ViMode = {
    provider = function()
        local mode = vim.fn.mode()
        local mode_config = {
            n = { "NORMAL", colors.red },
            no = { "OPERATOR PENDING", colors.red },
            i = { "INSERT", colors.green },
            ic = { "INSERT COMPLETION", colors.green },
            v = { "VISUAL", colors.blue },
            [""] = { "VISUAL BLOCK", colors.blue },
            V = { "VISUAL LINE", colors.blue },
            c = { "COMMAND", colors.magenta },
            s = { "SELECT", colors.orange },
            S = { "SELECT LINE", colors.orange },
            [""] = { "SELECT BLOCK", colors.orange },
            t = { "TERMINAL", colors.red },
            R = { "REPLACE", colors.violet },
            Rv = { "VIRTUAL REPLACE", colors.violet },
            ce = { "EX", colors.red },
            cv = { "VIM EX", colors.red },
            r = { "HIT-ENTER", colors.cyan },
            rm = { "MORE", colors.cyan },
            ["r?"] = { "CONFIRM", colors.cyan },
            ["!"] = { "SHELL RUNNING", colors.red },
        }
        vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_config[mode][2])
      return mode_config[mode][1]
    end,
    icon = "    ",
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.red, colors.bg, "bold" }
  },
}

gl.section.left[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = condition.check_git_workspace,
        icon = " ",
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.orange, colors.bg, "bold" }
    }
}

gl.section.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = condition.buffer_not_empty,
        highlight = { require("galaxyline.providers.fileinfo").get_file_icon_color, colors.bg },
    }
}

gl.section.left[4] = {
    FileName = {
        provider = "FileName",
        condition = condition.buffer_not_empty,
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.magenta, colors.bg, "bold" }
    }
}

gl.section.left[5] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = { colors.red, colors.bg },
    }
}

gl.section.left[6] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = { colors.red, colors.bg },
    }
}

gl.section.left[7] = {
    DiagnosticHint = {
        provider = "DiagnosticHint",
        icon = "  ",
        highlight = { colors.cyan, colors.bg },
    }
}

gl.section.left[8] = {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = "  ",
        highlight = { colors.blue, colors.bg },
    }
}

gl.section.right[1] = {
    ShowLspClient = {
        provider = "GetLspClient",
        condition = function()
            local tbl = { ["dashboard"] = true, [""] = true }
            if tbl[vim.bo.filetype] then
                return false
            end
            return true
        end,
        icon = " ",
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.cyan, colors.bg, "bold" }
    }
}

gl.section.right[2] = {
    FileSize = {
        provider = "FileSize",
        condition = condition.buffer_not_empty,
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.fg, colors.bg },
    }
}

gl.section.right[3] = {
    LineInfo = {
        provider = "LineColumn",
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.fg, colors.bg }
    }
}

gl.section.right[4] = {
    Percent = {
        provider = "LinePercent",
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.fg, colors.bg, "bold" },
    }
}

gl.section.short_line_left[1] = {
  BufferType = {
    provider = "FileTypeName",
    separator = " ",
    separator_highlight = { "NONE", colors.bg },
    highlight = { colors.blue, colors.bg, "bold" },
  },
}

gl.section.short_line_left[2] = {
  SFileName = {
    provider = "SFileName",
    condition = condition.buffer_not_empty,
    highlight = { colors.fg, colors.bg, "bold" },
  },
}

gl.section.short_line_right[1] = {
    BufferIcon = {
        provider = "BufferIcon",
        highlight = { colors.fg, colors.bg },
    }
}
