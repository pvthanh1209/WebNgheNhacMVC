using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace WebNgheNhac.Models
{
    public class Album
    {
        [Key]
        public int MA_AB { get; set; }
        [Required(ErrorMessage = "Tên album không được bỏ trống")]
        public string TEN_AB { get; set; }
        public string ANH_AB { get; set; }
        [Required(ErrorMessage = "Ngày phát hành không được bỏ trống")]
        public DateTime NGAYPHATHANH { get; set; }
        public int LUOTNGHE { get; set; }
        public string THONGTIN { get; set; }
        public int MA_TL { get; set; }
        public string TEN_TL { get; set; }
        public int MA_CS { get; set; }
        public string TEN_CS { get; set; }
    }
}