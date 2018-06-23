// =============================================
// Author:		Congtt
// Create date: 22/09/2014
// Description:	Edit danh sach fengshui
// =============================================

using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using Cb.DBUtility;
using Cb.Utility;
using Cb.BLL;
using Cb.Localization;
using System.IO;
using Microsoft.Security.Application;
using Cb.Model;

namespace Cb.Web.Admin.Pages.FengShui
{
    public partial class admin_editfengshui : DGCUserControl
    {
        #region Parameter

        protected int productcategoryId = int.MinValue;
        protected string template_path;

        private Generic<PNK_FengShui> genericBLL;
        private Generic<PNK_FengShuiDesc> genericDescBLL;
        private Generic2C<PNK_FengShui, PNK_FengShuiDesc> generic2CBLL;
        private string filenameUpload
        {
            get
            {
                if (ViewState["filenameUpload"] != null)
                    return ViewState["filenameUpload"].ToString();
                else
                    return string.Empty;
            }
            set
            {
                ViewState["filenameUpload"] = value;
            }
        }

        #endregion

        #region Common

        /// <summary>
        /// Init page
        /// </summary>
        private void InitPage()
        {
            LocalizationUtility.SetValueControl(this);
            ltrAdminApply.Text = Constant.UI.admin_apply;
            ltrAdminCancel.Text = Constant.UI.admin_cancel;
            ltrAdminDelete.Text = Constant.UI.admin_delete;
            ltrAdminSave.Text = Constant.UI.admin_save;

            //reqv_txtNameVi.Text = Constant.UI.alert_empty_name_outsite;
            //reqv_txtNameVi.ErrorMessage = Constant.UI.alert_empty_name;

            ltrAminLangVi.Text = Constant.UI.admin_lang_Vi;
            ltrAminLangEn.Text = Constant.UI.admin_lang_En;
        }

        private void GetId()
        {
            #region Set thuoc tinh cho block_baseimage

            block_baseimage.ImagePath = ConfigurationManager.AppSettings["FengShuiUpload"];
            block_baseimage.MinWidth = ConfigurationManager.AppSettings["minWidthCategory"];
            block_baseimage.MinHeigh = ConfigurationManager.AppSettings["minHeightCategory"];
            block_baseimage.MaxWidth = ConfigurationManager.AppSettings["maxWidthCategory"];
            block_baseimage.MaxHeight = ConfigurationManager.AppSettings["maxHeightCategory"];
            block_baseimage.MaxWidthBox = ConfigurationManager.AppSettings["maxWidthBoxCategory"];
            block_baseimage.MaxHeightBox = ConfigurationManager.AppSettings["maxHeightBoxCategory"];

            #endregion

            //get ID param          
            genericBLL = new Generic<PNK_FengShui>();
            generic2CBLL = new Generic2C<PNK_FengShui, PNK_FengShuiDesc>();
            genericDescBLL = new Generic<PNK_FengShuiDesc>();
            string strID = Utils.GetParameter("cid", string.Empty);
            this.productcategoryId = strID == string.Empty ? int.MinValue : DBConvert.ParseInt(strID);
            this.template_path = WebUtils.GetWebPath();

            ListItem lst = null;
            for (int i = 1920; i < 2050; i++)
            {
                lst = new ListItem();
                lst.Text = i.ToString();
                lst.Value = i.ToString();
                drpYear.Items.Add(lst);
            }

        }

        /// <summary>
        ///Hien thi o upload hinh anh( true: chua upload hinh) 
        /// </summary>
        /// <param name="isShowUplImg"></param>
        /// <param name="filename"></param>
        private void SetVisibleImg(bool isShowUplImg, string filename)
        {
            if (isShowUplImg)
            {
                fuImage.Visible = true;
                btnUploadImage.Visible = true;
                lbnView.Visible = false;
                lbnDelete.Visible = false;
            }
            else
            {
                fuImage.Visible = false;
                btnUploadImage.Visible = false;
                lbnView.Attributes["href"] = filename;
                lbnView.Visible = true;
                lbnDelete.Visible = true;
            }
        }

