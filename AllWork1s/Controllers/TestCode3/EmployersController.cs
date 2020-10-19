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
    public class EmployersController : Controller
    {
        private DataWorkEntities db = new DataWorkEntities();

        // GET: Employers
        public ActionResult Index()
        {
            var employers = db.Employers.Include(e => e.Career).Include(e => e.Province);
            return View(employers.ToList());
        }

        // GET: Employers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employer employer = db.Employers.Find(id);
            if (employer == null)
            {
                return HttpNotFound();
            }
            return View(employer);
        }

        // GET: Employers/Create
        public ActionResult Create()
        {
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name");
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name");
            return View();
        }

        // POST: Employers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "employer_id,employer_email,employer_pass,employer_fullname,employer_sex,employer_company,employer_position,employer_address,employer_phone,employer_vacancies,employer_token,employer_datelogin,employer_datecreated,employer_activate,employer_status,employer_logo,employer_specialized,employer_version,employer_option,employer_personalpage,employer_name,employer_introduce,employer_favourite,employer_linkfc,employer_recruitment,employer_addressmain,employer_ifamemapmain,employer_addresstwo,employer_ifamemaptwo,employer_addressthree,employer_ifamemapthree,employer_province,employer_pricemin,employer_pricemax,employer_symbol,employer_recrequirement,province_id,career_id,employer_limit")] Employer employer)
        {
            if (ModelState.IsValid)
            {
                db.Employers.Add(employer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", employer.career_id);
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name", employer.province_id);
            return View(employer);
        }

        // GET: Employers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employer employer = db.Employers.Find(id);
            if (employer == null)
            {
                return HttpNotFound();
            }
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", employer.career_id);
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name", employer.province_id);
            return View(employer);
        }

        // POST: Employers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "employer_id,employer_email,employer_pass,employer_fullname,employer_sex,employer_company,employer_position,employer_address,employer_phone,employer_vacancies,employer_token,employer_datelogin,employer_datecreated,employer_activate,employer_status,employer_logo,employer_specialized,employer_version,employer_option,employer_personalpage,employer_name,employer_introduce,employer_favourite,employer_linkfc,employer_recruitment,employer_addressmain,employer_ifamemapmain,employer_addresstwo,employer_ifamemaptwo,employer_addressthree,employer_ifamemapthree,employer_province,employer_pricemin,employer_pricemax,employer_symbol,employer_recrequirement,province_id,career_id,employer_limit")] Employer employer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", employer.career_id);
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name", employer.province_id);
            return View(employer);
        }

        // GET: Employers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employer employer = db.Employers.Find(id);
            if (employer == null)
            {
                return HttpNotFound();
            }
            return View(employer);
        }

        // POST: Employers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Employer employer = db.Employers.Find(id);
            db.Employers.Remove(employer);
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
