using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLNS.Models;
namespace QLNS.Controllers
{
    public class NhanVienController : Controller
    {
        QLyNhanSuEntities database = new QLyNhanSuEntities();
        // GET: NhanVien
        public ActionResult Index()
        {
            return View(database.NhanViens.ToList());
        }
        public ActionResult Create()
        {
            return View();
        }
    }
}