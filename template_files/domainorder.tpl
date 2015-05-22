{literal}
<script type="text/javascript">
    var TLDsConfig = {
        noRedirectAfterLookup: {/literal}{if $noRedirectAfterLookup == 1}true{else}false{/if}{literal},
        enableMultipleDomainSearch: {/literal}{if $enableMultipleDomainSearch == 1}true{else}false{/if}{literal},
        sortTldsVertically: {/literal}{if $sortTldsVertically == 1}true{else}false{/if}{literal}
    };
</script>
{/literal}
<div id="tldOrderFirstStep">
    <h2 class="formTitle">{$lang->_('Order New Domains')}</h2>
    <form method="post" id="tldFirstStep" {if $enableMultipleDomainSearch != 1}action="orderdomain.php?action=selectDomains"{else}action="orderdomain.php?action=selectDomains"{/if}>
        <div id="tldMessagesContainer"></div>
        <div id="tldOrderFirstStep">
            <p class="lead">{$lang->_('Please enter desired domain names')}</p>
            <div class="form-group">
                <input class="form-control input-lg" id="domainField" value="{$domainName}" name="domain" type="text" {if $enableMultipleDomainSearch != 1} placeholder="{$lang->_('eg. mydomain')}" {else} placeholder="{$lang->_('eg. mydomain,another')}" {/if} >
                <p class="help-block">{$lang->_('Choose at least one TLD to order')}</p>    
            </div>
            <hr>           
            <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <div class="input-group">
                      <input type="text" class="form-control" id="quickSearchTLD" placeholder="{$lang->_('Please Provide an Extension')}">
                      <span class="input-group-addon"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></span>
                  </div>
              </div>
              <ul class="list-group">
                <li class="list-group-item"><span class="badge">{$categoriesCount->total}</span> <a href="orderdomain.php?action=showDomainsFromCategory&catid=all" class="loadDomainsForCategory" data-category="all">{$lang->_('All Categories')}</a></li>
                {foreach from=$categories item=category}
                {if $category->parent_id eq 0}
                {if $category->assigned_domains_to_parent neq 0}
                <li class="list-group-item"><span class="badge">{$category->assigned_domains_to_parent}</span> <a href="orderdomain.php?action=showDomainsFromCategory&catid={$category->id}" class="loadDomainsForCategory" data-category="{$category->id}" data-parent="yes">{$category->title}</a></li>
                {/if}
                {else}
                {if $category->assigned_domains neq 0}
                <li class="list-group-item" style="padding-left:50px;display:none;" data-parentcategory="{$category->parent_id}"><span class="badge">{$category->assigned_domains}</span> <a href="orderdomain.php?action=showDomainsFromCategory&catid={$category->id}" class="loadDomainsForCategory" data-category="{$category->id}" data-parent="no">{$category->title}</a></li>
                {/if}
                {/if}
                {/foreach}
            </ul>
        </div>
        <div class="col-md-8">
            <div class="tab-content" id="tldsContentContainer">                        
                <p id="noDomainsInfoBox" class="alert alert-warning subhide"><span class="icon icon-warning-sign icon-white"></span> {$lang->_('This category has no available domains')}</p>
                {if $sortTldsVertically}
                <ul class="tldsVertically">
                    <li style="display: inline-block;" > 
                        {/if}
                        <div class="col-md-2" id="toggleAllTLDCheck">
                            <label class="domainLabel {if $sortTldsVertically}tldDiv{/if}"><input type="checkbox" value="" class="indeterminate selectAll"> <span class="domainName">{$lang->_('All')}</span></label>
                        </div> 
                        {if $sortTldsVertically}    
                    </li>
                    {/if}
                    {foreach from=$domains item=domain}
                    {if $sortTldsVertically}
                    <li style="display: inline-block;" class="tldDiv {if $domain.doubled}skipInSearchAll{/if}" data-extension="{$domain.extension}" data-category="{$domain.category}" data-categoryID="{$domain.categoryID}" data-parentID="{$domain.parentID}">
                        {/if}
                        <div class="col-md-2 tldDiv {if $domain.doubled}skipInSearchAll{/if}" data-extension="{$domain.extension}" data-category="{$domain.category}" data-categoryID="{$domain.categoryID}" data-parentID="{$domain.parentID}">
                            <label class="domainLabel {if $sortTldsVertically}tldDiv{/if}"><input type="checkbox" name="tld[]" value="{$domain.extension}" class="tldInput" style="display: inline;"> <span class="domainName">{$domain.extension}</span></label>
                        </div> 
                        {if $sortTldsVertically}  
                    </li>
                    {/if}
                    {/foreach}
                    {if $sortTldsVertically}
                </ul>
                {/if}
            </div>
        </div>
    </div>
    <hr>
    <div class="form-group pull-right">
        <button type="submit" {if $enableMultipleDomainSearch != 1}class="btn btn-default btn-lg tldFormCheckAvailabilityOne"{else}class="btn btn-default btn-lg tldFormCheckAvailability"{/if}> {$lang->_('Check Availability')}</button>
    </div>
</div>
</form> 
</div>
<div id="tldOrderSecondStepPreloader">   
</div>
<div id="tldOrderSecondStep" class="subhide">
    <div class="" id="tldsSelectContainer">
        {$lang->_('Please Wait Loading')}
    </div>
</div>
<div id="tldOrderSpinner" class="subhide"></div>