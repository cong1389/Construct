<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="admin_editproduct.ascx.cs"
    Inherits="Cb.Web.Admin.Pages.Products.admin_editproduct" %>
<%@ Register Assembly="Cb.WebControls" Namespace="Cb.WebControls" TagPrefix="uc" %>
<%@ Register TagPrefix="dgc" TagName="block_baseimage" Src="~/Admin/Controls/block_baseimage.ascx" %>
<%@ Register TagPrefix="dgc" TagName="block_uploadimage" Src="~/Admin/Controls/block_uploadimage.ascx" %>
<%@ Register TagPrefix="dgc" TagName="block_uploadvideo" Src="~/Admin/Controls/block_uploadvideo.ascx" %>
<%@ Register TagPrefix="dgc" TagName="block_uploadfile" Src="~/Admin/Controls/block_uploadfile.ascx" %>

<script type="text/javascript">

    //Set text thông tin SEO từ tên bài viết
    function CopyValue() {

        //VN
        jQuery("#<%=txtName.ClientID%>").change(function () {
            var name = jQuery("#<%=txtName.ClientID%>").val();
            if (name != "") {
                jQuery("#<%=txtMetaTitle.ClientID%>").val(name);
                jQuery("#<%=txtMetaKeyword.ClientID%>").val(name);
                jQuery("#<%=txtMetaDescription.ClientID%>").val(name);
                jQuery("#<%=txtH1.ClientID%>").val(name);
                jQuery("#<%=txtH2.ClientID%>").val(name);
                jQuery("#<%=txtH3.ClientID%>").val(name);
            }

        });

        //Eng
        jQuery("#<%=txtNameEng.ClientID%>").change(function () {
            var nameEng = jQuery("#<%=txtNameEng.ClientID%>").val();
            if (nameEng != "") {
                jQuery("#<%=txtMetaTitleEng.ClientID%>").val(nameEng);
                jQuery("#<%=txtMetaKeywordEng.ClientID%>").val(nameEng);
                jQuery("#<%=txtMetaDescriptionEng.ClientID%>").val(nameEng);
                jQuery("#<%=txtH1Eng.ClientID%>").val(nameEng);
                jQuery("#<%=txtH2Eng.ClientID%>").val(nameEng);
                jQuery("#<%=txtH3Eng.ClientID%>").val(nameEng);
            }
        });
    };

    jQuery(document).ready(function () {

        var categoryID = $("#hddProductCategoryId").val();
        if (categoryID < 0) {
            $(".tabUploadFile, .tabUploadVideo").addClass("hidden");
        }
        else {
            $(".tabUploadFile, .tabUploadVideo").removeClass("hidden");
        }

        //
        chkIsHome();

        //Copy value từ tên sản phẩm bỏ vào group SEO
        CopyValue();

        jQuery("#<%=drpCategory.ClientID%>").change(function () {
            var id = $('#<%=drpCategory.ClientID %> option:selected').val();
            jQuery.ajax({
                type: "POST",
                url: "/WebServices/Service.asmx/GetCategoryPageDetail",
                data: "{'id': '" + id + "' }",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (data) {

                    jQuery("#<%=txtPage.ClientID %>").val(data.d);

                    ResizeImageDefault(data.d);
                },
                error: function (x) {
                    alert(x.responseText);
                }
            });
        });

        //SizeImage
        var categoryName = $('#<%=drpCategory.ClientID %> option:selected').text();
        ResizeImageDefault(categoryName);

    });

    //Set img đại diện có resize hay không
    function ResizeImageDefault(path) {
        if (path.indexOf("BlogDetail")
             || path.indexOf("Nhận xét của khách hàng") >= 0) {
            jQuery(".chkDefault").attr('checked', 'checked');
        }
        else {
            jQuery(".chkDefault").attr('checked', '');
        }
    }

    function checkForm() {
        return true;
    }

    function submitButton(pressbutton) {
        var f = document.adminForm;
        submitForm(f, pressbutton);
    }

    function chkIsHome() {
        jQuery('#<%=chkNewInHome.ClientID%>').change(function () {
            if (jQuery('#<%=chkNewInHome.ClientID%>').attr("checked")) {
                jQuery(".divStatus").removeClass("hidden");
            }
            else {
                jQuery(".divStatus").addClass("hidden");
            }
        });

        if (jQuery('#<%=chkNewInHome.ClientID%>').attr("checked")) {
            jQuery(".divStatus").removeClass("hidden");
        }
        else {
            jQuery(".divStatus").addClass("hidden");
        }

    }
</script>

