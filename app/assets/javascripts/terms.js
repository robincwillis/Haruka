// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function() {

	var items = [];
	var map = {};
	var objects = [];

  $('#auto_complete').typeahead({source: function(query, process){  
      $.each(autocomplete_items, function(i,item){
          map[item.name] = item;
          items.push(item.name);
        });
        process(items);
      },
      updater: function (item) {
        objects.push(map[item]);

        // $.ajax({ 
        //   type: 'POST', 
        //   url: 'varients', 
        //   data: {'term_id' : $("input[name='report[start_date]']").val(), 
        //         'varient_id' : $("input[name='report[end_date]']").val() }, 
        //   success: function(data){
        //     //data is whatever you RETURN from your controller. 
        //     //an array, string, object...something 
        //   } 
        // });


        $("#varients").append("<li><b>"+map[item].name+"</b>  "+map[item].kanji+"</li>");
        console.log(objects);
        return '';
      }
  });   
});