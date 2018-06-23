using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Cb.IDAL;
using Cb.DALFactory;
using Cb.Model;
using Cb.DBUtility;
using System.Data;
using System.Configuration;


namespace Cb.BLL
{
    [Serializable]
    public class FengShuiBLL
    {
        private static IGeneric2C<PNK_FengShui, PNK_FengShuiDesc> dal_2C;

        private string prefixParam;

        public FengShuiBLL()
        {
            Type t = typeof(Cb.SQLServerDAL.Generic2C<PNK_FengShui, PNK_FengShuiDesc>);
            dal_2C = DataAccessGeneric2C<PNK_FengShui, PNK_FengShuiDesc>.CreateSession(t.FullName);

            switch (ConfigurationManager.AppSettings["Database"])
            {
                case "SQLServer":
                    prefixParam = "@";
                    break;
                case "MySQL":
                    prefixParam = "v_";
                    break;
            }
        }

        public IList<PNK_FengShui> GetList(int langId, string publish, int year, string directionHouse, int sex, int pageIndex, int pageSize, out int total)
        {
            IList<PNK_FengShui> lst = new List<PNK_FengShui>();
            DGCParameter[] param = new DGCParameter[7];

            if (langId != int.MinValue)
                param[0] = new DGCParameter(string.Format("{0}langId", prefixParam), DbType.Int16, langId);
            else
                param[0] = new DGCParameter(string.Format("{0}langId", prefixParam), DbType.Int16, DBNull.Value);

            if (year != int.MinValue)
                param[1] = new DGCParameter(string.Format("{0}year ", prefixParam), DbType.String, year);
            else
                param[1] = new DGCParameter(string.Format("{0}year ", prefixParam), DbType.String, DBNull.Value);

            if (pageIndex != int.MinValue)
                param[2] = new DGCParameter(string.Format("{0}pageIndex", prefixParam), DbType.Int32, pageIndex);
            else
                param[2] = new DGCParameter(string.Format("{0}pageIndex", prefixParam), DbType.Int32, DBNull.Value);

            if (pageSize != int.MinValue)
                param[3] = new DGCParameter(string.Format("{0}pageSize", prefixParam), DbType.Int32, pageSize);
            else
                param[3] = new DGCParameter(string.Format("{0}pageSize", prefixParam), DbType.Int32, DBNull.Value);

            if (sex != int.MinValue)
                param[4] = new DGCParameter(string.Format("{0}sex", prefixParam), DbType.String, sex);
            else
                param[4] = new DGCParameter(string.Format("{0}sex", prefixParam), DbType.String, DBNull.Value);

            if (!string.IsNullOrEmpty(directionHouse))
                param[5] = new DGCParameter(string.Format("{0}directionHouse", prefixParam), DbType.String, directionHouse);
            else
                param[5] = new DGCParameter(string.Format("{0}directionHouse", prefixParam), DbType.String, DBNull.Value);

            if (!string.IsNullOrEmpty(publish))
                param[6] = new DGCParameter(string.Format("{0}published", prefixParam), DbType.AnsiString, publish);
            else
                param[6] = new DGCParameter(string.Format("{0}published", prefixParam), DbType.AnsiString, DBNull.Value);

            lst = dal_2C.GetList("FengShui_Get", param, out total);
            return lst;
        }
    }
}
