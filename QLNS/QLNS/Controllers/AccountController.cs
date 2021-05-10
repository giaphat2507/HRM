using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLNS.Models;
using System.Web.Security;

namespace QLNS.Controllers
{
    public class AccountController : Controller
    {
        QLyNhanSuEntities db = new QLyNhanSuEntities();
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(User user)
        {
            var check = db.Users.Where(s => s.UserName == user.UserName && s.PassWord == user.PassWord).FirstOrDefault();
            if (check == null)
            {
                ViewBag.Error = "Sai thông tin đăng nhập";
                return View();
            }
            else
            {
                FormsAuthentication.SetAuthCookie(user.UserName, false);
                db.Configuration.ValidateOnSaveEnabled = false;
                Session["UserName"] = user.UserName;
                //Session["ID"] = user.Id;
                //Session["Password"] = user.PassWord;
                return RedirectToAction("Index", "Home");
            }

            //using(var context = new QLyNhanSuEntities())
            //{
            //    bool isValid = context.Users.Any(x => x.UserName == user.UserName && x.PassWord == user.PassWord);
            //       if (isValid)
            //    {
            //        FormsAuthentication.SetAuthCookie(user.UserName, false);
            //        return RedirectToAction("Index", "Home");

            //    }
            //    ModelState.AddModelError("", "Id or password wrong");
            //}
            //return View();
        }
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }
    }
}