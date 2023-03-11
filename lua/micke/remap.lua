--defining insertConsoleLog func 
function insertConsoleLog()
    --inserts str 'console.log()' at current cursor pos.
    vim.api.nvim_feedkeys("console.log()", "n", true)
    --move the cursor back one to get inside the parantheses
    local termcode = vim.api.nvim_replace_termcodes("<Left>", true, false, true)
    vim.api.nvim_feedkeys(termcode, "n", true)
end

--defining leader as " " (space) and "jk" as escape in insert mode
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<ESC>")

--defining <leader>y to yank text to sys clipboard instead of current buffer in normal and visual mode
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

--defining <leader>log to execute func insertConsoleLog()
vim.keymap.set("i", "<leader>log", "<ESC>:lua insertConsoleLog()<CR>a", {noremap = true, silent = true})
