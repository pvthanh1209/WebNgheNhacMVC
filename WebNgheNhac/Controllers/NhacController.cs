using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebNgheNhac.Models;

namespace WebNgheNhac.Controllers
{
    public class NhacController : Controller
    {
        private WebNNEntities db = new WebNNEntities();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Nghenhac(int Id)
        {
            var model = new BaiHatDetail();
            BAIHAT song = new BAIHAT();
            var detailBaiHat = db.BAIHATs.Where(x => x.MA_BH == Id).FirstOrDefault();
            if(detailBaiHat == null)
            {
                return HttpNotFound();
            }
            int mabh = (int)detailBaiHat.MA_BH;
            string link = detailBaiHat.LINK;
            string baihat = detailBaiHat.TEN_BH;
            int casi = (int)detailBaiHat.MA_CS;
            int luotnghe = detailBaiHat.LUOTNGHE.Value;
            int luotlike = (int)detailBaiHat.LUOTLIKE;
            song = db.BAIHATs.Find(Id);
            song.LUOTNGHE = luotnghe + 1;
            db.Entry(song).State = EntityState.Modified;
            db.SaveChanges();
            if(detailBaiHat.LUOTNGHE > 50)
            {
                model.Hot = "Nổi bật";
            }
            if (string.IsNullOrEmpty(detailBaiHat.LYRIC))
            {
                model.Lyrics = "Bài nhạc hiện tại chưa có lời. Đang cập nhật...";
            }
            else
            {
                model.Lyrics = detailBaiHat.LYRIC;
            }
            var album = db.ALBUMs.Where(x => x.MA_AB == detailBaiHat.MA_AB).FirstOrDefault();
            if(album != null)
            {
                model.TenAlbum = album.TEN_AB;
                model.AnhAlbum = album.ANH_AB;
            }
            var casiDetail = db.CASIs.Where(x => x.MA_CS == detailBaiHat.MA_CS).FirstOrDefault();
            if(casiDetail != null)
            {
                model.TenCS = casiDetail.TEN_CS;
            }
            var theLoai = db.THELOAIs.Where(x => x.MA_TL == detailBaiHat.MA_TL).FirstOrDefault();
            if(theLoai != null)
            {
                model.TenTL = theLoai.TEN_TL;
            }
            model.LINK = link;
            model.TEN_BH = baihat;
            model.MA_CS = casi;
            model.LUOTNGHE = luotnghe;
            model.MA_AB = detailBaiHat.MA_AB;
            model.LUOTLIKE = detailBaiHat.LUOTLIKE;
            model.MA_BH = mabh;
            return View(model);
        }
        public ActionResult AlbumNhac(int Id)
        {
            var album = new ALBUM();
            var model = new AlbumDetail();
            var baihat = (from b in db.BAIHATs
                          join c in db.CASIs on b.MA_CS equals c.MA_CS
                          where b.MA_BH == Id
                          orderby b.LUOTLIKE
                          descending
                          select new BaiHatMapping
                          {
                              BaiHat = b,
                              Ten_Cs = c.TEN_CS,
                          }
                      ).ToList();
            model.ListBaiHat = baihat;
            album = db.ALBUMs.Find(Id);
            if(album != null && album.MA_AB > 0)
            {
                model.Album = album;
                album.LUOTNGHE = album.LUOTNGHE + 1;
                db.Entry(album).State = EntityState.Modified;
                db.SaveChanges();
            }
            else
            {
                return HttpNotFound();
            }
            return View(model);
        }
        public ActionResult AmNhac()
        {
            var amNhac = new AmNhac();
            amNhac.ListBaiHat = (from b in db.BAIHATs
                          join c in db.CASIs on b.MA_CS equals c.MA_CS
                          orderby b.TEN_BH ascending select new BaiHatMapping
                          {
                              BaiHat = b,
                              Ten_Cs = c.TEN_CS,
                          }).ToList();
            amNhac.ListAlbum = (from a in db.ALBUMs
                         join c in db.CASIs on a.MA_CS equals c.MA_CS
                         orderby a.TEN_AB ascending select new AlbumMapping
                         {
                            Album = a,
                            Ten_Cs = c.TEN_CS,
                         }).ToList();
            amNhac.ListCasi = (from c in db.CASIs orderby c.TEN_CS ascending select c).ToList();

            return View(amNhac);
        }
        public ActionResult Casi(int Id)
        {
            var model = new CasiModel();
            var casi = db.CASIs.Where(x => x.MA_CS == Id).FirstOrDefault();
            if(casi == null)
            {
                return HttpNotFound();
            }
            string tenQG = string.Empty;
            string anh_cs = casi.ANH_CS;
            string ten_cs = casi.TEN_CS;
            int maqg = (int)casi.QUOCGIA;
            string tt_cs = casi.THONGTIN_CS;
            var quocgia = db.QUOCGIAs.Where(x => x.MA_QG == casi.QUOCGIA).FirstOrDefault();
            if(quocgia != null)
            {
                tenQG = quocgia.TEN_QG;
            }
            if (string.IsNullOrEmpty(tt_cs))
            {
                tenQG = "Chưa có thông tin về ca sĩ này";
            }
            var lstAlbum = (from a in db.ALBUMs
                            join c in db.CASIs on a.MA_CS equals c.MA_CS
                            where a.MA_CS == Id
                            orderby a.TEN_AB ascending
                            select new AlbumMapping
                            {
                                Album = a,
                                Ten_Cs = c.TEN_CS,
                            }).ToList();
            var lstBaiHat = (from b in db.BAIHATs
                             join c in db.CASIs on b.MA_CS equals c.MA_CS
                             where b.MA_CS == Id
                             orderby b.TEN_BH ascending
                             select new BaiHatMapping
                             {
                                 BaiHat = b,
                                 Ten_Cs = c.TEN_CS,
                             }).ToList();
            model.Anh_CS = anh_cs;
            model.Ten_CS = ten_cs;
            model.Ten_QG = tenQG;
            model.TieuSu = tt_cs;
            model.ListBaiHat = lstBaiHat;
            model.ListAlbum = lstAlbum;
            return View(model);
        }
        public ActionResult Timkiem(FormCollection fc)
        {
            string search = fc["keyword"];
            string kq = "";
            if (search != null || search != "")
            {
                var sql1 = (from ab in db.ALBUMs where ab.TEN_AB.ToUpper().Contains(search.ToUpper()) orderby ab.TEN_AB descending select ab).ToList();
                var sql2 = (from bh in db.BAIHATs where bh.TEN_BH.ToUpper().Contains(search.ToUpper()) orderby bh.TEN_BH descending select bh).ToList();
                var sql3 = (from cs in db.CASIs where cs.TEN_CS.ToUpper().Contains(search.ToUpper()) orderby cs.TEN_CS descending select cs).ToList();
                if (sql1.Count != 0 && sql2.Count == 0 && sql3.Count == 0)
                {
                    kq += "<div class=\"box-kqtk\">";
                    kq += "<fieldset>";
                    kq += "<legend><span class=\"glyphicon glyphicon-expand\"></span> <a>Album</a> <span class=\"glyphicon glyphicon-chevron-right\"></span> Có " + sql1.Count + " album được tìm thấy</legend>";
                    for (int j = 0; j < sql1.Count; j++)
                    {
                        int masocasi = (int)sql1[j].MA_CS;
                        var tencasi = (from c in db.CASIs where c.MA_CS == masocasi select c).ToList();
                        string singer = tencasi[0].TEN_CS;
                        kq += "<div class=\"item-noibat\">";
                        kq += "<div class=\"item-noibat-imgs\">";
                        kq += "<a href=\"/Nhac/AlbumNhac/" + sql1[j].MA_AB + "\"><img src=\"" + sql1[j].ANH_AB + "\" alt=\"cakhucnoibat\" /></a>";
                        kq += "</div>";
                        kq += "<p><a href=\"/Nhac/AlbumNhac/" + sql1[j].MA_AB + "\" id=\"tenplaylist\">" + sql1[j].TEN_AB + "</a></p>";
                        kq += "<p><a href=\"/Nhac/Casi/" + masocasi + "\" id=\"tenuser\">" + singer + "</a></p>";
                        kq += "</div>";
                    }
                    kq += "</fieldset>";
                    kq += "</div>";
                }
                else if (sql1.Count == 0 && sql2.Count != 0 && sql3.Count == 0)
                {
                    double tongluotnghe = 0;
                    kq += "<div class=\"box-kqtk\">";
                    kq += "<fieldset>";
                    kq += "<legend><span class=\"glyphicon glyphicon-music\"></span> <a>Bài hát</a> <span class=\"glyphicon glyphicon-chevron-right\"></span> Có " + sql2.Count + " bài hát được tìm thấy</legend>";
                    kq += "<table class=\"baihatcs\">";
                    for (int i = 0; i < sql2.Count; i++)
                    {
                        var macs = sql2[i].MA_CS;
                        var csbh = (from c in db.CASIs where c.MA_CS == macs select c).ToList();
                        string tencasi = csbh[0].TEN_CS;
                        kq += "<tr>";
                        kq += "<td>";
                        kq += "<a href=\"/Nhac/Nghenhac/" + sql2[i].MA_BH + "\" class=\"tenbh\" >" + sql2[i].TEN_BH + "</a><span> - </span>";
                        kq += "<a href=\"/Nhac/Casi/" + macs + "\" class=\"tencs\">" + tencasi + "</a>";
                        kq += "</td>";
                        kq += "<td>";
                        kq += "<span class=\"glyphicon glyphicon-headphones\"></span> " + sql2[i].LUOTNGHE + "";
                        kq += "</td>";
                        kq += "</tr>";
                        tongluotnghe += (int)sql2[i].LUOTNGHE;
                    }
                    kq += "<tr>Tổng lượt nghe: " + tongluotnghe + "</tr>";
                    kq += "</table></fieldset>";
                    kq += "</div>";
                }
                else if (sql1.Count == 0 && sql2.Count == 0 && sql3.Count != 0)
                {
                    kq += "<div class=\"box-kqtk\">";
                    kq += "<fieldset>";
                    kq += "<legend><span class=\"glyphicon glyphicon-star-empty\"></span> <a>Ca sĩ</a> <span class=\"glyphicon glyphicon-chevron-right\"></span> Có " + sql3.Count + " ca sĩ được tìm thấy</legend>";
                    for (int k = 0; k < sql3.Count; k++)
                    {
                        kq += "<div class=\"item-noibat\">";
                        kq += "<div class=\"item-noibat-imgs\">";
                        kq += "<a href=\"/Nhac/Casi/" + sql3[k].MA_CS + "\"><img src=\"" + sql3[k].ANH_CS + "\" alt=\"cakhucnoibat\" /></a>";
                        kq += "</div>";
                        kq += "<p><a href=\"/Nhac/Casi/" + sql3[k].MA_CS + "\" id=\"tenplaylist\">" + sql3[k].TEN_CS + "</a></p>";
                        kq += "</div>";
                    }
                    kq += "</fieldset>";
                    kq += "</div>";
                }
                else if (sql1.Count != 0 && sql2.Count != 0 && sql3.Count == 0)
                {
                    kq += "<div class=\"box-kqtk\">";
                    kq += "<fieldset>";
                    kq += "<legend><span class=\"glyphicon glyphicon-expand\"></span> <a>Album</a> <span class=\"glyphicon glyphicon-chevron-right\"></span> Có " + sql1.Count + " album được tìm thấy</legend>";
                    for (int j = 0; j < sql1.Count; j++)
                    {
                        int masocasi = (int)sql1[j].MA_CS;
                        var tencasi = (from c in db.CASIs where c.MA_CS == masocasi select c).ToList();
                        string singer = tencasi[0].TEN_CS;
                        kq += "<div class=\"item-noibat\">";
                        kq += "<div class=\"item-noibat-imgs\">";
                        kq += "<a href=\"/Nhac/AlbumNhac/" + sql1[j].MA_AB + "\"><img src=\"" + sql1[j].ANH_AB + "\" alt=\"cakhucnoibat\" /></a>";
                        kq += "</div>";
                        kq += "<p><a href=\"/Nhac/AlbumNhac/" + sql1[j].MA_AB + "\" id=\"tenplaylist\">" + sql1[j].TEN_AB + "</a></p>";
                        kq += "<p><a href=\"/Nhac/Casi/" + masocasi + "\" id=\"tenuser\">" + singer + "</a></p>";
                        kq += "</div>";
                    }
                    kq += "</fieldset>";
                    kq += "</div>";
                    kq += "<div class=\"box-kqtk\">";
                    kq += "<fieldset>";
                    kq += "<legend><span class=\"glyphicon glyphicon-music\"></span> <a>Bài hát</a> <span class=\"glyphicon glyphicon-chevron-right\"></span> Có " + sql2.Count + " bài hát được tìm thấy</legend>";
                    kq += "<table class=\"baihatcs\">";
                    double tongluotnghe = 0;
                    for (int i = 0; i < sql2.Count; i++)
                    {
                        int macs = (int)sql2[i].MA_CS;
                        var csbh = (from c in db.CASIs where c.MA_CS == macs select c).ToList();
                        string tencasi = csbh[0].TEN_CS;
                        kq += "<tr>";
                        kq += "<td>";
                        kq += "<a href=\"/Nhac/Nghenhac/" + sql2[i].MA_BH + "\" class=\"tenbh\" >" + sql2[i].TEN_BH + "</a><span> - </span>";
                        kq += "<a href=\"/Nhac/Casi/" + macs + "\" class=\"tencs\">" + tencasi + "</a>";
                        kq += "</td>";
                        kq += "<td>";
                        kq += "<span class=\"glyphicon glyphicon-headphones\"></span> " + sql2[i].LUOTNGHE + "";
                        kq += "</td>";
                        kq += "</tr>";
                        tongluotnghe += (int)sql2[i].LUOTNGHE;
                    }
                    kq += "<tr>Tổng lượt nghe: " + tongluotnghe + "</tr>";
                    kq += "</table></fieldset>";
                    kq += "</div>";
                }
                else if (sql1.Count == 0 && sql2.Count != 0 && sql3.Count != 0)
                {
                    kq += "<div class=\"box-kqtk\">";
                    kq += "<fieldset>";
                    kq += "<legend><span class=\"glyphicon glyphicon-music\"></span> <a>Bài hát</a> <span class=\"glyphicon glyphicon-chevron-right\"></span> Có " + sql2.Count + " bài hát được tìm thấy</legend>";
                    kq += "<table class=\"baihatcs\">";
                    double tongluotnghe = 0;
                    for (int i = 0; i < sql2.Count; i++)
                    {
                        int macs = (int)sql2[i].MA_CS;
                        var csbh = (from c in db.CASIs where c.MA_CS == macs select c).ToList();
                        string tencasi = csbh[0].TEN_CS;
                        kq += "<tr>";
                        kq += "<td>";
                        kq += "<a href=\"/Nhac/Nghenhac/" + sql2[i].MA_BH + "\" class=\"tenbh\" >" + sql2[i].TEN_BH + "</a><span> - </span>";
                        kq += "<a href=\"/Nhac/Casi/" + macs + "\" class=\"tencs\">" + tencasi + "</a>";
                        kq += "</td>";
                        kq += "<td>";
                        kq += "<span class=\"glyphicon glyphicon-headphones\"></span> " + sql2[i].LUOTNGHE + "";
                        kq += "</td>";
                        kq += "</tr>";
                        tongluotnghe += (int)sql2[i].LUOTNGHE;
                    }
                    kq += "<tr>Tổng lượt nghe: " + tongluotnghe + "</tr>";
                    kq += "</table></fieldset>";
                    kq += "</div>";
                    kq += "<div class=\"box-kqtk\">";
                    kq += "<fieldset>";
                    kq += "<legend><span class=\"glyphicon glyphicon-star-empty\"></span> <a>Ca sĩ</a> <span class=\"glyphicon glyphicon-chevron-right\"></span> Có " + sql3.Count + " ca sĩ được tìm thấy</legend>";
                    for (int k = 0; k < sql3.Count; k++)
                    {
                        kq += "<div class=\"item-noibat\">";
                        kq += "<div class=\"item-noibat-imgs\">";
                        kq += "<a href=\"/Nhac/Casi/" + sql3[k].MA_CS + "\"><img src=\"" + sql3[k].ANH_CS + "\" alt=\"cakhucnoibat\" /></a>";
                        kq += "</div>";
                        kq += "<p><a href=\"/Nhac/Casi/" + sql3[k].MA_CS + "\" id=\"tenplaylist\">" + sql3[k].TEN_CS + "</a></p>";
                        kq += "</div>";
                    }
                    kq += "</fieldset>";
                    kq += "</div>";
                }
                else if (sql1.Count != 0 && sql2.Count == 0 && sql3.Count != 0)
                {
                    kq += "<div class=\"box-kqtk\">";
                    kq += "<fieldset>";
                    kq += "<legend><span class=\"glyphicon glyphicon-expand\"></span> <a>Album</a> <span class=\"glyphicon glyphicon-chevron-right\"></span> Có " + sql1.Count + " album được tìm thấy</legend>";
                    for (int j = 0; j < sql1.Count; j++)
                    {
                        int masocasi = (int)sql1[j].MA_CS;
                        var tencasi = (from c in db.CASIs where c.MA_CS == masocasi select c).ToList();
                        string singer = tencasi[0].TEN_CS;
                        kq += "<div class=\"item-noibat\">";
                        kq += "<div class=\"item-noibat-imgs\">";
                        kq += "<a href=\"/Nhac/AlbumNhac/" + sql1[j].MA_AB + "\"><img src=\"" + sql1[j].ANH_AB + "\" alt=\"cakhucnoibat\" /></a>";
                        kq += "</div>";
                        kq += "<p><a href=\"/Nhac/AlbumNhac/" + sql1[j].MA_AB + "\" id=\"tenplaylist\">" + sql1[j].TEN_AB + "</a></p>";
                        kq += "<p><a href=\"/Nhac/Casi/" + masocasi + "\" id=\"tenuser\">" + singer + "</a></p>";
                        kq += "</div>";
                    }
                    kq += "</fieldset>";
                    kq += "</div>";
                    kq += "<div class=\"box-kqtk\">";
                    kq += "<fieldset>";
                    kq += "<legend><span class=\"glyphicon glyphicon-star-empty\"></span> <a>Ca sĩ</a> <span class=\"glyphicon glyphicon-chevron-right\"></span> Có " + sql3.Count + " ca sĩ được tìm thấy</legend>";
                    for (int k = 0; k < sql3.Count; k++)
                    {
                        kq += "<div class=\"item-noibat\">";
                        kq += "<div class=\"item-noibat-imgs\">";
                        kq += "<a href=\"/Nhac/Casi/" + sql3[k].MA_CS + "\"><img src=\"" + sql3[k].ANH_CS + "\" alt=\"cakhucnoibat\" /></a>";
                        kq += "</div>";
                        kq += "<p><a href=\"/Nhac/Casi/" + sql3[k].MA_CS + "\" id=\"tenplaylist\">" + sql3[k].TEN_CS + "</a></p>";
                        kq += "</div>";
                    }
                    kq += "</fieldset>";
                    kq += "</div>";
                }
                else if (sql1.Count != 0 && sql2.Count != 0 && sql3.Count != 0)
                {
                    kq += "<div class=\"box-kqtk\">";
                    kq += "<fieldset>";
                    kq += "<legend><span class=\"glyphicon glyphicon-expand\"></span> <a>Album</a> <span class=\"glyphicon glyphicon-chevron-right\"></span> Có " + sql1.Count + " album được tìm thấy</legend>";
                    for (int j = 0; j < sql1.Count; j++)
                    {
                        int masocasi = (int)sql1[j].MA_CS;
                        var tencasi = (from c in db.CASIs where c.MA_CS == masocasi select c).ToList();
                        string singer = tencasi[0].TEN_CS;
                        kq += "<div class=\"item-noibat\">";
                        kq += "<div class=\"item-noibat-imgs\">";
                        kq += "<a href=\"/Nhac/AlbumNhac/" + sql1[j].MA_AB + "\"><img src=\"" + sql1[j].ANH_AB + "\" alt=\"cakhucnoibat\" /></a>";
                        kq += "</div>";
                        kq += "<p><a href=\"/Nhac/AlbumNhac/" + sql1[j].MA_AB + "\" id=\"tenplaylist\">" + sql1[j].TEN_AB + "</a></p>";
                        kq += "<p><a href=\"/Nhac/Casi/" + masocasi + "\" id=\"tenuser\">" + singer + "</a></p>";
                        kq += "</div>";
                    }
                    kq += "</fieldset>";
                    kq += "</div>";
                    kq += "<div class=\"box-kqtk\">";
                    kq += "<fieldset>";
                    kq += "<legend><span class=\"glyphicon glyphicon-music\"></span> <a>Bài hát</a> <span class=\"glyphicon glyphicon-chevron-right\"></span> Có " + sql2.Count + " bài hát được tìm thấy</legend>";
                    kq += "<table class=\"baihatcs\">";
                    double tongluotnghe = 0;
                    for (int i = 0; i < sql2.Count; i++)
                    {
                        int macs = (int)sql2[i].MA_CS;
                        var csbh = (from c in db.CASIs where c.MA_CS == macs select c).ToList();
                        string tencasi = csbh[0].TEN_CS;
                        kq += "<tr>";
                        kq += "<td>";
                        kq += "<a href=\"/Nhac/Nghenhac/" + sql2[i].MA_BH + "\" class=\"tenbh\" >" + sql2[i].TEN_BH + "</a><span> - </span>";
                        kq += "<a href=\"/Nhac/Casi/" + macs + "\" class=\"tencs\">" + tencasi + "</a>";
                        kq += "</td>";
                        kq += "<td>";
                        kq += "<span class=\"glyphicon glyphicon-headphones\"></span> " + sql2[i].LUOTNGHE + "";
                        kq += "</td>";
                        kq += "</tr>";
                        tongluotnghe += (int)sql2[i].LUOTNGHE;
                    }
                    kq += "<tr><td>Tổng lượt nghe: </td><td><span class=\"glyphicon glyphicon-headphones\"></span> " + tongluotnghe + "</td></tr>";
                    kq += "</table></fieldset>";
                    kq += "</div>";
                    kq += "<div class=\"box-kqtk\">";
                    kq += "<fieldset>";
                    kq += "<legend><span class=\"glyphicon glyphicon-star-empty\"></span> <a>Ca sĩ</a> <span class=\"glyphicon glyphicon-chevron-right\"></span> Có " + sql3.Count + " ca sĩ được tìm thấy</legend>";
                    for (int k = 0; k < sql3.Count; k++)
                    {
                        kq += "<div class=\"item-noibat\">";
                        kq += "<div class=\"item-noibat-imgs\">";
                        kq += "<a href=\"/Nhac/Casi/" + sql3[k].MA_CS + "\"><img src=\"" + sql3[k].ANH_CS + "\" alt=\"cakhucnoibat\" /></a>";
                        kq += "</div>";
                        kq += "<p><a href=\"/Nhac/Casi/" + sql3[k].MA_CS + "\" id=\"tenplaylist\">" + sql3[k].TEN_CS + "</a></p>";
                        kq += "</div>";
                    }
                    kq += "</fieldset>";
                    kq += "</div>";
                }
                else kq = "<h4>Không tìm thấy kết quả cho từ khóa '" + search + "'</h4>";
            }
            ViewBag.keyword = search;
            ViewBag.result = kq;
            return View();
        }
    }
}