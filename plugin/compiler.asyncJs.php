<?php
/**
 * 将fis产出的外联和内联js放入指定位置
 */
function smarty_compiler_asyncJs($arrParams,  $smarty){
    $strAttr = '';
    foreach ($arrParams as $_key => $_value) {
        if (is_numeric($_key)) {
            $strAttr .= ' <?php echo ' . $_value .';?>';
        } else {
            $strAttr .= ' ' . $_key . '="<?php echo ' . $_value . ';?>"';
        }
    }
    return '<template id="sf_async_foot_js"' . $strAttr . '>';
}

function smarty_compiler_asyncJsclose($arrParams,  $smarty){
    $strCode = '<?php ';
    $strCode .= 'if(class_exists(\'FISResource\', false)){';
    $strCode .= 'echo FISResource::jsHook();';
    $strCode .= '}';
    $strCode .= '?>';
    $strCode .= '</template>';
    return $strCode;
}
