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
using System.Text;

namespace Cb.Web.Controls
{
    public partial class block_categorytemplate : DGCUserControl
    {
        #region Parameter

        protected string template_path, pageName, cid, cidsub, id, records, hot = string.Empty, feature = string.Empty, categoryID = string.Empty;
        int total;

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

        int totalSearch;
        public int TotalSearch { get; set; }

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

            // ltrAll.Text = LocalizationUtility.GetText("ltrAll", Ci);

            //  BindCategory();

            //Show page pc, mobile
            // block_categorypagetemplate.Visible = cidsub == "page" ? true : false;

            if (pageName == "tim-kiem" || pageName == "search")
            {
                //this.records = DBConvert.ParseString(totalSearch);
                //this.pager.PageSize = DBConvert.ParseInt(ConfigurationManager.AppSettings["pageSizeCate"]);
                //this.pager.ItemCount = totalSearch;

                //this.rptResult.DataSource = lstSearch;
                //this.rptResult.DataBind();

                ////Set header
                //ProductCategoryBLL pcBll = new ProductCategoryBLL();
                //IList<PNK_ProductCategory> lst = pcBll.GetList(LangInt, string.Empty, "1", DBConvert.ParseInt(ConfigurationManager.AppSettings["parentIdTemplate"]), int.MinValue, false, string.Empty, 1, 1, out  total);
                //if (total > 0)
                //{
                //    //ltrCateNameTitle.Text = lst[0].ProductCategoryDesc.Name;
                //    // ltrCategoryBrief.Text = lst[0].ProductCategoryDesc.Brief;
                //}
            }
            else
                GetProduct(string.Empty);


        }

        ////Bind drop cate
        //private void BindCategory()
        //{
        //    string strTemp;
        //    drpCategory.Items.Clear();
        //    drpCategory.Items.Add(new ListItem(LocalizationUtility.GetText("ltrAll", Ci), ConfigurationManager.AppSettings["parentIdTemplate"]));
        //    ProductCategoryBLL ncBll = new ProductCategoryBLL();
        //    IList<PNK_ProductCategory> lst = ncBll.GetList(LangInt, string.Empty, string.Empty, int.Parse(ConfigurationManager.AppSettings["parentIdTemplate"]), false, "p.ordering", 1, 1000, out  total);
        //    if (lst != null && lst.Count > 0)
        //    {
        //        foreach (PNK_ProductCategory item in lst)
        //        {
        //            strTemp = item.ProductCategoryDesc.Name;
        //            drpCategory.Items.Add(new ListItem(strTemp, DBConvert.ParseString(item.Id)));
        //        }
        //    }
        //}

