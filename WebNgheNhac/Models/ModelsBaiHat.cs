using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebNgheNhac.Models
{
    public class ModelsBaiHat
    {
        
        public int MA_BH { get; set; }

        [Display (Name = "Tên Bài Hát")]
        [Required(ErrorMessage="Bạn chưa nhập tên bài hát")]
        public string TEN_BH { get; set; }

        [Display (Name="LINK")]
        public string LINK { get; set; }

        [Display(Name = "LYRIC")]
        [Required(ErrorMessage = "Bạn chưa nhập LYRIC")]
        public string LYRIC { get; set; }

        [Display(Name = "Ca Sĩ")]
        [Required(ErrorMessage = "Bạn chưa nhập Ca Sĩ")]
        public int MA_CS { get; set; }
        public string TEN_CS { get; set; }

        [Display(Name = "Thể loại Bài Hát")]
        public int MA_TL { get; set; }
        public string TEN_TL { get; set; }

        [Display(Name = "Album")]
        public int MA_AB { get; set; }
        public string TEN_AB { get; set; }

        [Display(Name="Lượt nghe")]
        public int LUOTNGHE { get; set; }

        [Display(Name="Lượt like")]
        public int LUOTLIKE { get; set; }

        [Display(Name = "Users UpLoad")]
        public int ID { get; set; }
        [Display(Name = "Ảnh bài hát")]
        public string AnhBaiHat { get; set; }
        public string USERNAME { get; set; }  
    }
}