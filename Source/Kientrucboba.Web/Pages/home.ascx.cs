using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cb.BLL;
using Cb.Model;
using Cb.Utility;
using Cb.BLL.Product;
using Cb.Model.Products;
using Cb.DBUtility;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Configuration;
using System.Data;
using Cb.Web.Common;
using Cb.Localization;
using System.Text;
using Cb.Model.ContentStatic;
using System.Text.RegularExpressions;

namespace Cb.Web.Pages
{
    public partial class home : DGCUserControl
    {
        #region Parameter

        protected string categoryID, title, metaDescription, metaKeyword, h1, h2, h3, analytic, pageName, cid, cidsub, id;
        private string activeClass = "";
        int total;


        #endregion

        #region Common

        private void InitPage()
        {
            GetIntro();
            GetSEO();

            GetProject();
            GetService();
            GetWhat();
            GetLastBlog();
        }

        private void GetProject()
        {
            try
            {
                ProductBLL pcBll = new ProductBLL();
                DataTable dtb = DBHelper.ExcuteFromCmd("SELECT * FROM dbo.fc_GetAllChildProductCategory(" + ConfigurationManager.AppSettings["parentIdProject"] + ",1)", null);
                if (dtb != null && dtb.Rows.Count > 0)
                {
                    string[] array = dtb.AsEnumerable()
                            .Select(row => row.Field<Int32>("id").ToString())
                            .ToArray();
                    string idFirst = string.Join(",", array);
                    IList<PNK_Product> lst = pcBll.GetList(LangInt, string.Empty, "1", idFirst, string.Empty, string.Empty, string.Empty, 1, 6, out total);
                    if (lst.Count > 0)
                    {
                        this.rptProject.DataSource = lst;
                        this.rptProject.DataBind();
                    }
                }

                ProductCategoryBLL pcBllCate = new ProductCategoryBLL();
                IList<PNK_ProductCategory> lstCate = pcBllCate.GetList(LangInt, string.Empty, string.Empty, DBConvert.ParseInt(ConfigurationManager.AppSettings["parentIdProject"]), int.MinValue, false, string.Empty, 1, 1, out  total);
                if (lstCate.Count > 0)
                {
                    ltrCateName.Text = string.Format("{0} {1}", lstCate[0].ProductCategoryDesc.Name, LocalizationUtility.GetText("ltrWorking", Ci));// lstCate[0].ProductCategoryDesc.Name;
                    //ltrCateBrief.Text = lstCate[0].ProductCategoryDesc.Brief;

                    hypContinusProject.HRef = LinkHelper.GetLink(lstCate[0].ProductCategoryDesc.NameUrl, LangId);
                    //ltrContinusProject.Text = LocalizationUtility.GetText("ltrContinus", Ci);
                }
            }
            catch (Exception ex)
            {
                Write2Log.WriteLogs("home", "GetProject", ex.Message);
            }
        }

        /// <summary>
        /// Get count
        /// </summary>
        private void GetIntro()
        {
            ContentStaticBLL pcBll = new ContentStaticBLL();
            IList<PNK_ContentStatic> lst = pcBll.GetList(LangInt, string.Empty, ConfigurationManager.AppSettings["contentStatic_IntroByHome"], string.Empty, 1, 1, out total);
            if (total > 0)
            {
                imgIntro.Src = WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ContentStaticUpload"], lst[0].Image);
                ltrIntroName.Text = lst[0].ContentStaticDesc.Title;
                ltrIntroBrief.Text = lst[0].ContentStaticDesc.Brief;
            }


            //ProductBLL pcBll = new ProductBLL();

            //DataTable dtb = DBHelper.ExcuteFromCmd("SELECT * FROM dbo.fc_GetAllChildProductCategory(" + ConfigurationManager.AppSettings["contentStatic_IntroByHome"] + ",1)", null);
            //if (dtb != null && dtb.Rows.Count > 0)
            //{
            //    string[] array = dtb.AsEnumerable()
            //               .Select(row => row.Field<Int32>("id").ToString())
            //               .ToArray();
            //    string idFirst = string.Join(",", array);
            //    IList<PNK_Product> lst = pcBll.GetList(LangInt, string.Empty, string.Empty, idFirst, string.Empty, 1, 4, out total);
            //    if (lst.Count > 0)
            //    {

            //    }
            //}
        }

