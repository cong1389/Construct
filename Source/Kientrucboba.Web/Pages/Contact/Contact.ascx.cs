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
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Cb.Web.Pages.Contact
{
    public partial class Contact : DGCUserControl
    {
        #region Parameter

        protected string pageName, template_path = string.Empty, id = string.Empty, cid = string.Empty, cidsub = string.Empty, ImagePath=string.Empty;

        private int total;
        int bookingId = int.MinValue;

        #endregion

        #region Common

        private void InitPage()
        {
            template_path = WebUtils.GetWebPath();
            pageName = Utils.GetParameter("page", "home");
            cid = Utils.GetParameter("cid", string.Empty);
            cidsub = Utils.GetParameter("cidsub", string.Empty);
            id = Utils.GetParameter("id", string.Empty);

           

            SetHeader();

            //Bind data drp dịch vụ
            GetDataDropDownCategory(drpService, DBConvert.ParseInt(ConfigurationManager.AppSettings["parentIdService"]), LocalizationUtility.GetText("ltrServiceDropTitle", Ci));
            //Bind data drp công trình
            GetDataDropDownCategory(drpConstructions, DBConvert.ParseInt(ConfigurationManager.AppSettings["parentIdTemplate"]), LocalizationUtility.GetText("ltrConstructionsDropTitle", Ci));
            //Bind data drp location
            GetLocation();

            ltrCateNameTitle.Text = LocalizationUtility.GetText("ltrCateNameTitle", Ci);
            btnSend.Text = LocalizationUtility.GetText("btnSend", Ci);

            txtFullName.Attributes.Add("placeholder", LocalizationUtility.GetText("txtFullName", Ci));
            txtPhone.Attributes.Add("placeholder", LocalizationUtility.GetText("txtPhone", Ci));
            txtArea.Attributes.Add("placeholder", LocalizationUtility.GetText("txtArea", Ci));
            txtSubject.Attributes.Add("placeholder", LocalizationUtility.GetText("txtSubject", Ci));
            txtMessage.Attributes.Add("placeholder", LocalizationUtility.GetText("txtMessage", Ci));
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


                //ltrCategoryBrief.Text = lst[0].ProductCategoryDesc.Brief;

                WebUtils.SeoPage(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaDecription, lst[0].ProductCategoryDesc.MetaKeyword, this.Page);
                WebUtils.SeoTagH(lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, lst[0].ProductCategoryDesc.MetaTitle, Controls);
            }
        }

        private void GetDataDropDownCategory(DropDownList drp, int categoryId, string title)
        {
            ProductCategoryBLL pcBll = new ProductCategoryBLL();
            drp.Items.Clear();
            drp.Items.Add(new ListItem(title, "-1"));
            IList<PNK_ProductCategory> lst = pcBll.GetList(LangInt, string.Empty, string.Empty, categoryId, false, "p.ordering", 1, 1000, out total);
            if (lst != null && lst.Count > 0)
            {
                foreach (PNK_ProductCategory item in lst)
                {
                    drp.Items.Add(new ListItem(item.ProductCategoryDesc.Name, DBConvert.ParseString(item.Id)));
                }
            }
        }

        private void GetLocation()
        {
            LocationBLL pcBll = new LocationBLL();
            drpLocation.Items.Clear();
            drpLocation.Items.Add(new ListItem(LocalizationUtility.GetText("ltrLocationDropTitle", Ci), "-1"));
            IList<PNK_Location> lst = pcBll.GetList(LangInt, string.Empty, 1, 500, out total);
            if (lst != null && lst.Count > 0)
            {
                foreach (PNK_Location item in lst)
                {
                    drpLocation.Items.Add(new ListItem(item.ObjLocDesc.Name, DBConvert.ParseString(item.Id)));
                }
            }
        }

        /// <summary>
        /// get data for insert update
        /// </summary>
        /// <param name="userObj"></param>
        /// <returns></returns>
        private PNK_Booking GetDataObjectParent(PNK_Booking obj)
        {
            obj.ParentId = 1;
            obj.FullName = txtFullName.Value.Trim();
            obj.PhoneNumber = txtPhone.Value.Trim();
            obj.RequestTour = drpService.Items[drpService.SelectedIndex].Text;
            obj.ExpectedDepartureDate = drpConstructions.Items[drpConstructions.SelectedIndex].Text;
            obj.NumberOfAduts = drpLocation.Items[drpLocation.SelectedIndex].Text;
            obj.NumberOfChildren = txtArea.Value.Trim();
            obj.Published = "1";
            obj.Email = txtEmail.Value.Trim();


            obj.HotelType = txtSubject.Value.Trim();
            obj.ArrivalPort = txtMessage.Value.Trim();
            //obj.RoomType = drpRoomType.Items[drpRoomType.SelectedIndex].Text;
            //obj.RoomOther = txtRoomOther.Value.Trim();
            //obj.BedType = drpBedType.Items[drpBedType.SelectedIndex].Text;
            //obj.BedOther = txtBedOther.Value.Trim();
            //obj.VisaOfNeed = rdVisaYes.Checked == true ? "Yes" : "No";
            //obj.KnowThrough = drpKnow.Items[drpKnow.SelectedIndex].Text;
            //obj.PaymentMethod = drpPayment.Items[drpPayment.SelectedIndex].Text;
            //obj.Distance = drpDistance.Items[drpDistance.SelectedIndex].Text;
            //obj.FlightArrivalNo = txtFlightArrivalNo.Text.Trim();
            //obj.FlightArrivaTime = txtFlightArrialTime.Text.Trim();
            //obj.FlightDepartureTime = txtFlightDepartureTime.Text.Trim();
            //obj.FlightArrivalDate = txtFlightArrivalDate.Text.Trim();
            //obj.FlightDepartureDate = txtFlightDepartureDate.Text.Trim();

            //obj.CustomerHeight = txtCustomerHeight.Text.Trim();
            //obj.HotelName = txtHotelName.Text.Trim();
            //obj.CustomerAge = txtCustomerAge.Text.Trim();
            //obj.HotelAddress = txtHotelAddress.Text.Trim();


            obj.UpdateDate = DateTime.Now;
            obj.PostDate = DateTime.Now;


            return obj;
        }

        /// <summary>
        /// get data child for insert update
        /// </summary>
        /// <param name="contdescObj"></param>
        /// <returns></returns>
        private PNK_BookingDesc GetDataObjectChild(PNK_BookingDesc productcatdescObj, int lang)
        {
            switch (lang)
            {
                case 1:
                    productcatdescObj.MainId = 1;
                    productcatdescObj.LangId = Constant.DB.LangId;
                    productcatdescObj.Name = SanitizeHtml.Sanitize(txtFullName.Value);
                    break;
                case 2:
                    productcatdescObj.MainId = 1;
                    productcatdescObj.LangId = Constant.DB.LangId_En;
                    productcatdescObj.Name = SanitizeHtml.Sanitize(txtFullName.Value);
                    break;
            }
            return productcatdescObj;
        }

        /// <summary>
        /// Save location
        /// </summary>
        private int SaveBooking()
        {
            Generic<PNK_Booking> genericBLL = new Generic<PNK_Booking>();
            Generic2C<PNK_Booking, PNK_BookingDesc> generic2CBLL = new Generic2C<PNK_Booking, PNK_BookingDesc>();
            PNK_Booking bookingObj = new PNK_Booking();
            PNK_BookingDesc bookingObjVn = new PNK_BookingDesc();
            PNK_BookingDesc bookingObjEn = new PNK_BookingDesc();
            //if (this.productcategoryId == int.MinValue)
            //{
            //get data insert
            bookingObj = this.GetDataObjectParent(bookingObj);
            bookingObj.Ordering = genericBLL.getOrdering();
            bookingObjVn = this.GetDataObjectChild(bookingObjVn, Constant.DB.LangId);
            bookingObjEn = this.GetDataObjectChild(bookingObjEn, Constant.DB.LangId_En);

            List<PNK_BookingDesc> lst = new List<PNK_BookingDesc>();
            lst.Add(bookingObjVn);
            lst.Add(bookingObjEn);

            //excute
            bookingId = generic2CBLL.Insert(bookingObj, lst);

            return bookingId;
        }

        private void SendEmailTempate(PNK_Booking obj)
        {
            string companyName = string.Empty, companyEmail = string.Empty, companyPhone = string.Empty; ;

            ConfigurationBLL pcBll = new ConfigurationBLL();
            IList<PNK_Configuration> lst = pcBll.GetList();
            if (lst != null && lst.Count > 0)
            {
                foreach (PNK_Configuration item in lst)
                {
                    if (item.Key_name == Constant.Configuration.config_company_name_vi)
                    {
                        companyName = item.Value_name;
                    }
                    if (item.Key_name == Constant.Configuration.email)
                    {
                        companyEmail = item.Value_name;
                    }
                    if (item.Key_name == Constant.Configuration.phone)
                    {
                        companyPhone = item.Value_name;
                    }
                }
            }

            string path = Request.PhysicalApplicationPath;
            string strHtml = WebUtils.GetMailTemplate(Path.Combine(path, "TemplateMail/Booking.txt"));
            string body = string.Format(strHtml,
                companyName,//0
                obj.FullName,//1
                obj.Email,//2
                obj.PhoneNumber,//3
                  obj.RequestTour,//4
                   obj.ExpectedDepartureDate,//5
                   obj.NumberOfAduts,//6
                   obj.NumberOfChildren,//7
                   obj.HotelType,//8
                   obj.RoomType,//9
                   obj.RoomOther,//10
                   obj.BedType,//11
                   obj.BedOther,//12
                   obj.ArrivalPort,//13
                   obj.VisaOfNeed,//14
                   obj.PaymentMethod,//15
                   obj.Distance,//16
                   obj.FlightArrivalNo,//17
                   obj.FlightArrivaTime,//18
                   obj.FlightArrivalDate,//19
                   obj.FlightDepartureTime,//20
                     obj.FlightDepartureDate,//21
                        obj.CustomerHeight,//22
                        obj.CustomerAge,//23
                        obj.HotelName,//24
                         obj.HotelAddress,//25
                         companyEmail,//26
                         companyPhone,//27


                "fasfasf");
            WebUtils.SendEmail("LienHe", string.Empty, string.Empty, body);
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

        protected void FileUpload1_Complete(object sender, EventArgs e)
        {
            string fileName = System.IO.Path.GetFileName(fileUpload1.FileName);

            string filePath = string.Empty;
            string extension = string.Empty;
            string fileNameUpload = string.Empty;
            try
            {
                // Get selected image extension
                extension = Path.GetExtension(fileName).ToLower();
                if (fileName != null)
                {
                    ImagePath = ConfigurationManager.AppSettings["ContactUpload"];
                    fileNameUpload = string.Format("{0}{1}{2}", fileName.Split('.')[0], DateTime.Now.ToString("ddMMyyyyhhmmss"), extension);

                    filePath = Path.Combine(Server.MapPath(ImagePath), fileNameUpload);
                    //Check image is of valid type or not
                    if (extension == ".jpg" || extension == ".jpeg" || extension == ".png" || extension == ".gif" || extension == ".bmp")
                    {
                        //Upload bằng AsyncFileUpload
                        fileUpload1.SaveAs(filePath);

                        Session["ImageAttach1"] = "";
                        Session["ImageAttach1"] = fileNameUpload;

                        string url = string.Format("{0}/{1}", ImagePath, fileNameUpload);

                        ScriptManager.RegisterClientScriptBlock(fileUpload1, this.GetType(), "newfile"
    , "window.parent.$find('" + fileUpload1.ClientID + "').newFileName='" + fileNameUpload + "|" + url + "';", true);

                    }
                    else
                    {
                        // lblMsg.Text = "Please select jpg, jpeg, png, gif or bmp file only";
                    }
                }
                else
                {
                    // lblMsg.Text = "Please select file to upload";
                }
            }
            catch (Exception ex)
            {
                // lblMsg.Text = "Oops!! error occured : " + ex.Message.ToString();
            }
            finally
            {
                extension = string.Empty;
            }
        }

        protected void btnSend_ServerClick(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    bookingId = SaveBooking();

                    if (bookingId != int.MinValue)
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), Guid.NewGuid().ToString(), string.Format("jAlert('Gửi Liên hệ thành công','Message',function(r) {{window.location='{0}'}});", Request.RawUrl), true);
                    else
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), Guid.NewGuid().ToString(), string.Format("jAlert('Gửi Liên hệ thất baị','Message',function(r) {{window.location='{0}'}});", Request.RawUrl), true);
                    txtEmail.Value = txtMessage.Value = txtFullName.Value = "";
                }
            }
            catch (Exception ex)
            {
                Write2Log.WriteLogs("btnSend_ServerClick.aspx", "Contact", ex.Message);
            }
        }

        #endregion
    }
}