using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebNgheNhac.Models
{
    public class BaiHatMapping
    {
        public BAIHAT BaiHat { get; set; }
        public string Ten_Cs { get; set; }
        public string Anh_Ab { get; set; }
    }
    public class AlbumMapping
    {
        public ALBUM Album { get; set; }
        public string Ten_Cs { get; set; }
    }

    public class HomeModel 
    {
        public List<BaiHatMapping> LstBaiHat { get; set; }
        public List<AlbumMapping> LstAlbum { get; set; }
    }

    public class BaiHatDetail : BAIHAT
    {
        public string Hot { get; set; }
        public string TenAlbum { get; set; }
        public string AnhAlbum { get; set; }
        public string TenCS { get; set; }
        public string TenTL { get; set; }
        public string Lyrics { get; set; }
    }
    public class AlbumDetail: BaiHatDetail
    {
        public ALBUM Album { get; set; }
        public List<BaiHatMapping> ListBaiHat { get; set; }
    }

    public class AmNhac
    {
        public List<BaiHatMapping> ListBaiHat { get; set; }
        public List<AlbumMapping> ListAlbum { get; set; }
        public List<CASI> ListCasi { get; set; }
    }

    public class CasiModel
    {
        public List<BaiHatMapping> ListBaiHat { get; set; }
        public List<AlbumMapping> ListAlbum { get; set; }
        public string Anh_CS { get; set; }
        public string Ten_CS { get; set; }
        public string Ten_QG { get; set; }
        public string TieuSu { get; set; }
    }

}