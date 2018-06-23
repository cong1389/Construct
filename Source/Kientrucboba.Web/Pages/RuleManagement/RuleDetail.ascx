<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RuleDetail.ascx.cs" Inherits="Cb.Web.Pages.RuleManagement.RuleDetail" %>

<!--RuleDetail-->
<asp:Literal runat="server" ID="ltrHeaderCategory"></asp:Literal>

<script type="application/javascript" src="/Scripts/iscroll.js"></script>
<div id="content-wrapper" class="not-vc ">

    <div class="container">
        <div class="row">
            <div id="main-wrapper" class="col-md-12">

                <!-- post entry -->
                <article id="post-2350" class="portfolio-single post-2350 st_portfolio type-st_portfolio status-publish has-post-thumbnail hentry">

                    <div class="post-content">

                        <div class="vc_row wpb_row vc_row-fluid vc_custom_1450689182614 wpb_padding">

                            <div class="wpb_column vc_column_container vc_col-sm-12">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">

                                        <script type="text/javascript">

                                            //Remove submit form
                                            jQuery(document).on("keypress", "form", function (event) {
                                                return event.keyCode != 13;
                                            });

                                            var rulerLength = 1000;
                                            var trimStart = 0;
                                            var trimEnd = 1000;

                                            var myScroll;

                                            function pullRightAction() {
                                                if (trimStart > 0) {
                                                    jQuery('#loban-scroller').width(function (i, width) {
                                                        return width + 10000;
                                                    });
                                                    trimStart -= rulerLength;
                                                    var qStr = '?trimStart=' + trimStart + '&rulerLength=' + rulerLength;
                                                    var newLi = jQuery('<li>').append(jQuery('<img/>', { src: '<%=Template_path%>/Images/thuoc522.png' + qStr }))
                                                                         .append(jQuery('<img/>', { src: '<%=Template_path%>/Images/thuoc429.png' + qStr }))
                                                                         .append(jQuery('<img/>', { src: '<%=Template_path%>/Images/thuoc388.png' + qStr }));
                                                    jQuery('#loban-thelist').prepend(newLi);
                                                    myScroll.refresh();
                                                }
                                            }

                                            function pullLeftAction() {
                                                if (trimEnd < 50000) {
                                                    jQuery('#loban-scroller').width(function (i, width) {
                                                        return width + 10000;
                                                    });
                                                    var qStr = '?trimStart=' + trimEnd + '&rulerLength=' + rulerLength;
                                                    var newLi = jQuery('<li>').append(jQuery('<img/>', { src: '<%=Template_path%>/Images/thuoc522.png' + qStr }))
                                                                         .append(jQuery('<img/>', { src: '<%=Template_path%>/Images/thuoc429.png' + qStr }))
                                                                         .append(jQuery('<img/>', { src: '<%=Template_path%>/Images/thuoc388.png' + qStr }));
                                                    trimEnd += rulerLength;
                                                    jQuery('#loban-thelist').append(newLi);
                                                    myScroll.refresh();
                                                }
                                            }

                                            function loaded() {
                                                Math.nativeRound = Math.round;
                                                Math.round = function (i, iDecimals) {
                                                    if (!iDecimals)
                                                        return Math.nativeRound(i);
                                                    else
                                                        return Math.nativeRound(i * Math.pow(10, Math.abs(iDecimals))) / Math.pow(10, Math.abs(iDecimals));

                                                };

                                                myScroll = new iScroll('loban-wrapper', {
                                                    mouseWheel: true,
                                                    scrollbars: true,
                                                    useTransition: true,
                                                    leftOffset: jQuery('#pullRight').outerWidth(true),
                                                    onRefresh: function () {
                                                        jQuery('#thanhdo').css({ 'left': jQuery('#lobanOuter').width() / 2 + 'px' });
                                                        jQuery('#container-sodo').css({ 'left': (jQuery('#lobanOuter').width() / 2 - 28) + 'px' });
                                                        if (jQuery('#pullRight').hasClass('loading')) {
                                                            jQuery('#pullRight').removeClass('loading');
                                                            jQuery('#pullRight .pullRightLabel').html('Kéo qua phải...');
                                                        } else if (jQuery('#pullLeft').hasClass('loading')) {
                                                            jQuery('#pullLeft').removeClass('loading');
                                                            jQuery('#pullLeft .pullLeftLabel').html('Kéo qua trái...');
                                                        }
                                                        jQuery('#sodoLoban').html(Math.round((-this.x + jQuery('#lobanOuter').width() / 2) / 100, 1) + ' cm');
                                                        jQuery('#sodo').val(Math.round((-this.x + jQuery('#lobanOuter').width() / 2) / 10, 0));
                                                    },
                                                    onScrollMove: function () {
                                                        jQuery('#sodoLoban').html(Math.round((-this.x + jQuery('#lobanOuter').width() / 2) / 100, 1) + ' cm');
                                                        jQuery('#sodo').val(Math.round((-this.x + jQuery('#lobanOuter').width() / 2) / 10, 0));
                                                    },
                                                    onScrollEnd: function () {
                                                        console.log("onScrollEnd: " + this.x);
                                                        if (this.x == 0 && !jQuery('#pullRight').hasClass('flip')) {
                                                            console.log("pullRight add class 'flip'");
                                                            jQuery('#pullRight').addClass('flip');
                                                            jQuery('#pullRight .pullRightLabel').html('Thả ra để làm mới...');
                                                        } else if (-this.x > (jQuery('#loban-scroller').width() - 2000) && !jQuery('#pullLeft').hasClass('flip')) {
                                                            console.log("pullLeft add class 'flip'");
                                                            jQuery('#pullLeft').addClass('flip');
                                                            jQuery('#pullLeft .pullLeftLabel').html('Thả ra để làm mới...');
                                                        }

                                                        jQuery('#abc').html('this.x=' + this.x + ' : out=' + (jQuery('#loban-scroller').width() - 2000));

                                                        if (jQuery('#pullRight').hasClass('flip')) {
                                                            jQuery('#pullRight').removeClass('flip');
                                                            jQuery('#pullRight').addClass('loading');
                                                            jQuery('#pullRight .pullRightLabel').html('...');
                                                            console.log("pullRightAction");
                                                            pullRightAction();	// Execute custom function (ajax call?)
                                                        } else if (jQuery('#pullLeft').hasClass('flip')) {
                                                            jQuery('#pullLeft').removeClass('flip');
                                                            jQuery('#pullLeft').addClass('loading');
                                                            jQuery('#pullLeft .pullLeftLabel').html('...');
                                                            console.log("pullLeftAction");
                                                            pullLeftAction();	// Execute custom function (ajax call?)
                                                        }
                                                        jQuery('#sodoLoban').html(Math.round((-this.x + jQuery('#lobanOuter').width() / 2) / 100, 1) + ' cm');
                                                        jQuery('#sodo').val(Math.round((-this.x + jQuery('#lobanOuter').width() / 2) / 10, 0));
                                                    }
                                                });

                                                setTimeout(function () { document.getElementById('loban-wrapper').style.left = '0'; }, 800);

                                                console.log(jQuery('#lobanOuter').width());

                                                jQuery('#sodo').blur(function () {
                                                    var px = parseFloat(jQuery(this).val()) * 10
                                                    px += jQuery('#lobanOuter').width() / 2;
                                                    var st = Math.ceil((px - trimEnd * 10) / 10000)
                                                    if (st > 0) {
                                                        for (var i = 1; i <= st; i++) {
                                                            pullLeftAction();
                                                        }
                                                        myScroll.refresh();
                                                    }
                                                    myScroll.scrollTo(-(px - Math.round(jQuery('#lobanOuter').width(), 0)), 0, Math.max((st + 1) * 500, 1500))
                                                })

                                                jQuery('#sodo').bind('keypress', function (e) {
                                                    var code = e.keyCode || e.which;
                                                    if (code == 13) {
                                                        jQuery(this).blur()
                                                    }
                                                    else {
                                                        //v = $(this).val()
                                                        //alert( /^[0-9.]+$/.test(v)  )
                                                        if (!((code == 46) || (code >= 48 && code <= 57))) {
                                                            return false;
                                                        }
                                                        //alert(String.fromCharCode(e.charCode))
                                                    }
                                                });

                                                jQuery(document).ready(function () {
                                                    var px = 2020 + jQuery('#lobanOuter').width() / 2;
                                                    myScroll.scrollTo(-(px - Math.round(jQuery('#lobanOuter').width(), 0)), 0, 500)
                                                });

                                            }

                                            //document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);

                                            document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);
                                        </script>


                                        <div id="lobanOuter" style="height: 400px;">
                                            <div id="abc">this.x=-1391.5 : out=8100</div>
                                            <div class="loban-touch-left"></div>
                                            <div class="loban-touch-right"></div>
                                            <div id="sodoLoban">20.2 cm</div>
                                            <div id="container-sodo" style="left: 600.5px;">
                                                <input type="text" value="450" name="sodo" id="sodo" on>
                                                mm (nhập số)
                                            </div>
                                            <div id="thanhdo" style="left: 628.5px;"></div>
                                            <p class="loban-note">Hãy kéo thước</p>
                                            <p class="loban-t loban-522"><strong>Thước Lỗ Ban 52.2cm:</strong> Khoảng thông thủy (cửa, cửa sổ...)</p>
                                            <p class="loban-t loban-429"><strong>Thước Lỗ Ban 42.9cm (Duong trạch):</strong> Khối xây dựng (bếp, bệ, bậc...)</p>
                                            <p class="loban-t loban-388"><strong>Thước Lỗ Ban 38.8cm (âm phần):</strong> Đồ nội thất (bàn thờ, tủ...)</p>
                                            <div id="loban-wrapper" style="overflow: hidden; left: 0px;">
                                                <div id="loban-scroller" style="transition-property: transform; transform-origin: 0px 0px 0px; transition-timing-function: cubic-bezier(0.33, 0.66, 0.66, 1); transform: translate(-1391.5px, 0px) scale(1) translateZ(0px); transition-duration: 500ms;">
                                                    <div id="pullRight" style="display: none;">
                                                        <span class="pullRightIcon"></span><span class="pullRightLabel">Kéo qua phải...</span>
                                                    </div>
                                                    <ul id="loban-thelist">
                                                        <li>
                                                            <img src="<%=Template_path%>/Images/thuoc522.png" nopin="nopin">
                                                            <img src="<%=Template_path%>/Images/thuoc429.png" nopin="nopin">
                                                            <img src="<%=Template_path%>/Images/thuoc388.png" nopin="nopin">
                                                        </li>
                                                    </ul>
                                                    <div id="pullLeft" style="display: none;">
                                                        <span class="pullLeftIcon"></span><span class="pullLeftLabel">Kéo qua trái...</span>
                                                    </div>
                                                </div>
                                                <div style="position: absolute; z-index: 100; height: 7px; bottom: 1px; left: 2px; right: 2px; pointer-events: none; transition-property: opacity; overflow: hidden; opacity: 1;">
                                                    <div style="position: absolute; z-index: 100; background: padding-box padding-box rgba(0, 0, 0, 0.498039); border: 1px solid rgba(255, 255, 255, 0.901961); box-sizing: border-box; height: 100%; border-radius: 3px; pointer-events: none; transition-property: transform; transform: translate(172.777px, 0px) translateZ(0px); transition-timing-function: cubic-bezier(0.33, 0.66, 0.66, 1); width: 155px; transition-duration: 500ms;"></div>
                                                </div>
                                            </div>
                                            <div class="clear"></div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="wpb_column vc_column_container vc_col-sm-12">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">
                                        <asp:Literal runat="server" ID="ltrDetail"></asp:Literal>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="clearfix"></div>
                    </div>

                </article>
                <!-- end post entry -->
            </div>
        </div>
    </div>


</div>



