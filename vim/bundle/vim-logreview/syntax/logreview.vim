if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "logreview"
syntax keyword logYellow WARN WARNING UVM_WARNING
syntax match logYellow '\*W'
syntax keyword logGreen INFO DEBUG LOG Information VERBOSE UVM_INFO
syntax keyword logRed  STACK Stack stack SEVERE Severe severe
syntax match logRed "for programmers"
syntax keyword logError ERROR FATAL CRITICAL UVM_ERROR UVM_FATAL
syntax match logError '\*E'
syntax match logError '\*F'

highlight Keyword ctermfg=Yellow
"highlight link logYellow Keyword
highlight link logYellow WarningMsg

highlight Label ctermfg=LightGreen
highlight link logGreen Label

highlight Tag ctermfg=Red
highlight link logRed Tag

highlight link logError Error