        private void GetProduct(string categoryIDSelect)
        {
            try
            {
                string categoryID = null;
                categoryID = GetProductCategory();
                total = 0;
                ProductBLL pcBll = new ProductBLL();
                IList<PNK_Product> lst = null;

                if (cidsub == "page")
                {
                    lst = pcBll.GetList(LangInt, cid, "1", string.Empty, string.Empty, currentPageIndex, DBConvert.ParseInt(ConfigurationManager.AppSettings["pageSizeCate"]), out total);
                }
                else if (cidsub != string.Empty && cid != string.Empty)
                {
                    lst = pcBll.GetList(LangInt, cidsub, "1", string.Empty, string.Empty, currentPageIndex, DBConvert.ParseInt(ConfigurationManager.AppSettings["pageSizeCate"]), out total);
                }
                else if (cidsub == string.Empty && cid != string.Empty && categoryID != string.Empty)
                {
                    DataTable dtb = DBHelper.ExcuteFromCmd("SELECT * FROM dbo.fc_GetAllChildProductCategory(" + categoryID + ",1)", null);
                    string[] array = dtb.AsEnumerable()
                                        .Select(row => row.Field<Int32>("id").ToString())
                                        .ToArray();
                    string idFirst = string.Join(",", array);
                    if (pageName == "home" || pageName == "trang-chu")
                    {
                        lst = pcBll.GetList(LangInt, string.Empty, "1", idFirst, string.Empty, 1, 6, out total);
                    }
                    else
                    {
                        lst = pcBll.GetList(LangInt, string.Empty, "1", idFirst, string.Empty, currentPageIndex, DBConvert.ParseInt(ConfigurationManager.AppSettings["pageSizeCate"]), out total);
                    }
                }
                else if (cid == string.Empty && categoryID != string.Empty)
                {
                    DataTable dtb = DBHelper.ExcuteFromCmd("SELECT * FROM dbo.fc_GetAllChildProductCategory(" + categoryID + ",1)", null);
                    string[] array = dtb.AsEnumerable()
                                        .Select(row => row.Field<Int32>("id").ToString())
                                        .ToArray();
                    string idFirst = string.Join(",", array);
                    if (dtb != null && dtb.Rows.Count > 0)
                    {
                        if (pageName == "home" || pageName == "trang-chu")
                        {
                            lst = pcBll.GetList(LangInt, string.Empty, "1", idFirst, string.Empty, 1, 8, out total);
                        }
                        else
                        {
                            lst = pcBll.GetList(LangInt, string.Empty, "1", idFirst, string.Empty, currentPageIndex, DBConvert.ParseInt(ConfigurationManager.AppSettings["pageSizeCate"]), out total);
                        }

                    }
                }

                //total = lst.Count;
                if (total > 0)
                {
                    if (pageName != "home" && pageName != "trang-chu")
                    {
                        this.records = DBConvert.ParseString(total);
                        this.pager.PageSize = DBConvert.ParseInt(ConfigurationManager.AppSettings["pageSizeCate"]);
                        this.pager.ItemCount = total;
                    }

                    this.rptResult.DataSource = lst;
                    this.rptResult.DataBind();

                }
            }
            catch (Exception ex)
            {
                Write2Log.WriteLogs("block_category", "GetProduct", ex.Message);
            }
        }

