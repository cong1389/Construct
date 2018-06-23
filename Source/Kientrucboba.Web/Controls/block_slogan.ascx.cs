using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Cb.Model;
using Cb.Localization;
using Cb.BLL;
using System.IO;
using Cb.Model.Products;
using Cb.BLL.Product;
using Cb.DBUtility;
using System.Configuration;
using System.Web.UI.HtmlControls;
using Cb.Utility;
using Cb.Web.Common;
using Cb.Model.ContentStatic;

namespace Cb.Web.Controls
{
    public partial class block_slogan : DGCUserControl
    {
        #region Parameter

        protected string pageName, template_path = string.Empty;

        private int id, total;

        IList<PNK_ProductCategory> lstAll;
        IList<PNK_ProductCategory> lstParent;
        private ProductCategoryBLL pcBll
        {
            get
            {
                if (ViewState["pcBll"] != null)
                    return (ProductCategoryBLL)ViewState["pcBll"];
                else return new ProductCategoryBLL();
            }
            set
            {
                ViewState["pcBll"] = value;
            }
        }

        #endregion

        #region Common

        private void InitPage()
        {
            GetSlogan();
        }

        private void GetSlogan()
        {
            ContentStaticBLL pcBll = new ContentStaticBLL();
            IList<PNK_ContentStatic> lst = pcBll.GetList(LangInt, string.Empty, ConfigurationManager.AppSettings["contentStatic_Slogan"], string.Empty, 1, 10000, out total);
            if (total > 0)
            {
                ltrSlogan.Text = lst[0].ContentStaticDesc.Brief;
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

        #endregion
    }
}