using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLNS.Models;


namespace QLNS.Controllers
{
    public class TonGiaoController : Controller
    {
        QLyNhanSuEntities database = new QLyNhanSuEntities();
        
        // GET: TonGiao
        public ActionResult Index()
        {
            return View(database.TonGiaos.ToList());
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(TonGiao tg)
        {
            if (ModelState.IsValid)
            {
                var check = database.TonGiaos.Where(s => s.MaTonGiao == tg.MaTonGiao).FirstOrDefault();
                if(check == null)
                {
                    database.Configuration.ValidateOnSaveEnabled = false;
                    database.TonGiaos.Add(tg);
                    database.SaveChanges();
                    return RedirectToAction("Index", "TonGiao");
                }
                else
                {
                    ViewBag.ErrorTG = "Tên hoặc Mã tôn giáo đã tồn tại";
                    return View();
                }
            }
            return View();

        }
        public ActionResult Details(string id)
        {
            return View(database.TonGiaos.Where(s => s.MaTonGiao == id).FirstOrDefault());
        }
        public ActionResult Delete(string id)
        {
            return View(database.TonGiaos.Where(s => s.MaTonGiao == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Delete(TonGiao tg,string id)
        {
            try
            {
                tg = database.TonGiaos.Where(s => s.MaTonGiao == id).FirstOrDefault();
                database.TonGiaos.Remove(tg);
                database.SaveChanges();
                return RedirectToAction("Index", "TonGiao");
            }
            catch
            {
                return Content("Không tồn tại tôn giáo này");
            }
        }
        public ActionResult Edit(string id)
        {
            return View(database.TonGiaos.Where(s => s.MaTonGiao == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Edit(TonGiao tg)
        {
            if (ModelState.IsValid)
            {
                database.Configuration.ValidateOnSaveEnabled = false;
                database.Entry(tg).State = System.Data.Entity.EntityState.Modified;
                database.SaveChanges();
                return RedirectToAction("Index", "TonGiao");
            }
            return View();
        }

    }
}