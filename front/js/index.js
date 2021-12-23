$(document).ready(function(){
    $(".hidden_wrap").css({display:"none"});
    $(".mn").mouseover(function(){
        if(!$(".nav").hasClass("active")){
            $(".hidden_wrap").slideDown(function(){
                $(".nav").addClass("active");
            });
        }
    });
    $(".hidden_wrap").mouseleave(function(){
        $(".hidden_wrap").slideUp(function(){
            $(".nav").removeClass("active");
        });
    });
})