        /// <summary>
        /// Show location
        /// </summary>
        private void ShowProductcategory()
        {
            if (this.productcategoryId != int.MinValue)
            {
                PNK_FengShui productcatObj = new PNK_FengShui();
                string[] fields = { "Id" };
                productcatObj.Id = this.productcategoryId;
                productcatObj = generic2CBLL.Load(productcatObj, fields, Constant.DB.LangId);
                this.chkPublished.Checked = productcatObj.Published == "1" ? true : false;
                //txtPhone.Value = productcatObj.Phone;
                block_baseimage.ImageName = productcatObj.Image;

                IList<PNK_FengShuiDesc> lst = genericDescBLL.GetAllBy(new PNK_FengShuiDesc(), string.Format(" where mainid = {0}", this.productcategoryId), null);
                foreach (PNK_FengShuiDesc item in lst)
                {
                    switch (item.LangId)
                    {
                        case 1:
                            drpYear.SelectedValue = item.Year.ToString();
                            drpDirectionHouseVn.SelectedValue = item.DirectionHouse;
                            drpSexVn.SelectedValue = item.Sex == 0 ? "0" : "1";
                            txtNamSinhDuongLichVn.Text = item.NamSinhDuongLich;
                            txtNamSinhAmLichVn.Text = item.NamSinhAmLich;
                            txtQueMenhVn.Text = item.QuaMenh;
                            txtNguHanhVn.Text = item.NguHanh;
                            txtHuongNhaVn.Text = item.HuongNha;
                            txtBacVn.Text = item.Bac;
                            txtDongBacVn.Text = item.DongBac;
                            txtDongVn.Text = item.Dong;
                            txtDongNamVn.Text = item.DongNam;
                            txtNamVn.Text = item.Nam;
                            txtTayNamVn.Text = item.TayNam;
                            txtTayVn.Text = item.Tay;
                            txtTayBacVn.Text = item.TayBac;
                            txtBacDongNamTayVn.Text = item.BacDongNamTay;
                            editDetailVn.Text = item.Detail;
                            break;
                        case 2:
                            drpDirectionHouseEng.SelectedValue = item.DirectionHouse;
                            drpSexEng.SelectedValue = item.Sex == 0 ? "0" : "1";
                            txtNamSinhDuongLichEng.Text = item.NamSinhDuongLich;
                            txtNamSinhAmLichEng.Text = item.NamSinhAmLich;
                            txtQueMenhEng.Text = item.QuaMenh;
                            txtNguHanhEng.Text = item.NguHanh;
                            txtHuongNhaEng.Text = item.HuongNha;
                            txtBacEng.Text = item.Bac;
                            txtDongBacEng.Text = item.DongBac;
                            txtDongEng.Text = item.Dong;
                            txtDongNamEng.Text = item.DongNam;
                            txtNamEng.Text = item.Nam;
                            txtTayNamEng.Text = item.TayNam;
                            txtTayEng.Text = item.Tay;
                            txtTayBacEng.Text = item.TayBac;
                            txtBacDongNamTayEng.Text = item.BacDongNamTay;
                            editDetailEng.Text = item.Detail;
                            break;
                    }
                }
            }
        }

        /// <summary>
        /// get data for insert update
        /// </summary>
        /// <param name="userObj"></param>
        /// <returns></returns>
        private PNK_FengShui GetDataObjectParent(PNK_FengShui productcatObj)
        {
            productcatObj.CategoryId = 1;
            //productcatObj. = this.txtPhone.Value;
            productcatObj.Published = chkPublished.Checked ? "1" : "0";
            productcatObj.UpdateDate = DateTime.Now;

            HtmlControl hddImageName = block_baseimage.FindControl("hddImageName") as HtmlControl;
            if (hddImageName != null && hddImageName.Attributes["value"] != null)
            {
                productcatObj.Image = hddImageName.Attributes["value"].ToString();
            }
            else
            {
                productcatObj.Image = "";
            }
            return productcatObj;
        }

