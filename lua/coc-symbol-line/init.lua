return {
	refresh = function()
		if vim.g.coc_service_initialized == 1 then
			require("coc-symbol-line.core").refresh()
		end
	end,
}
