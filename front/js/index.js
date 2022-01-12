$(document).ready(function(){
    $(".mn").mouseover(function(){
        if(!$(".nav").hasClass("active")){
            $(".sub_nav").slideDown(300,function(){
                $(".nav").addClass("active");
            });
        }
    });
    $(".main_nav").mouseleave(function(){
        $(".sub_nav").slideUp(300, function(){
            $(".nav").removeClass("active");
        });
    });
})
