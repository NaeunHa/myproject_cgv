/**
 * index
 */

$(document).ready(function () {
    $('.img_wrap').on({
        mouseenter: function(e){
            var target = e.target;
            $(target).parents('.movie').find('.movie_hover').css({'display':'flex'});
            $(target).parents('.movie').find('.limit_age').css({'display':'none'});
            $(target).parents('.movie').find('.d_day').css({'display':'none'});
            $(target).parents('.movie').find('.chart_count').css({'display':'none'});
        },
        mouseleave: function(e){
            var target = e.target;
            $(target).parents('.movie').find('.movie_hover').css({'display':'none'});
            $(target).parents('.movie').find('.limit_age').css({'display':'block'});
            $(target).parents('.movie').find('.d_day').css({'display':'flex'});
            $(target).parents('.movie').find('.chart_count').css({'display':'block'});
        }
    })
})