using Cb.BLL.Product;
using Cb.DBUtility;
using Cb.Model.Products;
using Cb.Utility;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Cb.Web.Common;
using Cb.Localization;

namespace Cb.Web.Controls
{
    public partial class block_category : DGCUserControl
    {
        #region Parameter

        protected string template_path, pageName, cid, cidsub, id, records, hot = string.Empty, feature = string.Empty, categoryID = string.Empty, parentID = string.Empty;
        int total, level = 0;

        string categoryIdByPass = string.Empty;
        public string CategoryIdByPass
        {
            get
            {
                if (CategoryIdByPass != string.Empty)
                    return categoryIdByPass;
                else
                    return string.Empty;
            }
            set
            {
                categoryIdByPass = value;
            }
        }

        int totalSearch;
        public int TotalSearch { get; set; }

        protected int currentPageIndex
        {
            get
            {
                if (ViewState["CurrentPageIndex"] != null)
                    return int.Parse(ViewState["CurrentPageIndex"].ToString());
                else
                    return 1;
            }
            set
            {
                ViewState["CurrentPageIndex"] = value;
            }
        }

        ProductCategoryBLL pcBll = new ProductCategoryBLL();
        IList<PNK_Product> _lstSearch;
        public IList<PNK_Product> lstSearch { set; get; }

        #endregion

        #region Common

        private void InitPage()
        {
            template_path = WebUtils.GetWebPath();
            pageName = Utils.GetParameter("page", "home");
            cid = Utils.GetParameter("cid", string.Empty);
            cidsub = Utils.GetParameter("cidsub", string.Empty);
            id = Utils.GetParameter("id", string.Empty);

            if (Session["level"] != null)
            {
                level = DBConvert.ParseInt(Session["level"].ToString());
            }

            if (pageName == "tim-kiem" || pageName == "search")
            {
                this.records = DBConvert.ParseString(totalSearch);
                this.pager.PageSize = DBConvert.ParseInt(ConfigurationManager.AppSettings["pageSizeCate"]);
                this.pager.ItemCount = totalSearch;

                this.rptResult.DataSource = lstSearch;
                this.rptResult.DataBind();
            }
            else
            {
                GetProductCategory();
            }

        }

        private void GetProduct(string categoryID)
        {
            try
            {
                categoryID = categoryIdByPass == string.Empty ? categoryID : categoryIdByPass;

                ProductBLL pcBll = new ProductBLL();
                Dictionary<string, object> dic = Common.UtilityLocal.GetProduct(pageName, categoryID, level, LangInt, currentPageIndex, DBConvert.ParseInt(ConfigurationManager.AppSettings["pageSizeCate"]));
                if (dic != null && dic.Count > 0)
                {
                    IList<PNK_Product> lst = dic["DictProduct"] as IList<PNK_Product>;
                    if (lst.Count > 0)
                    {
                        this.records = dic["DictProduct_Total"].ToString();
                        this.pager.PageSize = DBConvert.ParseInt(ConfigurationManager.AppSettings["pageSizeCate"]);
                        this.pager.ItemCount = DBConvert.ParseDouble(dic["DictProduct_Total"].ToString());

                        this.rptResult.DataSource = lst;
                        this.rptResult.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                Write2Log.WriteLogs("block_category", "GetProduct", ex.Message);
            }
        }

        private string GetProductCategory()
        {
            Dictionary<string, object> dic = Common.UtilityLocal.GetProductCategory(pageName, cid, cidsub, id, LangInt, Session["level"].ToString());
            if (dic != null && dic.Count > 0)
            {
                IList<PNK_ProductCategory> lst = dic["DictProductCategory"] as IList<PNK_ProductCategory>;
                if (lst.Count > 0)
                {
                    //Gen html image category
                    ltrHeaderCategory.Text = Common.UtilityLocal.ImagePathByFont(lst[0]);
                    GetProduct(lst[0].Id.ToString());

                    WebUtils.SeoPage(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaDecription, lst[0].ProductCategoryDesc.MetaKeyword, this.Page);
                    //   WebUtils.SeoTagH(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, Controls);
                }
            }

            return categoryID;
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
                HtmlAnchor hypImg = e.Item.FindControl("hypImg") as HtmlAnchor;
                HtmlAnchor hypTitle = e.Item.FindControl("hypTitle") as HtmlAnchor;
                HtmlAnchor hypContinus = e.Item.FindControl("hypContinus") as HtmlAnchor;

                Dictionary<string, object> dic = UtilityLocal.GetHRefByLevel(data, LangInt, LangId, Ci);
                hypTitle.HRef = hypImg.HRef = hypContinus.HRef = dic["HRef"].ToString();

                HtmlImage img = e.Item.FindControl("img") as HtmlImage;
                img.Src = WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ProductUpload"], data.Image);

                Literal ltrTitle = e.Item.FindControl("ltrTitle") as Literal;
                hypImg.Title = ltrTitle.Text = img.Alt = img.Attributes["title"] = data.ProductDesc.Title;

                Literal ltrBrief = e.Item.FindControl("ltrBrief") as Literal;
                ltrBrief.Text = data.ProductDesc.Brief;

                Literal ltrContinus = e.Item.FindControl("ltrContinus") as Literal;
                ltrContinus.Text = LocalizationUtility.GetText("ltrContinus", Ci);
            }
        }

        public void pager_Command(object sender, CommandEventArgs e)
        {
            this.currentPageIndex = Convert.ToInt32(e.CommandArgument);
            pager.CurrentIndex = this.currentPageIndex;
            InitPage();
        }

        #endregion
    }
}