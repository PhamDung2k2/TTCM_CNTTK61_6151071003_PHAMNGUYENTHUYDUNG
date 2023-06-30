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
    public class TTBaoHiemController : Controller
    {
        private QLNhanSuEntities db = new QLNhanSuEntities();

        // GET: TTBaoHiem
        public ActionResult Index()
        {
            var tTBaoHiems = db.TTBaoHiems.Include(t => t.NhanVien);
            return View(tTBaoHiems.ToList());
        }

        // GET: TTBaoHiem/Details/5
        public ActionResult Details(int? idNV)
        {
            if (idNV == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TTBaoHiem tTBaoHiem = db.TTBaoHiems.FirstOrDefault(hd => hd.IdNV == idNV);
            if (tTBaoHiem == null)
            {
                return HttpNotFound();
            }
            return View(tTBaoHiem);
        }


        // GET: TTBaoHiem/Create
        public ActionResult Create()
        {
            ViewBag.IdNV = new SelectList(db.NhanViens, "IdNV", "HoTen");
            return View();
        }

        // POST: TTBaoHiem/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdBH,IdNV,TenBH,TyLeBH,NgayHL,NgayHetHL,TienBH")] TTBaoHiem tTBaoHiem)
        {
            if (ModelState.IsValid)
            {
                db.TTBaoHiems.Add(tTBaoHiem);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdNV = new SelectList(db.NhanViens, "IdNV", "HoTen", tTBaoHiem.IdNV);
            return View(tTBaoHiem);
        }

        // GET: TTBaoHiem/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TTBaoHiem tTBaoHiem = db.TTBaoHiems.Find(id);
            if (tTBaoHiem == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdNV = new SelectList(db.NhanViens, "IdNV", "HoTen", tTBaoHiem.IdNV);
            return View(tTBaoHiem);
        }

        // POST: TTBaoHiem/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdBH,IdNV,TenBH,TyLeBH,NgayHL,NgayHetHL,TienBH")] TTBaoHiem tTBaoHiem)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tTBaoHiem).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdNV = new SelectList(db.NhanViens, "IdNV", "HoTen", tTBaoHiem.IdNV);
            return View(tTBaoHiem);
        }

        // GET: TTBaoHiem/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TTBaoHiem tTBaoHiem = db.TTBaoHiems.Find(id);
            if (tTBaoHiem == null)
            {
                return HttpNotFound();
            }
            return View(tTBaoHiem);
        }

        // POST: TTBaoHiem/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TTBaoHiem tTBaoHiem = db.TTBaoHiems.Find(id);
            db.TTBaoHiems.Remove(tTBaoHiem);
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
