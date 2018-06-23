<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CategoryDetail.ascx.cs" Inherits="Cb.Web.Pages.CategoryManagement.CategoryDetail" %>

<!--CategoryDetail-->
<%@ Register TagPrefix="dgc" TagName="block_productrelate" Src="~/Controls/block_productrelate.ascx" %>
<%@ Register TagPrefix="dgc" TagName="block_like" Src="~/Controls/block_like.ascx" %>

<asp:Literal runat="server" ID="ltrHeaderCategory"></asp:Literal>

<div id="content-wrapper" class="not-vc ">

    <div class="container">
        <div class="row">
            <div id="main-wrapper" class="col-md-12">

                <!-- post entry -->
                <article id="post-2350" class="portfolio-single post-2350 st_portfolio type-st_portfolio status-publish has-post-thumbnail hentry">
                    <div class="post-content">

                        <div class="vc_row wpb_row vc_row-fluid vc_custom_1450689182614 wpb_padding divCategoryDetail">

                            <div class="wpb_column vc_column_container vc_col-sm-4">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">
                                        <div class="divSocial">
                                            <div class="widget ">
                                                <div class="st-heading  text-left">
                                                    <h3 class="box-title">
                                                        <asp:Literal runat="server" ID="ltrDetailHeader"></asp:Literal></h3>
                                                </div>
                                                <div class="st-metabox style-1">
                                                    <ul>
                                                        <asp:Literal runat="server" ID="ltrDetailRight"></asp:Literal>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="clear"></div>

                                            <div class="widget">
                                                <div class="st-heading  text-left">
                                                    <h3 class="box-title">
                                                        <asp:Literal runat="server" ID="ltrContact"></asp:Literal></h3>
                                                </div>
                                                <div class="">
                                                    <p class="address">
                                                        <i class="fa fa-map-marker"></i>
                                                        <asp:Literal runat="server" ID="ltrAddressValue"></asp:Literal>
                                                    </p>
                                                    <p class="address">
                                                        <i class="fa fa-tablet"></i>
                                                        <asp:Literal runat="server" ID="ltrPhoneValue"></asp:Literal>
                                                    </p>
                                                    <p class="address">
                                                        <i class="fa fa-envelope-o"></i>
                                                        <asp:Literal runat="server" ID="ltrEmail"></asp:Literal>
                                                    </p>
                                                    <dgc:block_like ID="block_like" runat="server" />
                                                </div>
                                            </div>
                                            <div class="clear"></div>
                                            <!-----------------------------------fb coment-------------------------------------------------------------------------------------------->
                                            <div class="widget ">
                                                <div class="st-heading  text-left">
                                                    <h3 class="box-title">
                                                        <asp:Literal runat="server" ID="ltrFBComment"></asp:Literal></h3>
                                                </div>
                                                <div class="st-metabox style-1">
                                                    <div id="Div1" class="clear" runat="server">
                                                    </div>
                                                    <div class="comment" id="divcoment" runat="server">
                                                        <div class="fb-comments" data-href="<%=hypLinkCommentFB %>" data-num-posts="10" data-width="300">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-----------------------------------/fb coment-------------------------------------------------------------------------------------------->

                                            <!-----------------------------------Video-------------------------------------------------------------------------------------------->
                                            <div class="widget ">
                                                <div class="st-heading  text-left">
                                                    <h3 class="box-title">
                                                        <asp:Literal runat="server" ID="V" Text="Video"></asp:Literal></h3>
                                                </div>
                                                <div class="st-metabox style-1">
                                                    <a class="popup-youtube" runat="server" id="hypVideo" href="https://www.youtube.com/watch?v=YkpWMulHL-g">
                                                        <img src="/Images/deco_2.png" alt="" class="img-responsive">
                                                    </a>
                                                </div>
                                            </div>
                                            <!-----------------------------------/Video-------------------------------------------------------------------------------------------->
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="wpb_column vc_column_container vc_col-sm-8 divContainDetail">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">

                                        <div runat="server" id="divSlide" visible="false" class="st-heading">
                                            <div id="slider1_container" style="position: relative; margin: 0 auto; top: 0px; left: 0px; height: 500px; overflow: hidden;">
                                                <!-- Loading Screen -->
                                                <div u="loading" style="position: absolute; top: 0px; left: 0px;">
                                                    <div style="filter: alpha(opacity=70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;">
                                                    </div>
                                                    <div style="position: absolute; display: block; background: url(/Images/loading.gif) no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;">
                                                    </div>
                                                </div>
                                                <!-- Slides Container -->
                                                <div u="slides" style="cursor: move; position: absolute; left: 0px; top: 0px; width: 900px; height: 500px; overflow: hidden;">
                                                    <asp:Repeater runat="server" ID="rptResult" OnItemDataBound="rptResult_ItemDataBound">
                                                        <ItemTemplate>
                                                            <div>
                                                                <img u="image" runat="server" id="img" />

                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:Repeater>

                                                </div>

                                                <!-- Bullet Navigator Skin Begin -->

                                                <!-- bullet navigator container -->
                                                <div u="navigator" class="jssorb21" style="position: absolute; bottom: 26px; left: 6px;">
                                                    <!-- bullet navigator item prototype -->
                                                    <div u="prototype" style="position: absolute; width: 19px; height: 19px; text-align: center; line-height: 19px; color: White; font-size: 12px;"></div>
                                                </div>

                                                <!-- Arrow Left -->
                                                <span u="arrowleft" class="jssora21l" style="width: 55px; height: 55px; top: 123px; left: 8px;"></span>
                                                <!-- Arrow Right -->
                                                <span u="arrowright" class="jssora21r" style="width: 55px; height: 55px; top: 123px; right: 8px"></span>
                                                <!-- Arrow Navigator Skin End -->

                                            </div>
                                        </div>

                                        <div class="st-heading style-1 text-left">
                                            <h3 class="box-title">
                                                <asp:Literal runat="server" ID="ltrTitle"></asp:Literal></h3>
                                        </div>
                                        <div class="wpb_text_column wpb_content_element ">
                                            <div class="wpb_wrapper">
                                                <asp:Literal runat="server" ID="ltrDetail"></asp:Literal>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <dgc:block_productrelate ID="block_productrelate" runat="server" />

                        <div class="clearfix"></div>
                    </div>

                </article>
                <!-- end post entry -->
            </div>
        </div>
    </div>


</div>


<%--<section class="container">
    <div class="row-wrapper-x">
        <section class="wpb_row   w-animate">
            <div class="wpb_column vc_column_container vc_col-sm-12">
                <div class="vc_column-inner ">
                    <div class="wpb_wrapper">
                        <hr class="vertical-space1">
                        <div class="subtitle-element subtitle-element1">
                            <h4></h4>
                        </div>
                        <hr class="vertical-space1">
                        <div class="vc_row wpb_row vc_inner vc_row-fluid">
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</section>--%>



<script>
    jQuery(document).ready(function () {
        SetSlideDetail();
    });
</script>
