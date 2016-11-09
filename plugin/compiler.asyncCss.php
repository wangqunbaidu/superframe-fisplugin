<?php
/**
 * 将fis产生的打包PKG_CSS文件引入sf模板
 */
function smarty_compiler_asyncCss($arrParams,  $smarty){

    $strAttr = '';
    foreach ($arrParams as $_key => $_value) {
        $strAttr .= ' ' . $_key . '="<?php echo ' . $_value . ';?>"';
    }
    return '<template id="sf_async_css"' . $strAttr . '>';
}

function smarty_compiler_asyncCssclose($arrParams,  $smarty){
    $strResourceApiPath = preg_replace('/[\\/\\\\]+/', '/', dirname(__FILE__) . '/FISResource.class.php');
    $strCode = '<?php ';
    $strCode .= 'if(!class_exists(\'FISResource\', false)){require_once(\'' . $strResourceApiPath . '\');}';
    $strCode .= 'echo FISResource::cssHook();';
    $strCode .= '?>';
    $strCode .= '</template>';

    return $strCode;
}
