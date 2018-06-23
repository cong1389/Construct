/**
                             * @version $Id:
                             * @package Digicom.NET
                             * @author Digicom Dev <dev@dgc.vn>
                             * @copyright Copyright (C) 2011 by Digicom. All rights reserved.
                             * @link http://www.dgc.vn
                            */

using System;
using System.Data;
using System.Data.Common;
using System.Collections.Generic;
using System.Text;

namespace Cb.Model
{
    public class PNK_FengShuiDesc
    {
        #region fields
        private int id;
        private int mainId;
        private int langId;
        private string title;
        private string detail;
        private string titleUrl;
        private int year;
        private string directionHouse;
        private int sex;
        private string namSinhDuongLich;
        private string namSinhAmLich;
        private string quaMenh;
        private string nguHanh;
        private string huongNha;
        private string bac;
        private string dongBac;
        private string dong;
        private string dongNam;
        private string nam;
        private string tayNam;
        private string tay;
        private string tayBac;
        private string bacDongNamTay;
        private string metaTitle;
        private string metaKeyword;
        private string metaDecription;
        #endregion

        #region properties
        public int Id
        {
            get { return this.id; }
            set { this.id = value; }
        }
        public int MainId
        {
            get { return this.mainId; }
            set { this.mainId = value; }
        }
        public int LangId
        {
            get { return this.langId; }
            set { this.langId = value; }
        }
        public string Title
        {
            get { return this.title; }
            set { this.title = value; }
        }
        public string Detail
        {
            get { return this.detail; }
            set { this.detail = value; }
        }
        public string TitleUrl
        {
            get { return this.titleUrl; }
            set { this.titleUrl = value; }
        }
        public int Year
        {
            get { return this.year; }
            set { this.year = value; }
        }
        public string DirectionHouse
        {
            get { return this.directionHouse; }
            set { this.directionHouse = value; }
        }
        public int Sex
        {
            get { return this.sex; }
            set { this.sex = value; }
        }
        public string NamSinhDuongLich
        {
            get { return this.namSinhDuongLich; }
            set { this.namSinhDuongLich = value; }
        }
        public string NamSinhAmLich
        {
            get { return this.namSinhAmLich; }
            set { this.namSinhAmLich = value; }
        }
        public string QuaMenh
        {
            get { return this.quaMenh; }
            set { this.quaMenh = value; }
        }
        public string NguHanh
        {
            get { return this.nguHanh; }
            set { this.nguHanh = value; }
        }
        public string HuongNha
        {
            get { return this.huongNha; }
            set { this.huongNha = value; }
        }
        public string Bac
        {
            get { return this.bac; }
            set { this.bac = value; }
        }
        public string DongBac
        {
            get { return this.dongBac; }
            set { this.dongBac = value; }
        }
        public string Dong
        {
            get { return this.dong; }
            set { this.dong = value; }
        }
        public string DongNam
        {
            get { return this.dongNam; }
            set { this.dongNam = value; }
        }
        public string Nam
        {
            get { return this.nam; }
            set { this.nam = value; }
        }
        public string TayNam
        {
            get { return this.tayNam; }
            set { this.tayNam = value; }
        }
        public string Tay
        {
            get { return this.tay; }
            set { this.tay = value; }
        }
        public string TayBac
        {
            get { return this.tayBac; }
            set { this.tayBac = value; }
        }
        public string BacDongNamTay
        {
            get { return this.bacDongNamTay; }
            set { this.bacDongNamTay = value; }
        }
        public string MetaTitle
        {
            get { return this.metaTitle; }
            set { this.metaTitle = value; }
        }
        public string MetaKeyword
        {
            get { return this.metaKeyword; }
            set { this.metaKeyword = value; }
        }
        public string MetaDecription
        {
            get { return this.metaDecription; }
            set { this.metaDecription = value; }
        }
        #endregion

        #region constructor
        public PNK_FengShuiDesc()
        {
            this.id = int.MinValue;
            this.mainId = int.MinValue;
            this.langId = int.MinValue;
            this.title = string.Empty;
            this.detail = string.Empty;
            this.titleUrl = string.Empty;
            this.year = int.MinValue;
            this.directionHouse = string.Empty;
            this.sex = int.MinValue;
            this.namSinhDuongLich = string.Empty;
            this.namSinhAmLich = string.Empty;
            this.quaMenh = string.Empty;
            this.nguHanh = string.Empty;
            this.huongNha = string.Empty;
            this.bac = string.Empty;
            this.dongBac = string.Empty;
            this.dong = string.Empty;
            this.dongNam = string.Empty;
            this.nam = string.Empty;
            this.tayNam = string.Empty;
            this.tay = string.Empty;
            this.tayBac = string.Empty;
            this.bacDongNamTay = string.Empty;
            this.metaTitle = string.Empty;
            this.metaKeyword = string.Empty;
            this.metaDecription = string.Empty;
        }
        public PNK_FengShuiDesc(int id,
                    int mainId,
                    int langId,
                    string title,
                    string detail,
                    string titleUrl,
                    int year,
                    string directionHouse,
                    int sex,
                    string namSinhDuongLich,
                    string namSinhAmLich,
                    string quaMenh,
                    string nguHanh,
                    string huongNha,
                    string bac,
                    string dongBac,
                    string dong,
                    string dongNam,
                    string nam,
                    string tayNam,
                    string tay,
                    string tayBac,
                    string bacDongNamTay,
                    string metaTitle,
                    string metaKeyword,
                    string metaDecription)
        {
            this.id = id;
            this.mainId = mainId;
            this.langId = langId;
            this.title = title;
            this.detail = detail;
            this.titleUrl = titleUrl;
            this.year = year;
            this.directionHouse = directionHouse;
            this.sex = sex;
            this.namSinhDuongLich = namSinhDuongLich;
            this.namSinhAmLich = namSinhAmLich;
            this.quaMenh = quaMenh;
            this.nguHanh = nguHanh;
            this.huongNha = huongNha;
            this.bac = bac;
            this.dongBac = dongBac;
            this.dong = dong;
            this.dongNam = dongNam;
            this.nam = nam;
            this.tayNam = tayNam;
            this.tay = tay;
            this.tayBac = tayBac;
            this.bacDongNamTay = bacDongNamTay;
            this.metaTitle = metaTitle;
            this.metaKeyword = metaKeyword;
            this.metaDecription = metaDecription;
        }
        #endregion

    }
}