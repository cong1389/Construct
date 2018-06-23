
jQuery(document).ready(function () {



    Project();

    jQuery('.popup-youtube, .popup-vimeo, .popup-gmaps').magnificPopup({
        disableOn: 700,
        type: 'iframe',
        mainClass: 'mfp-fade',
        removalDelay: 160,
        preloader: false,

        fixedContentPos: false
    });

    jQuery("#owl-example").owlCarousel({

        // Most important owl features
        items: 4,
        itemsCustom: false,
        itemsDesktop: [1199, 4],
        itemsDesktopSmall: [980, 6],
        itemsTablet: [767, 3],
        itemsTabletSmall: true,
        itemsMobile: [480, 1],
        singleItem: false,
        itemsScaleUp: false,

        //Basic Speeds
        slideSpeed: 1,
        paginationSpeed: 1,
        rewindSpeed: 1,

        //Autoplay
        autoPlay: true,
        stopOnHover: false,

        // Navigation
        navigation: false,
        navigationText: ["prev", "next"],
        rewindNav: true,
        scrollPerPage: false,

        //Pagination
        pagination: true,
        paginationNumbers: false,

        // Responsive 
        responsive: true,
        responsiveRefreshRate: 200,
        responsiveBaseWidth: window,

        // CSS Styles
        baseClass: "owl-carousel",
        theme: "owl-theme",

        //Lazy load
        lazyLoad: false,
        lazyFollow: true,
        lazyEffect: "fade",

        //Auto height
        autoHeight: true,

        //JSON 
        jsonPath: false,
        jsonSuccess: false,

        //Mouse Events
        dragBeforeAnimFinish: true,
        mouseDrag: true,
        touchDrag: true,

        //Transitions
        transitionStyle: false,

        // Other
        addClassActive: false,

        //Callbacks
        beforeUpdate: false,
        afterUpdate: false,
        beforeInit: false,
        afterInit: false,
        beforeMove: false,
        afterMove: false,
        afterAction: false,
        startDragging: false,
        afterLazyLoad: false

    })

    //Fix top
    var topheader = jQuery("#topbar-wrapper");
    var header = jQuery("#header-wrapper");
    var navHomeY = header.offset().top;
    var isFixed = false;
    var scrolls_pure = parseInt("250");
    var $w = jQuery(window);
    $w.scroll(function (e) {
        var scrollTop = $w.scrollTop();
        var shouldBeFixed = scrollTop > scrolls_pure;
        if (shouldBeFixed && !isFixed) {
            header.addClass("sticky");
            topheader.addClass("hidden");
            isFixed = true;
        } else if (!shouldBeFixed && isFixed) {
            header.removeClass("sticky");
            topheader.removeClass("hidden");
            isFixed = false;
        }
        e.preventDefault();
    });


    VisablePageInfo();

    // Menu divSocial product detail 
    var divSocial = jQuery('.divSocial').offset();
    var window_height = jQuery(window).height();

    jQuery(window).on('scroll load', function (event) {
        if (jQuery(window).width() >= 1024) {

            //var productrelate = jQuery('.block_productrelate').offset();
            //var topRelease = productrelate.top;

            var divSocial_width = jQuery('.vc_col-sm-4').width();
            var st = jQuery(this).scrollTop();

            var divContainDetail = jQuery('.divContainDetail').height();                    

            if (st > 230 && st <= divContainDetail) {
                jQuery('.divSocial').addClass('divSocialFix');
                jQuery('.divSocial').width(divSocial_width - 30);;

            }
            else if (st > divContainDetail) {
                jQuery('.divSocial').removeClass('divSocialFix');
                jQuery('.divSocial').width('');;
            }
            else {
                jQuery('.divSocial').removeClass('divSocialFix');
                jQuery('.divSocial').width('');;
            }
        }
    });
});

