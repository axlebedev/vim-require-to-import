vim9script

export def RequireToImport()
    var saveed_report = &report
    &report = 10000
    silent! g/const .\+ = require/normal! 0ciwimport
    silent! g/const \_.\+ = require/normal! 0ciwimport

    :%s/= require('\(.\+\)')/from '\1'/ge

    :%s/module.exports =/export default/ge
    &report = saveed_report
enddef

export def ImportToRequire()
    var saveed_report = &report
    &report = 10000
    :%s/import/const/ge

    :%s/from '\(.\+\)'/= require('\1')/ge

    :%s/export default/module.exports =/ge
    &report = saveed_report
enddef

command! RequireToImport RequireToImport()
command! ImportToRequire ImportToRequire()

nnoremap rti <ScriptCmd>RequireToImport()<CR>
nnoremap itr <ScriptCmd>ImportToRequire()<CR>
