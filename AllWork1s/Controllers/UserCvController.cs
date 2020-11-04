using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AllWork1s.Models;

namespace AllWork1s.Controllers
{
    public class UserCvController : Controller
    {
        DataWorkEntities db = new DataWorkEntities();
        // GET: UserCv
        public ActionResult ViewCV()
        {
            return View();
        }
        // Hồ sơ 1 : Free - Mẫu trắng
        public PartialViewResult AddCV1()
        {
            return PartialView();
        }
        [HttpPost]
        public ActionResult AddCV1([Bind(Include = "cv_id,cv_fullname,cv_location,cv_bird,cv_sex,cv_phone,cv_email,cv_address,cv_linkfc,cv_target,cv_datebegineducation,cv_dateendeducation,cv_contenteducation,cv_datebeginexp,cv_dateendexp,cv_contentexp,cv_datebeginexptwo,cv_dateendexptwo,cv_contentexptwo,cv_datebeginactivate,cv_dateendactivate,cv_contentactivate,cv_contentcertificate,cv_contentreward,cv_english,cv_IT,user_id,cv_numbertheme,cv_yearre,cv_yearcerti,cv_schools,cv_industrystory,cv_species,cv_point,cv_roleexp,cv_roleexptwo,cv_activate,cv_option,cv_datecreated,career_id,cv_schoolname,cv_companyname,cv_companynametwo")] Cv cv)
        {
            db.Cvs.Add(cv);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        //Quản lý hồ sơ
        public ActionResult CVID(int ?id)
        {
            List<Cv> cv = db.Cvs.Where(n => n.cv_activate == true && n.user_id == id).OrderByDescending(n => n.cv_datecreated).ToList();
            User userid = (User)Session["user"];
            if (userid == null)
            {
                return Redirect("/");
            }
            if(id != userid.user_id)
            {
                return Redirect("/UserCV/CVID/" + userid.user_id);
            }
            if(userid.career_id == null)
            {
                return Redirect("/Setting/UserWork");
            }
            return View(cv);
        }
    }
}