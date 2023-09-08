--------------------------------
-- DASHBOARD-NVIM CONFIGURATION
--------------------------------

require("dashboard").setup({
 event = 'VimEnter',
 theme = 'hyper',
 config = {
   week_header = { 
enable = true 
   },
	shortcut = {
           {
        	icon = ' ',
          	icon_hl = '@variable',
          	desc = 'Files',
          	group = 'Label',
          	action = 'Telescope file_browser path=%:p:h select_buffer=true',
          	key = 'f',
           },
           {
             desc = ' Packer Plugins',
          	group = 'DiagnosticHint',
          	action = 'PackerStatus',
          	key = 'a',
           },
           {
          	desc = ' Mason',
          	group = 'Number',
          	action = 'Mason',
          	key = 'm',
           },
       }
   }
})

