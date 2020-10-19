using System;
using System.Collections.Generic;
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
                db.SaveChanges();

                Session["employer"] = employer;
                return RedirectToAction("Index", "ViewEmployer");
            }
            return View(employer);
        }
    }
}