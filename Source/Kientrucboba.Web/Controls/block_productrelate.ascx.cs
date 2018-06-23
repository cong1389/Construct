using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cb.Utility;
using Cb.Model;
using System.Web.UI.HtmlControls;
using Cb.BLL.Product;
using Cb.Model.Products;
using Cb.DBUtility;
using System.Configuration;
using Cb.BLL;
using Cb.Localization;
using Cb.Web.Common;
using System.Data;

namespace Cb.Web.Controls
{
    public partial class block_productrelate : DGCUserControl
    {
        #region Parameter

        protected string template_path, pageName, nameurl, url, cid, cidsub, id, categoryID;
        int total;

        #endregion

        #region Common

        private void InitPage()
        {
            template_path = WebUtils.GetWebPath();
            pageName = Utils.GetParameter("page", "home");
            cid = Utils.GetParameter("cid", string.Empty);
            cidsub = Utils.GetParameter("cidsub", string.Empty);
            id = Utils.GetParameter("id", string.Empty);

            GetDetail();
            ShowConfig();
        }

        /// <summary>
        /// ishHot=true,cateid=sanphamID
        /// </summary>
        private void GetDetail()
        {
            ProductCategoryBLL pcBllCate = new ProductCategoryBLL();
            IList<PNK_ProductCategory> lstCate = pcBllCate.GetList(LangInt, pageName, "1", int.MinValue, true, "p.ordering", 1, 1000, out  total);
            if (lstCate.Count > 0)
            {
                ltrProductRelate.Text = string.Format("{0} {1}", lstCate[0].ProductCategoryDesc.Name, LocalizationUtility.GetText("ltrProductRelate", Ci));
                hypAll.HRef = LinkHelper.GetLink(lstCate[0].ProductCategoryDesc.NameUrl, LangId);

                categoryID = lstCate[0].Id.ToString();
                DataTable dtb = DBHelper.ExcuteFromCmd("SELECT * FROM dbo.fc_GetAllChildProductCategory(" + categoryID + ",1)", null);
                string[] array = dtb.AsEnumerable()
                                    .Select(row => row.Field<Int32>("id").ToString())
                                    .ToArray();
                string idFirst = string.Join(",", array);

                ProductBLL pcBll = new ProductBLL();
                IList<PNK_Product> lst = pcBll.GetListRelate(LangInt, string.Empty, idFirst, id, 1, 9999, out  total);
                if (lst.Count > 0)
                {
                    this.rptResult.DataSource = lst;
                    this.rptResult.DataBind();
                }
            }


        }

        private void ShowConfig()
        {
            ConfigurationBLL pcBll = new ConfigurationBLL();
            IList<PNK_Configuration> lst = pcBll.GetList();
            foreach (PNK_Configuration item in lst)
            {
                if (item.Key_name == Constant.Configuration.config_fbfanpage)
                {
                    this.hypFB.HRef = item.Value_name;
                }
                else if (item.Key_name == Constant.Configuration.config_googleplus)
                {
                    this.hypGooglePlus.HRef = item.Value_name;
                }
                else if (item.Key_name == Constant.Configuration.config_twitter)
                {
                    this.hypTwitter.HRef = item.Value_name;
                }
                else if (item.Key_name == Constant.Configuration.config_linkedIn)
                {
                    this.hypLinkedIn.HRef = item.Value_name;
                }
                else if (item.Key_name == Constant.Configuration.config_pinterest)
                {
                    this.hypPinTerest.HRef = item.Value_name;
                }
                else if (item.Key_name == Constant.Configuration.config_reddit)
                {
                    this.hypReddit.HRef = item.Value_name;
                }
            }
        }

        #endregion

        #region Event

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                InitPage();
            }
        }

        protected void rptResult_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                PNK_Product data = e.Item.DataItem as PNK_Product;

                HtmlAnchor hypContinus = e.Item.FindControl("hypContinus") as HtmlAnchor;
                HtmlAnchor hypImg = e.Item.FindControl("hypImg") as HtmlAnchor;

                Dictionary<string, object> dic = UtilityLocal.GetHRefByLevel(data, LangInt, LangId, Ci);
                hypImg.HRef = hypContinus.HRef = dic["HRef"].ToString();

                HtmlImage img = e.Item.FindControl("img") as HtmlImage;
                img.Src = WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ProductUpload"], data.Image);
                img.Attributes.Add("srcset", WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ProductUpload"], data.Image));

                Literal ltrTitle = e.Item.FindControl("ltrTitle") as Literal;
                ltrTitle.Text = hypContinus.Title = hypImg.Title = data.ProductDesc.Title;

                Literal ltrContinus = e.Item.FindControl("ltrContinus") as Literal;
                ltrContinus.Text = LocalizationUtility.GetText("ltrContinus", Ci);
            }
        }

        #endregion
    }
}