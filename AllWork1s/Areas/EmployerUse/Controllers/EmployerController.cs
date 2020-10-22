using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AllWork1s.Models;

namespace AllWork1s.Areas.EmployerUse.Controllers
{
    public class EmployerController : Controller
    {
        DataWorkEntities db = new DataWorkEntities();
        // GET: EmployerUse/Employer
        public PartialViewResult Login()
        {
            Employer employer = (Employer)Session["employer"];
            if (employer != null)
            {
                Response.Redirect("/");
            }
            return PartialView();
        }
        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            String sEmail = f["employer_email"].ToString();
            String sPass = f["employer_pass"].ToString();

            Employer employer = db.Employers.Where(n => n.employer_activate == true).SingleOrDefault(n => n.employer_email == sEmail && n.employer_pass == sPass);
            if(employer != null)
            {
                Session["employer"] = employer;
                return RedirectToAction("Index","ViewEmployer");
            }
            else
            {
                ViewBag.Check = "Sai email hoặc mật khẩu ! Vui lòng khử lại";
                return View(employer);
            }
        }
        public ActionResult Logout()
        {
            Session["employer"] = null;
            return RedirectToAction("Login", "Employer");
        }
        //Dang ky
        public PartialViewResult RegEmployer()
        {
            Employer employer = (Employer)Session["employer"];
            if(employer != null)
            {
                Response.Redirect("/");
            }
            return PartialView();
        }
        [HttpPost]
        public ActionResult RegEmployer([Bind(Include = "employer_id,employer_email,employer_pass,employer_fullname,employer_sex,employer_company,employer_position,employer_address,employer_phone,employer_vacancies,employer_token,employer_datelogin,employer_datecreated,employer_activate,employer_status,employer_logo,employer_specialized,employer_version,employer_option,employer_personalpage,employer_name,employer_introduce,employer_favourite,employer_linkfc,employer_recruitment,employer_addressmain,employer_ifamemapmain,employer_addresstwo,employer_ifamemaptwo,employer_addressthree,employer_ifamemapthree,employer_province,employer_pricemin,employer_pricemax,employer_symbol,employer_recrequirement,province_id,career_id,employer_limit")] Employer employer, FormCollection f)
        {
            String sPassRes = f["employer_passres"];
            Employer emmail = db.Employers.SingleOrDefault(n => n.employer_email == employer.employer_email);

            if(employer.employer_pass != sPassRes)
            {
                ViewBag.Check = "Mật khẩu xác nhận không đúng";
            }
            else if(emmail != null)
            {
                ViewBag.Check = "Email này đã được sử dụng";
            }
            else
            {
                db.Employers.Add(employer);
                employer.employer_activate = true;
                employer.employer_option = true;
                employer.employer_token = Guid.NewGuid().ToString();
                employer.employer_datecreated = DateTime.Now;
                db.SaveChanges();

                Session["employer"] = employer;
                return RedirectToAction("Index", "ViewEmployer");
            }
            return View(employer);
        }
        public ActionResult Createemployer(int ?id)
        {
            Employer employer = (Employer)Session["employer"];
            if(employer == null)
            {
                return RedirectToAction("Login", "Employer");
            }
            if(id != employer.employer_id)
            {
                return RedirectToAction("Error","ViewEmployer");
            }
            if(employer.employer_personalpage == true )
            {
                return RedirectToAction("Index", "ViewEmployer");
            }
            Employer employerid = db.Employers.Find(id);
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name");
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name");
            return View(employerid);
        }
        [HttpPost]
        public ActionResult Createemployer([Bind(Include = "employer_id,employer_email,employer_pass,employer_fullname,employer_sex,employer_company,employer_position,employer_address,employer_phone,employer_vacancies,employer_token,employer_datelogin,employer_datecreated,employer_activate,employer_status,employer_logo,employer_specialized,employer_version,employer_option,employer_personalpage,employer_name,employer_introduce,employer_favourite,employer_linkfc,employer_recruitment,employer_addressmain,employer_ifamemapmain,employer_addresstwo,employer_ifamemaptwo,employer_addressthree,employer_ifamemapthree,employer_province,employer_pricemin,employer_pricemax,employer_symbol,employer_recrequirement,province_id,career_id,employer_limit,employer_emailcompany,employer_banner,employer_scale,employer_bonus,employer_foundedyear")] Employer employer, HttpPostedFileBase imgLogo, HttpPostedFileBase imgBanner)
        {

            Employer ses = (Employer)Session["employer"];
            //Save img
            //Lưu tên file
            var namelogo = Path.GetFileName(imgLogo.FileName);
            var namebanner = Path.GetFileName(imgBanner.FileName);
            //Lưu file
            var palogo = Path.Combine(Server.MapPath("~/Images/Employer"), namelogo);
            var pabanner = Path.Combine(Server.MapPath("~/Images/Employer"), namebanner);

            if(imgLogo == null || imgBanner == null)
            {
                ViewBag.ThongBao = "Vui lòng chọn hình ảnh logo hoặc banner";
            }
            else if (System.IO.File.Exists(palogo))
            {
                ViewBag.ThongBao = "Tên hình ảnh logo đã tồn tại!";
            }
            else if(System.IO.File.Exists(pabanner))
            {
                ViewBag.ThongBao = "Tên hình ảnh banner đã tồn tại!";
            }
            else
            {
                db.Entry(employer).State = EntityState.Modified;


                imgLogo.SaveAs(palogo);
                imgBanner.SaveAs(pabanner);

                employer.employer_logo = imgLogo.FileName;
                employer.employer_banner = imgBanner.FileName;
                employer.employer_personalpage = true;
                employer.employer_version = 1;
                employer.employer_limit = 10;
                //Save sesstion
                employer.employer_email = ses.employer_email;
                employer.employer_pass = ses.employer_pass;
                employer.employer_token = ses.employer_token;
                employer.employer_activate = true;
                employer.employer_option = true;
                employer.employer_name = ses.employer_name;
                employer.employer_datecreated = ses.employer_datecreated;

                db.SaveChanges();

                Session["employer"] = employer;
                return RedirectToAction("Index", "ViewEmployer");
            }
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", employer.career_id);
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name", employer.province_id);
            return View(employer);
        }
    }
}