<td>
	{if $checkFirstAvailableCondition eq 1}
	{if $checkFirstAvailable eq 1 && $status eq 'Available'}
	<input type="checkbox" name="domain[{$domain}{$tld}]" class="domainSelectToggle" value="1" {if $prices} checked{/if}>
	{else}
	<input type="checkbox" name="domain[{$domain}{$tld}]" class="domainSelectToggle" value="1">
	{/if}
	{else}
	{if $status eq 'Available'}
	<input type="checkbox" name="domain[{$domain}{$tld}]" class="domainSelectToggle" value="1"{if $prices} checked{/if}>
	{/if} 
	{/if}
</td>
<td>{$domain}{$tld}</td>
<td>
	<span class="label {if $status eq 'Available'}label-success{else}label-danger{/if} domainStatusInfo" style="width: 80px; display: inline-block;">
		{if $status eq 'Available'}
		{$lang->_('Available')} 
		{elseif $status eq 'Taken'}
		{$lang->_('Taken')} 
		{elseif $status eq 'notvalid'}
		{$lang->_('Unknown TLD')}
		{else}
		{$lang->_('Error')} 
		{/if}
	</span> 
</td>
<td>
	{if $status eq 'Available'}
	<select name="domainreperiod[{$domain}{$tld}]" class="calculateSummary form-control input-sm">
		{if $prices}
		{foreach from=$prices key=period item=price}  
		<option value="{$period}" data-price="{$price.register}">{$period} {$lang->_('Year')} - {$currency.prefix} {$price.register} {$currency.suffix}
		</option>  
		{/foreach}
		{else}
		<option value="">{$lang->_("Not Applicable Pricings")}</option> 
		{/if} 
	</select>
	{elseif $status eq 'Taken'}
	<a href="http://{$domain}{$tld}" target="_blank">{$lang->_('WWW')}</a> | <a href="" onclick="popupWindow('orderdomain.php?action=whoisinfo&domain={$domain}{$tld}','whois',650,420);return false">{$lang->_('WHOIS')}</a> | <a href="orderdomain.php?action=transferDomain&domain={$domain}{$tld}">{$lang->_('TRANSFER')}</a>
	{/if}
</td>