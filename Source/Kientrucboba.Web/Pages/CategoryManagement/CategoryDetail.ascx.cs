using Cb.BLL;
using Cb.BLL.Product;
using Cb.Localization;
using Cb.Model;
using Cb.Model.Products;
using Cb.Utility;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Cb.Web.Pages.CategoryManagement
{
    public partial class CategoryDetail : DGCUserControl
    {
        #region Parameter

        private string title, metaDescription, metaKeyword, h1, h2, h3, analytic, background;
        protected string template_path, pageName, cid, id, records, hypLinkCommentFB;
        int total;

        #endregion

        #region Common

        private void InitPage()
        {
            template_path = WebUtils.GetWebPath();
            pageName = Utils.GetParameter("page", "home");
            cid = Utils.GetParameter("cid", string.Empty);
            id = Utils.GetParameter("id", string.Empty);

            ltrDetailHeader.Text = LocalizationUtility.GetText("ltrDetail", Ci);
            ltrContact.Text = LocalizationUtility.GetText("ltrContact", Ci);

            GetDetail();
            GetConfig();

            hypLinkCommentFB = Utils.CombineUrl(Template_path, Request.RawUrl);
            ltrFBComment.Text = LocalizationUtility.GetText("ltrFBComment", Ci);
        }

        private void GetDetail()
        {
            ProductBLL pcBll = new ProductBLL();
            IList<PNK_Product> lst = null;
            if (Session["level"] != null)
            {
                string level = Session["level"].ToString();
                switch (level)
                {
                    case "1":
                        lst = pcBll.GetList(LangInt, pageName, string.Empty, string.Empty, string.Empty, null, string.Empty, 1, 9999, out total);
                        break;
                    case "2":
                        lst = pcBll.GetList(LangInt, cid, string.Empty, string.Empty, string.Empty, null, string.Empty, 1, 9999, out total);
                        break;
                    case "3":
                    default:
                        lst = pcBll.GetList(LangInt, string.Empty, string.Empty, string.Empty, id, null, string.Empty, 1, 9999, out total);
                        break;
                }
            }

            if (total > 0)
            {
                ltrTitle.Text = lst[0].ProductDesc.Title;
                ltrDetail.Text = lst[0].ProductDesc.Detail;

                //Get img slide
                GetListImage(lst[0].Id.ToString());

                ltrHeaderCategory.Text = Common.UtilityLocal.ImagePathByFont(lst[0]);

                Dictionary<string, object> dic = new Dictionary<string, object>();
                dic.Add(LocalizationUtility.GetText("ltrClientName", Ci), lst[0].ProductDesc.Position);
                dic.Add(LocalizationUtility.GetText("ltrLocationName", Ci), lst[0].ProductDesc.Utility);
                dic.Add(LocalizationUtility.GetText("ltrSiteAreaName", Ci), lst[0].ProductDesc.Design);
                dic.Add(LocalizationUtility.GetText("ltrUrbanName", Ci), lst[0].ProductDesc.Pictures);
                dic.Add(LocalizationUtility.GetText("ltrAssociateName", Ci), lst[0].ProductDesc.Payment);
                dic.Add(LocalizationUtility.GetText("ltrArchitectName", Ci), lst[0].ProductDesc.Contact);

                dic.Add(LocalizationUtility.GetText("ltrWorkCarried", Ci), lst[0].ProductDesc.WorkCarried);
                dic.Add(LocalizationUtility.GetText("ltrTimeCarried", Ci), lst[0].ProductDesc.TimeCarried);
                dic.Add(LocalizationUtility.GetText("ltrOther", Ci), lst[0].ProductDesc.Other);

                GetDetailRight(dic);

                //ArrayList arr = new ArrayList();
                //arr.Add(lst[0].ProductDesc.Position);
                //arr.Add(lst[0].ProductDesc.Utility);

                WebUtils.SeoPage(lst[0].ProductDesc.MetaTitle, lst[0].ProductDesc.Metadescription, lst[0].ProductDesc.MetaKeyword, this.Page);
                WebUtils.SeoTagH(lst[0].ProductDesc.H1, lst[0].ProductDesc.H2, lst[0].ProductDesc.H3, this.Controls);
            }
        }

        private void GetListImage(string productID)
        {
            UploadImageBLL bll = new UploadImageBLL();
            IList<PNK_UploadImage> lst = bll.GetList(string.Empty, productID, "1", 1, 100, out  total);
            if (total > 0)
            {
                divSlide.Visible = true;

                rptResult.DataSource = lst.Where(m => m.Name != "Youtube");
                rptResult.DataBind();

                //Video
                IList<PNK_UploadImage> lstVideo = lst.Where(m => m.Name == "Youtube").ToList();
                if (lstVideo.Count > 0)
                {
                    hypVideo.HRef = lstVideo[0].ImagePath;
                }

            }
        }

        private void GetDetailRight(Dictionary<string, object> dic)
        {
            string result = string.Empty;
            StringBuilder sb = new StringBuilder();
            int i = 1;
            foreach (KeyValuePair<string, object> item in dic)
            {
                if (item.Value != "")
                {
                    sb.Append(" <li>");
                    sb.AppendFormat("<span class=\"badge\">{0}</span> ", i);
                    sb.AppendFormat(" <span class=\"box-label\">{0}</span>", item.Key);
                    sb.AppendFormat("<span class=\"box-value\">{0}</span> ", item.Value);
                    sb.Append(" </li>");
                    i++;
                }
            }
            ltrDetailRight.Text = sb.ToString();
        }

        private void GetConfig()
        {
            ConfigurationBLL pcBll = new ConfigurationBLL();
            IList<PNK_Configuration> lst = pcBll.GetList();
            if (lst != null && lst.Count > 0)
            {
                foreach (PNK_Configuration item in lst)
                {
                    if (item.Key_name == Constant.Configuration.email)
                    {
                        ltrEmail.Text = item.Value_name;
                    }
                    else if (item.Key_name == Constant.Configuration.phone)
                    {
                        ltrPhoneValue.Text = item.Value_name;
                    }
                    if (LangInt == 1)
                    {
                        if (item.Key_name == Constant.Configuration.config_address_vi)
                        {
                            ltrAddressValue.Text = item.Value_name;
                        }

                    }
                    else
                    {
                        if (item.Key_name == Constant.Configuration.config_address1_vi)
                        {
                            ltrAddressValue.Text = item.Value_name;
                        }
                    }

                    //if (item.Key_name == Constant.Configuration.config_fblike)
                    //{
                    //    ltrFBLike.Text = item.Value_name;
                    //}
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
                PNK_UploadImage data = e.Item.DataItem as PNK_UploadImage;

                HtmlImage img = e.Item.FindControl("img") as HtmlImage;

                img.Src = WebUtils.GetUrlImage(ConfigurationManager.AppSettings["ProductUpload"], data.Name);
                img.Alt = img.Attributes["title"] = data.Name;
            }
        }

        #endregion
    }
}
