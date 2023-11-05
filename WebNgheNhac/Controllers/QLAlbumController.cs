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
    public class QLAlbumController : Controller
    {
        private WebNNEntities db = new WebNNEntities();
        public ActionResult Index(string tukhoa)
        {
            if (Session["quyen"] == null || Session["quyen"].ToString() == "")
            {
                return RedirectToAction("Index", "Dangnhap");
            }
            string query = "SELECT ab.*, cs.TEN_CS, tl.TEN_TL FROM ALBUM ab, CASI cs, THELOAI tl "
                            + "WHERE ab.MA_CS = cs.MA_CS "
                            + "AND ab.MA_TL = tl.MA_TL";
            IEnumerable<Album> sql = db.Database.SqlQuery<Album>(query).ToList();
            if (!string.IsNullOrEmpty(tukhoa))
            {
                sql = sql.Where(ab => ab.TEN_AB.ToUpper().Contains(tukhoa.ToUpper()));
            }
            return View(sql);
        }
        public ActionResult Detail(int id)
        {
            ALBUM album = db.ALBUMs.Find(id);
            string anh = album.ANH_AB;
            ViewBag.anh = anh;
            if (album == null)
            {
                return HttpNotFound();
            }
            return View(album);
        }
        #region[Create]
        public ActionResult Create()
        {
            if (Session["quyen"] == null || Session["quyen"].ToString() == "")
            {
                return RedirectToAction("Index", "Dangnhap");
            }
            ViewBag.MA_TL = new SelectList(db.THELOAIs, "MA_TL", "TEN_TL");
            ViewBag.MA_CS = new SelectList(db.CASIs, "MA_CS", "TEN_CS");
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ALBUM album)
        {
            string img = "";
            string filename = "";
            foreach (string upload in Request.Files)
            {
                if (Request.Files[upload].ContentLength == 0) continue;
                string pathToSave = Server.MapPath("~/Uploads/poster/");//Phần vị trí lưu File .
                if (img == null || img == "")
                {
                    filename = Path.GetFileName(Request.Files[upload].FileName);
                    img = filename;
                }
                Request.Files[upload].SaveAs(Path.Combine(pathToSave, filename)); //lưu file
            }
            if (img == "" || img == null)
            {
                img = "posterdefault.jpg";
            }
            album.ANH_AB = "/Uploads/poster/" + img;
            album.LUOTNGHE = 1;
            var sql = (from ab in db.ALBUMs orderby ab.MA_AB descending select ab).Take(1).ToList();
            int maab = (int)sql[0].MA_AB;
            album.MA_AB = maab + 1;
            if (ModelState.IsValid)
            {
                db.ALBUMs.Add(album);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MA_TL = new SelectList(db.THELOAIs, "MA_TL", "MA_TL", album.MA_TL);
            ViewBag.MA_CS = new SelectList(db.CASIs, "MA_CS", "MA_CS", album.MA_CS);
            return View(album);
        }
        #endregion
        #region[Edit]
        public ActionResult Edit(int id)
        {
            ALBUM album = db.ALBUMs.Find(id);
            string anhab = album.ANH_AB;
            ViewBag.anhab = anhab;
            if (album == null)
            {
                return HttpNotFound();
            }
            ViewBag.MA_TL = new SelectList(db.THELOAIs, "MA_TL", "TEN_TL", album.MA_TL);
            ViewBag.MA_CS = new SelectList(db.CASIs, "MA_CS", "TEN_CS", album.MA_CS);
            return View(album);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit( ALBUM album)
        {
            if (ModelState.IsValid)
            {
                db.Entry(album).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MA_TL = new SelectList(db.THELOAIs, "MA_TL", "MA_TL", album.MA_TL);
            ViewBag.MA_CS = new SelectList(db.CASIs, "MA_CS", "MA_CS", album.MA_CS);
            return View(album);
        }
        #endregion
        #region[Delete]
        public ActionResult Delete(int id)
        {
            ALBUM album = db.ALBUMs.Find(id);
            string anh = album.ANH_AB;
            ViewBag.anh = anh;
            if (album == null)
            {
                return HttpNotFound();
            }
            return View(album);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ALBUM album = db.ALBUMs.Find(id);
            db.ALBUMs.Remove(album);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        #endregion
    }
}