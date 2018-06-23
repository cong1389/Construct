using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Cb.Model;
using System.Globalization;
using Cb.DBUtility;
using Cb.BLL;
using System.Text;
using System.Web.Script.Serialization;
using System.Collections;
using Cb.Model.Products;
using Cb.BLL.Product;
using System.Web.UI.WebControls;

namespace Cb.Web.WebServices
{
    /// <summary>
    /// Summary description for Service
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 

    [System.Web.Script.Services.ScriptService]
    public class Service : System.Web.Services.WebService
    {
        [WebMethod]
        public string UploadBaseImage()
        {
            return "success";
        }

        /// <summary>
        /// Lấy địa chỉ Path Page
        /// </summary>
        /// <param name="id">id sản phẩm</param>
        /// <returns>VD: Page/CategoryManagement/Category.ascx</returns>
        [WebMethod]
        public string GetCategoryPageDetail(int id)
        {
            int total;
            string result = string.Empty;
            ProductCategoryBLL pcBll = new ProductCategoryBLL();
            IList<PNK_ProductCategory> lst = pcBll.GetList(1, string.Empty, string.Empty, id, int.MinValue, false, string.Empty, 1, 100, out  total);
            if (total > 0)
                result = lst[0].PageDetail;
            return result;
        }
    }
}
