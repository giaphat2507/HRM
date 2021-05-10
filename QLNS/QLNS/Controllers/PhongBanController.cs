using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLNS.Models;

namespace QLNS.Controllers
{
    public class PhongBanController : Controller
    {
        QLyNhanSuEntities database = new QLyNhanSuEntities();
        // GET: PhongBan
        public ActionResult Index(string _name)
        {
            if (_name == null)
            {
            return View(database.PhongBans.ToList()) ;

            }
            else
            {
                return View(database.PhongBans.Where(s => s.TenPhongBan.Contains(_name)).ToList());
            }
        }
        // create phong ban
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(PhongBan pb)
        {
            if (ModelState.IsValid)
            {
                var checkid = database.PhongBans.Where(x => x.MaPhongBan == pb.MaPhongBan).FirstOrDefault();
                if (checkid == null)
                {
                    database.Configuration.ValidateOnSaveEnabled=false;
                    database.PhongBans.Add(pb);
                    database.SaveChanges();
                    return RedirectToAction("Index", "PhongBan");

                }
                else
                {
                    ViewBag.Error = "Tên hoặc Mã phòng ban đã tồn tại";
                    return View();
                }
            }
            return View();
        }
       //delete 
        public ActionResult Delete(string id)
        {
            return View(database.PhongBans.Where(s => s.MaPhongBan == id).FirstOrDefault());

        }
        [HttpPost]

        public ActionResult Delete(PhongBan pb, string id)
        {
            try
            {
                pb = database.PhongBans.Where(s => s.MaPhongBan == id).FirstOrDefault();
                database.PhongBans.Remove(pb);
                database.SaveChanges();
                return RedirectToAction("Index", "PhongBan");
            }
            catch
            {
                return Content("Không tồn tại User để xóa");
            }
        }

        //edit
        public ActionResult Edit (string id)
        {
            return View(database.PhongBans.Where(s => s.MaPhongBan == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Edit(PhongBan pb)
        {
            if (ModelState.IsValid)
            {
                database.Configuration.ValidateOnSaveEnabled = false;
                database.Entry(pb).State = System.Data.Entity.EntityState.Modified;
                database.SaveChanges();
                return RedirectToAction("Index", "PhongBan");
            }
            return View();
          
        }

        //detail
        public ActionResult Details(string id)
        {
            return View(database.PhongBans.Where(s => s.MaPhongBan == id).FirstOrDefault());
        }
    }
}