<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FengShuiDetail.ascx.cs" Inherits="Cb.Web.Pages.FengShuiManagement.FengShuiDetail" %>

<!--FengShuiDetail-->
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
</cc1:ToolkitScriptManager>

<asp:Literal runat="server" ID="ltrHeaderCategory"></asp:Literal>

<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div id="content-wrapper" class="not-vc divFengShui ">

            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="vc_column-inner ">
                            <div class="wpb_wrapper">

                                <ul class="st-contact-info">
                                    <li>
                                        <div class="contact-label">
                                            <asp:Literal runat="server" ID="ltrBirthdayOwer"></asp:Literal>
                                        </div>
                                        <asp:DropDownList ID="drpYear" runat="server" CssClass="form-control select2">
                                        </asp:DropDownList>
                                    </li>
                                    <li>
                                        <div class="contact-label">
                                            <asp:Literal runat="server" ID="ltrDirectHouse"></asp:Literal>

                                        </div>
                                        <asp:DropDownList ID="drpDirectionHouse" runat="server" CssClass="form-control select2">
                                            <asp:ListItem Text="Đông" Value="Đông"></asp:ListItem>
                                            <asp:ListItem Text="Tây" Value="Tây"></asp:ListItem>
                                            <asp:ListItem Text="Nam" Value="Nam"></asp:ListItem>
                                            <asp:ListItem Text="Bắc" Value="Bắc"></asp:ListItem>
                                            <asp:ListItem Text="Tây bắc" Value="Tây bắc"></asp:ListItem>
                                            <asp:ListItem Text="Đông bắc" Value="Đông bắc"></asp:ListItem>
                                            <asp:ListItem Text="Tây nam" Value="Tây nam"></asp:ListItem>
                                            <asp:ListItem Text="Đông nam" Value="Đông nam"></asp:ListItem>
                                        </asp:DropDownList>
                                    </li>
                                    <li>
                                        <div class="contact-label">
                                            <asp:Literal runat="server" ID="ltrSex"></asp:Literal>
                                        </div>
                                        <asp:DropDownList ID="drpSex" runat="server" CssClass="form-control select2">
                                            <asp:ListItem Text="Nam" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Nữ" Value="1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </li>

                                </ul>

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
                    </div>

                    <div class="col-md-2">
                        <div class="vc_column-inner ">
                            <div class="wpb_wrapper">
                                <asp:Button ID="btnViewFengShui" runat="server" CssClass="wpcf7-form-control wpcf7-submit" Text="Gửi liên hệ" OnClick="btnViewFengShui_ServerClick" />

                            </div>
                        </div>
                    </div>

                    <div class="col-md-5">
                        <div class="vc_column-inner ">
                            <div class="wpb_wrapper">
                                <ul class="st-contact-info">
                                    <li>
                                        <div class="contact-label">
                                            <asp:Literal runat="server" ID="ltrNamSinhDuongLichName"></asp:Literal>
                                        </div>
                                        <asp:Literal runat="server" ID="ltrNamSinhDuongLichValue"></asp:Literal>
                                    </li>
                                    <li>
                                        <div class="contact-label">
                                            <asp:Literal runat="server" ID="ltrNamSinhAmLichName"></asp:Literal>
                                        </div>
                                        <asp:Literal runat="server" ID="ltrNamSinhAmLichValue"></asp:Literal>
                                    </li>
                                    <li>
                                        <div class="contact-label">
                                            <asp:Literal runat="server" ID="ltrQueMenhName"></asp:Literal>
                                        </div>
                                        <asp:Literal runat="server" ID="ltrQueMenhValue"></asp:Literal>
                                    </li>
                                    <li>
                                        <div class="contact-label">
                                            <asp:Literal runat="server" ID="ltrNguHanhName"></asp:Literal>
                                        </div>
                                        <asp:Literal runat="server" ID="ltrNguHanhValue"></asp:Literal>
                                    </li>
                                    <li>
                                        <div class="contact-label">
                                            <asp:Literal runat="server" ID="ltrHuongNhaName"></asp:Literal>
                                        </div>
                                        <asp:Literal runat="server" ID="ltrHuongNhaValue"></asp:Literal>
                                    </li>
                                </ul>

                                <div class="wpb_column vc_column_container vc_col-sm-12">
                                    <div class="vc_column-inner ">
                                        <div class="wpb_wrapper">
                                            <asp:Literal runat="server" ID="Literal1"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>

                </div>

                <div class="vc_row wpb_row vc_row-fluid vc_custom_1450589067168 wpb_section wpb_padding" runat="server" id="divTable">
                    <div class="container">
                        <div class="row">
                            <div class="wpb_column vc_column_container vc_col-sm-12">
                                <div class="vc_column-inner ">
                                    <div class="wpb_wrapper">

                                        <div class="vc_empty_space" style="height: 15px"><span class="vc_empty_space_inner"></span></div>

                                        <div class="wpb_raw_code wpb_content_element wpb_raw_html">
                                            <div class="wpb_wrapper">
                                                <table class="table table-bordered">

                                                    <tbody>
                                                        <tr>
                                                            <td class="text-right">
                                                                <asp:Literal runat="server" ID="ltrTayBacName"></asp:Literal></td>
                                                            <td colspan="3" class="text-center">
                                                                <asp:Literal runat="server" ID="ltrBacName"></asp:Literal></td>
                                                            <td>
                                                                <asp:Literal runat="server" ID="ltrDongBacName"></asp:Literal></td>
                                                        </tr>
                                                        <tr>
                                                            <td rowspan="3" class="text-left text-align">
                                                                <asp:Literal runat="server" ID="ltrTayName"></asp:Literal></td>
                                                            <td class="text-right">
                                                                <asp:Literal runat="server" ID="ltrTayBacValue"></asp:Literal></td>
                                                            <td class="text-center">
                                                                <asp:Literal runat="server" ID="ltrBacValue"></asp:Literal></td>
                                                            <td class="text-left">
                                                                <asp:Literal runat="server" ID="ltrDongBacValue"></asp:Literal></td>
                                                            <td rowspan="3" class="text-right text-align">
                                                                <asp:Literal runat="server" ID="ltrDongName"></asp:Literal></td>
                                                        </tr>
                                                        <tr>

                                                            <td class="text-left">
                                                                <asp:Literal runat="server" ID="ltrTayValue"></asp:Literal></td>
                                                            <td class="text-center">
                                                                <asp:Literal runat="server" ID="ltrBacDongNamTayValue"></asp:Literal></td>
                                                            <td class="text-right">
                                                                <asp:Literal runat="server" ID="ltrDongValue"></asp:Literal></td>

                                                        </tr>
                                                        <tr>

                                                            <td class="text-right">
                                                                <asp:Literal runat="server" ID="ltrTayNamValue"></asp:Literal></td>
                                                            <td class="text-center">
                                                                <asp:Literal runat="server" ID="ltrNameValue"></asp:Literal></td>
                                                            <td class="text-left">
                                                                <asp:Literal runat="server" ID="ltrDongNamValue"></asp:Literal></td>

                                                        </tr>

                                                        <tr>
                                                            <td class="text-right">
                                                                <asp:Literal runat="server" ID="ltrTayNamName"></asp:Literal></td>
                                                            <td colspan="3" class="text-center">
                                                                <asp:Literal runat="server" ID="ltrNamName"></asp:Literal></td>
                                                            <td>
                                                                <asp:Literal runat="server" ID="ltrDongNamName"></asp:Literal></td>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!--Vong bat quai-->
            <div class="vc_row wpb_row vc_row-fluid vc_custom_1450589067168 wpb_section wpb_padding" runat="server" id="divVongBatQuai">
                <div class="container">
                    <div class="row">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="st-heading style-1 text-left">
                                        <h3 class="box-title">
                                            <asp:Literal runat="server" ID="ltrVongBatQuai"></asp:Literal></h3>
                                    </div>
                                    <div class="vc_empty_space" style="height: 15px"><span class="vc_empty_space_inner"></span></div>

                                    <div class="wpb_raw_code wpb_content_element wpb_raw_html">
                                        <div class="wpb_wrapper">

                                            <img class="center-block" runat="server" id="img" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/Vong bat quai-->

            <!--Vong bat quai chi tiết-->
            <div class="vc_row wpb_row vc_row-fluid vc_custom_1450589067168 wpb_section wpb_padding" runat="server" id="divVongBatQuaiChiTiet">
                <div class="container">
                    <div class="row">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="st-heading style-1 text-left">
                                        <h3 class="box-title">
                                            <asp:Literal runat="server" ID="ltrVongBatQuaiTitle"></asp:Literal></h3>
                                    </div>
                                    <div class="vc_empty_space" style="height: 15px"><span class="vc_empty_space_inner"></span></div>

                                    <div class="wpb_raw_code wpb_content_element wpb_raw_html">
                                        <div class="wpb_wrapper">

                                            <asp:Literal runat="server" ID="ltrVongBatQuaiDetail"></asp:Literal>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--/Vong bat quai chi tiết-->

        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<cc1:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender1" TargetControlID="UpdatePanel1"
    runat="server">
    <Animations>
                    <OnUpdating>
                       <Parallel duration="0">
                         
                            <EnableAction AnimationTarget="btnViewFengShui_ServerClick" Enabled="false" />       
                                     
                        </Parallel>
                    </OnUpdating>    
                    <OnUpdated>
                        <Parallel duration="0">
                          
                            <EnableAction AnimationTarget="btnViewFengShui_ServerClick" Enabled="true" />                    
                        </Parallel>
                    </OnUpdated>     
    </Animations>
</cc1:UpdatePanelAnimationExtender>
