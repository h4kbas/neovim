return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")

    local git_ignored = setmetatable({}, {
      __index = function(self, key)
        local proc = vim.system(
          { "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
          {
            cwd = key,
            text = true,
          }
        )
        local result = proc:wait()
        local ret = {}
        if result.code == 0 then
          for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
            -- Remove trailing slash
            line = line:gsub("/$", "")
            table.insert(ret, line)
          end
        end

        rawset(self, key, ret)
        return ret
      end,
    })
    oil.setup({
      default_file_explorer = true,
      use_default_keymaps = false,
      keymaps = require("config.bindings").Custom_oil_mappings,
      skip_confirm_for_simple_edits = true,
      view_options = {
        -- show_hidden = true,
        Vnatural_order = true,
        is_hidden_file = function(name, _)
          -- dotfiles are always considered hidden
          if vim.startswith(name, ".") then
            return true
          end
          local dir = require("oil").get_current_dir()
          -- if no local directory (e.g. for ssh connections), always show
          if not dir then
            return false
          end
          -- Check if file is gitignored
          return vim.list_contains(git_ignored[dir], name)
        end,
      },
      watch_for_changes = false,
    })
  end,
}
