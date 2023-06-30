﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLNS.Models;
namespace QLNS.Controllers
{
    public class HomeController : Controller
    {
        QLNhanSuEntities db = new QLNhanSuEntities();
        public ActionResult Index()
        {
            if (Session["user_id"] != null)
            {
                int id = (int)Session["user_id"];

                DateTime currentMonth = DateTime.Now;
                DateTime lastmonth = DateTime.Now.AddMonths(-2);
                ViewBag.NV = db.NhanViens.AsQueryable().ToList().Count();
                ViewBag.PB = db.PhongBans.AsQueryable().ToList().Count();
                ViewBag.VP = db.TTChamCongs.Where(c => c.IdNV == id).Where(t=>t.NgayCC < currentMonth && t.NgayCC > lastmonth).Where(v=>v.ViPham == true).ToList();
                //ViewBag.VP = db.TTChamCongs.Where(c => c.IdNV == id).Where(t=> DbFunctions.TruncateTime(t.NgayCC).Value.Month== currentMonth).Where(v=>v.ViPham == true).ToList();
                return View();
                //Lấy Thông tin user đăng nhập  db.NhanViens.Where(p => p.IdNV == Convert.ToInt32( Session["user_id"]));
            }
            else
            {
                return RedirectToAction("Login", "Home");
            }
        }
        /*public JsonResult Test()
        {
            db.Configuration.ProxyCreationEnabled = false;
            int id = 1;
            string currentMonth = "5";
            var P = db.TTChamCongs.Where(c => c.IdNV == id).Where(t => t.NgayCC.Value.ToString("M") == currentMonth).Where(v => v.ViPham == true);
            return Json(P.ToList(), JsonRequestBehavior.AllowGet);
        }*/
        //đăng nhập, đăng xuất
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string TaiKhoan, string MatKhau)
        {
            MatKhau = Helper.ComputeSha256Hash(MatKhau);
            ViewBag.mk = MatKhau;
            var user = db.NhanViens.Where(p => p.Email == TaiKhoan).Where(p => p.Password == MatKhau).FirstOrDefault();
            if (user != null)
            {
                Session["user_id"] = user.IdNV;
                Session["HoTen_user"] = user.HoTen;
                Session["isAdmin"] = user.IsAdmin;//db.NhanViens.Where(p => p.IdNV == Convert.ToInt32(Session["user_id"]));
                return RedirectToAction("Index", "Home");
            }
            else ViewBag.error = "Thông tin đăng nhập không hợp lệ!!!";
            return View();

        }
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Login", "Home");
        }
    }
}