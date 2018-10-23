using BTAdventure.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BTAdventure.UI.Controllers
{
    public class AdminController : Controller
    {
        private AdminService adminService;
        public AdminController(AdminService adminService)
        {
            this.adminService = adminService;
        }

        public ActionResult AdminHome()
        {
            return View();
        }

        // GET: Admin
        public ActionResult ListGames()
        {
            var allScene = adminService.GetAllScenes();
            return View(allScene);
        }
    }
}