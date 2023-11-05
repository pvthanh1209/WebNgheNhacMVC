using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using WebNgheNhac.Models;

namespace WebNgheNhac.Controllers
{
    public class DangnhapController : Controller
    {
        // GET: Dangnhap
        private WebNNEntities db = new WebNNEntities();
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(USER user)
        {
            if (ModelState.IsValid)
            {
                var passWork = ToMD5(user.PASS);
                var v = db.USERS.Where(a => a.USERNAME.Equals(user.USERNAME)
                                            && a.PASS.Equals(passWork)).FirstOrDefault();
                if (v != null)
                {
                    Session["id"] = v.ID;
                    Session["username"] = v.USERNAME;
                    Session["password"] = v.PASS;
                    Session["quyen"] = v.QUYEN;
                    return RedirectToAction("Saukhidangnhap");
                }
                else ModelState.AddModelError("", "Sai tên đăng nhập hoặc mật khẩu");
            }
            return View();
        }
        public ActionResult Saukhidangnhap()
        {
            if (Session["quyen"].ToString() == "1" || Session["quyen"].ToString() == "2")
            {
                return RedirectToAction("Index", "QLAlbum");
            }
            else return RedirectToAction("Index", "Home");
        }
        public ActionResult Dangxuat()
        {
            Session["username"] = null;
            Session["password"] = null;
            Session["quyen"] = null;
            return RedirectToAction("Index", "Home");
        }
        public ActionResult DangKy(USER user, Reg model)
        {
            if (ModelState.IsValid)
            {
                if (checkusername(model.username))
                {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                }
                else
                {
                    var sql = (from p in db.USERS orderby p.ID descending select p).ToList();

                    int id = sql[0].ID;

                    user.ID = id + 1;
                    user.HOTEN = model.hoten;
                    user.USERNAME = model.username;
                    user.PASS = ToMD5(model.pass1);
                    user.QUYEN = 3;
                    db.USERS.Add(user);
                    db.SaveChanges();
                    return RedirectToAction("Index", "Dangnhap");
                }
            }
            return View();
        }
        private bool checkusername(string username)
        {
            var sql = (from p in db.USERS where p.USERNAME == username select p).ToList();
            if (sql.Count > 0)
                return true;
            else
                return false;
        }
        public string ToMD5(string input)
        {
            using (System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create())
            {
                byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("X2"));
                }
                return sb.ToString();
            }
        }
    }
}