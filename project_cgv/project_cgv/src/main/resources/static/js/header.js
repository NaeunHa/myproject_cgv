$(document).ready(function () {
    
    
    $('.mn').on({
        mouseenter: function (e) {
            var target = e.target;
            $(target).parents('.main_nav').find('.sub_nav').slideDown(200, function () {
                $('.nav').addClass('active');
            });
        },
        click: function (e) {
            var target = e.target;
            if (!$('.nav').hasClass('active')) {
                $(this).trigger('mouseenter');
            } else {
                $('.nav').trigger('mouseleave');
            }
        }
    });

    $('.nav').on({
        mouseleave: function (e) {
            $(this).find('.sub_nav').slideUp(200, function () {
                $('.nav').removeClass('active');
            });
        }
    });

    $(this).on({
        scroll: function (e) {
            /* S GNB fixed */
            var headerOffsetT = $('#header').offset().top;
            var headerOuterH = $('#header').outerHeight(true);
            var fixedHeaderPosY = headerOffsetT + headerOuterH;
            var scrollT = $(this).scrollTop();
            var scrollL = $(this).scrollLeft();

            if (scrollT >= fixedHeaderPosY) {
                $('.nav').addClass('fixed');
                $('.fixedBtn_wrap').addClass('topBtn');
            } else {
                $('.nav').removeClass('fixed');
                $('.fixedBtn_wrap').removeClass('topBtn');
            }

            /* S > GNB fixed 좌우 스크롤
            Description
            - GNB가 fixed 되었을때 좌우 스크롤 되게 처리
            */
            if ($('.nav').hasClass('fixed')) {
                $('.nav').css({ 'left': -1 * scrollL })
            } else {
                $('.nav').css({ 'left': 0 })
            }
            /* E > GNB fixed 좌우 스크롤 */
            /* S GNB fixed */
        }
    });

    $('.btn_gotoTop').on({
        click: function () {
            $('html, body').stop().animate({
                scrollTop: '0'
            }, 400);
        }
    });

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
});
