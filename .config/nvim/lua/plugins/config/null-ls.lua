local null_ls = require("null-ls")

local sources = {
	null_ls.builtins.formatting.black,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.prettier.with({
		prefer_local = "node_modules/.bin",
	}),
	null_ls.builtins.formatting.eslint.with({
		prefer_local = "node_modules/.bin",
	}),
	null_ls.builtins.formatting.clang_format,
	null_ls.builtins.diagnostics.eslint.with({
		prefer_local = "node_modules/.bin",
	}),
	null_ls.builtins.diagnostics.flake8.with({
		prefer_local = ".venv/bin",
	}),
	null_ls.builtins.diagnostics.hadolint,
	null_ls.builtins.code_actions.eslint.with({
		prefer_local = "node_modules/.bin",
	}),
	null_ls.builtins.diagnostics.tsc,
	null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({
	sources = sources,
})
