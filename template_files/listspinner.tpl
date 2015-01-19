{assign var=anyAvailable value=0}
<p class="lead">{$lang->_('Domain Suggestions')}</p>
<table class="table"> 
    <thead> 
        <tr>
            <th>{$lang->_('Domain Name')}</th>
            <th>{$lang->_('Status')}</th>
            <th>{$lang->_('More Info')}</th>
        </tr>
    </thead>
    <tbody>
        {foreach from=$suggestions key=k item=v}
        {if $v.status eq 'available' || $enableTransfer eq 1}
        {assign var=anyAvailable value=1}
        <tr>
            <td>{$v.domain}{$v.tld}</td>
            <td>
                <span class="label {if $v.status eq 'available'}label-success{else}label-danger{/if} domainStatusInfo" style="width: 80px; display: inline-block;">
                   {if $v.status eq 'available'} 
                   {$lang->_('Available')}
                   {elseif $enableTransfer eq 1}
                   {$lang->_('Taken')}
                   {/if} 
               </span>
           </td> 
           <td>
            {if $v.status eq 'available'} 
            <a  target="_blank"  class="btn btn-success" style="height:18px; padding-top:3px;" href="orderdomain.php?action=registerDomain&domain={$v.domain}{$v.tld}">
                <i class="fa fa-plus"></i> {$lang->_('Register')}
            </a>
            {* NO TRANSFER! *}
            {elseif $enableTransfer eq 1}
            <a  target="_blank" class="btn btn-danger" style="height:18px; padding-top:3px;" href="orderdomain.php?action=transferDomain&domain={$v.domain}{$v.tld}">
                <i class="fa fa-truck"></i> {$lang->_('Transfer')}</a>
                {/if} 
            </td>
        </tr>
        {/if}
        {/foreach}
        {if $anyAvailable neq 1}
        <tr>
            <td colspan="3">{$lang->_('No Domain Suggestions Available')}</td>
        </tr>
        {/if}        
    </tbody>
</table>