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
    public class PhuCapController : Controller
    {
        private QLNhanSuEntities db = new QLNhanSuEntities();

        // GET: PhuCap
        public ActionResult Index()
        {
            if (TempData.ContainsKey("ErrorMessage"))
            {
                ViewBag.ErrorMessage = TempData["ErrorMessage"];
            }
            return View(db.PhuCaps.ToList());
        }

        // GET: PhuCap/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhuCap phuCap = db.PhuCaps.Find(id);
            if (phuCap == null)
            {
                return HttpNotFound();
            }
            return View(phuCap);
        }

        // GET: PhuCap/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PhuCap/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "IdPC,TenPC,TienPC")] PhuCap phuCap)
        {
            if (ModelState.IsValid)
            {
                db.PhuCaps.Add(phuCap);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(phuCap);
        }

        // GET: PhuCap/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhuCap phuCap = db.PhuCaps.Find(id);
            if (phuCap == null)
            {
                return HttpNotFound();
            }
            return View(phuCap);
        }

        // POST: PhuCap/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "IdPC,TenPC,TienPC")] PhuCap phuCap)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phuCap).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(phuCap);
        }

        public bool HasEmployeesWithPhuCap(int id)
        {
            // Kiểm tra xem có nhân viên nào có phụ cấp này hay không
            bool hasEmployees = db.NhanViens.Any(nv => nv.IdPC == id);

            return hasEmployees;
        }
        // GET: PhuCap/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhuCap phuCap = db.PhuCaps.Find(id);
            if (phuCap == null)
            {
                return HttpNotFound();
            }
            return View(phuCap);
        }

        // POST: PhuCap/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
           /* PhuCap phuCap = db.PhuCaps.Find(id);
            db.PhuCaps.Remove(phuCap);
            db.SaveChanges();
            return RedirectToAction("Index");*/
            bool hasEmployees = HasEmployeesWithPhuCap(id);

            if (hasEmployees)
            {
                TempData["ErrorMessage"] = "Vẫn còn nhân viên có phụ cấp này!";
                return RedirectToAction("Index"); 
            }

            // Xóa phụ cấp nếu không còn nhân viên nào có phụ cấp này
            PhuCap phuCap = db.PhuCaps.Find(id);
            db.PhuCaps.Remove(phuCap);
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
