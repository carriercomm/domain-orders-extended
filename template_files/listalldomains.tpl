<h2 class="formTitle">{$lang->_('Select Domains To Register')}</h2>
<p class="lead">{$lang->_('Please choose duration of domain')}</p>        
<form method="post" id="domainCheckForm" action="orderdomain.php?action=proceedToCart">
    <input type="hidden" id="checkFirstAvailable" value="{$checkFirstAvailable}"/>
    <input type="hidden" id="checkFirstAvailableCondition" value="{$checkFirstAvailableCondition}"/>
    <table class="table">
        <thead>
            <tr>
                <th></th> 
                <th>{$lang->_('Domain Name')}</th>
                <th>{$lang->_('Status')}</th>
                <th>{$lang->_('More Info')}</th>
            </tr>
        </thead>
        <tbody>
            <div id="tldMessagesContainer"></div>
            {if $tlds}
            <input type="hidden" id="domainField" value="{$domain}">
            {foreach from=$tlds item=tld}
            <input type="checkbox" name="tld[]" value="{$tld}" class="tldInput" style="display:none;" checked >
            {/foreach}
            {/if}
            {assign var=totalPrice value=0}
            {assign var=availableDomains value=0}
            {foreach from=$domains item=domain}
            <tr data-domain="{$domain.domain}{$domain.tld}">
                <td class="selectToggle">
                </td>
                <td class="domainName">
                    {$domain.domain}{$domain.tld}
                </td>
                <td class="domainStatus" colspan="2">
                    <img src="images/loadingsml.gif">
                    {* </td>
                    <td class="moreInfo"> 
                        <img src="images/loadingsml.gif"> *}
                    </td>
                </tr> 
                {/foreach}
            </tbody>
        </table>
        <div class="well well-sm clearfix"><h3 style="margin-top:0;"><span class="pull-right">{$lang->_('Total Cost')}: {$currency.prefix} <span id="totalCostSummary"></span> {$currency.suffix}</span></h3></div>       
        <div class="form-group" id="toCartButton">
            <div class="internalpadding pull-right">
                <button type="submit" class="btn btn-default btn-lg">{$lang->_('Proceed To The Cart')} <i class="fa fa-angle-right"></i></button>
            </div>
        </div>
        <a href="orderdomain.php?action=clearSelection&directForm={$directForm}" class="btn btn-link"><i class="fa fa-angle-left"></i> {$lang->_('Clear Selection And Go Back')}</a>  
        <div id="tldOrderSpinner" class="subhide"></div>
    </form>