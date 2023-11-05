using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebNgheNhac.Models
{
    public class Addcountry
    {
        [Key]
        public int maqg { get; set; }

        [Display(Name="Tên Quốc Gia")]
        [Required(ErrorMessage="Bạn Chưa Nhập Tên Quốc Gia")]
        public string tenqg { get; set; }
    }
}