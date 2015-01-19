<div class="col-md-2">
    <label class="domainLabel"><input type="checkbox" value="" class="indeterminate selectAll" style="display: inline;"> <span class="domainName">All</span></label>
</div>
{foreach from=$domains item=domain}
<div class="col-md-2" data-extension="{$domain->extension}">
    <label class="domainLabel"><input type="checkbox" name="tld[]" value="{$domain->extension}" class="tldInput" style="display: inline;"> <span class="domainName">{$domain->extension}</span></label>
</div>
{/foreach}