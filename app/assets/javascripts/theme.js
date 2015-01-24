var themes = {
    "default": "//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css",
    "flatly" : "//maxcdn.bootstrapcdn.com/bootswatch/3.3.1/flatly/bootstrap.min.css",
    "darkly" : "//maxcdn.bootstrapcdn.com/bootswatch/3.3.1/darkly/bootstrap.min.css",
}
$(function(){
   var themesheet = $('<link href="'+themes['default']+'" rel="stylesheet" />');
    themesheet.appendTo('head');
    $('.theme-link').click(function(){
       var themeurl = themes[$(this).attr('data-theme')];
        themesheet.attr('href',themeurl);
    });
});
