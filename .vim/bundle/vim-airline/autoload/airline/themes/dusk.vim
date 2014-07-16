" vim-airline companion theme of dusk
" (https://github.com/Pychimp/vim-dusk)

let g:airline#themes#dusk#palette = {}

let g:airline#themes#dusk#palette.accents = {
      \ 'red': [ '#ffffff' , '' , 231 , '' , '' ],
      \ }


let s:N1 = [ '#ffffff' , '#525252' , 231  , 36 ]
let s:N2 = [ '#ffffff' , '#3f3f3f' , 231 , 29 ]
let s:N3 = [ '#ffffff' , '#2b2b2b' , 231  , 23 ]
let g:airline#themes#dusk#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#dusk#palette.normal_modified = {
      \ 'airline_c': [ '#ffffff' , '#780000' , 231     , 88      , ''     ] ,
      \ }


let s:I1 = [ '#ffffff' , '#789f00' , 231 , 106 ]
let s:I2 = [ '#ffffff' , '#3f3f3f' , 231 , 29  ]
let s:I3 = [ '#ffffff' , '#2b2b2b' , 231 , 23  ]
let g:airline#themes#dusk#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#dusk#palette.insert_modified = g:airline#themes#dusk#palette.normal_modified
let g:airline#themes#dusk#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , '#789f00' , s:I1[2] , 106     , ''     ] ,
      \ }


let g:airline#themes#dusk#palette.replace = copy(g:airline#themes#dusk#palette.insert)
let g:airline#themes#dusk#palette.replace.airline_a = [ s:I2[0]   , '#920000' , s:I2[2] , 88     , ''     ]
let g:airline#themes#dusk#palette.replace_modified = g:airline#themes#dusk#palette.insert_modified

let s:V1 = [ '#ffff9a' , '#ff8036' , 222 , 208 ]
let s:V2 = [ '#ffffff' , '#3f3f3f' , 231 , 29 ]
let s:V3 = [ '#ffffff' , '#2b2b2b' , 231  , 23  ]
let g:airline#themes#dusk#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#dusk#palette.visual_modified = {
      \ 'airline_c': [ '#ffffff' , '#450000' , 231     , 52      , ''     ] ,
      \ }

let s:IA = [ '#4e4e4e' , '#2b2b2b' , 59 , 23 , '' ]
let g:airline#themes#dusk#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
let g:airline#themes#dusk#palette.inactive_modified = {
      \ 'airline_c': [ '#e20000' , ''        , 166      , ''      , ''     ] ,
      \ }

let g:airline#themes#dusk#palette.tabline = {
      \ 'airline_tab':  ['#2aa198', '#3f3f3f',  231, 29, ''],
      \ 'airline_tabsel':  ['#ffffff', '#575757',  231, 36, ''],
      \ 'airline_tabtype':  ['#ffffff', '#525252',  231, 36, ''],
      \ 'airline_tabfill':  ['#ffffff', '#2b2b2b',  231, 23, ''],
      \ 'airline_tabmod':  ['#ffffff', '#780000',  231, 88, ''],
      \ }

let s:WI = [ '#ffffff', '#5f0000', 231, 88 ]
let g:airline#themes#dusk#palette.normal.airline_warning = [
     \ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
     \ ]

let g:airline#themes#dusk#palette.normal_modified.airline_warning =
    \ g:airline#themes#dusk#palette.normal.airline_warning

let g:airline#themes#dusk#palette.insert.airline_warning =
    \ g:airline#themes#dusk#palette.normal.airline_warning

let g:airline#themes#dusk#palette.insert_modified.airline_warning =
    \ g:airline#themes#dusk#palette.normal.airline_warning

let g:airline#themes#dusk#palette.visual.airline_warning =
    \ g:airline#themes#dusk#palette.normal.airline_warning

let g:airline#themes#dusk#palette.visual_modified.airline_warning =
    \ g:airline#themes#dusk#palette.normal.airline_warning

let g:airline#themes#dusk#palette.replace.airline_warning =
    \ g:airline#themes#dusk#palette.normal.airline_warning

let g:airline#themes#dusk#palette.replace_modified.airline_warning =
    \ g:airline#themes#dusk#palette.normal.airline_warning


if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#dusk#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ [ '#ffffff' , '#2b2b2b' , 231 , 23 , ''     ] ,
      \ [ '#ffffff' , '#525252' , 231 , 36 , ''     ] ,
      \ [ '#ffffff' , '#973d45' , 231 , 95 , ''     ] )
