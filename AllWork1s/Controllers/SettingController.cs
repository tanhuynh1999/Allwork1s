using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AllWork1s.Models;

namespace AllWork1s.Controllers
{
    public class SettingController : Controller
    {
        DataWorkEntities db = new DataWorkEntities();
        // GET: Setting
        public ActionResult UserWork()
        {
            User user = (User)Session["user"];
            if(user == null)
            {
                return Redirect("/User/Login");
            }
            return View(db.Careers.ToList());
        }
        [HttpPost]
        public ActionResult UserWork(FormCollection f)
        {
            String sCareerId = f["career_id"].ToString();
            User user = (User)Session["user"];
            db.Users.Find(user.user_id).career_id = Int32.Parse(sCareerId);
            db.SaveChanges();
            return Redirect("/UserCv/ViewCV");
        }
    }
}