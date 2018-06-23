<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="home.ascx.cs" Inherits="Cb.Web.Pages.home" %>

<!--home-->
<%@ Register TagPrefix="dgc" TagName="block_slide" Src="~/Controls/block_slide.ascx" %>
<%@ Register TagPrefix="dgc" TagName="block_categorytemplate" Src="~/Controls/block_categorytemplate.ascx" %>
<%@ Register TagPrefix="dgc" TagName="block_partner" Src="~/Controls/block_partner.ascx" %>
<%@ Register TagPrefix="dgc" TagName="block_slogan" Src="~/Controls/block_slogan.ascx" %>
<div id="content-wrapper" class="is-vc site-intro">

    <!-- post entry -->
    <article id="post-991" class="page-single post-991 page type-page status-publish hentry">

        <div class="post-content">

            <div class="vc_row wpb_row vc_row-fluid vc_custom_1450139176121 wpb_section wpb_padding">
                <div class="container">
                    <div class="row">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="wpb_revslider_element wpb_content_element">
                                        <link href="http://fonts.googleapis.com/css?family=Raleway%3A500%2C800" rel="stylesheet" property="stylesheet" type="text/css" media="all" />
                                        <link href="http://fonts.googleapis.com/css?family=Raleway%3A400%2C700%2C800%2C500%2C600" rel="stylesheet" property="stylesheet" type="text/css" media="all" />
                                        <link href="http://fonts.googleapis.com/css?family=Hind%3A600%2C500" rel="stylesheet" property="stylesheet" type="text/css" media="all" />
                                        <link href="http://fonts.googleapis.com/css?family=Montserrat%3A400%2C500%2C700" rel="stylesheet" property="stylesheet" type="text/css" media="all" />
                                        <dgc:block_slide ID="block_slide" runat="server" />
                                        <!-- END REVOLUTION SLIDER -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <dgc:block_slogan ID="block_slogan" runat="server" />

            <!--Dự án-->
            <div id="Div1" class="vc_row wpb_row vc_row-fluid vc_custom_1471198040046 wpb_section wpb_padding divProject">
                <div class="container">
                    <div class="row">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="st-heading style-1 text-left">
                                        <h3 class="box-title pull-left">
                                            <a id="hypContinusProject" runat="server">
                                               <i class="fa fa-building"></i> <asp:Literal runat="server" ID="ltrCateName"></asp:Literal></a></h3>

                                    </div>
                                    <div class="st-blog crsl">
                                        <div class=" row1">

                                            <div class="max-title max-title3 pull-right">
                                                <div class="divProject-navigation">
                                                    <a class="btn prev"><i class="fa fa-angle-double-left"></i></a>
                                                    <a class="btn next"><i class="fa fa-angle-double-right"></i></a>
                                                </div>
                                            </div>

                                            <div id="divProject" class="fadeOut owl-carousel">
                                                <asp:Repeater runat="server" ID="rptProject" OnItemDataBound="rptProject_ItemDataBound">
                                                    <ItemTemplate>
                                                        <div class="portfolio-item ">

                                                            <div class="blog-container">
                                                                <div class="post-thumb">
                                                                    <a runat="server" id="hypImg">
                                                                        <img width="600" height="400" runat="server" id="img" class="attachment-slicetheme-small size-slicetheme-small wp-post-image" alt="blog01"
                                                                            sizes="(max-width: 600px) 100vw, 600px" /></a>
                                                                </div>
                                                                <div class="blog-inner">
                                                                    <div class="left-curve"></div>
                                                                    <div class="right-curve"></div>
                                                                    <h4 class="post-title">
                                                                        <a runat="server" id="hypTitle">
                                                                            <asp:Literal runat="server" ID="ltrTitle"></asp:Literal>
                                                                        </a>
                                                                    </h4>
                                                                    <div class="post-excerpt">
                                                                        <p>
                                                                            <asp:Literal runat="server" ID="ltrBrief"></asp:Literal>
                                                                        </p>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/Dự án--->

            <!--dich vu-->
            <div class="vc_row wpb_row vc_row-fluid vc_custom_1471186111033 vc_row-has-fill wpb_section wpb_padding hidden">
                <div class="container">
                    <div class="row">

                        <asp:Repeater runat="server" ID="rptService" OnItemDataBound="rptService_ItemDataBound">
                            <ItemTemplate>
                                <div class="wpb_column vc_column_container vc_col-sm-3">
                                    <div class="vc_column-inner ">
                                        <div class="wpb_wrapper">
                                            <div class="st-iconbox style-1">
                                                <div class="iconbox-container">
                                                    <a runat="server" id="hypTitle">
                                                        <div class="box-icon">
                                                            <span>
                                                                <asp:Literal runat="server" ID="ltrServiceIcon"></asp:Literal>
                                                                <%--<i class="fa fa-crop"></i>--%>

                                                            </span>
                                                        </div>
                                                        <div class="box-content">
                                                            <h4 class="box-title">
                                                               <i class="fa fa-building"></i> <asp:Literal runat="server" ID="ltrSeriveTitle"></asp:Literal>
                                                            </h4>
                                                            <div>
                                                                <asp:Literal runat="server" ID="ltrServiceBrief"></asp:Literal>
                                                            </div>
                                                        </div>
                                                        <div class="clearfix"></div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
            <!--/dich vu-->

            <!--Our Services-->
            <dgc:block_categorytemplate ID="block_categorytemplate" runat="server" />
            <!--/Our Services-->

            <div class="vc_row wpb_row vc_row-fluid vc_custom_1471186288974 wpb_section wpb_padding hidden">
                <div class="container">
                    <div class="row">
                        <!---Giới thiệu trang chủ--->
                        <div class="wpb_column vc_column_container vc_col-sm-6">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="vc_row wpb_row vc_inner vc_row-fluid vc_custom_1471186177227 vc_row-has-fill">
                                        <div class="wpb_column vc_column_container vc_col-sm-6">
                                            <div class="vc_column-inner vc_custom_1471185231461">
                                                <div class="wpb_wrapper">
                                                    <div class="wpb_single_image wpb_content_element vc_align_left  vc_custom_1471185881874">
                                                        <figure class="wpb_wrapper vc_figure">
                                                            <div class="vc_single_image-wrapper   vc_box_border_grey">
                                                                <img runat="server" id="imgIntro" class="vc_single_image-img attachment-full" height="780" src="http://themes.slicetheme.com/towerpress/wp-content/uploads/tp_image02.jpg" width="450">
                                                            </div>
                                                        </figure>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="wpb_column vc_column_container vc_col-sm-6">
                                            <div class="vc_column-inner vc_custom_1471185891545">
                                                <div class="wpb_wrapper">
                                                    <div class="st-heading style-1 text-left">
                                                        <h3 class="box-title">
                                                           <i class="fa fa-building"></i> <asp:Literal runat="server" ID="ltrIntroName"></asp:Literal>
                                                        </h3>
                                                    </div>

                                                    <div class="wpb_text_column wpb_content_element ">
                                                        <div class="wpb_wrapper">
                                                            <p>
                                                                <asp:Literal runat="server" ID="ltrIntroBrief"></asp:Literal>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!---/Giới thiệu trang chủ--->

                        <%--<div class="wpb_column vc_column_container vc_col-sm-6">
                            <div class="vc_column-inner vc_custom_1471589442621">
                                <div class="wpb_wrapper">
                                    <div class="st-heading style-1 text-left">
                                        <h3 class="box-title">
                                            <asp:Literal runat="server" ID="ltrCateName1"></asp:Literal>
                                        </h3>
                                        <div class="box-content">
                                            <asp:Literal runat="server" ID="ltrCateBrief1"></asp:Literal>
                                        </div>
                                    </div>
                                    <div class="st-client introByHome">
                                        <div class="vc_row wpb_row vc_inner vc_row-fluid vc_custom_1470320972347">

                                            <asp:Repeater runat="server" ID="rptProject1" >
                                                <ItemTemplate>
                                                    <div class="ab-color-01 wpb_column vc_column_container vc_col-sm-6">
                                                        <div class="vc_column-inner ">
                                                            <div class="wpb_wrapper">
                                                                <div class="st-promobox">
                                                                    <a runat="server" id="hypTitle" href="#">
                                                                        <div class="box-image">
                                                                            <span>
                                                                                <img width="240" height="130" runat="server" id="img" class="attachment-full size-full" alt="promobox01"></span>
                                                                        </div>
                                                                        <div class="box-content">
                                                                            <div class="box-content-inner">
                                                                                <h4 class="box-title center-block text-center">
                                                                                    <asp:Literal runat="server" ID="ltrTitle"></asp:Literal></h4>
                                                                                <div class="box-subtitle">
                                                                                    <asp:Literal runat="server" ID="ltrBrief"></asp:Literal>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                        </div>

                                    </div>

                                    <a runat="server" id="hypContinusProject1" class="st-button style-2 size-small" href="#" target="_self"><i class="fa fa-trophy"></i><span>
                                        <asp:Literal runat="server" ID="ltrContinusProject1"></asp:Literal></span></a>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>

            <%--<dgc:block_featurework ID="block_featurework" runat="server" />--%>

            <div class="vc_row wpb_row vc_row-fluid vc_custom_1471196818154 vc_row-has-fill wpb_section wpb_padding hidden">
                <div class="container">
                    <div class="row">
                        <div class="wpb_column vc_column_container vc_col-sm-3">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="st-counter style-icon icon-top">
                                        <div class="box-icon"><span><i class="fa fa-building-o"></i></span></div>
                                        <div class="box-inner">
                                            <div class="counter-number" data-to="523">0</div>
                                            <h4 class="box-title">Project Completed</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="wpb_column vc_column_container vc_col-sm-3">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="st-counter style-icon icon-top">
                                        <div class="box-icon"><span><i class="fa fa-cubes"></i></span></div>
                                        <div class="box-inner">
                                            <div class="counter-number" data-to="157">0</div>
                                            <h4 class="box-title">House Renovations</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="wpb_column vc_column_container vc_col-sm-3">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="st-counter style-icon icon-top">
                                        <div class="box-icon"><span><i class="fa fa-child"></i></span></div>
                                        <div class="box-inner">
                                            <div class="counter-number" data-to="1105">0</div>
                                            <h4 class="box-title">Workers Employed</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="wpb_column vc_column_container vc_col-sm-3">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="st-counter style-icon icon-top">
                                        <div class="box-icon"><span><i class="fa fa-trophy"></i></span></div>
                                        <div class="box-inner">
                                            <div class="counter-number" data-to="97">0</div>
                                            <h4 class="box-title">Awards Won</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!---ý kiến khách hàng-->
            <div class="vc_row wpb_row vc_row-fluid vc_custom_1471195598476 vc_row-has-fill wpb_section wpb_padding wpb_color">
                <div class="container">
                    <div class="row">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="col-sm-6">
                                        <div class="st-heading style-1 text-left">
                                            <h3 class="box-title">
                                              <i class="fa fa-video-camera"></i> <asp:Literal runat="server" ID="Literal1">Video</asp:Literal>
                                            </h3>
                                        </div>
                                        <div class="">
                                            <a class="popup-youtube" href="https://www.youtube.com/watch?v=H0gx1He7SBY">
                                                <img src="/Images/deco_2.png" alt="" class="img-responsive">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">

                                        <div class="st-heading style-1 text-left">
                                            <h3 class="box-title">
                                              <i class="fa fa-users"></i>  <asp:Literal runat="server" ID="ltrWhatCateName"></asp:Literal>
                                            </h3>
                                            <div class="box-content">
                                                <asp:Literal runat="server" ID="ltrWhatCateBrief"></asp:Literal>
                                            </div>
                                        </div>
                                        <div class="vc_empty_space" style="height: 32px"><span class="vc_empty_space_inner"></span></div>
                                        <div class="st-testimonial-slider owl-carousel">

                                            <asp:Repeater runat="server" ID="rptWhat" OnItemDataBound="rptWhat_ItemDataBound">
                                                <ItemTemplate>
                                                    <div class="testimonial-container">
                                                        <div class="testimonial-content">
                                                            <asp:Literal runat="server" ID="ltrWhatBrief"></asp:Literal>
                                                        </div>
                                                        <div class="testimonial-photo">
                                                            <img runat="server" id="imgWhat" width="150" height="150"
                                                                class="attachment-slicetheme-testimonial size-slicetheme-testimonial wp-post-image"
                                                                alt="testimonial01" sizes="(max-width: 150px) 100vw, 150px" />
                                                        </div>
                                                        <div class="testimonial-meta">
                                                            <h4>
                                                                <asp:Literal runat="server" ID="ltrWhatTitle"></asp:Literal></h4>
                                                            <span class="testimonial-position hidden">Businessman, NY</span>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>


                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!---/ý kiến khách hàng-->

            <!---Tin tuc-->
            <div class="vc_row wpb_row vc_row-fluid vc_custom_1471198040046 wpb_section wpb_padding divNews">
                <div class="container">
                    <div class="row">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="st-heading style-1 text-left">
                                        <h3 class="box-title">
                                            <a id="hypLastBlogCateName" runat="server">
                                               <i class="fa fa-newspaper-o" aria-hidden="true"></i> <asp:Literal runat="server" ID="ltrLastBlogCateName"></asp:Literal></a></h3>
                                    </div>
                                    <div class="st-blog">
                                        <div class="row">

                                            <asp:Repeater runat="server" ID="rptLastBlog" OnItemDataBound="rptLastBlog_ItemDataBound">
                                                <ItemTemplate>
                                                    <div class="col-md-3 col-sm-6 col-xs-12">
                                                        <div class="blog-container">
                                                            <div class="post-thumb">
                                                                <a runat="server" id="hypLastBlogImg">
                                                                    <img width="600" height="400" runat="server" id="imgLastBlog" class="attachment-slicetheme-small size-slicetheme-small wp-post-image" alt="blog01"
                                                                        sizes="(max-width: 600px) 100vw, 600px" /></a>
                                                            </div>
                                                            <div class="blog-inner">
                                                                <h4 class="post-title">
                                                                    <a runat="server" id="hypLastBlogTitle">
                                                                        <asp:Literal runat="server" ID="ltrLastBlogTitle"></asp:Literal></a></h4>
                                                                <div class="post-meta">
                                                                    <span class="post-author"><i class="fa fa-calendar"></i>
                                                                        <asp:Literal runat="server" ID="ltrLastBlogDate"></asp:Literal></span>


                                                                </div>
                                                                <div class="post-excerpt">
                                                                    <p>
                                                                        <asp:Literal runat="server" ID="ltrLastBlogBrief"></asp:Literal>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>


                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!---/Tin tuc-->

            <dgc:block_partner ID="block_partner" runat="server" Visible="false" />

            <div class="clearfix"></div>
        </div>

    </article>
    <!-- end post entry -->

</div>

<!--/home-->
