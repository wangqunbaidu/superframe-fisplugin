
    {%staticFramework framework="mobilesearch:static/js/mod.js"%}{%/staticFramework%}

    {%asyncCss%}
    <!--[FIS_CSS_LINKS_HOOK]-->
    <!--[FIS_JS_SCRIPT_HOOK]-->
    {%/asyncCss%}

    <template id="sf_async_head_js">
        {%* 全局tpl变量 *%}
        {%widget name="mobilesearch:widget/vars/custom_vars.tpl"%}
        {%* 全局js变量 *%}
        {%widget name="mobilesearch:widget/vars/global_vars.tpl"%}
    </template>

    <template id="sf_async_body">
        <div class="image-viewport">
            {%block name="block_content"%}
            <section id="mediacysearch" class="mediacysearch {%if !$mediacy_drop_down%}mediacysearch-black{%/if%}" {%if $showMediacy %}style="display:block;"{%/if%}>
                {%widget name="mobilemediacy:widget/index/load.tpl"%}
            </section>
            <section id="mainsearch" class="mainsearch" {%if $showMediacy %}style="display:none;"{%/if%}>
                {%widget name="mobilesearch:widget/component/holyfix/Holyfix.tpl"%}

                {%widget name="mobilesearch:widget/component/header/header.tpl"%}

                {%$tagLen=$bd_queryTags|@count%}

                {%if $tagLen < 3%}
                {%widget name="mobilesearch:widget/component/rs/toprs.tpl"%}
                {%/if%}

                {%*广告开始*%}
                {%if $wisePinZhuan and $wisePinZhuan.fdi_WisePinZhuanArray[0] and $wisePinZhuan.fdi_WisePinZhuanArray[0].wisePType eq 1 and $wisePinZhuan.fdi_WisePinZhuanNumber > 1%}
                {%*明星slider，query=林允儿，李敏镐*%}
                {%widget name="mobilesearch:widget/component/starad/starad.tpl"%}
                {%elseif $isNsTop%}
                {%*非标广告*%}
                {%widget name="mobilesearch:widget/component/nonstandard/nonstandard.tpl"%}
                {%elseif $isGameTop and $smarty.cookies.ISSEARCHGAMECLOSE != 2%}
                {%*游戏*%}
                {%widget name="mobilesearch:widget/component/special/game.tpl"%}
                {%elseif $cms_appad and $cms_appad.pos_21 and $cms_appad.pos_21.switch and $smarty.get.from != 'meitu'%}
                {%*app推广*%}
                {%widget name="mobilesearch:widget/component/appad/appad.tpl"%}
                {%/if%}
                {%*广告结束*%}

                {%if $cms_appad and $cms_appad.pos_21%}
                {%widget name="mobilesearch:widget/component/ugcad/ugcad.tpl"%}
                {%/if%}

                {%if $bd_atlas && !$bd_ads && $bd_isWiseAtlas == '1'%}
                {%widget name="mobilesearch:widget/component/atlas/atlas.tpl"%}
                {%/if%}

                {%widget name="mobilesearch:widget/component/waterfall/waterfall.tpl"%}

                {%if $flashRs%}
                {%widget name="mobilesearch:widget/component/flashrs/flashrs.tpl"%}
                {%/if%}

                {%widget name="mobilesearch:widget/component/rs/bottomrs.tpl"%}

                {%widget name="mobilesearch:widget/component/recommendad/recommendad.tpl"%}

                {%widget name="mobilesearch:widget/component/gotop/gotop.tpl"%}
            </section>

            {%/block%}
        </div>

        <JS_FRAMEWORK_HOOK/>
    </template>
    {%asyncJs%}
    <script>
        __inline('../static/js/zepto.js');
        __inline('../static/js/zepto.extend.js');
        __inline('../static/js/zepto.component.js');
        __inline('../static/js/reflux.js');
        __inline('../static/js/jucier.js');

        __inline('../static/js/abtest.js');
        __inline('../static/js/nslog.js');

        __inline('../static/js/mod.js');
        __inline('../static/js/md5.js');
        __inline('../static/js/url.js');
        __inline('../static/js/router.js');

        $ = Zepto;
    </script>
    {%/asyncJs%}
