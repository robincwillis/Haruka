$(document).ready(function() {

  //Hack, tooltips screw up mobile touches
  $('.has-tooltip').on('show', function (e) {
    if ('ontouchstart' in document.documentElement) e.preventDefault();
  });

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

        $.ajax({
          //TODO: should not hardcode this but fetch it from erb view
          url: "/varients",
          data: JSON.stringify(object),
          contentType: 'application/json',
          dataType: 'json',
          type: "POST",
          success: function(data) {
              console.log(data);
              //This is so ugly, bad bad bad
              var html='<li><p><a href="/terms/'+data.term_varient.id+'">'+data.term_varient.name+' </a><span class="light">'+data.term_varient.kanji+' '+data.term_varient.kana+'</span> ';

              //not working, cant destroy objects with links, need to do it with a form, urg
              html+= '<a href="/varients/'+data.varient.id+'" data-method="delete" data-confirm="Are you sure?" rel="nofollow" title="Delete" class="btn btn-mini btn-danger"><i class="icon-remove icon-white"></i></a>';
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