/*
 *警告框 
 */
function alertBox(){
        bootbox.dialog({
          message: "<span class='bigger-110'>I am a custom dialog with smaller buttons</span>",
          buttons:
          {
            "success" :
             {
              "label" : "<i class='ace-icon fa fa-check'></i> Success!",
              "className" : "btn-sm btn-success",
              "callback": function() {
                //Example.show("great success");
              }
            },
            "danger" :
            {
              "label" : "Danger!",
              "className" : "btn-sm btn-danger",
              "callback": function() {
                //Example.show("uh oh, look out!");
              }
            }, 
            "click" :
            {
              "label" : "Click ME!",
              "className" : "btn-sm btn-primary",
              "callback": function() {
                //Example.show("Primary button");
              }
            }, 
            "button" :
            {
              "label" : "Just a button...",
              "className" : "btn-sm"
            }
          }
        });     
      }  
        
