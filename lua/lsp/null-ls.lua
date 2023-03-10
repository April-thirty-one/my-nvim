local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("没有找到 null-ls")
  return
end

local M = {
    "jose-elias-alvarez/null-ls.nvim",
}

function M.setup(options)
    local nls = require("null-ls")
    nls.setup({
        debounce = 150,
        save_after_format = false,
        sources = {
            nls.builtins.formatting.stylua,
            nls.builtins.formatting.fish_indent,
            nls.builtins.formatting.clang_format,
            nls.builtins.formatting.rustfmt.with({
                extra_args = function(params)
                    local Path = require("plenary.path")
                    local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

                    if cargo_toml:exists() and cargo_toml:is_file() then
                        for _, line in ipairs(cargo_toml:readlines()) do
                            local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
                            if edition then
                                return { "--edition=" .. edition }
                            end
                        end
                    end
                    -- default edition when we don't find `Cargo.toml` or the `edition` in it.
                    return { "--edition=2021" }
                end,
            }),
            nls.builtins.formatting.black,
            -- nls.builtins.code_actions.gitsigns,
            -- nls.builtins.diagnostics.flake8,
        },
        root_dir = require("null-ls.utils").root_pattern(".git"),
        on_attach = options.on_attach,
    })
end

return M