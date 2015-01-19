        <h2 class="formTitle">{$lang->_('Select Domains To Register')}</h2>
        <p class="lead">{$lang->_('Please choose duration of domain')}</p>       
        <form method="post" action="orderdomain.php?action=proceedToCart">
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
                    {assign var=totalPrice value=0}
                    {assign var=availableDomains value=0}
                    {foreach from=$domains item=domain}
                    <tr>
                        <td>
                            {if $domain.result eq 'Available' && $hr->getTLDPrice($domain.tld)}
                            <input type="checkbox" name="domain[{$domain.domain}{$domain.tld}]" class="domainSelectToggle" value="1" checked>
                            {/if}
                        </td>
                        <td>{$domain.domain}{$domain.tld}</td>
                        <td>
                            {if $domain.result eq 'Available'}
                            <span class="label label-success domainStatusInfo">{$lang->_('Available')}</span>
                            {assign var=$availableDomains value=$availableDomains++}
                            {else}
                            <span class="label label-danger domainStatusInfo">{$domain.result}</span>
                            {/if}
                        </td>
                        <td>
                            {if $domain.result eq 'Available'}
                            <select name="domainreperiod[{$domain.domain}{$domain.tld}]" class="calculateSummary form-control input-sm">
                                {foreach from=$hr->getTLDPrice($domain.tld) key=period item=price name=prices}
                                {if $smarty.foreach.prices.index eq 0}{assign var=totalPrice value=$totalPrice+$price.register}{/if}
                                <option value="{$period}" data-price="{$price.register}">{$period} {$LANG.orderyears} - {$currency.prefix} {$price.register} {$currency.suffix}</option> 
                                {foreachelse}
                                <option value="">{$lang->_('Not Applicable Pricings')}</option>
                                {/foreach}
                            </select>
                            {else}
                            <a href="http://{$domain.domain}{$domain.tld}" target="_blank">{$lang->_('WWW')}</a> | <a href="" onclick="popupWindow('orderdomain.php?action=whoisinfo&domain={$domain.domain}{$domain.tld}','whois',650,420);return false">{$lang->_('WHOIS')}</a> | <a href="orderdomain.php?action=transferDomain&domain={$domain.domain}{$domain.tld}">{$lang->_('TRANSFER')}</a>
                            {/if}
                        </td>
                    </tr>
                    {/foreach}
                </tbody>
            </table>            
            {if $availableDomains > 0 && $totalPrice > 0}
            <div class="well well-sm clearfix"><h3 style="margin-top:0;"><span class="pull-right">{$lang->_('Total Cost')}: {$currency.prefix} {$totalPrice} {$currency.suffix}</span></h3></div>
            {/if}            
            {if $availableDomains > 0 && $totalPrice > 0}
            <div class="form-group pull-right">
                <div class="internalpadding">
                    <button type="submit" class="btn btn-default btn-lg"><span class="icon icon-white icon-shopping-cart"></span> {$lang->_('Proceed To The Cart')} <i class="fa fa-angle-right"></i></button>
                </div>
            </div>
            {/if}
            <a href="orderdomain.php?action=clearSelection&directForm={$smarty.get.directForm}" class="btn btn-link"><i class="fa fa-angle-left"></i> {$lang->_('Clear Selection And Go Back')}</a>    
        </form>