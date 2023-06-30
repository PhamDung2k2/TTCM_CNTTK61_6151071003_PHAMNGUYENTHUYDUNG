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
    public class TTChamCongController : Controller
    {
        private QLNhanSuEntities db = new QLNhanSuEntities();

        // GET: TTChamCong
        public ActionResult Index()
        {
            IQueryable<TTChamCong> tTChamCongs;

            if (Convert.ToBoolean(Session["isAdmin"]))
            {
                 tTChamCongs = db.TTChamCongs.Include(t => t.NhanVien);
            }
            else
            {
                int IdNV = (int)Session["user_id"];
                 tTChamCongs = db.TTChamCongs.Include(t => t.NhanVien).Where(t => t.IdNV == IdNV);
            }

            return View(tTChamCongs.ToList());
        }

        // GET: TTChamCong/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TTChamCong tTChamCong = db.TTChamCongs.Find(id);
            if (tTChamCong == null)
            {
                return HttpNotFound();
            }
            return View(tTChamCong);
        }

        // GET: TTChamCong/Create
        public ActionResult Create()
        {
            ViewBag.IdNV = new SelectList(db.NhanViens, "IdNV", "HoTen");
            return View();
        }

        // POST: TTChamCong/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdCC,IdNV,NgayCC,TVao,TRa,ViPham")] TTChamCong tTChamCong)
        {
            if (ModelState.IsValid)
            {
                db.TTChamCongs.Add(tTChamCong);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdNV = new SelectList(db.NhanViens, "IdNV", "HoTen", tTChamCong.IdNV);
            return View(tTChamCong);
        }

        // GET: TTChamCong/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TTChamCong tTChamCong = db.TTChamCongs.Find(id);
            if (tTChamCong == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdNV = new SelectList(db.NhanViens, "IdNV", "HoTen", tTChamCong.IdNV);
            return View(tTChamCong);
        }

        // POST: TTChamCong/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdCC,IdNV,NgayCC,TVao,TRa,ViPham")] TTChamCong tTChamCong)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tTChamCong).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdNV = new SelectList(db.NhanViens, "IdNV", "HoTen", tTChamCong.IdNV);
            return View(tTChamCong);
        }

        // GET: TTChamCong/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TTChamCong tTChamCong = db.TTChamCongs.Find(id);
            if (tTChamCong == null)
            {
                return HttpNotFound();
            }
            return View(tTChamCong);
        }

        // POST: TTChamCong/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TTChamCong tTChamCong = db.TTChamCongs.Find(id);
            db.TTChamCongs.Remove(tTChamCong);
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
