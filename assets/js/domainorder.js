var counter=0;
var killEach = false;
var TLDsFormOrder = 
{
   alreadySelected : [],
   directFrom : false,
   initInputs : function() 
   {
        //alert(TLDsConfig.enableMultipleDomainSearch);
        if (typeof TLDsConfig != 'undefined'){
            if(TLDsConfig.enableMultipleDomainSearch == true)
            {
                if($('#domainField').length)
                   {
                       $('#domainField').tagsinput({
                            confirmKeys: [13,44,32,188 ]
                        });

                        $('#domainField').tagsinput('input').on('blur', function()
                        {
                           $('#domainField').tagsinput('add', $(this).val());
                           $(this).val('');
                        });
                   }
            }
        }

       $('.tldInput').on('click', function()
       {
           if($('.tldInput:checked').length > 0 && $('.tldInput:checked:visible').length < $('.tldInput:visible').length)
           {
               $('input[type="checkbox"].indeterminate').prop('checked', false);
               $('input[type="checkbox"].indeterminate').prop('indeterminate', true);
           }
           else if($('.tldInput:checked').length == $('.tldInput:visible').length)
           {
               $('input[type="checkbox"].indeterminate').prop('indeterminate', false);
               $('input[type="checkbox"].indeterminate').prop('checked', true);
           }
           else if($('.tldInput:checked').length == 0)
           {
               $('input[type="checkbox"].indeterminate').prop('indeterminate', false);
               $('input[type="checkbox"].indeterminate').prop('checked', false);
           }

           var $value = $(this).val();

           if(TLDsFormOrder.alreadySelected.indexOf($value) < 0)
           {
                TLDsFormOrder.alreadySelected.push($value);
           }
       });

       $('.tldInput').each(function(i, a) 
       {
           var $that = $(a);

           if(TLDsFormOrder.alreadySelected.indexOf($that.val()) >= 0)
           {
               $(a).prop('checked', true);
           }
       });

       $('.selectAll').on('click', function()
       {
           var $that = $(this);

           if($that.is(':checked'))
           {
               $('.tldInput:visible').prop('checked', true);
           }
           else
           {
               $('.tldInput:visible').prop('checked', false);
           }
       });
       
       // $('#domainOrderTabs').tabs({ disabled: [1] });
       
       // $('#domainField').tagsinput('input').on('keypress', function(e)
       // {
       //     var keyCode = e.which || e.keyCode;
       //     var value = String.fromCharCode(keyCode);
       //     //console.log(keyCode);
       //     if(!/^[a-zA-Z0-9]+$/.test(value))
       //     {
       //          e.preventDefault();
       //     }
       // });
   },
   putInStorage : function(key, value)
   {
       localStorage.setItem(key, value);
   },
   getFromStorage : function(key, defaultValue)
   {
       localStorage.getItem(key);
   },
   calculateCost :  function()
   {
       var $totalValue = 0;

       $('.calculateSummary option:selected').each(function() 
       {
           var $that = $(this);

           if($that.parent().parent().parent().find('td:first input.domainSelectToggle').is(':checked'))
           {
                var $value = parseFloat($that.data('price'));
                $totalValue += $value;
           }
       });

       $('#totalCostSummary').text(parseFloat($totalValue).toFixed(2));
   },
   loadDataForCategory : function(categoryID, parent)
   {
       //TLDsFormOrder.showPreloader('tldsContentContainer');
       //
       if(categoryID == 'all')
       {
           $('#noDomainsInfoBox').addClass('subhide');
           $('#toggleAllTLDCheck').show();
           $('[data-categoryID]').show(); //show all tlds
           $('[data-parentcategory]').hide(); //hide all subcategories
           $('.selectAll').removeAttr('checked');
       }
       else if (parent == 'yes')
       { 
          var inputs = $('[data-parentID="'+categoryID+'"]');
          var inputs2 = $('[data-categoryID="'+categoryID+'"]');
          var menus = $('[data-parentcategory="'+categoryID+'"]');

          if(inputs.length == 0 && inputs2.length == 0)
          {
              $('#toggleAllTLDCheck').hide();
              $('[data-parentID]').hide();  //hide all tlds
              $('[data-categoryID]').hide(); //hide all tlds
              $('#noDomainsInfoBox').removeClass('subhide');
          }
          else
          {
              $('#noDomainsInfoBox').addClass('subhide');
              $('#toggleAllTLDCheck').show();
              $('[data-parentID]').hide(); //hide all tlds
              $('[data-categoryID]').hide();  //hide all tlds
              $('[data-parentID="'+categoryID+'"]').show(); //show all tlds from subcategory
              $('[data-categoryID="'+categoryID+'"]').show(); //show all tlds from category
              $('.selectAll').removeAttr('checked'); //remove 'all' checked
          }

          if (menus.length == 0){
              $('[data-parentcategory]').hide(); //hide all subcategories
          } else {
              $('[data-parentcategory]').hide(); //hide all subcategories
              $('[data-parentcategory="'+categoryID+'"]').show(); //show subcategories from category
          }

       }
       else
       { 
          var inputs = $('[data-categoryID="'+categoryID+'"]');
          
          if(inputs.length == 0)
          {
              $('#toggleAllTLDCheck').hide();
              $('[data-categoryID]').hide(); //hide all tlds
              $('[data-parentID]').hide(); //hide all tlds
              $('#noDomainsInfoBox').removeClass('subhide');
          }
          else
          {
              $('#noDomainsInfoBox').addClass('subhide');
              $('#toggleAllTLDCheck').show();
              $('[data-categoryID]').hide(); 
              $('[data-categoryID="'+categoryID+'"]').show(); //show all tlds from subcategory
              $('.selectAll').removeAttr('checked');
          }
       }
       
       /*$.getJSON('orderdomain.php?action=showDomainsFromCategory&catid='+categoryID, function(result)
       {
           $('#tldsContentContainer').html(result.html);
       });*/
   },
   showPreloader : function(containerID, defaultText)
   {
       var loadingText = typeof defaultText == 'undefined' ? 'Please Wait, Loading...' : defaultText;
       
       $('#'+containerID).html('<div class="textcenter"><span><img src="images/loadingsml.gif"> '+ loadingText +'</span></div>');
   },
   makeAjaxCall: function (arr, value){
        if(counter<5){
            if (killEach){
                return false;
            }
            counter+=1;
            if (typeof arr[2] != 'undefined'){
                arr[1] = arr[1]+'.'+arr[2];
            }
            var checkFirst = $('#checkFirstAvailable').val();
            var checkFirstCondition = $('#checkFirstAvailableCondition').val();
            $('#checkFirstAvailable').val(0);
            if (typeof checkFirstCondition != 'undefined'){
              var data = '&checkFirstAvailable='+checkFirst+'&checkFirstAvailableCondition='+checkFirstCondition;
            } else {
              var data ='';
            }
            $.ajax(
                  {
                    url:'orderdomain.php?action=checkAvailabilityOne', 
                    dataType:'json', 
                    data: 'domain='+arr[0]+'&tld='+'.'+arr[1]+data,
                    timeout: 18000, 
                    async: true,
                    cache: false,
                    success:function(result){
                      counter-=1;
                      if (result.status == 'Available') {
                          $('#toCartButton').show();
                           $(value).html(result.htmlInput);
                      } else if (result.status == 'Taken') {
                           $(value).html(result.htmlInput);
                      } else {
                          $(value).html(result.htmlInput);
                          //$(value).remove();
                      }
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                      counter-=1;
                           $(value).html('<td></td><td><span style="font-size: 16px;">'+arr[0]+'.'+arr[1]+'</span></td><td><span class="label label-danger domainStatusInfo" style="width: 80px; display: inline-block;">Timeout</span></td><td></td>');
                    } 
                });
        }
        else {
            
            if (killEach){
                return false;
            }
            setTimeout(function(){TLDsFormOrder.makeAjaxCall(arr,value);}, 500); 
        }
   },
   checkAvailabilityOne : function(element)
   {
        //prepare for post
        var alltld = [];
        $('.tldInput').each(function(){
              if ($(this).is(':checked')){
                  alltld.push($(this).val());
              }
              if (TLDsFormOrder.directForm){
                    alltld.push($(this).val());
              }
        });
        var $self = this;
        var $domains = $('#domainField').val();
        var $tlds = $('.tldInput').serialize();
        
        element.prop('disabled', 'disabled'); 

        $('#tldMessagesContainer').html('');

        this.showPreloader('tldOrderSecondStepPreloader');
        
        $('#tldOrderSecondStep').html('');
        $('#tldOrderSecondStep').show();
        var totalprice=0;
        $.ajax({
            url:'orderdomain.php?action=showDomains',
            type: "post",
            dataType: 'json',
            data:  {domains: $domains, tld: alltld},
          
            success: function(result)
            { 
                killEach = false;
                if(typeof result.error != 'undefined')
                {
                    element.prop('disabled', false);
                    $('#tldOrderSecondStepPreloader').hide();
                    $self.errorMessage(result.error);
                } else {
                    $('#tldOrderSecondStepPreloader').hide();
                    $('#tldOrderSecondStep').show();
                    $('#tldOrderSecondStep').html(result.html);
                    $('#toCartButton').hide();
                    element.prop('disabled', false);
                    $('#tldOrderFirstStep').hide();
                    $("#domainCheckForm tbody  tr").each(function(index, value ){
                          var domain = $(this).attr('data-domain');
                          if (typeof domain != 'undefined'){
                              var arr = domain.split('.');
                              TLDsFormOrder.makeAjaxCall(arr,value);
                            
                          }
                          if (killEach){
                              return false;
                          }
                          
                    });
                    $.getJSON('orderdomain.php?action=showSpinner', {'domains': $domains, 'tlds':$tlds, 'nousedomains' : $domains}, function(result) {
                          if (typeof result.error == 'undefined') {
                                $('#tldOrderSpinner').show();
                                $('#tldOrderSpinner').html(result.html);
                          }
                    });
                }
            }
        });  
   },
   checkAvailability : function(element)
   {
        
        var $self = this;
        var $domains = $('#domainField').val();
        var $tlds = $('.tldInput').serialize();
        
        element.prop('disabled', 'disabled');
        
        $('#tldMessagesContainer').html('');

        this.showPreloader('tldOrderSecondStepPreloader');

        //prepare for post
        var alltld = [];
        $('.tldInput').each(function(){
            if ($(this).is(':checked')){
                alltld.push($(this).val());
            }
        });
        $.ajax({
            url:'orderdomain.php?action=checkAvailability',
            type: "post",
            dataType: 'json',
            data:  {domains: $domains, tld: alltld},
          
            success: function(result)
            { 
                $('#tldOrderSecondStepPreloader').html('');
            
                if(typeof result.error != 'undefined')
                {
                    element.prop('disabled', false);
                    $self.errorMessage(result.error);
                }
                else
                {
                    $('#tldFirstStep').submit();
                }
            }
        });  
        
        $('#tldFirstStep').on('submit', function(e)
        {
            $('.tldFormCheckAvailability').prop('disabled', false);
            $('#tldOrderSecondStep').removeClass('subhide');
            
            if(TLDsConfig.noRedirectAfterLookup == true)
            {
               $.getJSON('orderdomain.php?action=selectDomains&_ajax=1', function(result) 
               {
                   $('#tldOrderFirstStep').slideToggle();
                   $.getJSON('orderdomain.php?action=showSpinner', {'domains': $domains, 'tlds':$tlds, 'nousedomains' : $domains}, function(result) {
                          if (typeof result.error == 'undefined') {
                                $('#tldOrderSpinner').show();
                                $('#tldOrderSpinner').html(result.html);
                          }
                    });
                   TLDsFormOrder.scrollTo('#tldOrderSecondStep');
                   
                   $('#tldsSelectContainer').html(result.html);
               });
               
               e.preventDefault();
            }
        });
   },
   scrollTo : function(element)
   {
       $('html, body').animate({
            scrollTop: $(element).offset().top
       }, 2000);
   },
   errorMessage : function(message)
   {
       $('#tldMessagesContainer').html('<div class="alert alert-dismissable alert-danger"><button type="button" class="close closeTLDMessage" data-dismiss="alert">×</button>'+message+'</div>');
       this.scrollTo('#tldMessagesContainer');
       
       $('.closeTLDMessage').on('click', function()
       {
          $(this).parent().fadeOut(); 
       });
   },
   quickTLDSearch : function()
   {
       $('#quickSearchTLD').on('keyup', function()
       {
            var $that = $(this);
            var value = $that.val();

            if(value == '')
            {
                $('[data-extension]').show();
            }
            else
            {
                $('[data-extension]').hide();
                $('[data-extension*="'+ value +'"]').show();
            }
       });
   },
    getParameterValueFromUrl: function (name, url){
        name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
        var regexS = "[\\?&]"+name+"=([^&#]*)";
        var regex = new RegExp( regexS );
        var results = regex.exec( url );
        if( results == null )
            return null;
        else
            return results[1];
    },
};

