using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cb.BLL;
using Cb.Model;
using Cb.DBUtility;
using Cb.Model.Products;
using Cb.BLL.Product;
using Cb.Localization;
using System.Configuration;
using Cb.Utility;

namespace Cb.Web
{
    public partial class _default : DGCPage
    {
        #region Parameter

        protected string cid, cidsub, pageName, id, template_path = string.Empty, langId = string.Empty;
        private int total;

        #endregion

        #region Common

        private void GetPageName(string pageName)
        {
            try
            {
                //cid = Utils.GetParameter("page", string.Empty);
                cid = Utils.GetParameter("cid", string.Empty);
                cidsub = Utils.GetParameter("cidsub", string.Empty);
                id = Utils.GetParameter("id", string.Empty);

                //if (pageName == "tim-kiem" || pageName == "search")
                //{
                //    //id = cid;
                //    //cidsub = pageName = string.Empty;
                //}
                
                if (cidsub != string.Empty && id != string.Empty)
                {
                    //Đi đến trang danh mục giao diện nhưng có hình PC, Mobile
                    if (cidsub.ToLower() == "page")
                    {
                        pageName = "Pages/TemplateManagement/Template.ascx";
                        Session["level"] = 3;
                    }
                    else
                    {
                        ProductBLL pcBll = new ProductBLL();
                        cidsub = cidsub != LocalizationUtility.GetText("linktmp", Ci) ? cidsub : string.Empty;
                        IList<PNK_Product> lst = pcBll.GetList(LangInt, cidsub, string.Empty, string.Empty, id, null, string.Empty, 1, 9999, out total);
                        if (total > 0)
                        {
                            lst = lst.Where(p => p.ProductDesc.TitleUrl == id).ToList();
                            pageName = lst[0].Page;
                            Session["level"] = 3;
                        }
                    }
                }
                else
                {
                    ProductCategoryBLL pcBll = new ProductCategoryBLL();
                    if ((cid == string.Empty && id == string.Empty) || (pageName == "tim-kiem" || pageName == "search"))
                    {
                        IList<PNK_ProductCategory> lst = pcBll.GetList(LangInt, pageName, string.Empty, int.MinValue, false, "p.ordering", 1, 9999, out  total);
                        if (total > 0)
                        {
                            pageName = lst[0].Page;
                            Session["level"] = lst[0].PathTree.Count(i => i.Equals('.'));
                        }
                    }
                    else
                    {
                        IList<PNK_ProductCategory> lst = pcBll.GetList(LangInt, cid, string.Empty, int.MinValue, false, "p.ordering", 1, 9999, out  total);
                        if (total > 0)
                        {
                            pageName = lst[0].Page;
                            Session["level"] = lst[0].PathTree.Count(i => i.Equals('.'));
                        }
                    }
                }

                //draft code


                UserControl contentView = (UserControl)Page.LoadControl(pageName);
                phdContent.Controls.Add(contentView);
            }
            catch (Exception ex)
            {
                Write2Log.WriteLogs("default.aspx", "GetPageName", ex.Message + "/" + cid + "/" + cidsub + "/" + id);
            }

        }

        #endregion

        #region Event

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Page.IsPostBack)
            //{
            pageName = Utils.GetParameter("page", "trang-chu");
            GetPageName(pageName);
            //}
        }

        #endregion
    }
}