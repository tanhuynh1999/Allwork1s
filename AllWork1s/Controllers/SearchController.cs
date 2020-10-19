using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using AllWork1s.Models;

namespace AllWork1s.Controllers
{
    public class SearchController : Controller
    {
        // GET: Search
        DataWorkEntities db = new DataWorkEntities();
        //Tìm kiếm all work
        public PartialViewResult CategoryWork(int ? id, int ? idform)
        {
            System.Threading.Thread.Sleep(2000);
            Session["cate"] = id;
            Session["form"] = idform;

            if(Session["cate"] != null)
            {
                int cate = (int)Session["cate"];
                List<Work> works = db.Works.Where(n => n.work_activate == true && n.work_option == true && n.Employer.employer_activate == true && n.career_id == cate).OrderByDescending(n => n.work_datecreated).ToList();
                return PartialView("_Work",works);
            }
            else
            {
                List<Work> works = db.Works.Where(n => n.work_activate == true && n.work_option == true && n.Employer.employer_activate == true).OrderByDescending(n => n.work_datecreated).ToList();
                return PartialView("_Work", works);
            }
        }
        public PartialViewResult CategoryNull()
        {
            System.Threading.Thread.Sleep(2000);
            Session["cate"] = null;

            List<Work> works = db.Works.Where(n => n.work_activate == true && n.work_option == true && n.Employer.employer_activate == true).OrderByDescending(n => n.work_datecreated).ToList();
            return PartialView("_Work", works);
        }
        public PartialViewResult FormNull()
        {
            System.Threading.Thread.Sleep(2000);
            Session["form"] = null;

            List<Work> works = db.Works.Where(n => n.work_activate == true && n.work_option == true && n.Employer.employer_activate == true).OrderByDescending(n => n.work_datecreated).ToList();
            return PartialView("_Work", works);
        }
        public PartialViewResult FormCategory_Work(int? idform)
        {
            System.Threading.Thread.Sleep(2000);
            Session["form"] = idform;

            if (Session["cate"] != null && Session["form"] != null)
            {
                int cate = (int)Session["cate"];
                int form = (int)Session["form"];
                List<Work> works = db.Works.Where(n => n.work_activate == true && n.work_option == true && n.Employer.employer_activate == true && n.career_id == cate && n.form_id == form).OrderByDescending(n => n.work_datecreated).ToList();
                return PartialView("_Work", works);
            }
            else
            {
                List<Work> works = db.Works.Where(n => n.work_activate == true && n.work_option == true && n.Employer.employer_activate == true && n.form_id == idform).OrderByDescending(n => n.work_datecreated).ToList();
                return PartialView("_Work", works);
            }
        }
    }
}