        private string GetProductCategory()
        {
            ProductCategoryBLL pcBll = new ProductCategoryBLL();
            IList<PNK_ProductCategory> lst = null;
            IList<PNK_ProductCategory> lst2 = null;

            if (cidsub != string.Empty && cid != string.Empty && id != string.Empty)
            {
                lst = pcBll.GetList(LangInt, cid, "1", int.MinValue, true, "p.ordering", 1, 1000, out total);
                //ltrCategoryBrief.Text = lst[0].ProductCategoryDesc.Brief;

                categoryID = lst[0].ProductCategoryDesc.Id.ToString();
                CategoryHtml(lst);
                WebUtils.SeoPage(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaDecription, lst[0].ProductCategoryDesc.MetaKeyword, this.Page);
                WebUtils.SeoTagH(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, Controls);

                //Gen html image category
                ltrHeaderCategory.Text = Common.UtilityLocal.ImagePathByFont(lst[0]);
            }
            else if (cidsub != string.Empty && cid != string.Empty)
            {
                lst = pcBll.GetList(LangInt, cid, "1", int.MinValue, true, "p.ordering", 1, 1000, out total);
                if (total > 0)
                {
                    CategoryHtml(lst);

                    //lần 2 truyền parentID vào để lấy ds con
                    lst = pcBll.GetList(LangInt, string.Empty, string.Empty, lst[0].Id, false, "p.ordering", 1, 1000, out total);
                    WebUtils.SeoPage(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaDecription, lst[0].ProductCategoryDesc.MetaKeyword, this.Page);
                    WebUtils.SeoTagH(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, Controls);

                    //Gen html image category
                    ltrHeaderCategory.Text = Common.UtilityLocal.ImagePathByFont(lst[0]);

                    //Chỉ có 1 menu cha
                    if (total > 0)
                    {
                        CategoryHtml(lst);

                        //ltrCategoryBrief.Text = lst[0].ProductCategoryDesc.Brief;
                        categoryID = lst[0].ProductCategoryDesc.Id.ToString();
                    }
                    else
                        categoryID = null;
                }
            }
            else if (cidsub == string.Empty && cid != string.Empty)
            {
                lst = pcBll.GetList(LangInt, cid, "1", int.MinValue, true, "p.ordering", 1, 1000, out total);
                WebUtils.SeoPage(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaDecription, lst[0].ProductCategoryDesc.MetaKeyword, this.Page);
                WebUtils.SeoTagH(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, Controls);

                //Gen html image category
                ltrHeaderCategory.Text = Common.UtilityLocal.ImagePathByFont(lst[0]);

                //IList<PNK_ProductCategory> lstSub = pcBll.GetList(LangInt, string.Empty, string.Empty, lst[0].Id, false, "p.ordering", 1, 1000, out  total);
                if (lst.Count > 1)
                {
                    CategoryHtml(lst);
                    // ltrCategoryBrief.Text = lst[0].ProductCategoryDesc.Brief;
                    categoryID = lst[0].ProductCategoryDesc.Id.ToString();
                }
                else if (lst.Count == 1)
                {
                    CategoryHtml(lst);
                    // ltrCategoryBrief.Text = lst[0].ProductCategoryDesc.Brief;
                    categoryID = lst[0].ProductCategoryDesc.Id.ToString();
                }
                else
                    categoryID = null;
            }
            else if (cid == string.Empty)
            {
                //lần đầu lấy parentID
                if (pageName == "home" || pageName == "trang-chu")
                {
                    lst2 = pcBll.GetList(LangInt, string.Empty, "1", DBConvert.ParseInt(ConfigurationManager.AppSettings["parentIdTemplate"]), false, "p.ordering", 1, 6, out total);
                    if (lst2.Count > 0)
                    {
                        CategoryHtml(lst2);
                        categoryID = lst2[0].ParentId.ToString();
                    }

                    //Get catename
                    lst = pcBll.GetList(LangInt, string.Empty, "1", DBConvert.ParseInt(ConfigurationManager.AppSettings["parentIdTemplate"]), int.MinValue, false, string.Empty, 1, 1, out total);
                    if (lst.Count > 0)
                    {
                        ltrCateName.Text = lst[0].ProductCategoryDesc.Name;
                        ltrCateBrief.Text = lst[0].ProductCategoryDesc.Brief;
                    }
                }
                else
                {
                    lst = pcBll.GetList(LangInt, pageName, "1", int.MinValue, true, "p.ordering", 1, 1000, out total);
                    WebUtils.SeoPage(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaDecription, lst[0].ProductCategoryDesc.MetaKeyword, this.Page);
                    WebUtils.SeoTagH(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, Controls);

                    //Gen html image category
                    ltrHeaderCategory.Text = Common.UtilityLocal.ImagePathByFont(lst[0]);
                    //lần 2 truyền parentID vào để lấy ds con
                    lst2 = pcBll.GetList(LangInt, string.Empty, string.Empty, lst[0].Id, false, "p.ordering", 1, 1000, out total);
                    //lst = lst2.Count > 0 ? lst2 : lst;
                    if (lst.Count > 0)
                    {
                        // lst2 = lst2.Where(m => m.Id == DBConvert.ParseInt(ConfigurationManager.AppSettings["parentIdWebCompany"]) || m.Id == DBConvert.ParseInt(ConfigurationManager.AppSettings["parentIdWebShop"])).ToList();
                        CategoryHtml(lst2);
                        ltrCateName.Text = lst[0].ProductCategoryDesc.Name;
                        ltrCateBrief.Text = lst[0].ProductCategoryDesc.Brief;
                        categoryID = lst[0].Id.ToString();
                    }
                    else
                    {
                        CategoryHtml(lst2);
                        ltrCateName.Text = lst2[0].ProductCategoryDesc.Name;
                        ltrCateBrief.Text = lst[0].ProductCategoryDesc.Brief;
                        categoryID = lst2[0].ParentId.ToString();
                    }
                }
            }

            return categoryID;
        }