        /// <summary>
        /// get data child for insert update
        /// </summary>
        /// <param name="contdescObj"></param>
        /// <returns></returns>
        private PNK_FengShuiDesc GetDataObjectChild(PNK_FengShuiDesc productcatdescObj, int lang)
        {
            switch (lang)
            {
                case 1:
                    productcatdescObj.MainId = this.productcategoryId;
                    productcatdescObj.LangId = Constant.DB.LangId;
                    productcatdescObj.Title = string.Format("{0}-{1}-{2}", drpYear.SelectedValue, Utils.RemoveUnicode(drpDirectionHouseVn.SelectedValue.ToLower()), drpSexVn.SelectedItem.Text);
                    productcatdescObj.Year = DBConvert.ParseInt(drpYear.SelectedValue);
                    productcatdescObj.DirectionHouse = Utils.RemoveUnicode(drpDirectionHouseVn.SelectedValue.ToLower());
                    productcatdescObj.Sex = DBConvert.ParseInt(drpSexVn.SelectedValue);
                    productcatdescObj.NamSinhDuongLich = txtNamSinhDuongLichVn.Text.Trim();
                    productcatdescObj.NamSinhAmLich = txtNamSinhAmLichVn.Text.Trim();
                    productcatdescObj.QuaMenh = txtQueMenhVn.Text.Trim();
                    productcatdescObj.NguHanh = txtNguHanhVn.Text.Trim();
                    productcatdescObj.HuongNha = txtHuongNhaVn.Text.Trim();

                    productcatdescObj.Bac = txtBacVn.Text.Trim();
                    productcatdescObj.DongBac = txtDongBacVn.Text.Trim();
                    productcatdescObj.Dong = txtDongVn.Text.Trim();
                    productcatdescObj.DongNam = txtDongNamVn.Text.Trim();
                    productcatdescObj.Nam = txtNamVn.Text.Trim();
                    productcatdescObj.TayNam = txtTayNamVn.Text.Trim();
                    productcatdescObj.Tay = txtTayVn.Text.Trim();
                    productcatdescObj.TayBac = txtTayBacVn.Text.Trim();
                    productcatdescObj.BacDongNamTay = txtBacDongNamTayVn.Text.Trim();
                    productcatdescObj.Detail = editDetailVn.Text;
                    break;
                case 2:
                    productcatdescObj.MainId = this.productcategoryId;
                    productcatdescObj.LangId = Constant.DB.LangId_En;
                    productcatdescObj.Title = string.Format("{0}-{1}-{2}", drpYear.SelectedValue, Utils.RemoveUnicode(drpDirectionHouseEng.SelectedValue.ToLower()), drpSexEng.SelectedItem.Text);
                    productcatdescObj.Year = DBConvert.ParseInt(drpYear.SelectedValue);
                    productcatdescObj.DirectionHouse = Utils.RemoveUnicode(drpDirectionHouseEng.SelectedValue.ToLower());
                    productcatdescObj.Sex = DBConvert.ParseInt(drpSexEng.SelectedValue);
                    productcatdescObj.NamSinhDuongLich = string.IsNullOrEmpty(txtNamSinhDuongLichEng.Text) ? txtNamSinhDuongLichVn.Text : txtNamSinhDuongLichEng.Text;
                    productcatdescObj.NamSinhAmLich = string.IsNullOrEmpty(txtNamSinhAmLichEng.Text) ? txtNamSinhAmLichVn.Text : txtNamSinhAmLichEng.Text;// txtNamSinhAmLichVn.Text.Trim();
                    productcatdescObj.QuaMenh = string.IsNullOrEmpty(txtQueMenhEng.Text) ? txtQueMenhVn.Text : txtQueMenhEng.Text;// txtQueMenhVn.Text.Trim();
                    productcatdescObj.NguHanh = string.IsNullOrEmpty(txtNguHanhEng.Text) ? txtNguHanhVn.Text : txtNguHanhEng.Text;// txtNguHanhVn.Text.Trim();
                    productcatdescObj.HuongNha = string.IsNullOrEmpty(txtHuongNhaEng.Text) ? txtHuongNhaVn.Text : txtHuongNhaEng.Text;// txtHuongNhaVn.Text.Trim();

                    productcatdescObj.Bac = string.IsNullOrEmpty(txtBacEng.Text) ? txtBacVn.Text : txtBacEng.Text;// txtBacVn.Text.Trim();
                    productcatdescObj.DongBac = string.IsNullOrEmpty(txtDongBacEng.Text) ? txtDongBacVn.Text : txtDongBacEng.Text;// txtDongBacVn.Text.Trim();
                    productcatdescObj.Dong = string.IsNullOrEmpty(txtDongEng.Text) ? txtDongVn.Text : txtDongEng.Text;// txtDongVn.Text.Trim();
                    productcatdescObj.DongNam = string.IsNullOrEmpty(txtDongNamEng.Text) ? txtDongNamVn.Text : txtDongNamEng.Text;// txtDongNamVn.Text.Trim();
                    productcatdescObj.Nam = string.IsNullOrEmpty(txtNamEng.Text) ? txtNamVn.Text : txtNamEng.Text;//  txtNamVn.Text.Trim();
                    productcatdescObj.TayNam = string.IsNullOrEmpty(txtTayNamEng.Text) ? txtTayNamVn.Text : txtTayNamEng.Text;//   txtTayNamVn.Text.Trim();
                    productcatdescObj.Tay = string.IsNullOrEmpty(txtTayEng.Text) ? txtTayVn.Text : txtTayEng.Text;//   txtTayVn.Text.Trim();
                    productcatdescObj.TayBac = string.IsNullOrEmpty(txtTayBacEng.Text) ? txtTayBacVn.Text : txtTayBacEng.Text;//   txtTayBacVn.Text.Trim();
                    productcatdescObj.BacDongNamTay = string.IsNullOrEmpty(txtBacDongNamTayEng.Text) ? txtBacDongNamTayVn.Text : txtBacDongNamTayEng.Text;// txtBacDongNamTayVn.Text.Trim();
                    productcatdescObj.Detail = string.IsNullOrEmpty(editDetailEng.Text) ? editDetailVn.Text : editDetailEng.Text;// editDetailVn.Text;

                    break;
            }
            return productcatdescObj;
        }