//Replace ký tự đặc biệt
function RemoveUnicode(text) {
    var result;

    //Đổi chữ hoa thành chữ thường
    result = text.toLowerCase();

    // xóa dấu
    result = result.replace(/(à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ)/g, 'a');
    result = result.replace(/(è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ)/g, 'e');
    result = result.replace(/(ì|í|ị|ỉ|ĩ)/g, 'i');
    result = result.replace(/(ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ)/g, 'o');
    result = result.replace(/(ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ)/g, 'u');
    result = result.replace(/(ỳ|ý|ỵ|ỷ|ỹ)/g, 'y');
    result = result.replace(/(đ)/g, 'd');
    // Xóa ký tự đặc biệt
    result = result.replace(/([^0-9a-z-\s])/g, '');
    // Xóa khoảng trắng thay bằng ký tự -
    result = result.replace(/(\s+)/g, '-');
    // xóa phần dự - ở đầu
    result = result.replace(/^-+/g, '');
    // xóa phần dư - ở cuối
    result = result.replace(/-+$/g, '');

    return result;
}

function GetLink3Param(pageName, langId, catId) {
    re = "/" + pageName + "/" + langId + "/" + catId;
    return re;
}

function GetLink5Param(pageName, langId, item, destination, day) {
    var result = "/" + pageName + "/" + langId;
    if (item != "") {
        result = result + "/" + RemoveUnicode(item);
    }
    if (destination != "") {
        result = result + "/" + destination;
    }
    if (day != "") {
        result = result + "/" + day;
    }
    re = result;
    return re;
}

function checkEnter(e) { //e is event object passed from function invocation
    var characterCode //literal character code will be stored in this variable

    if (e && e.which) { //if which property of event object is supported (NN4)
        e = e;
        characterCode = e.which;  //character code is contained in NN4's which property
    }
    else {
        e = event;
        characterCode = e.keyCode;  //character code is contained in IE's keyCode property
    }
    if (characterCode == 13) { //if generated character code is equal to ascii 13 (if enter key)
        submitButtonSearchThemes('search'); //submit the form
        return false;
    }
    else {
        return true;
    }
}

function VisablePageInfo() {
    jQuery(".info").addClass("hidden");

    jQuery(".nextprev").addClass("hidden");
}

function OpenMenu() {
    var e = $(".overlapblackbg, .slideLeft, .wsmenuMobile"),
        n = $(".wsmenucontent, .wsmenuMobile"),
        l = function () {
            $(e).removeClass("menuclose").addClass("menuopen")
        },
        u = function () {
            $(e).removeClass("menuopen").addClass("menuclose")
        };
    $("#navToggle").click(function () {
        $(n.hasClass("menuopen") ? $(e).removeClass("menuopen").addClass("menuclose") : $(e).removeClass("menuclose").addClass("menuopen"));
    })
    , n.click(function () {
        n.hasClass("menuopen") && $(u)
    }), $("#navToggle,.overlapblackbg").on("click", function () {
        $(".wsmenucontainer").toggleClass("mrginleft")
    })
    , $(".wsmenu-list li").has(".wsmenu-submenu, .wsmenu-submenu-sub, .wsmenu-submenu-sub-sub").prepend('<span class="wsmenu-click"><i class="wsmenu-arrow fa fa-angle-down"></i></span>'), $(".wsmenu-list li").has(".megamenu").prepend('<span class="wsmenu-click"><i class="wsmenu-arrow fa fa-angle-down"></i></span>')
    , $(".wsmenu-mobile").click(function () {
        $(".wsmenu-list").slideToggle("slow")
    }), $(".wsmenu-click").click(function () {
        $(this).siblings(".wsmenu-submenu").slideToggle("slow")
        , $(this).children(".wsmenu-arrow").toggleClass("wsmenu-rotate")
        , $(this).siblings(".wsmenu-submenu-sub").slideToggle("slow")
        , $(this).siblings(".wsmenu-submenu-sub-sub").slideToggle("slow")
        , $(this).siblings(".megamenu").slideToggle("slow")
    })
};

