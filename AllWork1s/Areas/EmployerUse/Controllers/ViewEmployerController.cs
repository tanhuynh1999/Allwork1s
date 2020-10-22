using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AllWork1s.Models;

namespace AllWork1s.Areas.EmployerUse.Controllers
{
    public class ViewEmployerController : Controller
    {
        DataWorkEntities db = new DataWorkEntities();
        // GET: EmployerUse/ViewEmployer
        public ActionResult Index()
        {
            Employer employer = (Employer)Session["employer"];
            if(employer == null)
            {
                return RedirectToAction("Login","Employer");
            }
            if (employer.employer_personalpage == false || employer.employer_personalpage == null)
            {
                return RedirectToAction("Createemployer", "Employer", new { id = employer.employer_id });
            }
            return View();
        }
        public PartialViewResult Header()
        {
            return PartialView();
        }
        public ActionResult Manager(int ?id)
        {
            Employer ses = (Employer)Session["employer"];
            if (ses == null)
            {
                return RedirectToAction("Login", "Employer");
            }
            if (id != ses.employer_id)
            {
                return RedirectToAction("Error");
            }
            if(ses.employer_personalpage == false || ses.employer_personalpage == null)
            {
                return RedirectToAction("Createemployer","Employer", new { id = ses.employer_id });
            }
            Employer employer = db.Employers.Find(id);
            return View(employer);
        }
        public ActionResult Error()
        {
            Employer employer = (Employer)Session["employer"];
            if(employer == null)
            {
                return RedirectToAction("Login", "Employer");
            }
            return View(employer);
        }
    }
}