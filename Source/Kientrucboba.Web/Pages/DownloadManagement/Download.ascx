<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Download.ascx.cs" Inherits="Cb.Web.Pages.DownloadManagement.Download" %>

<!--download--->
<%@ Register Namespace="Cb.WebControls" Assembly="Cb.WebControls" TagPrefix="cc" %>

<asp:Literal runat="server" ID="ltrHeaderCategory"></asp:Literal>

<div id="content-wrapper" class="is-vc">
    <!-- post entry -->
    <article id="divDownload" class="page-single post-75 page type-page status-publish hentry">

        <div class="post-content">
            <div class="vc_row wpb_row vc_row-fluid vc_custom_1446105205968 wpb_section wpb_padding">
                <div class="container">
                    <div class="row">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="st-heading style-1 text-left hidden">
                                        <h3 class="box-title">Experienced Team</h3>
                                        <div class="box-content">Our experts have been featured in press numerous times.</div>
                                    </div>

                                    <div class="st-team">
                                        <div class="row" style="position: relative;">

                                            <asp:Repeater runat="server" ID="rptResult" OnItemDataBound="rptResult_ItemDataBound">
                                                <ItemTemplate>
                                                    <div class="col-md-3 col-sm-6 col-xs-12" runat="server" id="divPdf" style="display: none">

                                                        <a href="#" runat="server" id="hypImg" class="boxDownload">
                                                            <div class="team-container style-1">

                                                                <div class="team-photo">
                                                                    <span>
                                                                        <img width="265" height="240" runat="server" id="img"
                                                                            sizes="(max-width: 265) 265, 265">
                                                                    </span>
                                                                    <div class="st-social">
                                                                        <ul class="list-inline text-center">
                                                                            <li>
                                                                                <asp:LinkButton runat="server" ID="lbnViewFile" OnCommand="lbnViewFile_Command" CssClass="button btn-small full-width">
                                                                                    <i class="fa fa-cloud-download fa-fw"></i>
                                                                                    <asp:Literal runat="server" ID="ltrDownload"></asp:Literal>
                                                                                </asp:LinkButton>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="team-inner">
                                                                    <div class="team-meta">
                                                                        <h4>
                                                                            <asp:Literal runat="server" ID="ltrTitle"></asp:Literal></h4>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </a>

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
            <div class="clearfix"></div>
            <!--Padding-->
            <div class="gdl-pagination">
                <cc:Pager ID="pager" runat="server" EnableViewState="true" OnCommand="pager_Command" CompactModePageCount="10" MaxSmartShortCutCount="0" RTL="False" PageSize="9" />

            </div>
        </div>

    </article>
    <!-- end post entry -->


</div>
<!--/download--->