        /// <summary>
        /// Get count
        /// </summary>
        private void GetService()
        {
            ProductBLL pcBll = new ProductBLL();

            DataTable dtb = DBHelper.ExcuteFromCmd("SELECT * FROM dbo.fc_GetAllChildProductCategory(" + ConfigurationManager.AppSettings["parentIdService"] + ",1)", null);
            if (dtb != null && dtb.Rows.Count > 0)
            {
                string[] array = dtb.AsEnumerable()
                           .Select(row => row.Field<Int32>("id").ToString())
                           .ToArray();
                string idFirst = string.Join(",", array);
                IList<PNK_Product> lst = pcBll.GetList(LangInt, string.Empty, "1", idFirst, string.Empty, string.Empty, "1", 1, 4, out  total);
                if (lst.Count > 0)
                {
                    this.rptService.DataSource = lst;
                    this.rptService.DataBind();
                }
            }
        }

        /// <summary>
        /// Get count
        /// </summary>
        private void GetWhat()
        {
            ProductBLL pcBll = new ProductBLL();

            DataTable dtb = DBHelper.ExcuteFromCmd("SELECT * FROM dbo.fc_GetAllChildProductCategory(" + ConfigurationManager.AppSettings["parentIdCommentCustomer"] + ",1)", null);
            if (dtb != null && dtb.Rows.Count > 0)
            {
                string[] array = dtb.AsEnumerable()
                           .Select(row => row.Field<Int32>("id").ToString())
                           .ToArray();
                string idFirst = string.Join(",", array);
                IList<PNK_Product> lst = pcBll.GetList(LangInt, string.Empty, "1", idFirst, string.Empty, string.Empty, "1", 1, 100, out  total);
                if (lst.Count > 0)
                {
                    this.rptWhat.DataSource = lst;
                    this.rptWhat.DataBind();

                    ltrWhatCateName.Text = lst[0].CategoryNameDesc;
                    ltrWhatCateBrief.Text = lst[0].CategoryBriefDesc;
                }
            }
        }

        private void GetSEO()
        {
            ConfigurationBLL pcBll = new ConfigurationBLL();
            IList<PNK_Configuration> lst = pcBll.GetList();
            if (lst != null && lst.Count > 0)
            {
                foreach (PNK_Configuration item in lst)
                {
                    if (item.Key_name == Constant.Configuration.config_title)
                    {
                        title = item.Value_name;
                    }
                    else if (item.Key_name == Constant.Configuration.config_metaDescription)
                    {
                        metaDescription = item.Value_name;
                    }
                    else if (item.Key_name == Constant.Configuration.config_metaKeyword)
                    {
                        metaKeyword = item.Value_name;
                    }

                    else if (item.Key_name == Constant.Configuration.config_h1)
                    {
                        h1 = item.Value_name;
                    }
                    else if (item.Key_name == Constant.Configuration.config_h2)
                    {
                        h2 = item.Value_name;
                    }
                    else if (item.Key_name == Constant.Configuration.config_h3)
                    {
                        h3 = item.Value_name;
                    }
                    else if (item.Key_name == Constant.Configuration.config_analytic)
                    {
                        analytic = item.Value_name;
                    }
                }

                WebUtils.SeoPage(title, metaDescription, metaKeyword, this.Page);
                //WebUtils.SeoTagH(h1, h2, h3, Controls);

                //Google Analytic
                WebUtils.IncludeJSScript(this.Page, analytic);
            }
        }

        /// <summary>
        /// Blog cuối cùng
        /// </summary>
        private void GetLastBlog()
        {
            ProductBLL pcBll = new ProductBLL();
            DataTable dtb = DBHelper.ExcuteFromCmd("SELECT * FROM dbo.fc_GetAllChildProductCategory(" + DBConvert.ParseInt(ConfigurationManager.AppSettings["parentIdLastBlog"]) + ",1)", null);
            string[] array = dtb.AsEnumerable()
                                .Select(row => row.Field<Int32>("id").ToString())
                                .ToArray();
            string idFirst = string.Join(",", array);
            IList<PNK_Product> lst = pcBll.GetList(LangInt, string.Empty, "1", idFirst, string.Empty, string.Empty, string.Empty, 1, 4, out  total);
            if (total > 0)
            {
                rptLastBlog.DataSource = lst.OrderByDescending(m => m.PostDate);
                rptLastBlog.DataBind();

                ltrLastBlogCateName.Text = lst[0].CategoryNameDesc;
            }

            ProductCategoryBLL pcBllCate = new ProductCategoryBLL();
            IList<PNK_ProductCategory> lstCate = pcBllCate.GetList(LangInt, string.Empty, "1", DBConvert.ParseInt(ConfigurationManager.AppSettings["parentIdLastBlog"]), int.MinValue, false, string.Empty, 1, 1, out  total);
            if (lstCate.Count > 0)
            {
                ltrLastBlogCateName.Text = lstCate[0].ProductCategoryDesc.Name;

                hypLastBlogCateName.HRef = LinkHelper.GetLink(lstCate[0].ProductCategoryDesc.NameUrl, LangId);
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

        protected void rptService_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                PNK_Product data = e.Item.DataItem as PNK_Product;

                //   HtmlAnchor hypContinus = e.Item.FindControl("hypContinus") as HtmlAnchor;

                //Dictionary<string, object> dic = UtilityLocal.GetHRefByLevel(data, LangInt, LangId, Ci);
                //hypContinus.HRef = dic["HRef"].ToString();

                //HtmlImage img = e.Item.FindControl("img") as HtmlImage;
                //img.Src = WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ProductUpload"], data.Image);

                Literal ltrServiceIcon = e.Item.FindControl("ltrServiceIcon") as Literal;
                ltrServiceIcon.Text = data.ImageFont;

                Literal ltrSeriveTitle = e.Item.FindControl("ltrSeriveTitle") as Literal;
                ltrSeriveTitle.Text = DBHelper.getTruncate(data.ProductDesc.Title, 12);

                Literal ltrServiceBrief = e.Item.FindControl("ltrServiceBrief") as Literal;
                ltrServiceBrief.Text = data.ProductDesc.Brief;
            }
        }

