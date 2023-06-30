using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using QLNS.Models;

namespace QLNS.Controllers
{
    public class NhanVienController : Controller
    {
        private QLNhanSuEntities db = new QLNhanSuEntities();

        // GET: NhanVien
        public ActionResult Index()
        {
            var nhanViens = db.NhanViens.Include(n => n.ChucVu).Include(n => n.PhongBan).Include(n => n.PhuCap);
            return View(nhanViens.ToList());
        }
        public ActionResult TinhLuong(int? ThangCong)
        {
            List<Luong> luong = new List<Luong>();
            double tinhluong = 0.0;
            int tongngaycong = 0;
            int tongvipham = 0;
            double tienbh = 0.0;
            var nhanViens = db.NhanViens.Include(n => n.ChucVu).Include(n => n.PhongBan).Include(n=>n.PhuCap).ToList();
            var tTBaoHiems = db.TTBaoHiems.ToList();

            //tự nó dừng
            foreach (var nv in nhanViens)
            {
               var tien =  tTBaoHiems.Where(t => t.IdNV == /*nv.IdNV*/2).FirstOrDefault();
                if (tien != null)
                {
                    tienbh = (double)tien.TienBH;
                }
                else
                {
                    tienbh = 0.0;
                }

                tinhluong = db.sp_TinhLuong(/*nv.IdNV*/2, ThangCong).FirstOrDefault().GetValueOrDefault();
                tongngaycong = db.sp_TongNgayCong(/*nv.IdNV*/2, ThangCong).FirstOrDefault().GetValueOrDefault();
                tongvipham = db.sp_TongViPham(/*nv.IdNV*/2, ThangCong).FirstOrDefault().GetValueOrDefault();

                luong.Add(new Luong(tinhluong, tongngaycong, tongvipham, tienbh, nv));
            }
            return View(luong);
        }

        // GET: NhanVien/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanVien nhanVien = db.NhanViens.Find(id);
            if (nhanVien == null)
            {
                return HttpNotFound();
            }
            return View(nhanVien);
        }

        // GET: NhanVien/Create
        public ActionResult Create()
        {
            ViewBag.IdCV = new SelectList(db.ChucVus, "IdCV", "TenCV");
            ViewBag.IdPB = new SelectList(db.PhongBans, "IdPB", "TenPhong");
            ViewBag.IdPC = new SelectList(db.PhuCaps, "IdPC", "TenPC");
            return View();
        }

        // POST: NhanVien/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdNV,HoTen,Email,Password,IsAdmin,SDT,GioiTinh,NgaySinh,QueQuan,DanToc,IdPB,IdCV,IdPC,TrinhDoHV")] NhanVien nhanVien)
        {
            if (ModelState.IsValid)
            {
                nhanVien.Password = Helper.ComputeSha256Hash(nhanVien.Password);
                db.NhanViens.Add(nhanVien);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdCV = new SelectList(db.ChucVus, "IdCV", "TenCV", nhanVien.IdCV);
            ViewBag.IdPB = new SelectList(db.PhongBans, "IdPB", "TenPhong", nhanVien.IdPB);
            ViewBag.IdPC = new SelectList(db.PhuCaps, "IdPC", "TenPC", nhanVien.IdPC);
            return View(nhanVien);
        }

        // GET: NhanVien/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanVien nhanVien = db.NhanViens.Find(id);
            if (nhanVien == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdCV = new SelectList(db.ChucVus, "IdCV", "TenCV", nhanVien.IdCV);
            ViewBag.IdPB = new SelectList(db.PhongBans, "IdPB", "TenPhong", nhanVien.IdPB);
            ViewBag.IdPC = new SelectList(db.PhuCaps, "IdPC", "TenPC", nhanVien.IdPC);
            return View(nhanVien);
        }

        // POST: NhanVien/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdNV,HoTen,Email,Password,IsAdmin,SDT,GioiTinh,NgaySinh,QueQuan,DanToc,IdPB,IdCV,IdPC,TrinhDoHV")] NhanVien nhanVien)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nhanVien).State = EntityState.Modified;
                db.SaveChanges();
                if (Convert.ToBoolean(Session["isAdmin"]))
                {
                    return RedirectToAction("Index");
                }
                else
                {
                    return RedirectToAction("Index", "Home");
                }
            }
            ViewBag.IdCV = new SelectList(db.ChucVus, "IdCV", "TenCV", nhanVien.IdCV);
            ViewBag.IdPB = new SelectList(db.PhongBans, "IdPB", "TenPhong", nhanVien.IdPB);
            ViewBag.IdPC = new SelectList(db.PhuCaps, "IdPC", "TenPC", nhanVien.IdPC);
            return View(nhanVien);
        }

        // GET: NhanVien/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            NhanVien nhanVien = db.NhanViens.Find(id);
            if (nhanVien == null)
            {
                return HttpNotFound();
            }
            return View(nhanVien);
        }

        // POST: NhanVien/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NhanVien nhanVien = db.NhanViens.Find(id);
            
            var hopDong = db.HopDongs.Where(h => h.IdNV == id).ToList();
            foreach(var hd in hopDong)
            {
                db.HopDongs.Remove(hd);
            }
            var cc = db.TTChamCongs.Where(h => h.IdNV == id).ToList();
            foreach (var c in cc)
            {
                db.TTChamCongs.Remove(c);
            }
            var bh = db.TTBaoHiems.Where(h => h.IdNV == id).ToList();
            foreach (var b in bh)
            {
                db.TTBaoHiems.Remove(b);
            }
            db.NhanViens.Remove(nhanVien);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
