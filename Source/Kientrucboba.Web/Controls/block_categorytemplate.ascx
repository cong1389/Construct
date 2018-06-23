<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="block_categorytemplate.ascx.cs" Inherits="Cb.Web.Controls.block_categorytemplate" %>

<!--block_categorytemplate-->

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Namespace="Cb.WebControls" Assembly="Cb.WebControls" TagPrefix="cc" %>

<!--Category-->
<asp:Literal runat="server" ID="ltrHeaderCategory"></asp:Literal>

<div id="content-wrapper" class="is-vc block_categorytemplate">

    <!-- post entry -->
    <article id="post-2337" class="page-single post-2337 page type-page status-publish hentry">

        <div class="post-content">
            <div class="vc_row wpb_row vc_row-fluid vc_custom_1450147398464 wpb_section wpb_padding divCate">
                <div class="container">
                    <div class="row1">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">

                                    <div class="vc_row wpb_row vc_inner vc_row-fluid vc_custom_1471192675587">
                                        <div class="wpb_column vc_column_container vc_col-sm-3">
                                            <div class="vc_column-inner ">
                                                <div class="wpb_wrapper">
                                                    <div class="st-heading style-1 text-left">
                                                        <h3 class="box-title pull-left">
                                                            <a id="hypContinusProject" runat="server">
                                                                <i class="fa fa-building"></i>
                                                                <asp:Literal runat="server" ID="ltrCateName"></asp:Literal></a></h3>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wpb_column vc_column_container vc_col-sm-6 hidden">
                                            <div class="vc_column-inner ">
                                                <div class="wpb_wrapper">
                                                    <div class="st-heading style-1 text-center">
                                                        <h3 class="box-title">
                                                            <i class="fa fa-building"></i>
                                                            <asp:Literal runat="server" ID="ltrCateName1"></asp:Literal>
                                                        </h3>
                                                        <div class="box-content">
                                                            <asp:Literal runat="server" ID="ltrCateBrief"></asp:Literal>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="wpb_column vc_column_container vc_col-sm-3">
                                            <div class="vc_column-inner ">
                                                <div class="wpb_wrapper"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="st-portfolio">
                                        <div class="load-filter">
                                            <ul id="load-filter" class="list-unstyled">
                                                <li class="active"><a href="#" data-filter="*">All</a></li>

                                                <asp:Repeater runat="server" ID="rptCategory" OnItemDataBound="rptCategory_ItemDataBound">
                                                    <ItemTemplate>
                                                        <li><a href="#" runat="server" id="hypTitle">
                                                            <asp:Literal runat="server" ID="ltrTitle"></asp:Literal></a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>
                                        <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>--%>
                                        <div class="portfolioHolder  row" data-layout="fitRows"
                                            style="position: relative;">

                                            <asp:Repeater runat="server" ID="rptResult" OnItemDataBound="rptResult_ItemDataBound">
                                                <ItemTemplate>

                                                    <article runat="server" id="article">
                                                        <div class="portfolio-container style-1 row">
                                                            <div class="portfolio-image">
                                                                <a runat="server" id="hypImg">
                                                                    <img width="600" height="400" runat="server" id="img"
                                                                        class="attachment-slicetheme-portfolio size-slicetheme-portfolio wp-post-image"
                                                                        alt="portfolio12"
                                                                        sizes="(max-width: 600px) 100vw, 600px"><div class="zoom-overlay"></div>
                                                                </a>
                                                            </div>
                                                            <div class="portfolio-content">
                                                                <h4>
                                                                    <asp:Literal runat="server" ID="ltrTitle"></asp:Literal></h4>
                                                                <div class="portfolio-link">
                                                                    <a runat="server" id="hypContinus">
                                                                        <asp:Literal runat="server" ID="ltrContinus"></asp:Literal></a>
                                                                </div>
                                                            </div>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </article>

                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <%-- </ContentTemplate>
                                        </asp:UpdatePanel>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>

            <!--Padding-->
            <div class="clearfix"></div>
            <div class="navigation pagination">
                <cc:Pager ID="pager" runat="server" EnableViewState="true" OnCommand="pager_Command" CompactModePageCount="10" MaxSmartShortCutCount="0" RTL="False" PageSize="9" />
            </div>

        </div>

    </article>
    <!-- end post entry -->


</div>

