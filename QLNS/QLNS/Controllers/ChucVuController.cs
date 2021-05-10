using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLNS.Models;

namespace QLNS.Controllers
{
    public class ChucVuController : Controller
    {
        QLyNhanSuEntities databse = new QLyNhanSuEntities();
        // GET: ChucVu
        public ActionResult Index()
        {
            return View(databse.ChucVus.ToList());
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(ChucVu cv)
        {
            if (ModelState.IsValid)
            {
                var check = databse.ChucVus.Where(x => x.MaChucVuNV == cv.MaChucVuNV).FirstOrDefault();
                if(check == null)
                {
                    databse.Configuration.ValidateOnSaveEnabled = false;
                    databse.ChucVus.Add(cv);
                    databse.SaveChanges();
                    return RedirectToAction("Index", "ChucVu");
                }
                else
                {
                    ViewBag.Error = "Tên hoặc Mã chức vụ đã tồn tại";
                    return View();
                }
            }
            return View();
        }
        public ActionResult Delete(string id)
        {
            return View(databse.ChucVus.Where(s => s.MaChucVuNV == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Delete (ChucVu cv, string id)
        {
            try
            {
                cv = databse.ChucVus.Where(s => s.MaChucVuNV == id).FirstOrDefault();
                databse.ChucVus.Remove(cv);
                databse.SaveChanges();
                return RedirectToAction("Index", "ChucVu");
            }
            catch
            {
                return Content("Không tồn tại Chức vự này để xóa");
            }
        }
        public ActionResult Edit (string id)
        {
            return View(databse.ChucVus.Where(s => s.MaChucVuNV == id).FirstOrDefault());

        }
        [HttpPost]
        public ActionResult Edit (ChucVu cv , string id)
        {
            if (ModelState.IsValid)
            {
                databse.Configuration.ValidateOnSaveEnabled = false;
                databse.Entry(cv).State = System.Data.Entity.EntityState.Modified;
                databse.SaveChanges();
                return RedirectToAction("Index", "PhongBan");
            }
            return View();
        }
        public ActionResult Details (string id)
        {
            return View(databse.ChucVus.Where(s => s.MaChucVuNV == id).FirstOrDefault());
        }
    }
}