-- =============================================
--              -== MISC ==-
-- =============================================
local Terminal  = require('toggleterm.terminal').Terminal

function _G._Run()
    vim.ui.input({
        prompt = "RUNIT ⟫ ",
        completion = "shellcmd",
        highlight=function(cmd)
            local hl = {{0, string.len(cmd), "WarningMsg"}}
            return hl
        end},
    function (cmd)
        if not cmd then
                return 1
        end
        Terminal:new({
            cmd = string.format([[echo "$(tput bold setaf 3)\$$(tput sgr0) %s\n" &&]], cmd) .. cmd,
            close_on_exit = false,
        }):toggle()
    end)
end
