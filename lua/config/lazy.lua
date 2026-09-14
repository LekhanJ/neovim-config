local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{
			"sphamba/smear-cursor.nvim",
			opts = {
				enabled = true,
				stiffness = 0.6,
				trailing_stiffness = 0.5,
			},
		},
	},
	install = { colorscheme = { "onedark", "habamax" } },
	checker = { enabled = false },
})