<!-- Event btn-->
<section class="content-header ulBtn btnEdit">
    <div class="row ">
        <div class="col-xs-12">

            <button validationgroup="adminproductCategory" id="btn_Save" runat="server" onserverclick="btnSave_Click" class="btn btn-success">
                <i class="fa fa-check"></i>
                <asp:Literal ID="ltrAdminSave" runat="server"></asp:Literal>
            </button>

            <button validationgroup="adminproductCategory" id="btn_Delete" runat="server" onserverclick="btnDelete_Click" class="btn btn-success" visible="false">
                <i class="fa fa-check"></i>
                <asp:Literal ID="ltrAdminDelete" runat="server"></asp:Literal>
            </button>

            <button id="btn_Cancel" runat="server" onserverclick="btnCancel_Click" type="button" name="back" class="btn btn-secondary-outline">
                <i class="fa fa-angle-left"></i>
                <asp:Literal ID="ltrAdminCancel" runat="server"></asp:Literal>
            </button>

            <button validationgroup="adminproductCategory" id="btn_Apply" runat="server" type="button" name="btn_Apply" class="btn btn-secondary-outline" onserverclick="btnApply_Click">
                <i class="fa fa-angle-right"></i>
                <asp:Literal ID="ltrAdminApply" runat="server" Text="ltrAdminApply"></asp:Literal>
            </button>

        </div>
    </div>
</section>
<!-- /Event btn-->

