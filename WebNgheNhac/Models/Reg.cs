using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace WebNgheNhac.Models
{
    public class Reg
    {
        [Key]
        public int id { get; set; }

        [Display(Name="Tên tài khoản: ")]
        [Required(ErrorMessage="Bạn chưa nhập tên tài khoản")]
        public string username { get; set; }

        [Display(Name="Password: ")]
        [Required(ErrorMessage="Vui lòng nhập password")]
        [StringLength(12,ErrorMessage="Dộ dài mật khẩu dài từ 6 - 12 ký tự",MinimumLength=6)]
        public string pass1 { get; set; }

        [Display(Name="Nhập lại Password: ")]
        [Compare("pass1", ErrorMessage = "Nhập lại mật khẩu không chính xác")]
        public string pass2 { get; set; }

        [Display(Name="Họ và Tên: ")]
        [Required(ErrorMessage="Bạn chưa nhập họ và Tên")]
        public string hoten { get; set; }

        [Display(Name="Ngày Sinh: ")]
        public string ngaysinh { get; set; }

    }
}