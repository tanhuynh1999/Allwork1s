using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AllWork1s.Models;

namespace AllWork1s.Areas.EmployerUse.Controllers
{
    public class WorkEmployerController : Controller
    {
        DataWorkEntities db = new DataWorkEntities();
        // GET: EmployerUse/WorkEmployer
        public ActionResult CreateWork(int? id)
        {
            Employer employer = (Employer)Session["employer"];
            if (employer == null)
            {
                return RedirectToAction("Login", "Employer");
            }
            if (id != employer.employer_id)
            {
                return RedirectToAction("Error", "ViewEmployer");
            }
            if (employer.employer_personalpage == false || employer.employer_personalpage == null)
            {
                return RedirectToAction("Createemployer", "Employer", new { id = employer.employer_id });
            }
            Employer employerall = db.Employers.Find(id);
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name");
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name");
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name");
            return View(employerall);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult CreateWork([Bind(Include = "work_id,work_name,work_image,work_deadline,work_description,work_request,work_benefit,work_address,work_moneyf,work_moneye,work_amount,work_activate,work_option,work_view,work_love,work_map,work_datecreated,work_dateexpired,work_datesend,work_imagetwo,work_imgathree,employer_id,work_pricemin,work_pricemax,work_symbol,work_sex,work_format,work_yearsofexp,work_province,work_ifamemap,work_note,work_delete,work_spam,province_id,form_id,career_id,work_del")] Work work, HttpPostedFile imgOne, HttpPostedFile imgTwo, HttpPostedFile imgThree)
        {
            Employer employer = (Employer)Session["employer"];

            if(imgOne == null || imgTwo == null || imgThree == null)
            {

                db.Works.Add(work);

                if (employer.employer_version == 3 || employer.employer_version == 2)
                {
                    work.work_activate = true;
                }
                else
                {
                    work.work_activate = false;
                }
                work.work_option = true;
                work.employer_id = employer.employer_id;
                work.work_datecreated = DateTime.Now;
                work.work_view = 1;
                work.work_love = 1;
                work.work_delete = false;
                work.work_del = false;
                

                db.SaveChanges();

                return RedirectToAction("Index", "ViewEmployer");
            }
            else
            {
                //Lay ten file
                var nameone = Path.GetFileName(imgOne.FileName);
                var nametwo = Path.GetFileName(imgTwo.FileName);
                var namethree = Path.GetFileName(imgThree.FileName);
                //Dua vao file
                var paone = Path.Combine(Server.MapPath("~/Images/Employer"), nameone);
                var patwo = Path.Combine(Server.MapPath("~/Images/Employer"), nametwo);
                var pathree = Path.Combine(Server.MapPath("~/Images/Employer"), namethree);

                if (imgOne == null || imgTwo == null || imgThree == null)
                {
                    ViewBag.ThongBao = "Chọn hình ảnh";
                }
                else if (System.IO.File.Exists(paone) || System.IO.File.Exists(patwo) || System.IO.File.Exists(pathree))
                {
                    ViewBag.ThongBao = "Hình ảnh đã tồn tại!";
                }
                else
                {
                    imgOne.SaveAs(paone);
                    imgTwo.SaveAs(patwo);
                    imgThree.SaveAs(pathree);

                    db.Works.Add(work);

                    work.work_image = imgOne.FileName;
                    work.work_imagetwo = imgTwo.FileName;
                    work.work_imgathree = imgThree.FileName;

                    if (employer.employer_version == 3 || employer.employer_version == 2)
                    {
                        work.work_activate = true;
                    }
                    else
                    {
                        work.work_activate = false;
                    }
                    work.work_option = true;
                    work.employer_id = employer.employer_id;
                    work.work_datecreated = DateTime.Now;
                    work.work_view = 1;
                    work.work_love = 1;
                    work.work_delete = false;
                    work.work_del = false;

                    db.SaveChanges();

                    return RedirectToAction("Index", "ViewEmployer");
                }
            }
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", work.career_id);
            ViewBag.form_id = new SelectList(db.Forms, "form_id", "form_name", work.form_id);
            ViewBag.province_id = new SelectList(db.Provinces, "province_id", "province_name", work.province_id);

            return View(work);
        }
        public ActionResult IndexWorkEmployer(int ?id)
        {
            Employer employer = (Employer)Session["employer"];
            if (employer == null)
            {
                return RedirectToAction("Login", "Employer");
            }
            if (id != employer.employer_id)
            {
                return RedirectToAction("Error", "ViewEmployer");
            }
            if (employer.employer_personalpage == false || employer.employer_personalpage == null)
            {
                return RedirectToAction("Createemployer", "Employer", new { id = employer.employer_id });
            }
            List<Work> works = db.Works.Where(n => n.work_activate == true && n.work_del == false && n.employer_id == id).OrderByDescending(n => n.work_datecreated).ToList();
            return View(works);
        }
    }
}