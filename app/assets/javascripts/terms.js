// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready(function() {

  $('#vote-up').tooltip();
  $('#vote-down').tooltip();
  $('#accuracy').tooltip();
  $('#flag').tooltip();
  $('#save').tooltip();
  $('#edit').tooltip();
  $('#delete').tooltip();

  var accuracy = $("#accuracy").data("accuracy");
  $('.accuracy-bar-mask').width(accuracy);

	var map = {};


  $('#auto_complete').typeahead({source: function(query, process){  
      var items = [];
      $.each(autocomplete_items, function(i,item){
          map[item.name] = item;
          if(item.id != term.id){
            items.push(item.name);            
          }
        });
        process(items);
      },
      updater: function (item) {

        var object = {"term_id":term.id,"term_varient_id":map[item].id};
        console.log(object);
        $.ajax({
          //TODO: should not hardcode this but fetch it from erb view
          url: "/varients",
          data: JSON.stringify(object),
          contentType: 'application/json',
          dataType: 'json',
          type: "POST",
          success: function(data) {
              console.log( "Data Saved: " + JSON.stringify(data) );
              //This is so ugly, bad bad bad
              var html='<li><p><a href="/terms/'+data.id+'">'+data.name+' </a><span class="light">'+data.kanji+' '+data.kana+'</span> ';

              //not working, cant destroy objects with links, need to do it with a form, urg
              //html+= '<a href="/varients/'+data.id+'" data-method="delete" data-confirm="Are you sure?" rel="nofollow" title="Delete" class="btn btn-mini btn-danger"><i class="icon-remove icon-white"></i></a>';
              html+='</p></li>';
              $("#varients").append(html);    
          },
          failure: function() {
              console.log("Unsuccessful");
          }
        });

return '';
      }
  });   
});