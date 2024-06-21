vim.opt.termguicolors = true
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Indents
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

-- Status bar
vim.opt.showmode = false -- removes mode from command bar
local gl = require "galaxyline"
local colors = require("galaxyline.themes.colors").default
gl.short_line_list = { "oil", "chadtree" }
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