$(function()
{
    TLDsFormOrder.initInputs();
    //TLDsFormOrder.loadDataForCategory('all');
    
    TLDsFormOrder.quickTLDSearch();
    
    $(document).on('change', '.calculateSummary', function()
    {
        TLDsFormOrder.calculateCost();
    }).on('click', '.domainSelectToggle', function()
    {
        TLDsFormOrder.calculateCost();
    }).ajaxComplete(function() {
        TLDsFormOrder.calculateCost();
        //TLDsFormOrder.displayToCart();
    }).ready(function(){
      if (TLDsFormOrder.getParameterValueFromUrl('directForm', window.location.href) !== null){
            TLDsFormOrder.directForm = true;
            TLDsFormOrder.checkAvailabilityOne($(this));
        }
    });
    
    $('.tldPushDomain').on('click', function(e)
    {
        var $self = $(this);
        
        e.preventDefault();
    });
    
    $('.loadDomainsForCategory').on('click', function(e)
    {
        TLDsFormOrder.loadDataForCategory($(this).attr('data-category'), $(this).attr('data-parent'));
        e.preventDefault(); 
    });
    
    $('.tldFormCheckAvailability').on('click', function(e)
    {
        TLDsFormOrder.checkAvailability($(this));
        e.preventDefault();
    }); 
    $('.tldFormCheckAvailabilityOne').on('click', function(e)
    {
        TLDsFormOrder.checkAvailabilityOne($(this));
        e.preventDefault();
    }); 

    $('a').click(function(event) {
        killEach = true;
    });
});