        private void CategoryHtml(IList<PNK_ProductCategory> lst)
        {
            if (lst.Count > 0)
            {
                rptCategory.DataSource = lst;
                rptCategory.DataBind();
                // hypTitle1.HRef = lst[0].ProductCategoryDesc.NameUrl;
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
                HtmlAnchor hypImg = e.Item.FindControl("hypImg") as HtmlAnchor;
                HtmlAnchor hypContinus = e.Item.FindControl("hypContinus") as HtmlAnchor;
                //cid = Utils.GetParameter("cid", string.Empty);
                //string link = UtilityLocal.GetPathTreeNameUrl(data.CategoryId, LangInt, LangId);
                //int level = link.Count(i => i.Equals('/'));

                Dictionary<string, object> dic = UtilityLocal.GetHRefByLevel(data, LangInt, LangId, Ci);
                hypImg.HRef = hypContinus.HRef = dic["HRef"].ToString();

                //switch (ConfigurationManager.AppSettings["Version"])
                //{
                //    case "1":
                //        hypContinus.HRef = hypImg.HRef = WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ProductUpload"], data.Image);
                //        break;
                //    case "2":
                //        if (level == 3)
                //        {
                //            hypContinus.HRef = hypImg.HRef = LinkHelper.GetLink(pageName, LangId, cid, data.CategoryUrlDesc, data.ProductDesc.TitleUrl);
                //        }
                //        else if (level == 2)
                //        {
                //            hypContinus.HRef = hypImg.HRef = LinkHelper.GetLink(link, "page", data.ProductDesc.TitleUrl);
                //            //hypImg.HRef = LinkHelper.GetLink(link, LocalizationUtility.GetText("linktmp", Ci), data.ProductDesc.TitleUrl);
                //        }
                //        else if (level == 1)
                //        {
                //            hypContinus.HRef = hypImg.HRef = LinkHelper.GetLink(UtilityLocal.GetPathTreeNameUrl(data.CategoryId, LangInt, LangId), LocalizationUtility.GetText("linkCate", Ci), "page", data.ProductDesc.TitleUrl);
                //            //hypImg.HRef = LinkHelper.GetLink(UtilityLocal.GetPathTreeNameUrl(data.CategoryId, LangInt, LangId), LocalizationUtility.GetText("linkCate", Ci), LocalizationUtility.GetText("linktmp", Ci), data.ProductDesc.TitleUrl);
                //        }
                //        break;
                //}

                HtmlImage img = e.Item.FindControl("img") as HtmlImage;
                img.Src = WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ProductUpload"], data.Image);
                img.Attributes.Add("srcset", WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ProductUpload"], data.Image));

                Literal ltrTitle = e.Item.FindControl("ltrTitle") as Literal;
                hypImg.Title = ltrTitle.Text = img.Alt = img.Attributes["title"] = data.ProductDesc.Title;

                HtmlControl article = e.Item.FindControl("article") as HtmlControl;
                //article.Attributes.Add("data-title", "data.ProductDesc.Title");
                article.Attributes.Add("class", string.Format("post-item col-md-3 col-sm-4 col-xs-12 {0}", data.CategoryUrlDesc));

                Literal ltrContinus = e.Item.FindControl("ltrContinus") as Literal;
                ltrContinus.Text = LocalizationUtility.GetText("ltrContinus", Ci);

            }
        }

        protected void rptCategory_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                PNK_ProductCategory data = e.Item.DataItem as PNK_ProductCategory;

                Literal ltrTitle = e.Item.FindControl("ltrTitle") as Literal;
                ltrTitle.Text = data.ProductCategoryDesc.Name;

                HtmlAnchor hypTitle = e.Item.FindControl("hypTitle") as HtmlAnchor;
                hypTitle.Attributes.Add("data-filter", string.Format(".{0}", data.ProductCategoryDesc.NameUrl));
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