function SetSlideDetail() {

    jQuery(document).ready(function ($) {

        var _CaptionTransitions = [];
        _CaptionTransitions["L"] = { $Duration: 900, x: 0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
        _CaptionTransitions["R"] = { $Duration: 900, x: -0.6, $Easing: { $Left: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
        _CaptionTransitions["T"] = { $Duration: 900, y: 0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
        _CaptionTransitions["B"] = { $Duration: 900, y: -0.6, $Easing: { $Top: $JssorEasing$.$EaseInOutSine }, $Opacity: 2 };
        _CaptionTransitions["ZMF|10"] = { $Duration: 900, $Zoom: 11, $Easing: { $Zoom: $JssorEasing$.$EaseOutQuad, $Opacity: $JssorEasing$.$EaseLinear }, $Opacity: 2 };
        _CaptionTransitions["RTT|10"] = { $Duration: 900, $Zoom: 11, $Rotate: 1, $Easing: { $Zoom: $JssorEasing$.$EaseOutQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInExpo }, $Opacity: 2, $Round: { $Rotate: 0.8 } };
        _CaptionTransitions["RTT|2"] = { $Duration: 900, $Zoom: 3, $Rotate: 1, $Easing: { $Zoom: $JssorEasing$.$EaseInQuad, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInQuad }, $Opacity: 2, $Round: { $Rotate: 0.5 } };
        _CaptionTransitions["RTTL|BR"] = { $Duration: 900, x: -0.6, y: -0.6, $Zoom: 11, $Rotate: 1, $Easing: { $Left: $JssorEasing$.$EaseInCubic, $Top: $JssorEasing$.$EaseInCubic, $Zoom: $JssorEasing$.$EaseInCubic, $Opacity: $JssorEasing$.$EaseLinear, $Rotate: $JssorEasing$.$EaseInCubic }, $Opacity: 2, $Round: { $Rotate: 0.8 } };
        _CaptionTransitions["CLIP|LR"] = { $Duration: 900, $Clip: 15, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic }, $Opacity: 2 };
        _CaptionTransitions["MCLIP|L"] = { $Duration: 900, $Clip: 1, $Move: true, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic } };
        _CaptionTransitions["MCLIP|R"] = { $Duration: 900, $Clip: 2, $Move: true, $Easing: { $Clip: $JssorEasing$.$EaseInOutCubic } };

        var options = {
            $FillMode: 2,                                       //[Optional] The way to fill image in slide, 0 stretch, 1 contain (keep aspect ratio and put all inside slide), 2 cover (keep aspect ratio and cover whole slide), 4 actual size, 5 contain for large image, actual size for small image, default value is 0
            $AutoPlay: true,                                    //[Optional] Whether to auto play, to enable slideshow, this option must be set to true, default value is false
            $AutoPlayInterval: 4000,                            //[Optional] Interval (in milliseconds) to go for next slide since the previous stopped if the slider is auto playing, default value is 3000
            $PauseOnHover: 1,                                   //[Optional] Whether to pause when mouse over if a slider is auto playing, 0 no pause, 1 pause for desktop, 2 pause for touch device, 3 pause for desktop and touch device, 4 freeze for desktop, 8 freeze for touch device, 12 freeze for desktop and touch device, default value is 1

            $ArrowKeyNavigation: true,   			            //[Optional] Allows keyboard (arrow key) navigation or not, default value is false
            $SlideEasing: $JssorEasing$.$EaseOutQuint,          //[Optional] Specifies easing for right to left animation, default value is $JssorEasing$.$EaseOutQuad
            $SlideDuration: 800,                               //[Optional] Specifies default duration (swipe) for slide in milliseconds, default value is 500
            $MinDragOffsetToSlide: 20,                          //[Optional] Minimum drag offset to trigger slide , default value is 20
            $SlideWidth: 750,                                 //[Optional] Width of every slide in pixels, default value is width of 'slides' container
            $SlideHeight: 500,                                //[Optional] Height of every slide in pixels, default value is height of 'slides' container
            $SlideSpacing: 0, 					                //[Optional] Space between each slide in pixels, default value is 0
            $DisplayPieces: 1,                                  //[Optional] Number of pieces to display (the slideshow would be disabled if the value is set to greater than 1), the default value is 1
            $ParkingPosition: 0,                                //[Optional] The offset position to park slide (this options applys only when slideshow disabled), default value is 0.
            $UISearchMode: 1,                                   //[Optional] The way (0 parellel, 1 recursive, default value is 1) to search UI components (slides container, loading screen, navigator container, arrow navigator container, thumbnail navigator container etc).
            $PlayOrientation: 1,                                //[Optional] Orientation to play slide (for auto play, navigation), 1 horizental, 2 vertical, 5 horizental reverse, 6 vertical reverse, default value is 1
            $DragOrientation: 1,                                //[Optional] Orientation to drag slide, 0 no drag, 1 horizental, 2 vertical, 3 either, default value is 1 (Note that the $DragOrientation should be the same as $PlayOrientation when $DisplayPieces is greater than 1, or parking position is not 0)

            $CaptionSliderOptions: {                            //[Optional] Options which specifies how to animate caption
                $Class: $JssorCaptionSlider$,                   //[Required] Class to create instance to animate caption
                $CaptionTransitions: _CaptionTransitions,       //[Required] An array of caption transitions to play caption, see caption transition section at jssor slideshow transition builder
                $PlayInMode: 1,                                 //[Optional] 0 None (no play), 1 Chain (goes after main slide), 3 Chain Flatten (goes after main slide and flatten all caption animations), default value is 1
                $PlayOutMode: 3                                 //[Optional] 0 None (no play), 1 Chain (goes before main slide), 3 Chain Flatten (goes before main slide and flatten all caption animations), default value is 1
            },

            $BulletNavigatorOptions: {                          //[Optional] Options to specify and enable navigator or not
                $Class: $JssorBulletNavigator$,                 //[Required] Class to create navigator instance
                $ChanceToShow: 2,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                $AutoCenter: 1,                                 //[Optional] Auto center navigator in parent container, 0 None, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                $Steps: 1,                                      //[Optional] Steps to go for each navigation request, default value is 1
                $Lanes: 1,                                      //[Optional] Specify lanes to arrange items, default value is 1
                $SpacingX: 8,                                   //[Optional] Horizontal space between each item in pixel, default value is 0
                $SpacingY: 8,                                   //[Optional] Vertical space between each item in pixel, default value is 0
                $Orientation: 1                                 //[Optional] The orientation of the navigator, 1 horizontal, 2 vertical, default value is 1
            },

            $ArrowNavigatorOptions: {                           //[Optional] Options to specify and enable arrow navigator or not
                $Class: $JssorArrowNavigator$,                  //[Requried] Class to create arrow navigator instance
                $ChanceToShow: 1,                               //[Required] 0 Never, 1 Mouse Over, 2 Always
                $AutoCenter: 2,                                 //[Optional] Auto center arrows in parent container, 0 No, 1 Horizontal, 2 Vertical, 3 Both, default value is 0
                $Steps: 1                                       //[Optional] Steps to go for each navigation request, default value is 1
            }
        };

        var jssor_slider1 = new $JssorSlider$("slider1_container", options);

        //responsive code begin
        //you can remove responsive code if you don't want the slider scales while window resizes
        function ScaleSlider() {
            var bodyWidth = document.body.clientWidth;
            if (bodyWidth)
                jssor_slider1.$ScaleWidth(Math.min(bodyWidth, 750));
            else
                window.setTimeout(ScaleSlider, 30);
        }

        ScaleSlider();

        if (!navigator.userAgent.match(/(iPhone|iPod|iPad|BlackBerry|IEMobile)/)) {
            $(window).bind('resize', ScaleSlider);
        }


        //if (navigator.userAgent.match(/(iPhone|iPod|iPad)/)) {
        //    $(window).bind("orientationchange", ScaleSlider);
        //}
        //responsive code end
    });
};



function st_buildingx_PopupCenterDual(url, title, w, h) {
    // Fixes dual-screen position Most browsers Firefox
    var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
    var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
    width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
    height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

    var left = ((width / 2) - (w / 2)) + dualScreenLeft;
    var top = ((height / 2) - (h / 2)) + dualScreenTop;
    var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

    // Puts focus on the newWindow
    if (window.focus) {
        newWindow.focus();
    }
}


//scroll dự án
function Project() {
    var owl = jQuery("#divProject");
    owl.owlCarousel({
        items: 4,
        pagination: false
    });
    // Custom Navigation Events
    jQuery(".divProject-navigation .next").click(function () {
        owl.trigger('owl.next');
    });
    jQuery(".divProject-navigation .prev").click(function () {
        owl.trigger('owl.prev');
    });
};
