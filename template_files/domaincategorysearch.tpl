<div id="mg-wrapper" style=" overflow: auto; min-width:450px;">
    <div class="col100">
        <div class="col-md-12 col-sm-12 col-xs-12" style="display:none;padding:0px; margin:0px;" id="tldMessages">

        </div>
    	<div id="searchBar">
			<div class="well textcenter">
                <input class="bigfield span7 form-control" id="domain" value="{$smarty.get.domain}"  name="domain" type="text"  placeholder="{$lang->_('eg. mydomain')}" style="display:inline !important; text-align:center !important;   height: 46px; width:60%"  >
                <button id="domainsearch" class="btn btn-primary btn-lg" style=" vertical-align: top;"><span class="glyphicon glyphicon-search"></span> {$lang->_('Search')}</button>
            </div>
    	</div>
    	<div class="col-md-8 col-sm-8 col-xs-12" id="searchResults">



            {**
            *
            *   Top Domain Search
            *
            **}
            <div class="col-md-12 col-sm-12 col-xs-12" id="topDomain"   style="display:none; padding:0px;">

            </div>





            {**
            *
            *   Top Domain Search
            *
            **}
            <div class="col-md-12 col-sm-12 col-xs-12" id="topGrossingPlaceholder"  style="display:none; padding:0px;  margin-bottom: 20px;">
                <div class="categoryHeader">
                    <h5>{if $topCategory->header}{$topCategory->header}{else}{$lang->_('Top Grossing Domains')}{/if}</h5>
                </div>
                    {section name=foo start=0 loop=6}
                        <div class="col-md-2 col-sm-4 col-xs-4" style="padding:2px; ">
                            <div style="background-color:#f5f5f5;border:1px solid #E0E0E0; text-align:center;height:120px;padding-top:50px;">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                        <div class="loader" style="  margin: 0px auto;">
                                            <div class="inner one"></div>
                                            <div class="inner two"></div>
                                            <div class="inner three"></div>
                                        </div>

                                        {* <img src="images/spinner.gif" style="height:20px;" alt="Loading.."/> *}
                                    </div>
                                </div>
                            </div>
                        </div>
                    {/section}

            </div>
            <div class="col-md-12 col-sm-12 col-xs-12" id="topGrossingSearch" style="display:none; padding:0px;  margin-bottom: 20px;">

            </div>





            {**
            *
            *   Suggestions Search
            *
            **}
            <div class="col-md-12 col-sm-12 col-xs-12" id="categories" style="display:none;padding:0px; ">
                <div class="col-md-12 col-sm-12 col-xs-12 suggestionsHolder" style="padding:0px;margin-bottom: 20px;">
                    <div class="categoryHeader">
                        <div class="col-md-8 col-sm-8 col-xs-8">
                            <h5>{if $suggCategory->header}{$suggCategory->header}{else}{$lang->_('Suggestions')}{/if}</h5>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4" style="  text-align: right;padding-right:0px;">
                            <a class="btn btn-danger btn-sm addCategoryToBasket" disabled="diabled" data-id="suggestions">
                                <div class="loader addAll " data-type="loader" style="display:inline-block;">
                                    <div class="inner one"></div>
                                    <div class="inner two"></div>
                                    <div class="inner three"></div>
                                </div>
                                <span class="addAll hidden" data-type="add">
                                    {$lang->_('Add All')}
                                </span>
                                <span class="addAll hidden" data-type="remove">
                                    {$lang->_('Remove All')}
                                </span>
                            </a>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <div style="display:table-row;padding:0px; " class="suggestionsPlaceholder col-md-12 col-sm-12 col-xs-12" data-id="suggestions">
                        <div style="text-align:center;border: 1px solid #e3e3e3;background-color: #f5f5f5;padding:10px 0px;">
                            {* <img src="images/spinner.gif" style="height:20px;" alt="Loading.."/> *}
                            <div class="loader" style="  margin: 0px auto;">
                                <div class="inner one"></div>
                                <div class="inner two"></div>
                                <div class="inner three"></div>
                            </div>
                        </div>
                    </div>
                    <div style="display:none;padding:0px;  margin-bottom: 20px;" class="suggestionsSearch col-md-12" data-id="suggestions">

                    </div>
                </div>
                <div style="clear:both;"></div>

            {*
            *
            * Categories
            *
            *}
                {foreach from=$categories item=category key=k}
                    {if $category.count > 0}
                        <div class="col-md-12 col-sm-12 col-xs-12 categoryHolder" data-id="{$category.id}" style="display:none;padding:0px;margin-bottom: 20px;">
                            <div class="categoryHeader">
                                <div class="col-md-8 col-sm-8 col-xs-8">
                                    <h5>{if $category.header}{$category.header}{else}{$lang->_($category.title)}{/if}</h5>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-4" style="  text-align: right;padding-right:0px;">
                                    <a class="btn btn-danger btn-sm addCategoryToBasket" disabled="diabled" data-id="{$category.id}">
                                        <div class="loader addAll " data-type="loader" style="display:inline-block;">
                                            <div class="inner one"></div>
                                            <div class="inner two"></div>
                                            <div class="inner three"></div>
                                        </div>
                                        <span class="addAll hidden" data-type="add">
                                            {$lang->_('Add All')}
                                        </span>
                                        <span class="addAll hidden" data-type="remove">
                                            {$lang->_('Remove All')}
                                        </span>
                                    </a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                            <div style="display:table-row;padding:0px;width:100% " class="categoryPlaceholder col-md-12 col-sm-12 col-xs-12" data-id="{$category.id}">
                                <div style="text-align:center;border: 1px solid #e3e3e3;background-color: #f5f5f5;padding:10px 0px;">
                                    {* <img src="images/spinner.gif" style="height:20px;" alt="Loading.."/> *}
                                    <div class="loader" style="  margin: 0px auto;">
                                        <div class="inner one"></div>
                                        <div class="inner two"></div>
                                        <div class="inner three"></div>
                                    </div>
                                </div>
                            </div>
                            <div style="display:none;padding:0px;  margin-bottom: 20px;" class="categorySearch col-md-12 col-sm-12 col-xs-12" data-id="{$category.id}">

                            </div>
                        </div>
                        <div style="clear:both;"></div>
                    {/if}
                {/foreach}


            {**
            *
            *   Non Available Domains -> for transfers
            *
            **}
                <div class="col-md-12 col-sm-12 col-xs-12 transfersHolder" data-id="transfers" style="display:none;padding:0px;margin-bottom: 20px;">
                    <div class="categoryHeader">
                        <div class="col-md-8 col-sm-8 col-xs-8">
                            <h5>{$lang->_('Transfers')}</h5>
                        </div>
                        <div class="col-md-4 col-sm-4 col-xs-4" style="  text-align: right;padding-right:0px;">
                            <a class="btn btn-sm showHideMoreTransfers"  data-id="transfers">
                                <span class="showAll" data-type="showAll">
                                    {$lang->_('Show All')}
                                </span>
                                <span class="hideAll" data-type="hideAll">
                                    {$lang->_('Hide All')}
                                </span>
                            </a>
                        </div>
                        <div style="clear:both;"></div>
                    </div>
                    <div style="display:table-row;padding:0px; " class="transfersPlaceholder col-md-12 col-sm-12 col-xs-12" data-id="transfers">
                        <div style="text-align:center;border: 1px solid #e3e3e3;background-color: #f5f5f5;padding:10px 0px;">
                            <div class="loader" style="  margin: 0px auto;">
                                <div class="inner one"></div>
                                <div class="inner two"></div>
                                <div class="inner three"></div>
                            </div>
                        </div>
                    </div>
                    <div style="display:none;padding:0px;  margin-bottom: 20px;" class="transfersHolderContainer col-md-12" data-id="transfers">

                    </div>
                </div>


            </div>
                <div class="endLoader col-md-12 col-sm-12 col-xs-12" style="padding:10px 15px;display:none;">
                    <div class="loader" style="margin: 0px auto;">
                        <div class="inner one"></div>
                        <div class="inner two"></div>
                        <div class="inner three"></div>
                    </div>
                </div>
                <div style="clear:both;"></div>

&nbsp;

        </div>
        <div class="col-md-4 col-sm-4 col-xs-12" id="searchCart" style="border:1px solid #E0E0E0;; padding:0px;">
            <div id="cartContent" style="margin: 0px 10px;">
            </div>
            <div style="margin:0px; padding:20px 0px 15px 0px;background-color: #f5f5f5;text-align: center;">
                <a class="btn btn-primary" href="cart.php?a=view">{$lang->_('Proceed With Order')}</a>
            </div>
        </div>
    </div>
</div>
