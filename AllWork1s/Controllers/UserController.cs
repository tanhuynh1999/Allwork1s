using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AllWork1s.Models;

namespace AllWork1s.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        DataWorkEntities db = new DataWorkEntities();
        // Đăng nhập ứng viên
        public ActionResult Login()
        {
            User user = (User)Session["user"];
            if(user != null)
            {
                if (user.career_id != null)
                {

                    return Redirect("/");
                }
                else
                {
                    return Redirect("/Setting/UserWork");
                }
            }

            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            String sEmail = f["user_email"].ToString();
            String sPass = f["user_pass"].ToString();
            User user = db.Users.Where(n => n.user_activate == true).SingleOrDefault(n => n.user_email == sEmail && n.user_pass == sPass);
            if(user != null)
            {
                Session["user"] = user;
                db.Users.Find(user.user_id).user_datelogin = DateTime.Now;
                db.Users.Find(user.user_id).user_token = Guid.NewGuid().ToString();
                if (user.career_id != null)
                {

                    return Redirect("/UserCv/ViewCV");
                }
                else
                {
                    return Redirect("/Setting/UserWork");
                }
            }
            else
            {
                ViewBag.Mes = "Sai email hoặc mật khẩu, vui lòng khử lại !";
            }

            return View(user);
        }
        //Đâng ký
        public ActionResult CreateUser()
        {
            User user = (User)Session["user"];
            if (user != null)
            {
                if (user.career_id == null)
                {
                    return Redirect("/Setting/UserWork");
                }
                else
                {
                    return Redirect("/");
                }
            }

            return View();
        }
        [HttpPost]
        public ActionResult CreateUser([Bind(Include = "user_id,user_login,user_pass,user_nicename,user_email,user_datecreated,user_token,user_role,user_datelogin,user_activate,user_image,user_industryloving,user_skill,user_interests,user_view,career_id")] User user)
        {
            User user_exist = db.Users.SingleOrDefault(n => n.user_email == user.user_email);
            if (user_exist != null)
            {
                ViewBag.Mess = "Email này đã tồn tại!";
            }
            else
            {
                db.Users.Add(user);
                user.user_datecreated = DateTime.Now;
                user.user_role = 1;
                user.user_token = Guid.NewGuid().ToString();
                user.user_activate = true;
                user.user_datelogin = DateTime.Now;
                db.SaveChanges();
                Session["user"] = user;
                if (user.career_id != null)
                {

                    return Redirect("/UserCv/ViewCV");
                }
                else
                {
                    return Redirect("/Setting/UserWork");
                }
            }

            return View(user);
        }
        //Đăng xuất
        public ActionResult LogOut()
        {
            Session["user"] = null;
            return RedirectToAction("Login");
        }
        //Thông tin cá nhân
        public ActionResult PersonalInformation(int ?id)
        {
            User user = (User)Session["user"];
            if(user == null)
            {
                return RedirectToAction("Login");
            }
            else
            {
                if (id != user.user_id)
                {
                    return Redirect("/");
                }
                User userid = db.Users.Find(id);
                return View(userid);
            }
        }
        //Sửa thông tin cá nhân
        public ActionResult EditProfile(FormCollection f)
        {
            User user = (User)Session["User"];

            String sNiceName = f["user_nicename"].ToString();
            String sIndustryloving = f["user_industryloving"].ToString();
            String sSkill = f["user_skill"].ToString();
            String sInterests = f["user_interests"].ToString();

            db.Users.Find(user.user_id).user_nicename = sNiceName;
            db.Users.Find(user.user_id).user_industryloving = sIndustryloving;
            db.Users.Find(user.user_id).user_skill = sSkill;
            db.Users.Find(user.user_id).user_interests = sInterests;

            db.SaveChanges();

            Session["check"] = "Cập nhật thành công";
            Session["user"] = user;
            return Redirect(Request.UrlReferrer.ToString());
        }
        //Đổi mật khẩu
        public ActionResult ResetPass(FormCollection f)
        {
            User user = (User)Session["user"];

            String SPassNew = f["user_passnew"].ToString();

            db.Users.Find(user.user_id).user_pass = SPassNew;
            db.SaveChanges();

            Session["user"] = user;
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}