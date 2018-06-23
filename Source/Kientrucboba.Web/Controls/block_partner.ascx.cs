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
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Cb.Web.Controls
{
    public partial class block_partner : DGCUserControl
    {
        #region Parameter

        protected string title, metaDescription, metaKeyword, h1, h2, h3, analytic;
        int total;

        #endregion

        #region Common

        private void InitPage()
        {
            GetManufacture();
        }

        private void GetManufacture()
        {
            BannerBLL bannerBLL = new BannerBLL();
            IList<PNK_Banner> lst = bannerBLL.GetList(DBConvert.ParseInt(ConfigurationManager.AppSettings["partnerId"]), string.Empty, "1", 1, 100, out total);
            if (total > 0)
            {
                this.rptManufacture.DataSource = lst;
                this.rptManufacture.DataBind();
            }

            //IList<PNK_Banner> lstPartner = bannerBLL.GetList(DBConvert.ParseInt(ConfigurationManager.AppSettings["partnerId"]), string.Empty, "1", 1, 100, out total);
            //if (total > 0)
            //{
            //    this.rptPartner.DataSource = lstPartner;
            //    this.rptPartner.DataBind();
            //}
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


        protected void rptManufacture_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                PNK_Banner data = e.Item.DataItem as PNK_Banner;

                HtmlImage img = e.Item.FindControl("img") as HtmlImage;
                img.Src = WebUtils.GetUrlImage(ConfigurationManager.AppSettings["SliderUpload"], data.Image);

                //if (data.OutPage == 1)
                //{
                //    HtmlAnchor hypImg = e.Item.FindControl("hypImg") as HtmlAnchor;
                //    hypImg.HRef = data.LinkUrl;
                //}

                Literal ltrTitle = e.Item.FindControl("ltrTitle") as Literal;
                ltrTitle.Text = data.Name;
            }
        }

        #endregion
    }
}