using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AllWork1s.Models;

namespace AllWork1s.Controllers
{
    public class HomeController : Controller
    {
        DataWorkEntities db = new DataWorkEntities();
        public ActionResult Index()
        {
            return View(db.Works.ToList());
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public PartialViewResult Css()
        {
            return PartialView();
        }
    }
}