        /// <summary>
        /// Save location
        /// </summary>
        private void SaveFengShuiCategory()
        {
            PNK_FengShui productcatObj = new PNK_FengShui();
            PNK_FengShuiDesc productcatObjVn = new PNK_FengShuiDesc();
            PNK_FengShuiDesc productcatObjEn = new PNK_FengShuiDesc();
            if (this.productcategoryId == int.MinValue)
            {
                //get data insert
                productcatObj = this.GetDataObjectParent(productcatObj);
                productcatObj.PostDate = DateTime.Now;
                productcatObj.Ordering = genericBLL.getOrdering();
                productcatObjVn = this.GetDataObjectChild(productcatObjVn, Constant.DB.LangId);
                productcatObjEn = this.GetDataObjectChild(productcatObjEn, Constant.DB.LangId_En);

                List<PNK_FengShuiDesc> lst = new List<PNK_FengShuiDesc>();
                lst.Add(productcatObjVn);
                lst.Add(productcatObjEn);
                //excute
                this.productcategoryId = generic2CBLL.Insert(productcatObj, lst);
            }
            else
            {
                string[] fields = { "Id" };
                productcatObj.Id = this.productcategoryId;

                productcatObj = genericBLL.Load(productcatObj, fields);
                //string publisheddOld = productcatObj.Published;
                //get data update
                productcatObj = this.GetDataObjectParent(productcatObj);
                productcatObjVn = this.GetDataObjectChild(productcatObjVn, Constant.DB.LangId);
                productcatObjEn = this.GetDataObjectChild(productcatObjEn, Constant.DB.LangId_En);
                List<PNK_FengShuiDesc> lst = new List<PNK_FengShuiDesc>();
                lst.Add(productcatObjVn);
                lst.Add(productcatObjEn);
                //excute
                generic2CBLL.Update(productcatObj, lst, fields);
                //neu ve Published oo thay doi thi chay ham ChangeWithTransaction de doi Published cac con va cac product
                //if (publisheddOld != productcatObj.Published)
                //    PNK_FengShui.ChangeWithTransaction(DBConvert.ParseString(this.productcategoryId), productcatObj.Published);
            }

        }

