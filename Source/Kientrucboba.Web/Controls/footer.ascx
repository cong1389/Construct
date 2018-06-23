<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="Cb.Web.Controls.footer" %>

<!--footer-->

<footer id="footer">

    <section id="footer-wrapper" class=" footer-in">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="widget">

                        <div class="st-heading style-1 text-left">
                            <h4 class="box-title">
                                <a href="#" id="ctl00_mainContent_ctl00_hypLastBlogCateName">
                                    <asp:Literal runat="server" ID="ltrAboutUs"></asp:Literal></a></h4>
                        </div>

                        <h5 class="subtitle text-uppercase"></h5>
                        <div class="textwidget">
                            <p>
                                <asp:Literal runat="server" ID="ltrContactDetail"></asp:Literal>
                            </p>
                            <p>
                            </p>
                        </div>
                        <div class="side-list">
                            <asp:Literal runat="server" ID="ltrFooterContact"></asp:Literal>
                        </div>
                        <div class="widget">
                            <div class="textwidget">
                                <div class="vertical-space2"></div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-md-3">
                    <div class="widget">
                        <div class="st-heading style-1 text-left">
                            <h4 class="box-title">
                                <a href="#" id="A4">
                                    <asp:Literal runat="server" ID="ltrSocail"></asp:Literal></a></h4>
                        </div>
                        
                        <div class="socialfollow">
                            <div class="fam-projects-widget-gallery clearfix">
                                <asp:Literal runat="server" ID="ltrFBFooter"></asp:Literal>
                            </div>
                        </div>
                    </div>
                    <div class="widget hidden">
                        <div class="st-heading style-1 text-left">
                            <h4 class="box-title">
                                <a href="#" id="A1">
                                    <asp:Literal runat="server" ID="ltrLastNews"></asp:Literal></a></h4>
                        </div>
                        <div class="side-list">
                            <ul>
                                <asp:Repeater runat="server" ID="rptLastBlog" OnItemDataBound="rptLastBlog_ItemDataBound">
                                    <ItemTemplate>
                                        <li class="pull-left">
                                            <a runat="server" id="hypImg">
                                                <img runat="server" id="img" class="landscape full tabs-img" width="164" height="124"></a>
                                            <div class="fam-posts-widget-content">
                                                <h5 class="fam-posts-widget-title">
                                                    <a runat="server" id="hypTitle">
                                                        <asp:Literal runat="server" ID="ltrTitle"></asp:Literal></a></h5>
                                                <div class="fam-posts-widget-date">
                                                    <asp:Literal runat="server" ID="ltrDate"></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="clearfix"></div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="widget">
                        <div class="st-heading style-1 text-left">
                            <h4 class="box-title">
                                <a href="#" id="A2">
                                    <asp:Literal runat="server" ID="ltrAddressHeader"></asp:Literal></a></h4>
                        </div>
                        <div style="color: #eee">
                            <i class="fa fa-map-marker"></i>
                            <asp:Literal runat="server" ID="ltrAddressName"></asp:Literal>:
                                <asp:Literal runat="server" ID="ltrAddressValue"></asp:Literal>
                        </div>

                        <div style="color: #eee">
                            <i class="fa fa-phone"></i>
                            <asp:Literal runat="server" ID="ltrPhoneName"></asp:Literal>: 
                                <asp:Literal runat="server" ID="ltrPhoneValue"></asp:Literal>
                        </div>

                        <div style="color: #eee">
                            <i class="fa fa-envelope"></i>
                            <asp:Literal runat="server" ID="Literal1">Email</asp:Literal>: 
                                <asp:Literal runat="server" ID="ltrEmail"></asp:Literal>
                        </div>
                    </div>
                </div>


                <div class="col-md-3">
                    <div class="widget">

                        <!--Công trình hoàn thành-->
                        <div class="st-heading style-1 text-left">
                            <h4 class="box-title">
                                <a href="#" id="A3">
                                    <asp:Literal runat="server" ID="ltrConstructionCateName"></asp:Literal></a></h4>
                        </div>

                        <div class="socialfollow">
                            <div class="fam-projects-widget-gallery clearfix">

                                <asp:Repeater runat="server" ID="rptConstruction" OnItemDataBound="rptConstruction_ItemDataBound">
                                    <ItemTemplate>

                                        <a runat="server" id="hypImg" class="fam-projects-widget-thumbnail">
                                            <img runat="server" id="img" class="attachment-thumbnail size-thumbnail wp-post-image" alt="portfolio-02">
                                            <div class="fam-projects-widget-hover">
                                                <i class="fa fa-glass"></i>
                                            </div>
                                        </a>

                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>

                            <a target="_blank" runat="server" id="hypFBFP" class="facebook hidden"><i class="fa-facebook"></i></a>
                            <a target="_blank" runat="server" id="hypGooglePlus" class="google-plus hidden"><i class="fa-google-plus"></i></a>
                            <%--<asp:Literal runat="server" ID="ltrFBLike"></asp:Literal>--%>
                            <div class="clear"></div>
                        </div>
                        <!--/Công trình hoàn thành-->

                    </div>

                    
                </div>

            </div>
        </div>
    </section>
    <div id="copyright-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="title-holder-cell text-left">
                        <ol class="breadcrumb">
                            <asp:Repeater runat="server" ID="rptResult" OnItemDataBound="rptResult_ItemDataBound">
                                <ItemTemplate>
                                    <li class="active"><a runat="server" id="hypName">
                                        <asp:Literal runat="server" ID="ltrName"></asp:Literal></a></li>
                                </ItemTemplate>
                            </asp:Repeater>

                        </ol>
                    </div>
                </div>
                <div class="col-md-6 title-holder-cell text-center">
                    <asp:Literal runat="server" ID="ltrFooter"></asp:Literal>
                </div>
            </div>
        </div>
    </div>

    <%-- <section class="footbot">
        <div class="container">
            <div class="col-md-12 center-block">
                <div class="footer-navi">© 2016 All Rights Reserved. Created by EPMDesign.</div>
            </div>

        </div>
    </section>--%>
</footer>
