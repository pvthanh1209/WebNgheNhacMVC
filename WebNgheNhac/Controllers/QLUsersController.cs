using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using WebNgheNhac.Models;

namespace WebNgheNhac.Controllers
{
    public class QLUsersController : Controller
    {
        WebNNEntities db = new WebNNEntities();
        public ActionResult Index()
        {
            if (Session["quyen"] == null || Session["quyen"].ToString() == "")
            {
                return RedirectToAction("Index", "Dangnhap");
            }
            var sql = (from p in db.USERS select p).ToList();

            string user = "";
            string pass = "";
            string hoten = "";
            string ngaysinh = "";
            int chk_quyen;
            string Chuoi = "";
            for (int i = 0; i < sql.Count; i++)
            {
                if (sql[i].ID == 1)
                    continue;
                else
                {
                    user = sql[i].USERNAME;
                    pass = sql[i].PASS;
                    hoten = sql[i].HOTEN;
                    ngaysinh = sql[i].NGAYSINH.ToString();
                    chk_quyen = (int)sql[i].QUYEN;
                    string level = "";
                    var s = (from a in db.QUYENs where a.ID_LV == chk_quyen select a).ToList();

                    level = s[0].LEVEL;

                    Chuoi += "<tr><th>" + user + "</th><th>" + hoten + "</th><th>" + ngaysinh + "</th><th>" + level + "</th><th><a href=\"/QLUsers/Edit/" + sql[i].ID + "\" class=\"opt-btn\"><span class=\"glyphicon glyphicon-wrench\"></span></a>|<a href=\"/QLUsers/Delete/" + sql[i].ID + "\" class=\"opt-btn\"><span class=\"glyphicon glyphicon-trash\"></span></a></th></tr>";
                }
            }
            ViewBag.Manager = Chuoi;
            return View();
        }

        public ActionResult Edit(int id)
        {
            USER user = db.USERS.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            ViewBag.QUYEN = new SelectList(db.QUYENs, "ID_LV", "LEVEL");
            return View(user);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(USER users)
        {
            if (ModelState.IsValid)
            {
                users.PASS = ToMD5(users.PASS);
                db.Entry(users).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(users);
        }


        public ActionResult Search(string keyword)
        {
            if (keyword != null)
            {
                string KQ = "";
                var s = (from p in db.USERS where p.USERNAME.ToUpper().Contains(keyword.ToUpper()) orderby p.ID select p).ToList();

                if (s.Count != 0)
                {
                    KQ += "Có " + s.Count + " Kết Quả Được Tìm Thấy";
                    for (int i = 0; i < s.Count; i++)
                    {
                        if (s[i].ID == 1) continue;
                        KQ += "<tr><th>" + s[i].USERNAME + "</th><th>" + s[i].PASS + "</th><th>" + s[i].HOTEN + "</th><th>" + s[i].NGAYSINH + "</th><th>" + s[i].QUYEN + "</th><th><a href=\"/QLUsers/Edit/" + s[i].ID + "\" class=\"opt-btn\"><span class=\"glyphicon glyphicon-wrench\"></span></a>|<a href=\"/QLUsers/Delete/" + s[i].ID + "\" class=\"opt-btn\"><span class=\"glyphicon glyphicon-trash\"></span></a></th></tr>";

                    }
                }
                else
                    KQ = "Không tìm thấy kết quả!";
                ViewBag.Manager = KQ;
            }
            else
                return RedirectToAction("Index");
            return View();
        }
        public ActionResult Delete(int id)
        {
            USER user = db.USERS.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            return View(user);
        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            USER user = db.USERS.Find(id);
            db.USERS.Remove(user);
            db.SaveChanges();
            return RedirectToAction("Index");
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