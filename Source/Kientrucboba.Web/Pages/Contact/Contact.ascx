<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Contact.ascx.cs" Inherits="Cb.Web.Pages.Contact.Contact" %>

<!--Contact-->
<%@ Register TagPrefix="dgc" TagName="block_googlemap" Src="~/Controls/block_googlemap.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>

<asp:Literal runat="server" ID="ltrHeaderCategory"></asp:Literal>

<div id="content-wrapper" class="is-vc">

    <!-- post entry -->
    <article id="post-9" class="page-single post-9 page type-page status-publish hentry">

        <div class="post-content">
            <div class="vc_row wpb_row vc_row-fluid vc_custom_1444633257299 wpb_section">
                <div class="container-full">
                    <div class="row">
                        <div class="wpb_column vc_column_container vc_col-sm-12">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">
                                    <div class="wpb_gmaps_widget wpb_content_element vc_custom_1450145066092">
                                        <div class="wpb_wrapper">
                                            <div class="wpb_map_wraper">
                                               <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.870911261781!2d106.72604571521651!3d10.744430992343217!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752581e6a8b0cb%3A0xf9db865ea9568c32!2zNDU4IEh14buzbmggVOG6pW4gUGjDoXQsIELDrG5oIFRodeG6rW4sIFF14bqtbiA3LCBI4buTIENow60gTWluaCwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1506256279535" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                                               <%-- <dgc:block_googlemap ID="block_googlemap" runat="server" />--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="vc_row wpb_row vc_row-fluid vc_custom_1451525930914 wpb_section wpb_padding">
                <div class="container">
                    <div class="row">
                        <div class="st-heading style-1 text-left  vc_col-sm-12">
                            <h3 class="box-title">
                                <asp:Literal runat="server" ID="ltrCateNameTitle"></asp:Literal></h3>
                        </div>
                        <div class="wpb_column vc_column_container vc_col-sm-8">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">

                                    <div role="form" class="wpcf7" id="wpcf7-f1157-p9-o1" lang="en-US" dir="ltr">
                                        <div class="screen-reader-response"></div>
                                        <div class="wpcf7-form">

                                            <p>
                                                <span class="wpcf7-form-control-wrap your-fname">
                                                    <input runat="server" id="txtFullName" type="text" name="your-fname" value="" size="40"
                                                        class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required"
                                                        aria-required="true" aria-invalid="false">
                                                </span>
                                            </p>
                                            <p>
                                                <span class="wpcf7-form-control-wrap your-lname">
                                                    <input runat="server" id="txtPhone" type="text" name="your-lname" value="" size="40" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required" aria-required="true" aria-invalid="false" placeholder="Last Name *"></span>
                                            </p>
                                            <p>
                                                <span class="wpcf7-form-control-wrap your-email">
                                                    <input runat="server" id="txtEmail" type="text" name="your-email" value="" size="40" class="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-required wpcf7-validates-as-email" aria-required="true" aria-invalid="false" placeholder=" Email *"></span>
                                            </p>

                                            <p>
                                                <span class="wpcf7-form-control-wrap your-fname">
                                                    <input runat="server" id="txtSubject" type="text" name="your-fname" value="" size="40"
                                                        class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required"
                                                        aria-required="true" aria-invalid="false">
                                                </span>
                                            </p>
                                            <p>
                                                <span class="wpcf7-form-control-wrap your-email">
                                                    <input runat="server" id="txtArea" type="text" name="your-email" value="" size="40" class="wpcf7-form-control wpcf7-text wpcf7-email wpcf7-validates-as-required wpcf7-validates-as-email" aria-required="true" aria-invalid="false"></span>
                                            </p>
                                            <p>
                                                <span class="wpcf7-form-control-wrap Textarea">
                                                    <textarea runat="server" id="txtMessage" name="Textarea" cols="40" rows="10" class="wpcf7-form-control wpcf7-text wpcf7-validates-as-required"
                                                        aria-invalid="false"></textarea></span>
                                            </p>

                                            <p>

                                                <asp:Button ID="btnSend" runat="server" CssClass="wpcf7-form-control wpcf7-submit" Text="Gửi liên hệ"
                                                    OnClick="btnSend_ServerClick" />
                                                <img class="ajax-loader" src="/Images/ajax-loader.gif" alt="Sending ..." style="visibility: hidden;">

                                                <%-- <input type="submit" value="Send Message" class="wpcf7-form-control wpcf7-submit">
                                                <img class="ajax-loader" src="http://themes.slicetheme.com/towerpress/wp-content/plugins/contact-form-7/images/ajax-loader.gif" alt="Sending ..." style="visibility: hidden;">--%>
                                            </p>
                                            <div class="wpcf7-response-output wpcf7-display-none"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="wpb_column vc_column_container vc_col-sm-4">
                            <div class="vc_column-inner ">
                                <div class="wpb_wrapper">

                                    <div role="form" class="wpcf7" id="Div1" lang="en-US" dir="ltr">
                                        <div class="screen-reader-response"></div>
                                        <p>
                                            <span class="wpcf7-form-control-wrap your-subject">
                                                <asp:DropDownList ID="drpService" runat="server" CssClass="wpcf7-form-control wpcf7-text">
                                                </asp:DropDownList>
                                            </span>
                                        </p>
                                        <p>
                                            <span class="wpcf7-form-control-wrap your-subject">
                                                <asp:DropDownList ID="drpConstructions" runat="server" CssClass="wpcf7-form-control wpcf7-text">
                                                </asp:DropDownList>
                                            </span>
                                        </p>
                                        <p>
                                            <span class="wpcf7-form-control-wrap your-subject">
                                                <asp:DropDownList ID="drpLocation" runat="server" CssClass="wpcf7-form-control wpcf7-text">
                                                </asp:DropDownList>
                                            </span>
                                        </p>
                                        <p class="hidden">

                                          <%--  <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>--%>
                                                    <div class="form-group ">

                                                        <%--<label class="col-sm-8 col-xs-4 control-label">
                                                            <asp:TextBox runat="server" ID="txtFilename" placeholder="File Name" CssClass="form-control" ReadOnly /></label>--%>
                                                        <div class="col-sm-12 col-xs-8 checkbox">

                                                            <cc1:AsyncFileUpload CssClass="FileUploadClass" runat="server" ID="fileUpload1" Width="100%"
                                                                UploaderStyle="Modern" CompleteBackColor="White" OnUploadedComplete="FileUpload1_Complete"
                                                                ThrobberID="imgLoader" />
                                                        </div>
                                                    </div>

                                               <%-- </ContentTemplate>
                                            </asp:UpdatePanel>--%>

                                        </p>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>

    </article>
    <!-- end post entry -->

</div>



<%--<cc1:UpdatePanelAnimationExtender ID="UpdatePanelAnimationExtender1" TargetControlID="UpdatePanel2"
    runat="server">
    <Animations>
        <OnUpdating>
            <Parallel duration="0">
                         
                <EnableAction AnimationTarget="FileUpload1_Complete" Enabled="false" />       
                                     
            </Parallel>
        </OnUpdating>    
        <OnUpdated>
            <Parallel duration="0">
                          
                <EnableAction AnimationTarget="FileUpload1_Complete" Enabled="true" />                    
            </Parallel>
        </OnUpdated>     
    </Animations>
</cc1:UpdatePanelAnimationExtender>--%>
