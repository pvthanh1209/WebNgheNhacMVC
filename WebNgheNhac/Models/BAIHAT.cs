//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebNgheNhac.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class BAIHAT
    {
        public int MA_BH { get; set; }
        public string TEN_BH { get; set; }
        public string LINK { get; set; }
        public string LYRIC { get; set; }
        public Nullable<int> LUOTNGHE { get; set; }
        public Nullable<int> LUOTLIKE { get; set; }
        public Nullable<int> MA_CS { get; set; }
        public Nullable<int> ID { get; set; }
        public Nullable<int> MA_TL { get; set; }
        public Nullable<int> MA_AB { get; set; }
        public string AnhBaiHat { get; set; }
    
        public virtual CASI CASI { get; set; }
        public virtual THELOAI THELOAI { get; set; }
        public virtual USER USER { get; set; }
    }
}
