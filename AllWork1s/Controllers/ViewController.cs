using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AllWork1s.Models;

namespace AllWork1s.Controllers
{
    public class ViewController : Controller
    {
        DataWorkEntities db = new DataWorkEntities();
        // GET: View
        public ActionResult AllWork()
        {
            return View(db.Works.ToList());
        }
        public PartialViewResult Menu()
        {
            return PartialView();
        }
        public ActionResult AllEmployer()
        {
            return View(db.Employers.ToList());
        }
        public ActionResult DetailWork(int ?id)
        {
            Work work = db.Works.Find(id);
            return View(work);
        }
        public ActionResult DetailEmployer(int ?id)
        {
            Employer employer = db.Employers.Find(id);
            return View(employer);
        }
    }
}