using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNgheNhac.Models;

namespace WebNgheNhac.Controllers
{
    public class QLCasiController : Controller
    {
        WebNNEntities db = new WebNNEntities();

        public ActionResult Index()
        {
            if (Session["quyen"] == null || Session["quyen"].ToString() == "")
            {
                return RedirectToAction("Index", "Dangnhap");
            }
            var sql = (from p in db.CASIs select p).ToList();
            string Chuoi = "";
            int Ma_CS;
            string Ten_CS = "";
            string img = "";
            string info = "";
            int quocgia;
            for (int i = 0; i < sql.Count; i++)
            {
                quocgia = (int)sql[i].QUOCGIA;
                var sql_1 = (from a in db.QUOCGIAs where a.MA_QG == quocgia select a).ToList();
                string country = sql_1[0].TEN_QG;

                Ma_CS = sql[i].MA_CS;
                Ten_CS = sql[i].TEN_CS;
                img = sql[i].ANH_CS;
                info = sql[i].THONGTIN_CS;

                Chuoi += "<tr><td class=\"tencs\">" + Ten_CS + "</td><td><img src=\"" + img + "\" alt=\"acs\" class=\"hinhcs\"/></td><td class=\"thongtincs\">" + info + "</td><td class=\"quocgiacs\">" + country + "</td><td class=\"tuychon\"><a href=\"/QLCasi/Detail/" + Ma_CS + "\" class=\"opt-btn\"><span class=\"glyphicon glyphicon-zoom-in\"></span></a>|<a href=\"/QLCasi/Edit/" + Ma_CS + "\" class=\"opt-btn\"><span class=\"glyphicon glyphicon-wrench\"></span></a>|<a href=\"/QLCasi/Delete/" + Ma_CS + "\" class=\"opt-btn\"><span class=\"glyphicon glyphicon-trash\"></span></a></td></tr>";

            }
            ViewBag.Manager = Chuoi;
            return View();
        }
        public ActionResult Search(string keyword)
        {
            if (keyword != null)
            {
                string KQ = "";
                var s = (from p in db.CASIs where p.TEN_CS.ToUpper().Contains(keyword.ToUpper()) orderby p.MA_CS select p).ToList();

                if (s.Count != 0)
                {
                    KQ += "Có " + s.Count + " Kết Quả Được Tìm Thấy";

                    for (int i = 0; i < s.Count; i++)
                    {
                        int quocgia = (int)s[i].QUOCGIA;
                        var sql_1 = (from a in db.QUOCGIAs where a.MA_QG == quocgia select a).ToList();
                        string country = sql_1[0].TEN_QG;
                        int Ma_CS = (int)s[i].MA_CS;
                        string Ten_CS = s[i].TEN_CS;
                        string img = s[i].ANH_CS;
                        string info = s[i].THONGTIN_CS;
                        KQ += "<tr><td class=\"tencs\">" + Ten_CS + "</td><td><img src=\"" + img + "\" alt=\"acs\" class=\"hinhcs\"/></td><td class=\"thongtincs\">" + info + "</td><td class=\"quocgiacs\">" + country + "</td><td class=\"tuychon\"><a href=\"/QLCasi/Detail/" + Ma_CS + "\" class=\"opt-btn\"><span class=\"glyphicon glyphicon-zoom-in\"></span></a>|<a href=\"/QLCasi/Edit/" + Ma_CS + "\" class=\"opt-btn\"><span class=\"glyphicon glyphicon-wrench\"></span></a>|<a href=\"/QLCasi/Delete/" + Ma_CS + "\" class=\"opt-btn\"><span class=\"glyphicon glyphicon-trash\"></span></a></td></tr>";

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
        public ActionResult Detail(int id)
        {
            var sql = (from p in db.CASIs where p.MA_CS == id select p).ToList();
            string tencs = sql[0].TEN_CS;
            string img = sql[0].ANH_CS;
            string info = sql[0].THONGTIN_CS;
            int ma_quocgia = (int)sql[0].QUOCGIA;

            var sql2 = (from b in db.QUOCGIAs where b.MA_QG == ma_quocgia select b).ToList();

            string tenquocgia = sql2[0].TEN_QG;

            ViewBag.id = id;
            ViewBag.TEN = tencs;
            ViewBag.IMG = img;
            ViewBag.Thongtin = info;
            ViewBag.Quocgia = tenquocgia;
            return View();
        }

        public ActionResult Edit(int id)
        {
            CASI casi = db.CASIs.Find(id);
            if (casi == null)
            {
                return HttpNotFound();
            }
            ViewBag.QUOCGIA = new SelectList(db.QUOCGIAs, "MA_QG", "TEN_QG");
            return View(casi);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit( CASI casi, int id)
        {
            if (ModelState.IsValid)
            {
                db.Entry(casi).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(casi);
        }
        public ActionResult Delete(int id)
        {
            CASI casi = db.CASIs.Find(id);
            string anh = casi.ANH_CS;
            ViewBag.anh = anh;
            if (casi == null)
            {
                return HttpNotFound();
            }
            return View(casi);
        }
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            CASI casi = db.CASIs.Find(id);
            db.CASIs.Remove(casi);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Create()
        {
            ViewBag.QUOCGIA = new SelectList(db.QUOCGIAs, "MA_QG", "TEN_QG");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CASI casi)
        {
            if (Session["quyen"] == null || Session["quyen"].ToString() == "")
            {
                return RedirectToAction("Index", "Dangnhap");
            }
            string img = "";
            string filename = "";
            foreach (string upload in Request.Files)
            {
                if (Request.Files[upload].ContentLength == 0) continue;
                string pathToSave = Server.MapPath("~/Uploads/avatar/");//Phần vị trí lưu File .
                if (img == null || img == "")
                {
                    filename = Path.GetFileName(Request.Files[upload].FileName);
                    img = filename;
                }
                Request.Files[upload].SaveAs(Path.Combine(pathToSave, filename)); //lưu file
            }
            if (img == "" || img == null)
            {
                img = "defaultavatar.ico";
            }
            casi.ANH_CS = "/Uploads/avatar/" + img;
            var sql = (from p in db.CASIs orderby p.MA_CS descending select p).Take(1).ToList();

            int id_max = (int)sql[0].MA_CS;
            casi.MA_CS = id_max + 1;

            if (ModelState.IsValid)
            {

                db.CASIs.Add(casi);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MA_QG = new SelectList(db.QUOCGIAs, "QUOCGIA", "MA_QG", casi.QUOCGIA);

            return View(casi);
        }

        public ActionResult AddCountry(Addcountry model, QUOCGIA QG)
        {
            if (ModelState.IsValid)
            {
                string name_QG = model.tenqg;

                var sql2 = (from p in db.QUOCGIAs where p.TEN_QG == name_QG select p).ToList();
                if (sql2.Count != 0)
                {
                    ModelState.AddModelError("", "Tên Quốc Gia đã tồn tại");
                }
                else
                {
                    var sql = (from p in db.QUOCGIAs orderby p.MA_QG descending select p).ToList();

                    int id_max = sql[0].MA_QG + 1;

                    QG.MA_QG = id_max;
                    QG.TEN_QG = name_QG;
                    db.QUOCGIAs.Add(QG);
                    db.SaveChanges();
                    return RedirectToAction("Create");
                }

            }

            return View();
        }
    }
}