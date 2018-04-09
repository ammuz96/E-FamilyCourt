<%-- 
    Document   : couhome
    Created on : 9 Apr, 2018, 5:38:55 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Councillor home</title>
<meta charset="utf-8">
<meta name = "format-detection" content = "telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/camera.css">
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.1.1.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/script.js"></script> 
<script src="js/superfish.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/tmStickUp.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/camera.js"></script>
<script src="js/owl.carousel.js"></script> 
<!--[if (gt IE 9)|!(IE)]><!-->
<script src="js/jquery.mobile.customized.min.js"></script>
<!--<![endif]-->
<script>
 $(window).load(function(){
  $().UItoTop({ easingType: 'easeOutQuart' });
  $('#stuck_container').tmStickUp({});  

  $('#camera_wrap').camera({
    loader: false,
    pagination: false ,
    minHeight: '400',
    thumbnails: false,
    height: '38.07291666666667%',
    caption: false,
    navigation: true,
    fx: 'mosaic'
  });

  $("#owl").owlCarousel({
    items : 3, //10 items above 1000px browser width
    itemsDesktop : [995,1], //5 items between 1000px and 901px
    itemsDesktopSmall : [767, 1], // betweem 900px and 601px
    itemsTablet: [700, 1], //2 items between 600 and 0
    itemsMobile : [479, 1], // itemsMobile disabled - inherit from itemsTablet option
    navigation : true,
    pagination :  false
  }); 
 }); 
</script>
<!--[if lt IE 8]>
 <div style=' clear: both; text-align:center; position: relative;'>
   <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
     <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
   </a>
</div>
<![endif]-->
<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<link rel="stylesheet" media="screen" href="css/ie.css">
<![endif]-->
</head>

<body class="page1" id="top">
<!--==============================
              header
=================================-->
<header>
  <div class="container_12">
    <div class="grid_12">
      <h1>
          <span>E-FamilyCourt</span>
        
      </h1>
    </div>
    <div class="clear"></div>
  </div>
  <section id="stuck_container">
  <!--==============================
              Stuck menu
  =================================-->
    <div class="container_12">
        <div class="grid_12">          
          <div class="navigation">
            <nav>
              <ul class="sf-menu">
               <li class="current"><a href="couhome.jsp">Home</a></li>
               <li><a href="../Councillor/CouncillorViewProfile.jsp">Profile</a></li>
               <li><a href="../Councillor/ViewPetition.jsp">Counseling Matters</a></li>
               <li><a href="../Councillor/View_Cou_Petitioners.jsp">Details</a></li>
               <li><a href="../Councillor/ViewCaseCategory.jsp">Case</a></li>
<li><a href="../Councillor/CouChangeUname.jsp">Edit</a></li>
            <li><a href="../Guest/login.jsp">Sign Out</a></li>
            
             </ul>
            </nav>
            <div class="clear"></div>
          </div>       
         <div class="clear"></div>  
     </div> 
     <div class="clear"></div>
    </div> 
  </section>
</header>
<section class="slider_wrapper">
  <div id="camera_wrap" class="">
    <div data-src="images/slide.jpg"></div>
    <div data-src="images/slide1.jpg"></div>
    <div data-src="images/slide2.jpg"></div>  
  </div>  
</section> 
<!--=====================
          Content
======================-->
<section id="content"><div class="ic">More Website Templates @ TemplateMonster.com - September22, 2014!</div>
  <div class="container_12">
    <div class="grid_4">
      <div class="banner">
        <a href="#" class="banner_title">Live<br>
Events</a>
        <div class="maxheight"><img src="images/icon1.png" alt=""></div>
      </div>
    </div>
    <div class="grid_4">
      <div class="banner">
        <a href="#" class="banner_title">Biblical <br>
Counseling</a>
        <div class="maxheight"><img src="images/icon2.png" alt=""></div>
      </div>
    </div>
    <div class="grid_4">
      <div class="banner">
        <a href="#" class="banner_title">Helping <br>
Children</a>
        <div class="maxheight"><img src="images/icon3.png" alt=""></div>
      </div>
    </div>
    <div class="clear"></div>
  </div>
  
  <div class="container_12">
    <div class="grid_6">
      <div class="block-2">
        <img src="images/b_icon1.png" alt="">
        <div class="text1"><a href="#">I’m New Here</a></div>
        Amus at magna non nunc tristique rhoncus. Aliquam nibh antegestas id dictum a, commodo luctus libero. Praesent faucibus malesuada faucibus. Donec laoreet metus id laoreeto 
      </div>
    </div>
    <div class="grid_6">
      <div class="block-2">
        <img src="images/b_icon2.png" alt="">
        <div class="text1"><a href="#">Care Ministries</a></div>
        Rmus at magna non nunc tristique rhoncus. Aliquam nibh antegestas id dictum a, commodo luctus libero. Praesent faucibus malesuada faucibus. Donec laoreet metus id laoreet 
      </div>
    </div>
    <div class="grid_6">
      <div class="block-2">
        <img src="images/b_icon3.png" alt="">
        <div class="text1"><a href="#">Prayer Request</a></div>
        Hemus at magna non nunc tristique rhoncus. Aliquam nibh antegestas id dictum a, commodo luctus libero. Praesent faucibus malesuada faucibus. Donec laoreet metus id laoreeti 
      </div>
    </div>
    <div class="grid_6">
      <div class="block-2">
        <img src="images/b_icon4.png" alt="">
        <div class="text1"><a href="#">Audio Podcasts</a></div>
        Emus at magna non nunc tristique rhoncus. Aliquam nibh antegestas id dictum a, commodo luctus libero. Praesent faucibus malesuada faucibus. Donec laoreet metus id laoree 
      </div>
    </div>
    <div class="clear"></div>
  </div>
  <div class="clear sep-1"></div>
</section>
<!--==============================
              footer
=================================-->
<footer id="footer">
  <div class="container_12">
    <div class="grid_12"> 
        <div class="sub-copy">&copy; <span id="copyright-year"></span>| <a href="#">Privacy Policy</a> <br> Website designed by <a href="http://www.templatemonster.com/" rel="nofollow">www.efamilycourt.com</a></div>
    </div>
    <div class="clear"></div>
  </div>  
</footer>

</body>
</html>

