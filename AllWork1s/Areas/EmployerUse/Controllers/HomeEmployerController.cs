using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AllWork1s.Areas.EmployerUse.Controllers
{
    public class HomeEmployerController : Controller
    {
        // GET: EmployerUse/HomeEmployer
        public PartialViewResult Index()
        {
            return PartialView();
        }
    }
}