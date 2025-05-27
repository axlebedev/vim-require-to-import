vim9script

export def RequireToImport()
    var view = winsaveview()
    silent! g/const .\+ = require/normal! 0ciwimport
    silent! g/const \_.\+ = require/normal! 0ciwimport

    silent! keeppatterns %s/= require('\(.\+\)')/from '\1'/ge

    silent! keeppatterns %s/module.exports =/export default/ge

    winrestview(view)
enddef

export def ImportToRequire()
    var view = winsaveview()
    silent! keeppatterns :%s/import/const/ge

    silent! keeppatterns :%s/from '\(.\+\)'/= require('\1')/ge

    silent! keeppatterns :%s/export default/module.exports =/ge
    winrestview(view)
enddef

command! RequireToImport RequireToImport()
command! ImportToRequire ImportToRequire()

nnoremap rti <ScriptCmd>RequireToImport()<CR>
nnoremap itr <ScriptCmd>ImportToRequire()<CR>
