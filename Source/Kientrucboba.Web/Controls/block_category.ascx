<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="block_category.ascx.cs" Inherits="Cb.Web.Controls.block_category" %>

<!--block_category-->
<%@ Register Namespace="Cb.WebControls" Assembly="Cb.WebControls" TagPrefix="cc" %>

<asp:Literal runat="server" ID="ltrHeaderCategory"></asp:Literal>

<div id="content-wrapper" class="is-vc">
    <!-- post entry -->
    <article id="post-991" class="block_category page-single post-991 page type-page status-publish hentry">

        <div class="post-content">

            <div class="vc_row wpb_row vc_row-fluid vc_custom_1447894184176 wpb_section wpb_padding divNews">
                <div class="container">
                    <div class="row">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="st-service" style="position: relative; height: 1038px;">
                                        <div class="serviceHolder row" data-layout="fitRows">

                                            <asp:Repeater runat="server" ID="rptResult" OnItemDataBound="rptResult_ItemDataBound">
                                                <ItemTemplate>
                                                    <div class="post-item col-md-3 col-sm-4 col-xs-12 architecture">
                                                        <div class="service-container style-2">
                                                            <div class="service-image">
                                                                <a runat="server" id="hypImg">
                                                                    <img width="600" height="400" runat="server" id="img" class="attachment-slicetheme-service size-slicetheme-service wp-post-image"
                                                                        sizes="(max-width: 600px) 100vw, 600px"></a>
                                                            </div>
                                                            <div class="service-content">
                                                                <h4><a runat="server" id="hypTitle">
                                                                    <asp:Literal runat="server" ID="ltrTitle"></asp:Literal></a></h4>
                                                                <div>
                                                                    <asp:Literal runat="server" ID="ltrBrief"></asp:Literal>
                                                                </div>
                                                                <div class="service-link">
                                                                    <a runat="server" id="hypContinus">
                                                                        <asp:Literal runat="server" ID="ltrContinus"></asp:Literal></a>
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
