// JavaScript Document
 var nrImg = 6; //số lượng ảnh muốn đưa vào slide
        var IntSeconds = 4;    

        function Load()
        {
            nrShown = 0;
            Vect = new Array(nrImg + 10);
            Vect[0] = document.getElementById("Img1");
            Vect[0].style.visibility = "visible";


            for (var i = 1; i < nrImg; i++)
            {
                Vect[i] = document.getElementById("Img" + (i + 1));

            }

            mytime = setInterval(Timer, IntSeconds * 1000);
        }
        function Timer()
        {
            nrShown++;
            if (nrShown == nrImg)
                nrShown = 0;
            Effect();
        }
     
        function next()
        {
            nrShown++;
            if (nrShown == nrImg)
                nrShown = 0;
            Effect();

            clearInterval(mytime);
            mytime = setInterval(Timer, IntSeconds * 1000);
        }
        function prev()
        {
            nrShown--;
            if (nrShown == -1)
                nrShown = nrImg -1;
            Effect();

            clearInterval(mytime);
            mytime = setInterval(Timer, IntSeconds * 1000);
        }
        function Effect()
        {
            for (var i = 0; i < nrImg; i++)
            {
                Vect[i].style.opacity = "0";  
                Vect[i].style.visibility = "hidden";

              
            }
            Vect[nrShown].style.opacity = "1";
            Vect[nrShown].style.visibility = "visible";
        }
//Modal đăng nhập - đăng ký
        $(document).ready(function () {
            $("#dangnhap").click(function () {
                $("#modaldangnhap").modal();
            });
        });
        $(document).ready(function () {
            $("#dangky").click(function () {
                $("#modaldangky").modal();
            });
        });
//Kiểm tra đăng nhập
        function kiemtralogin() {
            var x = document.forms["formdangnhap"]["username"].value;
            var y = document.forms["formdangnhap"]["pass"].value;
            if (x == null || x == "") {
                alert("Vui lòng nhập tên đăng nhập");
                document.forms["formdangnhap"]["username"].focus();
                return false;
            }
            if (y == null || y == "") {
                alert("Vui lòng nhập mật khẩu");
                document.forms["formdangnhap"]["pass"].focus();
                return false;
            }
            else alert("Đăng nhập thành công");
            return true;
        }
//Kiểm tra đăng ký
        function kiemtrajoin() {
            var a = document.forms["formdangky"]["username"].value;
            var b = document.forms["formdangky"]["pass"].value;
            var c = document.forms["formdangky"]["re-pass"].value;
            var d = document.forms["formdangky"]["hoten"].value;
            if (a == null || a == "") {
                alert("Tên đăng nhập không được bỏ trống !");
                document.forms["formdangky"]["username"].focus();
                return false;
            }
            if (a.length <= 5) {
                alert("Tên đăng nhập phải dài hơn 5 ký tự !");
                document.forms["formdangky"]["username"].focus();
                return false;
            }
            if (a.length >= 19) {
                alert("Tên đăng nhập không quá 18 ký tự !");
                document.forms["formdangky"]["username"].focus();
                return false;
            }
            if (b == null || b == "") {
                alert("Mật khẩu không được bỏ trống !");
                document.forms["formdangky"]["pass"].focus();
                return false;
            }
            if (b.length <= 5) {
                alert("Mật khẩu phải dài hơn 5 ký tự !");
                document.forms["formdangky"]["pass"].focus();
                return false;
            }
            if (b.length >= 13) {
                alert("Mật khẩu không quá 12 ký tự !");
                document.forms["formdangky"]["pass"].focus();
                return false;
            }
            if (c != b) {
                alert("Nhập lại mật khẩu không chính xác !");
                document.forms["formdangky"]["re-pass"].focus();
                return false;
            }
            if (d == null || d == "") {
                alert("Họ Tên không được bỏ trống");
                document.forms["formdangky"]["hoten"].focus();
                return false;
            }
            if (d.length <= 2) {
                alert("Họ tên phải dài hơn 2 ký tự !");
                document.forms["formdangky"]["hoten"].focus();
                return false;
            }
            if (d.length >= 51) {
                alert("Họ tên không quá 50 ký tự !");
                document.forms["formdangky"]["hoten"].focus();
                return false;
            }
            else alert("Chúc mừng bạn đã đăng ký tài khoản thành công");
            return true;
        }
//popover lượt thích
        $(document).ready(function () {
            $('[data-toggle="popover"]').popover();
        });
//Xem lời bài hát
        $(document).ready(function () {
            $("#xemlyric").click(function () {
                $("#lyric").animate({
                    height: 'toggle'
                });
            });
        });
//Thử
        $(document).ready(function () {
            $('#rutgon').click(function () {
                $('#khuctren').removeClass("chieucao");
                $('#rutgon').addClass("hidden");
            });
            $('#xemthem').click(function () {
                $('#khuctren').addClass("chieucao");
                $('#rutgon').removeClass("hidden");
            });
        });
//Điều khiển nghe album
        jQuery(document).ready(function () {

            // inner variables
            var song;
            
            function initAudio(elem) {
                var url = elem.attr('audiourl');
                var title = elem.attr('title');
                var lyric = elem.attr('lyric');
                $('.trangalbum .lyric .title').text(title);
                $('.trangalbum .lyric .ndlr').text(lyric);
                song = new Audio(url);
                $('.playlist li').removeClass('active');
                elem.addClass('active');
            }
            function playAudio() {
                song.play();
                $('.play').addClass('hidden');
                $('.pause').addClass('visible');
            }
            function stopAudio() {
                song.pause();
                $('.play').removeClass('hidden');
                $('.pause').removeClass('visible');
            }

            // sự kiện click nút play
            $('.play').click(function (e) {
                e.preventDefault();
                playAudio();
            });

            // sự kiện click nút pause
            $('.pause').click(function (e) {
                e.preventDefault();
                stopAudio();
            });

            // sự kiện click nút next
            $('.next').click(function (e) {
                e.preventDefault();
                stopAudio();
                var next = $('.playlist li.active').next();
                if (next.length == 0) {
                    next = $('.playlist li:first-child');
                }
                initAudio(next);
                playAudio();
            });

            // sự kiện click nút previous
            $('.prev').click(function (e) {
                e.preventDefault();
                stopAudio();
                var prev = $('.playlist li.active').prev();
                if (prev.length == 0) {
                    prev = $('.playlist li:last-child');
                }
                initAudio(prev);
                playAudio();
            });

            // sự kiện khi chọn bài hát trong playlist
            $('.playlist li').click(function () {
                stopAudio();
                initAudio($(this));
                playAudio();
            });

            // phát bài đầu tiên
            initAudio($('.playlist li:first-child'));
            $('.play').addClass('hidden');
            $('.pause').addClass('visible');
            song.play($('.playlist li:first-child'));
        });
