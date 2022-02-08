-- =============================================
--             -== Nvim LSP ==-
-- =============================================
local colors = require("tokyonight.colors").setup({})
local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require('lspconfig')
local lsp_colors = require("lsp-colors")
local capabilities = vim.lsp.protocol.make_client_capabilities()


-- {{{ LSP Servers
-- Check and Install at line:79
local lsp_servers = {
	"bashls",               -- Bash
	"yamlls",               -- Yaml
    "sumneko_lua",          -- Lua
    "tsserver",             -- JS and TS
    "eslint",               -- JS and TS
    "vimls",                -- Vim
    "cssls",                -- Css
    "html",                 -- Html
    "emmet-ls",             --  HTML
    "pylsp",                -- Python
}
-- }}}

-- {{{ Colors
lsp_colors.setup({
    Error = colors.red,
    Warning = colors.yellow,
    Information = colors.blue,
    Hint = colors.green
})
-- }}}

-- {{{ Capabilities
capabilities.textDocument.completion.completionItem = {
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    }
}
-- }}}

local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- {{{ Diagnostic icons
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = {
            prefix = "●", -- "●", "▎", "x", "■"
            spacing = 2,
      },
      underline = true,
})
-- }}}

-- {{{ Install LSP Servers
for _, name in pairs(lsp_servers) do
    local ok, server = lsp_installer.get_server(name)
    -- Check that the server is supported in nvim-lsp-installer
    if ok then
        if not server:is_installed() then
            print("Installing: " .. name)
            server:install()
        end
    end
end
-- }}}

lspconfig.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
  }
}


-- {{{ On ready func
lsp_installer.on_server_ready( function(server)
	local default_opts = {
		capabilities = capabilities,
        handlers = {
            ["textDocument/hover"] =
                vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}),
            ["textDocument/signatureHelp"] =
                vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"}),
        },
      root_dir = function(_)
        return vim.loop.cwd()
      end;

	}

	local server_opts = {
        ["sumneko_lua"] = function()
            default_opts.settings = {
                Lua = {
                    runtime = {
                        version = "LuaJIT",
                        path = vim.split(package.path, ";")
                    },
                    diagnostics = {
                        globals = {"vim", "awesome"}
                    },
                    workspace = {
                        library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                        }
                    }
                }
            }
        end,
	}
	server:setup(server_opts[server.name] and server_opts[server.name]() or default_opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)
-- }}}
