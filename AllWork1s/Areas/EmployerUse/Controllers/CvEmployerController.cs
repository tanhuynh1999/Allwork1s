using AllWork1s.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AllWork1s.Areas.EmployerUse.Controllers
{
    public class CvEmployerController : Controller
    {
        DataWorkEntities db = new DataWorkEntities();
        // GET: EmployerUse/CvEmployer
        public ActionResult AllCv()
        {
            Employer employer = (Employer)Session["employer"];
            if (employer == null)
            {
                return RedirectToAction("Login", "Employer");
            }
            if (employer.employer_personalpage == false || employer.employer_personalpage == null)
            {
                return RedirectToAction("Createemployer", "Employer", new { id = employer.employer_id });
            }
            List<Cv> cvs = db.Cvs.Where(n => n.cv_activate == true && n.cv_option == true && n.User.user_activate == true).OrderByDescending(n => n.cv_datecreated).ToList();
            return View(cvs);
        }
        //Ho sơ nhận
        public ActionResult ListSubmitCv()
        {
            Employer employer = (Employer)Session["employer"];
            if (employer == null)
            {
                return RedirectToAction("Login", "Employer");
            }
            if (employer.employer_personalpage == false || employer.employer_personalpage == null)
            {
                return RedirectToAction("Createemployer", "Employer", new { id = employer.employer_id });
            }
            List<Submit> submit = db.Submits.Where(n=>n.Work.Employer.employer_id == employer.employer_id).ToList();
            return View(submit);
        }
        //Xem chi tiet ho so
        public ActionResult DetailCV(int ?id)
        {
            Employer employer = (Employer)Session["employer"];
            Submit submit = db.Submits.Find(id);
            if (employer == null)
            {
                return RedirectToAction("Login", "Employer");
            }
            if (employer.employer_personalpage == false || employer.employer_personalpage == null)
            {
                return RedirectToAction("Createemployer", "Employer", new { id = employer.employer_id });
            }
            return View(submit);
        }
    }
}