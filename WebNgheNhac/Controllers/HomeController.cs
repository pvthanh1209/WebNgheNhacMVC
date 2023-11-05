using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNgheNhac.Models;

namespace WebNgheNhac.Controllers
{
    public class HomeController : Controller
    {
        private WebNNEntities db = new WebNNEntities();
        public ActionResult Index()
        {
            var model = new HomeModel();
            var baihat = (from b in db.BAIHATs 
                          join c in db.CASIs on b.MA_CS equals c.MA_CS
                          join ab in db.ALBUMs on b.MA_AB equals ab.MA_AB
                          orderby b.LUOTLIKE
                          descending select new BaiHatMapping
                          {
                              BaiHat = b,
                              Ten_Cs = c.TEN_CS,
                              Anh_Ab = ab.ANH_AB
                          }
                         ).Take(8).ToList();
            var album = (from a in db.ALBUMs
                         join c in db.CASIs on a.MA_CS equals c.MA_CS
                         orderby a.LUOTNGHE
                         descending select new AlbumMapping
                         {
                            Album = a,
                            Ten_Cs = c.TEN_CS
                         }).Take(8).ToList();
            model.LstAlbum = album;
            model.LstBaiHat = baihat;
            return View(model);
        }
    }
}