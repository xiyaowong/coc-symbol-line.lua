local M = {}

local fn = vim.fn
local api = vim.api

local position_in_range = require("coc-symbol-line.utils").position_in_range

local labels
local fallback_labels = {
	["function"] = "ƒ",
	method = "",
	class = " ",
	struct = "פּ",
	variable = "",
}

function M.refresh()
	--------- initialize
	if
		not (
			vim.g.coc_service_initialized == 1
			and vim.bo.buftype == ""
			and fn.CocAction("hasProvider", "documentSymbol")
		)
	then
		return
	end

	if not labels then
		labels = fn["coc#util#get_config"]("suggest.completionItemKindLabels")
	end

	--------- handle symbols

	local bufnr, winnr = api.nvim_get_current_buf(), api.nvim_get_current_win()

	fn.CocActionAsync("documentSymbols", bufnr, function(_, symbols)
		if type(symbols) ~= "table" or vim.tbl_isempty(symbols) then
			return
		end

		local cursor = api.nvim_win_get_cursor(winnr)
		local position = { line = cursor[1] - 1, character = cursor[2] }

		symbols = vim.tbl_filter(function(symbol)
			return (
					symbol.range
					and vim.tbl_contains(
						{ "Class", "Method", "Function", "Struct", "Property", "Variable" },
						symbol.kind
					)
					-- not ends with ' callback'
					and symbol.text:reverse():find("kcabllac ") ~= 1
					and position_in_range(position, symbol.range) == 0
				)
		end, symbols)

		local new_symbols = {}
		for _, symbol in ipairs(symbols) do
			-- only need the nearest variable
			if
				symbol.kind == "Variable"
				and vim.tbl_count(new_symbols) > 0
				and new_symbols[#new_symbols].kind == "Variable"
			then
				new_symbols[#new_symbols] = symbol
			else
				table.insert(new_symbols, symbol)
			end
		end

		local items = {}
		for _, symbol in ipairs(new_symbols) do
			local text = symbol.text
			local kind = symbol.kind:lower()
			local label = labels[kind] or fallback_labels[kind] or ""
			table.insert(items, label .. " " .. text)
		end

		api.nvim_buf_set_var(bufnr, "coc_symbol_line", table.concat(items, " > "))
	end)
end

return M