        /// <summary>
        /// delete location
        /// </summary>
        /// <param name="cid"></param>
        private void DeleteFengShuiCategory(string cid)
        {
            if (cid != null)
            {

                string link, url;

                if (generic2CBLL.Delete(cid))
                    link = LinkHelper.GetAdminLink("fengshui", "delete");
                else
                    link = LinkHelper.GetAdminLink("fengshui", "delfail");
                url = Utils.CombineUrl(template_path, link);
                Response.Redirect(url);

            }
        }

        /// <summary>
        /// Cancel content
        /// </summary>
        private void CancelFengShuiCategory()
        {
            string url = LinkHelper.GetAdminLink("fengshui");
            Response.Redirect(url);
        }

        #endregion

        #region Event

        protected void Page_Load(object sender, EventArgs e)
        {
            btn_Delete.Attributes["onclick"] = string.Format("javascript:return confirm('{0}');", Constant.UI.admin_msg_confirm_delete_item);
            GetId();
            if (!IsPostBack)
            {
                InitPage();
                ShowProductcategory();
            }
        }

        /// <summary>
        /// btnSave_Click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SaveFengShuiCategory();
                string url = LinkHelper.GetAdminMsgLink("fengshui", "save");
                Response.Redirect(url);
            }
        }

        /// <summary>
        /// btnApply_Click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnApply_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SaveFengShuiCategory();
                string url = LinkHelper.GetAdminLink("edit_fengshui", this.productcategoryId);
                Response.Redirect(url);
            }
        }

        /// <summary>
        /// btnDelete_Click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DeleteFengShuiCategory(DBConvert.ParseString(this.productcategoryId));
        }

        /// <summary>
        /// btnCancel_Click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            CancelFengShuiCategory();
        }

        protected void btnUploadImage_Click(object sender, EventArgs e)
        {

            try
            {
                if (fuImage.HasFile)
                {

                    filenameUpload = string.Format("{0}.{1}", GenerateString.Generate(10), fuImage.FileName.Split('.')[1]);
                    //string str = Path.Combine(Request.PhysicalApplicationPath, Constant.DSC.NewsUploadFolder.Replace("/", "\\") + filenameUpload);
                    fuImage.SaveAs(Path.Combine(Server.MapPath(ConfigurationManager.AppSettings["FengShuiUpload"]), filenameUpload));


                    //string strTemp = string.Format("<a class='zoom-image' href='{0}''>&nbsp;{1}</a>", Utils.CombineUrl(template_path, string.Format("{0}/{1}", Constant.DSC.NewsUploadFolder.Replace("\\", "/"), filename)), LocalizationUtility.GetText("strView"));
                    //strTemp += string.Format("<a href='{0}' >{1}</a>",LocalizationUtility.GetText("strDelete"));
                    //ltrImage.Text = strTemp;
                    SetVisibleImg(false, string.Format("{0}/{1}", ConfigurationManager.AppSettings["FengShuiUpload"], filenameUpload));
                }
            }
            catch (Exception ex)
            {
                Write2Log.WriteLogs("admin_editfengshui", "btnUploadImage_Click", ex.ToString());
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="alert"></param>
        private void Alert(string alert)
        {
            string script = string.Format("alert('{0}')", alert);
            ScriptManager.RegisterStartupScript(this, GetType(), "alertproductcategory", script, true);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="source"></param>
        /// <param name="args"></param>
        protected void csv_drpCategory_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //args.IsValid = !CheckParentIsThisOrChild();
            //if (!args.IsValid)
            //    Alert(Constant.UI.alert_invalid_parent_productcategory);
        }

        protected void lbnDelete_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(filenameUpload))
            {
                SetVisibleImg(true, string.Empty);

                filenameUpload = string.Empty; string f = Path.Combine(Server.MapPath(ConfigurationManager.AppSettings["FengShuiUpload"]), filenameUpload);
                if (File.Exists(f))
                {
                    try
                    {
                        File.Delete(f);
                    }
                    catch { }
                }
            }
        }

        #endregion
    }
}