using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLNS.Models;

namespace QLNS.Controllers
{
    public class DanTocController : Controller
    {
        QLyNhanSuEntities database = new QLyNhanSuEntities();
        // GET: DanToc
        public ActionResult Index()
        {
            return View(database.DanTocs.ToList());
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(DanToc dt)
        {
            if (ModelState.IsValid)
            {
                var check = database.DanTocs.Where(s => s.MaDanToc == dt.MaDanToc).FirstOrDefault();
                if(check == null)
                {
                    database.Configuration.ValidateOnSaveEnabled = false;
                    database.DanTocs.Add(dt);
                    database.SaveChanges();
                    return RedirectToAction("Index", "DanToc");
                }
                else
                {
                    ViewBag.ErrorDT = "Mã dân tộc hoặc Tên dân tộc đã tồn tại";
                }
            }
            return View();
        }
        public ActionResult Details (string id)
        {
            return View(database.DanTocs.Where(s => s.MaDanToc == id).FirstOrDefault());
        }
        public ActionResult Edit(string id )
        {
            return View(database.DanTocs.Where(s => s.MaDanToc == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Edit(string id , DanToc dt)
        {
            if (ModelState.IsValid)
            {
                dt = database.DanTocs.Where(s => s.MaDanToc == dt.MaDanToc).FirstOrDefault();
                database.Entry(dt).State = System.Data.Entity.EntityState.Modified;
                database.SaveChanges();
                return RedirectToAction("Index", "DanToc");
            }
            return View();
        }
        public ActionResult Delete(string id)
        {
            return View(database.DanTocs.Where(s => s.MaDanToc == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Delete(DanToc dt, string id)
        {
            try
            {
                dt = database.DanTocs.Where(s => s.MaDanToc == id).FirstOrDefault();
                database.DanTocs.Remove(dt);
                database.SaveChanges();
                return RedirectToAction("Index", "DanToc");
            }
            catch
            {
                return Content("Không tồn tại dân tộc này để xóa");
            }
        }
    }
}