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
            Session["user"] = user;
            return Redirect("/UserCV/CVID/" + user.user_id);
        }

        //Cài đặt nghành nghề modal
        public ActionResult EditCareer(FormCollection f)
        {
            User user = (User)Session["user"];
            String sCareerId = f["career_id"];
            db.Users.Find(user.user_id).career_id = Int32.Parse(sCareerId);
            db.SaveChanges();
            User us = db.Users.SingleOrDefault(n => n.user_id == user.user_id);
            Session["user"] = us;
            return Redirect(Request.UrlReferrer.ToString());
        }

        // cai dat nghanh nghe view
        [HttpPost]
        public ActionResult EditCareerView(FormCollection f)
        {
            User user = (User)Session["user"];
            String sCareerId = f["career_id"].ToString();
            db.Users.Find(user.user_id).career_id = Int32.Parse(sCareerId);
            db.SaveChanges();
            Session["user"] = user;
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name");
            return Redirect("/View/SettingWork/"+user.user_id);
        }

    }
}