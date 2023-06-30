﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QLNS.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class TTBaoHiem
    {
        [Display(Name = "Mã Bảo Hiểm")]
        public int IdBH { get; set; }
        [Display(Name = "Nhân Viên")]
        public Nullable<int> IdNV { get; set; }
        [Display(Name = "Tên Bảo Hiểm")]
        public string TenBH { get; set; }
        [Display(Name = "Tỷ Lệ")]
        public Nullable<double> TyLeBH { get; set; }
        [Display(Name = "Ngày Hiệu Lực")]
        [Required(ErrorMessage = "Vui lòng không bỏ trống trường này!")]
        [DataType(DataType.Date)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        public Nullable<System.DateTime> NgayHL { get; set; }
        [Display(Name = "Ngày Hết Hiệu Lực")]
        [Required(ErrorMessage = "Vui lòng không bỏ trống trường này!")]
        [DataType(DataType.Date)]
        [DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:dd/MM/yyyy}")]
        public Nullable<System.DateTime> NgayHetHL { get; set; }
        [Display(Name = "Tiền Bảo Hiểm(1000VNĐ)")]
        [RegularExpression("^[0-9]*$", ErrorMessage = "Chỉ được nhập số!")]
        public Nullable<double> TienBH { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}