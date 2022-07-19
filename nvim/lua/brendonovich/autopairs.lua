local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")

npairs.setup({
    check_ts = true,
    ts_config = {
	lua = {'string'},
	javascript = {'template_string'},
    }
})