        protected void rptWhat_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                PNK_Product data = e.Item.DataItem as PNK_Product;

                HtmlImage imgWhat = e.Item.FindControl("imgWhat") as HtmlImage;
                imgWhat.Src = WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ProductUpload"], data.Image);
                imgWhat.Attributes.Add("srcset", WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ProductUpload"], data.Image));

                Literal ltrWhatTitle = e.Item.FindControl("ltrWhatTitle") as Literal;
                ltrWhatTitle.Text = DBHelper.getTruncate(data.ProductDesc.Title, 12); 

                Literal ltrWhatBrief = e.Item.FindControl("ltrWhatBrief") as Literal;
                ltrWhatBrief.Text = data.ProductDesc.Brief;
            }
        }

        protected void rptProject_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                PNK_Product data = e.Item.DataItem as PNK_Product;

                HtmlAnchor hypImg = e.Item.FindControl("hypImg") as HtmlAnchor;
                HtmlAnchor hypTitle = e.Item.FindControl("hypTitle") as HtmlAnchor;

                Dictionary<string, object> dic = UtilityLocal.GetHRefByLevel(data, LangInt, LangId, Ci);
                hypImg.HRef = hypTitle.HRef = dic["HRef"].ToString();

                HtmlImage img = e.Item.FindControl("img") as HtmlImage;
                img.Src = WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ProductUpload"], data.Image);

                Literal ltrTitle = e.Item.FindControl("ltrTitle") as Literal;
                hypImg.Title = ltrTitle.Text = img.Alt = img.Attributes["title"] = DBHelper.getTruncate(data.ProductDesc.Title, 12); 

                Literal ltrBrief = e.Item.FindControl("ltrBrief") as Literal;
                ltrBrief.Text = data.ProductDesc.Brief;
            }
        }

        protected void rptLastBlog_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                PNK_Product data = e.Item.DataItem as PNK_Product;

                HtmlImage imgLastBlog = e.Item.FindControl("imgLastBlog") as HtmlImage;
                imgLastBlog.Src = WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ProductUpload"], data.Image);
                imgLastBlog.Attributes.Add("srcset", WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ProductUpload"], data.Image));

                HtmlAnchor hypLastBlogImg = e.Item.FindControl("hypLastBlogImg") as HtmlAnchor;
                HtmlAnchor hypLastBlogTitle = e.Item.FindControl("hypLastBlogTitle") as HtmlAnchor;

                Dictionary<string, object> dic = UtilityLocal.GetHRefByLevel(data, LangInt, LangId, Ci);
                hypLastBlogTitle.HRef = hypLastBlogImg.HRef = dic["HRef"].ToString();

                Literal ltrLastBlogTitle = e.Item.FindControl("ltrLastBlogTitle") as Literal;
                hypLastBlogTitle.Title = hypLastBlogImg.Title = imgLastBlog.Alt = imgLastBlog.Attributes["title"] =
                    ltrLastBlogTitle.Text = hypLastBlogImg.Title = DBHelper.getTruncate(data.ProductDesc.Title, 20);

                Literal ltrLastBlogBrief = e.Item.FindControl("ltrLastBlogBrief") as Literal;
                ltrLastBlogBrief.Text = hypLastBlogImg.Title = DBHelper.getTruncate(data.ProductDesc.Brief, 20);

                Literal ltrLastBlogDate = e.Item.FindControl("ltrLastBlogDate") as Literal;
                ltrLastBlogDate.Text = data.PostDate.ToString("dd/MM/yyyy");
            }
        }


        #endregion
    }
}