<section class="content editCotent">
    <div class="row ">
        <div class="col-xs-12">
            <div class="box">
                <div class="form-horizontal">
                    <div class="panel-body">

                        <!-- Validator-->
                        <div class="form-group">
                            <asp:ValidationSummary ID="sumv_SumaryValidate" ValidationGroup="adminproductCategory" DisplayMode="BulletList" ShowSummary="true" runat="server" EnableClientScript="true" ViewStateMode="Disabled" CssClass="col-md-5 ValidationSummary" />

                        </div>

                        <%-- Thông tin chung--%>
                        <div class="form-group">
                            <div class="col-sm-2 col-xs-3 control-label"></div>
                            <div class="checkbox-list">
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="chkPublished" id="chkPublished" checked runat="server" />
                                    <asp:Literal ID="ltrAminPublish" runat="server" Text="ltrAminPublish"></asp:Literal>
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" runat="server" id="chkPublishedHot" value="option1">
                                    Sản phẩm hot
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" runat="server" id="chkPublishedFeature" value="option2">
                                    Hiển thị sản phẩm trang chủ
                                </label>
                                <label class="checkbox-inline hidden">
                                    <input type="checkbox" runat="server" id="chkProjectNew" value="option2">
                                    Dự án ngoài nước
                                </label>
                                <label class="checkbox-inline hidden">
                                    <input type="checkbox" runat="server" id="chkNewInHome">
                                    Hiển thị tin tức trang chủ
                                </label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <asp:Literal ID="ltrAminCategory" runat="server" Text="ltrAminCategory"></asp:Literal></label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="drpCategory" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="drpCategory"
                                    runat="server" ValidationGroup="adminproductCategory" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>

                            </div>
                            <label class="col-sm-2 control-label divStatus">
                                <label>
                                    <asp:Literal ID="ltrStatus" runat="server" Text="Link kết nối ngoài"></asp:Literal>
                                </label>
                            </label>
                            <div class="col-sm-4 divStatus">
                                <input type="text" name="txtPrice" id="txtStatus" runat="server" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group hidden">
                            <label class="col-sm-2 control-label">
                                <asp:Literal ID="Literal7" runat="server" Text="Mã căn hộ"></asp:Literal></label>
                            <div class="col-sm-4">
                                <input type="text" name="txtPrice" id="txtCode" runat="server" />
                            </div>
                            <label class="col-sm-2 control-label">
                                <label>
                                    <asp:Literal ID="Literal3" runat="server" Text="Upload pdf file"></asp:Literal></label>
                            </label>
                            <div class="col-sm-4">
                                <asp:FileUpload ID="fuImage" runat="server" EnableViewState="true" CssClass="fuImage form-group" />
                                <asp:Button ID="btnUploadImage" runat="server" Text="strUpload" OnClick="btnUploadImage_Click"
                                    CssClass="btn btn-success btn-sm form-group" />
                                <asp:LinkButton ID="lbnView" runat="server" Text="strView" Visible="false" OnClick="btnViewPdf_Click"><span class="glyphicon glyphicon-fullscreen btn-sm form-group">
                        </span></asp:LinkButton>
                                <asp:LinkButton ID="lbnDelete" runat="server" Text="strDelete" Visible="false" OnClick="lbnDeleteImage_Click"><span class="glyphicon glyphicon-trash btn-sm form-group">
                        </span></asp:LinkButton>
                            </div>
                        </div>

                        <div class="form-group" runat="server" id="divPage">
                            <label class="col-sm-2 control-label">
                                <abbr title="Đường dẫn chứa trang ascx. Ví dụ: Pages/CategoryManagement/Category.ascx">
                                    <asp:Literal ID="ltrPageDetail" runat="server" Text="ltrPageDetail"></asp:Literal>
                                </abbr>
                            </label>
                            <div class="col-sm-10">
                                <asp:TextBox runat="server" ID="txtPage" CssClass="form-control disabled " />
                            </div>

                        </div>

                        <div class="form-group hidden">
                            <label class="col-sm-2 control-label">
                                <asp:Literal ID="Literal10" runat="server" Text="Website"></asp:Literal></label>
                            <div class="col-sm-4">
                                <input type="text" name="txtPrice" id="txtWebsite" runat="server" class="form-control" />
                            </div>
                            <label class="col-sm-2 control-label">
                                <label>
                                    <asp:Literal ID="Literal26" runat="server" Text="Tiền tệ"></asp:Literal></label>
                            </label>
                            <div class="col-sm-4">
                                <span class="col-sm-6 noPM">
                                    <input type="text" name="txtPrice" id="txtPrice" runat="server" class="form-control" /></span>
                                <span class="col-sm-6">
                                    <asp:DropDownList ID="drpCost" runat="server" CssClass="form-control">
                                    </asp:DropDownList></span>
                            </div>
                        </div>

                        <div class="form-group hidden ">
                            <label class="col-sm-2 control-label">
                                <asp:Literal ID="Literal29" runat="server" Text="Phòng ngủ"></asp:Literal></label>
                            <div class="col-sm-4">
                                <input type="text" name="txtPrice" id="txtBedRoom" runat="server" class="form-control" />
                                <asp:RegularExpressionValidator ID="req_BedRoom" ControlToValidate="txtBedRoom" runat="server" class="validator" Text="*"></asp:RegularExpressionValidator>
                            </div>
                            <label class="col-sm-2 control-label">
                                <label>
                                    <asp:Literal ID="Literal4" runat="server" Text="Diện tích (m²)(*)"></asp:Literal></label>
                            </label>
                            <div class="col-sm-4">
                                <input type="text" name="txtPrice" id="txtArea" runat="server" class="form-control" />
                                <asp:RegularExpressionValidator ID="reqE_Area" ControlToValidate="txtArea" runat="server" Text="*" class="validator"></asp:RegularExpressionValidator>
                            </div>
                        </div>

                        <div class="form-group hidden">
                            <label class="col-sm-2 control-label">
                                <asp:Literal ID="Literal5" runat="server" Text="Quận/ Huyện (*)"></asp:Literal></label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="drpDistrict" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <label class="col-sm-2 control-label">
                                <label>
                                    <asp:Literal ID="ltrProvince" runat="server" Text="Tỉnh/ Thành phố (**)"></asp:Literal></label>
                            </label>
                            <div class="col-sm-4">
                                <asp:DropDownList ID="drpProvince" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group hidden">
                            <label class="col-sm-2 control-label">
                                <asp:Literal ID="Literal23" runat="server" Text="Kinh độ (*)"></asp:Literal>
                            </label>
                            <div class="col-sm-4">
                                <input type="text" name="txtMap" id="txtLongitude" runat="server" class="form-control" />
                                <asp:RegularExpressionValidator ID="req_Longitude" ControlToValidate="txtLongitude" class="validator" runat="server" Text="*"></asp:RegularExpressionValidator>
                            </div>
                            <label class="col-sm-2 control-label">
                                <label>
                                    <asp:Literal ID="Literal9" runat="server" Text="Vĩ độ (*)"></asp:Literal></label>
                            </label>
                            <div class="col-sm-4">
                                <input type="text" name="txtMap" id="txtLatitude" runat="server" class="form-control" />
                                <asp:RegularExpressionValidator ID="req_Latitude" ControlToValidate="txtLatitude" class="validator"
                                    runat="server" Text="*"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <%-- /Thông tin chung--%>

                        <%-- Thông tin chi tiết--%>
                        <div class="tabbable tabbable-tabdrop">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a href="#tab_1" data-toggle="tab">
                                        <asp:Literal ID="ltrAminLangVi" runat="server" Text="strVietNam"></asp:Literal></a>
                                </li>
                                <li class="">
                                    <a href="#tab_2" data-toggle="tab">
                                        <asp:Literal ID="ltrAminLangEn" runat="server" Text="strEnglish_en"></asp:Literal></a>
                                </li>
                                <li>
                                    <a href="#tab_3" data-toggle="tab">
                                        <asp:Literal ID="ltrAvartarImages" runat="server" Text="Hình đại diện"></asp:Literal></a>
                                </li>
                                <li>
                                    <a href="#tab_4" data-toggle="tab">
                                        <asp:Literal ID="ltrUploadFile" runat="server" Text="Upload Files"></asp:Literal></a>
                                </li>
                                <li class="tabUploadVideo">
                                    <a href="#tab_5" data-toggle="tab">
                                        <asp:Literal ID="ltrUploadVideo" runat="server" Text="Upload Video"></asp:Literal></a>
                                </li>
                                <li class="tabUploadFile">
                                    <a href="#tab_6" data-toggle="tab">
                                        <asp:Literal ID="Literal2" runat="server" Text="Upload file"></asp:Literal></a>
                                </li>
                            </ul>

                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_1">
                                    <div class="panel-group accordion" id="adn">
                                        <!--Accordion thông tin chung-->
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#adn" href="#adnGeneral" class="accordion-toggle accordion-toggle-styled collapsed" aria-expanded="false">
                                                        <asp:Literal runat="server" ID="ltrGeneral" Text="ltrGeneral"></asp:Literal>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="adnGeneral" class="panel-collapse collapse in">
                                                <div class="panel-body">

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrAminName" runat="server" Text="ltrAminName"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="txtName" id="txtName" runat="server"
                                                                class="form-control form-group" />
                                                            <asp:RequiredFieldValidator ID="reqv_txtNameVi" ControlToValidate="txtName"
                                                                runat="server" ValidationGroup="adminproductCategory" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrIntro" runat="server" Text="ltrIntro"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtIntro" TextMode="MultiLine" Rows="2" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrAdminIntro" runat="server" Text="ltrAdminIntro"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <uc:CKEditorControl runat="server" Language="vi" ID="txtDetailVi">
                                                            </uc:CKEditorControl>
                                                        </div>
                                                    </div>

                                                    <div class="form-group ">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal11" runat="server" Text="Thông tin chủ đầu tư"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtPositionVi" TextMode="MultiLine" Rows="2" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            Địa điểm</label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtUtilityVi" TextMode="MultiLine" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <abbr title="Tên bài viết muốn hiển thị dạng nổi bật. Ví dụ: Sách bồi linh">
                                                                Diện tích</abbr></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtDesignVi" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal14" runat="server" Text="Diện tích xây dựng"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtPicturesVi" CssClass="form-control form-group" />

                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal15" runat="server" Text="Diện tích sàn"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtPaymentVi" CssClass="form-control form-group" />

                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal16" runat="server" Text="Quy mô công trình"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtContactVi" CssClass="form-control form-group" />

                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal6" runat="server" Text="Công việc thực hiện"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtWorkCarriedVi" CssClass="form-control form-group" />

                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal8" runat="server" Text="Thời gian thực hiện"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtTimeCarriedVi" CssClass="form-control form-group" />

                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal12" runat="server" Text="Nội dung khác"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtOtherVi" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <!--/Accordion thông tin chung-->
                                        <!--Accordion SEO-->
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#adn" href="#adnSEO" class="accordion-toggle accordion-toggle-styled collapsed" aria-expanded="false">
                                                        <asp:Literal runat="server" ID="ltrAdnMeta" Text="ltrAdnMeta"></asp:Literal>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="adnSEO" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrMetaTitle" runat="server" Text="ltrMetaTitle"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtMetaTitle" TextMode="MultiLine" Rows="2" placeholder="Meta Title" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrMetaKeyWord" runat="server" Text="ltrMetaKeyWord"></asp:Literal>
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtMetaKeyword" TextMode="MultiLine" Rows="2" placeholder="Meta Keywords" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrMetaDescription" runat="server" Text="ltrMetaDescription"></asp:Literal>
                                                        </label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtMetaDescription" TextMode="MultiLine" Rows="2" placeholder="Meta Description" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrH1" runat="server" Text="ltrH1"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtH1" TextMode="MultiLine" Rows="2" placeholder="H1 Tag" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrH2" runat="server" Text="ltrH2"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtH2" TextMode="MultiLine" Rows="2" placeholder="H2 Tag" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrH3" runat="server" Text="ltrH3"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtH3" TextMode="MultiLine" Rows="2" placeholder="H3 Tag" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/Accordion SEO-->
                                    </div>

                                </div>
                                <!-- /.tab-pane -->
                                <div class="tab-pane" id="tab_2">
                                    <div class="panel-group accordion" id="adnEng">
                                        <!--Accordion General Info-->
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#adn" href="#adnGeneralEng" class="accordion-toggle accordion-toggle-styled collapsed" aria-expanded="false">
                                                        <asp:Literal runat="server" ID="Literal1" Text="ltrGeneral"></asp:Literal>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="adnGeneralEng" class="panel-collapse collapse in">
                                                <div class="panel-body">

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrAminNameEng" runat="server" Text="ltrAminNameEng"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="txtName_En" id="txtNameEng" size="60" runat="server" class="form-control form-group" />

                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrIntroEng" runat="server" Text="ltrIntroEng"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtIntroEng" TextMode="MultiLine" Rows="2" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrDetailEng" Text="ltrDetailEng" runat="server"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <uc:CKEditorControl runat="server" ID="txtDetailEng">
                                                            </uc:CKEditorControl>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal22" runat="server" Text="Investors"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtPositionEng" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal17" runat="server" Text="Location"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtUtilityEng" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal18" runat="server" Text="Site area"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                              <asp:TextBox runat="server" ID="txtDesignEng" CssClass="form-control form-group" />                                                            
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal19" runat="server" Text="Construction area"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtPicturesEng" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group ">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal20" runat="server" Text="Floor area"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtPaymentEng" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group ">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal21" runat="server" Text="Scale works"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtContactEng" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group ">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal13" runat="server" Text="Work Carried"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtWorkCarriedEng" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group ">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal24" runat="server" Text="Time Carried"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtTimeCarriedEng" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group ">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="Literal25" runat="server" Text="Other"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtOtherEng" CssClass="form-control form-group" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <!--/Accordion General Info-->

                                        <!--Accordion SEO-->
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#adnEng" href="#adnSEOEng" class="accordion-toggle accordion-toggle-styled collapsed" aria-expanded="false">
                                                        <asp:Literal runat="server" ID="ltrSEOEng" Text="ltrSEOEng"></asp:Literal>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="adnSEOEng" class="panel-collapse collapse" aria-expanded="false" style="height: 0px;">
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrMetaTitleEng" runat="server" Text="ltrMetaTitleEng"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtMetaTitleEng" TextMode="MultiLine" Rows="2" placeholder="Meta Title" CssClass="form-group form-control" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrMetaKeywordEng" runat="server" Text="ltrMetaKeywordEng"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtMetaKeywordEng" TextMode="MultiLine" Rows="2" placeholder="Meta Keywords" CssClass="form-group form-control" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrMetaDescriptionEng" runat="server" Text="ltrMetaDescriptionEng"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtMetaDescriptionEng" TextMode="MultiLine" Rows="2" placeholder="Meta Description" CssClass="form-group form-control" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrH1TagEng" runat="server" Text="ltrH1TagEng"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtH1Eng" TextMode="MultiLine" Rows="2" placeholder="H1 Tag" CssClass="form-group form-control" />


                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrH2TagEng" runat="server" Text="ltrH2TagEng"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtH2Eng" TextMode="MultiLine" Rows="2" placeholder="H2 Tag" CssClass="form-group form-control" />
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="col-sm-2 control-label">
                                                            <asp:Literal ID="ltrH3TagEng" runat="server" Text="ltrH3TagEng"></asp:Literal></label>
                                                        <div class="col-sm-10">
                                                            <asp:TextBox runat="server" ID="txtH3Eng" TextMode="MultiLine" Rows="2" placeholder="H3 Tag" CssClass="form-group form-control" />
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <!--/Accordion SEO-->
                                    </div>

                                </div>
                                <!-- /.tab-pane -->
                                <div class="tab-pane " id="tab_3">
                                    <dgc:block_baseimage ID="block_baseimage" runat="server" />
                                </div>
                                <!-- /.tab-pane -->
                                <div class="tab-pane" id="tab_4">
                                    <dgc:block_uploadimage Id="block_uploadimage" runat="server" />
                                </div>
                                <!-- /.tab-pane -->
                                <div class="tab-pane tabUploadVideo" id="tab_5">
                                    <dgc:block_uploadvideo Id="block_uploadvideo" runat="server" />
                                </div>
                                <!-- /.tab-pane -->
                                <div class="tab-pane tabUploadVideo" id="tab_6">
                                    <dgc:block_uploadfile ID="block_uploadfile" runat="server" />
                                </div>
                                <!-- /.tab-pane -->
                            </div>
                            <!-- /.tab-content -->
                        </div>
                        <%--/ Thông tin chi tiết--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<input type="hidden" name="task" value="" />
<input id="hddProductCategoryId" type="hidden" name="id" value="<%=productcategoryId%>" />
