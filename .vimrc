#Allow vim to copy to clipboard
set clipboard=unnamedplus

#Make line numbers visible
set number

#Make line numbers relative to current line
set relativenumber

#Set the width of a tab character to 4 spaces
set tabstop=4

#Set the number of spaces used for each level of indentation
set shiftwidth=4

#Convert tabs to spaces
set expandtab

#Automatically add proper indentation for new lines in structured files
set smartindent

#This is just a colorscheme
colorscheme elflord

#Enable syntax highlighting
syntax on

"Disable the default Vim startup message.
set shortmess+=I

"Enable searching as you type, rather than waiting till you press enter
set incsearch

"This setting makes search case-insensitive when all characters in the string
"being searched are lowercase. However, the search becomes case-sensitive if
"it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

"Enable searching as you type, rather than waiting till you press enter
set incsearch
