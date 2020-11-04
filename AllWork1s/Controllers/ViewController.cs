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
            User user = (User)Session["user"];
            if(user != null)
            {
                List<Favourite> favourites = db.Favourites.Where(n => n.user_id == user.user_id && n.favourite_delete == false && n.work_id == id).ToList();
                ViewBag.Fa = favourites.Count;
            }
            return View(work);
        }
        public ActionResult DetailEmployer(int ?id)
        {
            Employer employer = db.Employers.Find(id);
            return View(employer);
        }
        //Thanh cai dat chung
        public PartialViewResult Manager()
        {
            return PartialView();
        }
        //GET cai dat nghanh nghe
        public ActionResult SettingWork(int ?id)
        {
            User userid = (User)Session["user"];
            if (userid == null)
            {
                return Redirect("/");
            }
            if (id != userid.user_id)
            {
                return Redirect("/View/SettingWork/" + userid.user_id);
            }
            if (userid.career_id == null)
            {
                return Redirect("/Setting/UserWork");
            }
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name");
            return View();
        }
        
    }
}