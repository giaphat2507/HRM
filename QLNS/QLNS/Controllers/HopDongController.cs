using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLNS.Models;

namespace QLNS.Controllers
{
    public class HopDongController : Controller
    {
        QLyNhanSuEntities database = new QLyNhanSuEntities();

        // GET: TonGiao
        public ActionResult Index()
        {
            return View(database.HopDongs.ToList());
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(HopDong hd)
        {
            if (ModelState.IsValid)
            {
                var check = database.HopDongs.Where(s => s.MaHopDong == hd.MaHopDong).FirstOrDefault();
                if (check == null )
                {
                    database.Configuration.ValidateOnSaveEnabled = false;
                    database.HopDongs.Add(hd);
                    database.SaveChanges();
                    return RedirectToAction("Index", "HopDong");
                }
                else
                {
                    ViewBag.ErrorHD = "Loại hoặc Mã hợp đồng đã tồn tại";
                    return View();
                }
            }
            return View();

        }
        public ActionResult Details(string id)
        {
            return View(database.HopDongs.Where(s => s.MaHopDong == id).FirstOrDefault());
        }
        public ActionResult Delete(string id)
        {
            return View(database.HopDongs.Where(s => s.MaHopDong == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Delete(HopDong hd, string id)
        {
            try
            {
                hd = database.HopDongs.Where(s => s.MaHopDong == id).FirstOrDefault();
                database.HopDongs.Remove(hd);
                database.SaveChanges();
                return RedirectToAction("Index", "HopDong");
            }
            catch
            {
                return Content("Không tồn tại hợp đồng này");
            }
        }
        public ActionResult Edit(string id)
        {
            return View(database.HopDongs.Where(s => s.MaHopDong == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Edit(HopDong hd)
        {
            if (ModelState.IsValid)
            {
                database.Configuration.ValidateOnSaveEnabled = false;
                database.Entry(hd).State = System.Data.Entity.EntityState.Modified;
                database.SaveChanges();
                return RedirectToAction("Index", "HopDong");
            }
            return View();
        }
    }
}