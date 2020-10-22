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
    }
}