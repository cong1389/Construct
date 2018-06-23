using Cb.BLL;
using Cb.BLL.Product;
using Cb.DBUtility;
using Cb.Localization;
using Cb.Model;
using Cb.Model.Products;
using Cb.Utility;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cb.Web.Pages.FengShuiManagement
{
    public partial class FengShuiDetail : DGCUserControl
    {
        #region Parameter

        private string title, metaDescription, metaKeyword, h1, h2, h3, analytic, background;
        protected string template_path, pageName, cid, id, records;
        int total;

        #endregion

        #region Common

        private void InitPage()
        {
            template_path = WebUtils.GetWebPath();
            pageName = Utils.GetParameter("page", "home");
            cid = Utils.GetParameter("cid", string.Empty);
            id = Utils.GetParameter("id", string.Empty);

            ltrBirthdayOwer.Text = LocalizationUtility.GetText("ltrBirthdayOwer", Ci);
            ltrDirectHouse.Text = LocalizationUtility.GetText("ltrDirectHouse", Ci);
            ltrSex.Text = LocalizationUtility.GetText("ltrSex", Ci);

            btnViewFengShui.Text = LocalizationUtility.GetText("btnViewFengShui", Ci);

            ltrNamSinhDuongLichName.Text = LocalizationUtility.GetText("ltrNamSinhDuongLichName", Ci);
            ltrNamSinhAmLichName.Text = LocalizationUtility.GetText("ltrNamSinhAmLichName", Ci);
            ltrQueMenhName.Text = LocalizationUtility.GetText("ltrQueMenhName", Ci);
            ltrNguHanhName.Text = LocalizationUtility.GetText("ltrNguHanhName", Ci);
            ltrHuongNhaName.Text = LocalizationUtility.GetText("ltrHuongNhaName", Ci);

            ltrTayBacName.Text = LocalizationUtility.GetText("ltrTayBacName", Ci);
            ltrBacName.Text = LocalizationUtility.GetText("ltrBacName", Ci);
            ltrDongBacName.Text = LocalizationUtility.GetText("ltrDongBacName", Ci);
            ltrTayName.Text = LocalizationUtility.GetText("ltrTayName", Ci);
            ltrTayNamName.Text = LocalizationUtility.GetText("ltrTayNamName", Ci);
            ltrNamName.Text = LocalizationUtility.GetText("ltrNamName", Ci);
            ltrDongNamName.Text = LocalizationUtility.GetText("ltrDongNamName", Ci);
            ltrDongName.Text = LocalizationUtility.GetText("ltrDongName", Ci);

            ltrVongBatQuai.Text = LocalizationUtility.GetText("ltrVongBatQuai", Ci);
            ltrVongBatQuaiTitle.Text = LocalizationUtility.GetText("ltrVongBatQuaiTitle", Ci);

            ListItem lst = null;
            for (int i = 1920; i < 2050; i++)
            {
                lst = new ListItem();
                lst.Text = i.ToString();
                lst.Value = i.ToString();
                drpYear.Items.Add(lst);
            }

            SetHeader();
            GetViewDirection();
        }

        private void GetViewDirection()
        {
            int year = DBConvert.ParseInt(drpYear.SelectedValue);
            string directionHouse = Utils.RemoveUnicode(drpDirectionHouse.SelectedValue.ToLower());
            int sex = DBConvert.ParseInt(drpSex.SelectedValue);

            FengShuiBLL pcBll = new FengShuiBLL();
            IList<PNK_FengShui> lst = pcBll.GetList(LangInt, "1", year, directionHouse, sex, 1, 1, out total);
            if (total > 0)
            {
                ltrNamSinhDuongLichValue.Text = lst[0].FengShuiDesc.NamSinhDuongLich;
                ltrNamSinhAmLichValue.Text = lst[0].FengShuiDesc.NamSinhAmLich;
                ltrQueMenhValue.Text = lst[0].FengShuiDesc.QuaMenh;
                ltrNguHanhValue.Text = lst[0].FengShuiDesc.NguHanh;
                ltrHuongNhaValue.Text = lst[0].FengShuiDesc.HuongNha;

                ltrTayBacValue.Text = lst[0].FengShuiDesc.TayBac;
                ltrBacValue.Text = lst[0].FengShuiDesc.Bac;
                ltrDongBacValue.Text = lst[0].FengShuiDesc.DongBac;

                ltrTayValue.Text = lst[0].FengShuiDesc.Tay;
                ltrBacDongNamTayValue.Text = lst[0].FengShuiDesc.BacDongNamTay;
                ltrDongValue.Text = lst[0].FengShuiDesc.Dong;

                ltrTayNamValue.Text = lst[0].FengShuiDesc.TayNam;
                ltrNameValue.Text = lst[0].FengShuiDesc.Nam;
                ltrDongNamValue.Text = lst[0].FengShuiDesc.DongNam;

                img.Src = WebUtils.GetUrlImage(ConfigurationManager.AppSettings["FengShuiUpload"], lst[0].Image);

                ltrVongBatQuaiDetail.Text = lst[0].FengShuiDesc.Detail;

                divTable.Visible = divVongBatQuaiChiTiet.Visible = divVongBatQuai.Visible = true;
            }
            else
            {
                ltrHuongNhaValue.Text = ltrNguHanhValue.Text = ltrQueMenhValue.Text = ltrNamSinhAmLichValue.Text = ltrNamSinhDuongLichValue.Text = string.Empty;
                divTable.Visible = divVongBatQuaiChiTiet.Visible = divVongBatQuai.Visible = false;
            }
        }

        private void SetHeader()
        {
            //Set header
            ProductCategoryBLL pcBll = new ProductCategoryBLL();
            IList<PNK_ProductCategory> lst = pcBll.GetList(LangInt, pageName, string.Empty, int.MinValue, int.MinValue, false, string.Empty, 1, 1, out  total);
            if (total > 0)
            {
                //Gen html image category
                ltrHeaderCategory.Text = Common.UtilityLocal.ImagePathByFont(lst[0]);

                WebUtils.SeoPage(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaDecription, lst[0].ProductCategoryDesc.MetaKeyword, this.Page);
                WebUtils.SeoTagH(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, Controls);
            }
        }

        #endregion

        #region Event

        protected void btnViewFengShui_ServerClick(object sender, EventArgs e)
        {
            GetViewDirection();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                InitPage();
            }
        }

        #endregion
    }
}