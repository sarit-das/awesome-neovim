local o = vim.opt -- editor options
local g = vim.g -- Global editor variables
local cmd = vim.cmd -- execute vimscript in lua
local fn = vim.fn -- invoke vim-functions in lua
-- Remap leader key to ,
-- With a map leader it's possible to do extra key combinations
-- like <leader>w saves the current file

g.mapleader = ","

-- Set clipboard to the +  registers only
-- if you want to use the * also add ,unnamed
if fn.has("clipboard") == 1 then
    vim.opt.clipboard:append("unnamedplus")
end

-- Restore cursor to file position in previous editing session
-- This autocommand jumps to the last known position in a file
-- just after opening it, if the '-- mark is set: >
cmd([[
augroup restore_cursor
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END
]])

-- Show line numbers
o.number = true

-- Show the line number relative to the line with the cursor in front of each line.
o.relativenumber = true

--If you write to an existing file (but do not append) a backup of the original file is made.
o.backup = true

-- tells neovim how backups are done
o.backupcopy = "auto"

-- List of directories for the backup file
-- if a directory ends in two path separators "//", the swap file name will be built from
-- the complete path to the file with all path separators changed to percent '%' signs.
-- This will ensure file name uniqueness in the backup directory.
local dirprefix = vim.env.XDG_DATA_HOME or fn.expand("~/.local/share")

o.backupdir = { dirprefix .. "/nvim/backup//", "/tmp//" }

-- The extension to be used for vim backup files
o.backupext = ".vimbak"

-- enable saving unsaved/unwritten files in a *.swp file
o.swapfile = true

-- The location of swap files ,ie buffers that have not been save ie in memory
o.directory = { dirprefix .. "/nvim/swap//", "/tmp//" }

-- saves undo history to an undo file when writing a buffer to a file, and restores undo
-- history from the same file on buffer read.
o.undofile = true

-- Maximum number of changes that can be undone.
o.undolevels = 30000

-- Location for storing undo tree of the edited file--
o.undodir = { dirprefix .. "/nvim/undo//", "/tmp//" }

-- Don't redraw screen when executing macros,registers or untyped commands
o.lazyredraw = true

-- Incremental live completion
o.inccommand = "nosplit"

-- You will have bad experience for diagnostic messages when it's default 4000.
o.updatetime = 100

-- don't give |ins-completion-menu| messages.
o.shortmess = "c"

-- always merge sign column and number column into one
o.signcolumn = "yes"

-- always expands tab to spaces. It is good when peers use different editor.
o.expandtab = true

-- Don't let autocomplete affect usual typing habits
o.completeopt = "menuone,noselect"

-- This option allows you to switch between multiple buffers
o.hidden = true -- without saving a changed buffer

-- Automatically enable mouse usage
o.mouse = "a"

-- Wrap-broken line prefix
o.showbreak = [[>>>\ \ \]]

-- enable line wrap
o.wrap = true

-- Line wrap (number of cols)
o.textwidth = 117

-- Highlight matching brace
o.showmatch = true

-- text complete with CTRL-N or CTRL-P
o.complete = "kspell"

-- Enable spell checking for español y ingles--
o.spelllang = "en,es"

-- Show best nine spell checking candidates at most
o.spellsuggest = "best,9"

-- When a word is CamelCased, assume "Cased" is a separate word: every upper-case character
-- in a word that comes after a lower case character indicates the start of a new word.
o.spelloptions = "camel"

-- Use visual bell (no beeping)
o.visualbell = true

-- Always case-insensitive
o.ignorecase = true

-- Enable smart-case search
o.smartcase = true

-- case insensitive auto completion
o.wildignorecase = true

-- Number of auto-indent spaces
o.shiftwidth = 4

-- Enable smart-indent
o.smartindent = true

-- Number of spaces per Tab
o.softtabstop = 4

-- Prompt confirmation dialogs
o.confirm = true

-- Show row and column ruler information
o.ruler = true

-- Command line height
o.cmdheight = 2

-- Auto-write all file changes
o.autowriteall = true

-- Set the history size to maximum. by default it is 20
o.history = 10000

-- Display unprintable characters f12 - switches
o.list = true

-- Unprintable chars mapping
o.listchars = { tab = "••", trail = "•", extends = "»", precedes = "«" }

-- Enable folding
o.foldmethod = "indent"

o.foldlevel = 99

-- Remove Trailing whitespaces in all files
cmd([[autocmd BufWritePre * %s/\s\+$//e]])

-- automatically show diagnostics on current line
cmd([[autocmd CursorHold * lua vim.diagnostic.open_float(nil,{focus=false})]])

--  format files on save
cmd([[autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()]])
