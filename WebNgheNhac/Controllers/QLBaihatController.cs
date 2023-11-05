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
    public class QLBaihatController : Controller
    {
        // GET: QLBaihat
        private WebNNEntities db = new WebNNEntities();
        public ActionResult Index(string tukhoa)
        {
            if (Session["quyen"] == null || Session["quyen"].ToString() == "")
            {
                return RedirectToAction("Index", "Dangnhap");
            }
            string query = "SELECT bh.*, cs.TEN_CS, tl.TEN_TL, us.USERNAME, ab.TEN_AB FROM BAIHAT bh, USERS us, ALBUM ab, CASI cs, THELOAI tl "
                            + "WHERE bh.MA_CS = cs.MA_CS "
                            + "AND bh.MA_TL = tl.MA_TL "
                            + "AND bh.MA_AB = ab.MA_AB "
                            + "AND bh.ID = us.ID";
            IEnumerable<ModelsBaiHat> sql = db.Database.SqlQuery<ModelsBaiHat>(query).ToList();
            if (!String.IsNullOrEmpty(tukhoa))
            {
                sql = sql.Where(bh => bh.TEN_BH.ToUpper().Contains(tukhoa.ToUpper()));
            }
            return View(sql);
        }
        public ActionResult Detail(int id)
        {
            BAIHAT bh = db.BAIHATs.Find(id);
            if (bh == null)
            {
                return HttpNotFound();
            }
            return View(bh);
        }
        public ActionResult Create()
        {
            if (Session["quyen"] == null || Session["quyen"].ToString() == "")
            {
                return RedirectToAction("Index", "Dangnhap");
            }
            ViewBag.MA_TL = new SelectList(db.THELOAIs, "MA_TL", "TEN_TL");
            ViewBag.MA_AB = new SelectList(db.ALBUMs, "MA_AB", "TEN_AB");
            ViewBag.MA_CS = new SelectList(db.CASIs, "MA_CS", "TEN_CS");
            ViewBag.ID = new SelectList(db.USERS, "ID", "USERNAME");
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(BAIHAT baihat)
        {
            baihat.ID = (int)Session["id"];
            string song = "";
            string fileImage = "";
            foreach (string upload in Request.Files)
            {
                if (upload.Equals("fileAnhBia"))
                {
                    if (Request.Files[upload].ContentLength == 0) continue;
                    string pathToSave = Server.MapPath("~/Uploads/baihat/");//Phần vị trí lưu File .
                    var filess = Path.GetFileName(Request.Files[upload].FileName);
                    fileImage = filess;
                    Request.Files[upload].SaveAs(Path.Combine(pathToSave, filess));
                }
                if (upload.Equals("fileUpload"))
                {
                    if (Request.Files[upload].ContentLength == 0) continue;
                    string pathToSave = Server.MapPath("~/Uploads/music/");//Phần vị trí lưu File .
                    string filename = Path.GetFileName(Request.Files[upload].FileName);
                    song = filename;
                    Request.Files[upload].SaveAs(Path.Combine(pathToSave, filename));
                }
            }
            baihat.LINK = "/Uploads/music/" + song;
            baihat.AnhBaiHat = "/Uploads/baihat/" + fileImage;
            baihat.LUOTNGHE = 1;
            baihat.LUOTLIKE = 1;
            var sql = (from bh in db.BAIHATs orderby bh.MA_BH descending select bh).Take(1).ToList();
            int mabh = (int)sql[0].MA_BH;
            baihat.MA_BH = mabh + 1;
            if (ModelState.IsValid)
            {
                db.BAIHATs.Add(baihat);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MA_TL = new SelectList(db.THELOAIs, "MA_TL", "MA_TL", baihat.MA_TL);
            ViewBag.MA_CS = new SelectList(db.CASIs, "MA_CS", "MA_CS", baihat.MA_CS);
            ViewBag.MA_AB = new SelectList(db.ALBUMs, "MA_AB", "MA_AB", baihat.MA_AB);
            ViewBag.ID = new SelectList(db.USERS, "ID", "ID", baihat.ID);
            return View(baihat);
        }

        //Sửa Bài Hát
        #region[Edit]
        public ActionResult Edit(int id)
        {
            BAIHAT baihat = db.BAIHATs.Find(id);

            if (baihat == null)
            {
                return HttpNotFound();
            }
            ViewBag.MA_TL = new SelectList(db.THELOAIs, "MA_TL", "TEN_TL", baihat.MA_TL);
            ViewBag.MA_CS = new SelectList(db.CASIs, "MA_CS", "TEN_CS", baihat.MA_CS);
            ViewBag.MA_AB = new SelectList(db.ALBUMs, "MA_AB", "TEN_AB", baihat.MA_AB);
            return View(baihat);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(BAIHAT baihat)
        {
            baihat.ID = (int)Session["id"];
            if (ModelState.IsValid)
            {
                db.Entry(baihat).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MA_TL = new SelectList(db.THELOAIs, "MA_TL", "MA_TL", baihat.MA_TL);
            ViewBag.MA_CS = new SelectList(db.CASIs, "MA_CS", "MA_CS", baihat.MA_CS);
            ViewBag.MA_AB = new SelectList(db.ALBUMs, "MA_AB", "MA_AB", baihat.MA_AB);
            return View(baihat);
        }
        #endregion

        #region[Delete]
        public ActionResult Delete(int id)
        {
            BAIHAT baihat = db.BAIHATs.Find(id);
            if (baihat == null)
            {
                return HttpNotFound();
            }
            return View(baihat);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BAIHAT baihat = db.BAIHATs.Find(id);
            db.BAIHATs.Remove(baihat);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        #endregion
    }
}