<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="block_partner.ascx.cs" Inherits="Cb.Web.Controls.block_partner" %>

<!---block_partner-->
<div class="vc_row wpb_row vc_row-fluid vc_custom_1450586392383 vc_row-has-fill wpb_section wpb_padding divPartner">
        <div class="container">
            <div class="row">
                <div class="wpb_column vc_column_container vc_col-sm-12">
                    <div class="vc_column-inner ">
                        <div class="wpb_wrapper">
                            <div class="st-heading style-1 text-left">
                                <h3 class="box-title">
                                   <i class="fa fa-paw" aria-hidden="true"></i> <asp:Literal runat="server" ID="Literal5">Đối tác</asp:Literal>
                                </h3>

                            </div>
                            <div class="st-client-slider">

                                <asp:Repeater runat="server" ID="rptManufacture" OnItemDataBound="rptManufacture_ItemDataBound">
                                    <ItemTemplate>
                                        <div>
                                            <div class="client-container">
                                                <span>
                                                    <img width="240" height="130" runat="server" id="img" class="attachment-slicetheme-client size-slicetheme-client wp-post-image" alt="client10"></span>
                                                <span>
                                                    <asp:Literal runat="server" ID="ltrTitle"></asp:Literal></span>
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


<!---/block_partner-->
