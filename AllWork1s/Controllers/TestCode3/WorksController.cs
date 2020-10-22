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
    public class WorksController : Controller
    {
        private DataWorkEntities db = new DataWorkEntities();

        // GET: Works
        public ActionResult Index()
        {
            var works = db.Works.Include(w => w.Career).Include(w => w.Employer).Include(w => w.Form).Include(w => w.Form1).Include(w => w.Province);
            return View(works.ToList());
        }

        // GET: Works/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Work work = db.Works.Find(id);
            if (work == null)
            {
                return HttpNotFound();
            }
            return View(work);
        }

        // GET: Works/Create
        public ActionResult Create()
        {
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name");
            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email");
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name");
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name");
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name");
            return View();
        }

        // POST: Works/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "work_id,work_name,work_image,work_deadline,work_description,work_request,work_benefit,work_address,work_moneyf,work_moneye,work_amount,work_activate,work_option,work_view,work_love,work_map,work_datecreated,work_dateexpired,work_datesend,work_imagetwo,work_imgathree,employer_id,work_pricemin,work_pricemax,work_symbol,work_sex,work_format,work_yearsofexp,work_province,work_ifamemap,work_note,work_delete,work_spam,province_id,form_id,career_id,work_del")] Work work)
        {
            if (ModelState.IsValid)
            {
                db.Works.Add(work);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", work.career_id);
            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email", work.employer_id);
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name", work.form_id);
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name", work.form_id);
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name", work.province_id);
            return View(work);
        }

        // GET: Works/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Work work = db.Works.Find(id);
            if (work == null)
            {
                return HttpNotFound();
            }
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", work.career_id);
            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email", work.employer_id);
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name", work.form_id);
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name", work.form_id);
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name", work.province_id);
            return View(work);
        }

        // POST: Works/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "work_id,work_name,work_image,work_deadline,work_description,work_request,work_benefit,work_address,work_moneyf,work_moneye,work_amount,work_activate,work_option,work_view,work_love,work_map,work_datecreated,work_dateexpired,work_datesend,work_imagetwo,work_imgathree,employer_id,work_pricemin,work_pricemax,work_symbol,work_sex,work_format,work_yearsofexp,work_province,work_ifamemap,work_note,work_delete,work_spam,province_id,form_id,career_id,work_del")] Work work)
        {
            if (ModelState.IsValid)
            {
                db.Entry(work).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", work.career_id);
            ViewBag.employer_id = new SelectList(db.Employers, "employer_id", "employer_email", work.employer_id);
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name", work.form_id);
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name", work.form_id);
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name", work.province_id);
            return View(work);
        }

        // GET: Works/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Work work = db.Works.Find(id);
            if (work == null)
            {
                return HttpNotFound();
            }
            return View(work);
        }

        // POST: Works/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Work work = db.Works.Find(id);
            db.Works.Remove(work);
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
