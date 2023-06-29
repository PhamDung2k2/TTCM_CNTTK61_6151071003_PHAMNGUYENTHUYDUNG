using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLNS.Models
{
    public class Luong
    {
        public double TongLuong { get; set; }
        public int TongNgayCong { get; set; }
        public int TongViPham { get; set; }
        public NhanVien nv { get; set; }
        public Luong() { }
        public Luong(double TongLuong, int TongNgayCong, int TongViPham, NhanVien nv)
        {
            this.TongLuong = TongLuong;
            this.TongNgayCong = TongNgayCong;
            this.TongViPham = TongViPham;
            this.nv = nv;
        }
    }
}