<?php
/**
 * 将fis运行时依赖的framework引入sf模板
 */
function smarty_compiler_staticFramework($arrParams,  $smarty){

    $strResourceApiPath = preg_replace('/[\\/\\\\]+/', '/', dirname(__FILE__) . '/FISResource.class.php');
    $strFramework = $arrParams['framework'];

    unset($arrParams['framework']);
    $strAttr = '';
    $strCode  = '<?php ';
    if (isset($strFramework)) {
        $strCode .= 'if(!class_exists(\'FISResource\', false)){require_once(\'' . $strResourceApiPath . '\');}';
        $strCode .= 'FISResource::setFramework(FISResource::getUri('.$strFramework.', $_smarty_tpl->smarty));';
    }
    $strCode .= ' ?>';

    foreach ($arrParams as $_key => $_value) {
        if (is_numeric($_key)) {
            $strAttr .= ' <?php echo ' . $_value .';?>';
        } else {
            $strAttr .= ' ' . $_key . '="<?php echo ' . $_value . ';?>"';
        }
    }

    return $strCode ;
}

function smarty_compiler_staticFrameworkclose($arrParams,  $smarty){
    $strCode = '<?php ';
    $strCode .= '$_smarty_tpl->registerFilter(\'output\', array(\'FISResource\', \'rendersfResponse\'));';
    $strCode .= '?>';
    //$strCode .= '</template>';
//    var_dump($strCode);exit();
    return $strCode;
}
