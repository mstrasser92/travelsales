$(function(){
    $.contextMenu({
        selector: '.context-menu-one', 
        callback: function(key, options) {
            var m = "clicked: " + key;
            window.console && console.log(m) || alert(m); 
        },
        items: {
            "Ändern": {name: "Edit", icon: "edit"},
            "Löschen": {name: "Delete", icon: "delete"},
        }
    });
    
    $('.context-menu-one').on('click', function(e){
        console.log('clicked', this);
    })
});


function popup (url) {
  fenster = window.open(url, "User", "width=400,height=300,resizable=yes");
  fenster.focus();
  return false;
 }