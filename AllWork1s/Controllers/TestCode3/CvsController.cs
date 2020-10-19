using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AllWork1s.Models;

namespace AllWork1s.Controllers.TestCode3
{
    public class CvsController : Controller
    {
        private DataWorkEntities db = new DataWorkEntities();

        // GET: Cvs
        public ActionResult Index()
        {
            var cvs = db.Cvs.Include(c => c.Career).Include(c => c.User);
            return View(cvs.ToList());
        }

        // GET: Cvs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cv cv = db.Cvs.Find(id);
            if (cv == null)
            {
                return HttpNotFound();
            }
            return View(cv);
        }

        // GET: Cvs/Create
        public ActionResult Create()
        {
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name");
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_login");
            return View();
        }

        // POST: Cvs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "cv_id,cv_fullname,cv_location,cv_bird,cv_sex,cv_phone,cv_email,cv_address,cv_linkfc,cv_target,cv_datebegineducation,cv_dateendeducation,cv_contenteducation,cv_datebeginexp,cv_dateendexp,cv_contentexp,cv_datebeginexptwo,cv_dateendexptwo,cv_contentexptwo,cv_datebeginactivate,cv_dateendactivate,cv_contentactivate,cv_contentcertificate,cv_contentreward,cv_english,cv_IT,user_id,cv_numbertheme,cv_yearre,cv_yearcerti,cv_schools,cv_industrystory,cv_species,cv_point,cv_roleexp,cv_roleexptwo,cv_activate,cv_option,cv_datecreated,career_id")] Cv cv)
        {
            if (ModelState.IsValid)
            {
                db.Cvs.Add(cv);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", cv.career_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_login", cv.user_id);
            return View(cv);
        }

        // GET: Cvs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cv cv = db.Cvs.Find(id);
            if (cv == null)
            {
                return HttpNotFound();
            }
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", cv.career_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_login", cv.user_id);
            return View(cv);
        }

        // POST: Cvs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "cv_id,cv_fullname,cv_location,cv_bird,cv_sex,cv_phone,cv_email,cv_address,cv_linkfc,cv_target,cv_datebegineducation,cv_dateendeducation,cv_contenteducation,cv_datebeginexp,cv_dateendexp,cv_contentexp,cv_datebeginexptwo,cv_dateendexptwo,cv_contentexptwo,cv_datebeginactivate,cv_dateendactivate,cv_contentactivate,cv_contentcertificate,cv_contentreward,cv_english,cv_IT,user_id,cv_numbertheme,cv_yearre,cv_yearcerti,cv_schools,cv_industrystory,cv_species,cv_point,cv_roleexp,cv_roleexptwo,cv_activate,cv_option,cv_datecreated,career_id")] Cv cv)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cv).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", cv.career_id);
            ViewBag.user_id = new SelectList(db.Users, "user_id", "user_login", cv.user_id);
            return View(cv);
        }

        // GET: Cvs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cv cv = db.Cvs.Find(id);
            if (cv == null)
            {
                return HttpNotFound();
            }
            return View(cv);
        }

        // POST: Cvs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Cv cv = db.Cvs.Find(id);
            db.Cvs.Remove(cv);
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
