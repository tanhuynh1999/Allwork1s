using AllWork1s.Models;
using System;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace AllWork1s.Areas.Admin.Controllers
{
    public class UsersController : Controller
    {
        private DataWorkEntities db = new DataWorkEntities();

        // GET: Admin/Users
        public ActionResult Index()
        {
            var users = db.Users.Include(u => u.Career);
            return View(users.Where(n=>n.user_delete == false).ToList());
        }

        // GET: Admin/Users/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // GET: Admin/Users/Create
        public ActionResult Create()
        {
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name");
            return View();
        }

        // POST: Admin/Users/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "user_id,user_login,user_pass,user_nicename,user_email,user_datecreated,user_token,user_role,user_datelogin,user_activate,user_image,user_industryloving,user_skill,user_interests,user_view,career_id")] User user, HttpPostedFileBase imgUser)
        {
            Random r = new Random();
            int ran = r.Next(1, 1000);

            //Lat ten file
            var nameimg = Path.GetFileName(imgUser.FileName);
            //Dua vao file
            var paimg = Path.Combine(Server.MapPath("~/Images/User"), ran.ToString() + nameimg);

            //email ton tai
            User useremail = db.Users.SingleOrDefault(n => n.user_email == user.user_email);

            if (imgUser == null)
            {
                ViewBag.ThongBao = "Chọn hình ảnh";
            }
            else if (useremail != null)
            {
                ViewBag.ThongBao = "Email đã có, vui lòng chọn email khác";
            }
            else if (System.IO.File.Exists(paimg))
            {
                ViewBag.ThongBao = "Hình ảnh đã tồn tại!";
            }
            else
            {
                imgUser.SaveAs(paimg);

                db.Users.Add(user);

                user.user_image = ran.ToString() + nameimg;

                user.user_datecreated = DateTime.Now;
                user.user_datelogin = DateTime.Now;
                user.user_token = Guid.NewGuid().ToString();
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", user.career_id);
            return View(user);

        }

        // GET: Admin/Users/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", user.career_id);
            return View(user);
        }

        // POST: Admin/Users/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "user_id,user_login,user_pass,user_nicename,user_email,user_datecreated,user_token,user_role,user_datelogin,user_activate,user_image,user_industryloving,user_skill,user_interests,user_view,career_id")] User user, HttpPostedFileBase imgUser)
        {
            db.Entry(user).State = EntityState.Modified;

            User useremail = db.Users.Where(n=>n.user_email != user.user_email).SingleOrDefault(n => n.user_email == user.user_email);

            if (imgUser == null)
            {
                user.user_token = Guid.NewGuid().ToString();

                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                Random r = new Random();
                int ran = r.Next(1, 1000);

                //Lat ten file
                var nameimg = Path.GetFileName(imgUser.FileName);
                //Dua vao file
                var paimg = Path.Combine(Server.MapPath("~/Images/User"), ran.ToString() + nameimg);

                if (useremail != null)
                {
                    ViewBag.ThongBao = "Email này đã tồn tại";
                }
                else if (imgUser == null)
                {
                    ViewBag.ThongBao = "Chọn hình ảnh";
                }
                else if (System.IO.File.Exists(paimg))
                {
                    ViewBag.ThongBao = "Hình ảnh đã tồn tại!";
                }
                else
                {
                    imgUser.SaveAs(paimg);
                    user.user_image = ran.ToString() + nameimg;

                    System.IO.File.Delete("530du-lich-Ben-Tre.jpg");

                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                
            }

            ViewBag.career_id = new SelectList(db.Careers, "career_id", "career_name", user.career_id);
            return View(user);
        }

        // GET: Admin/Users/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }

        // POST: Admin/Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            User user = db.Users.Find(id);
            db.Users.Remove(user);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public ActionResult DeleteTelex(int ?id)
        {
            User user = db.Users.Find(id);
            user.user_delete = true;
            db.SaveChanges();
            return Redirect(Request.UrlReferrer.ToString());
        }
    }
}
