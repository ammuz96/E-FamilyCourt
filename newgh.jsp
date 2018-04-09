<%-- 
    Document   : anjaly_header
    Created on : 5 Apr, 2018, 12:15:23 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guest Home</title>
  <link rel="stylesheet" href="css/foundation.min.css">
<link rel="stylesheet" href="css/superfish.css">
<link rel="stylesheet" href="css/stylesheet.css">
<link rel="stylesheet" href="js/slider/flexslider.css">
<link rel="stylesheet" href="js/slider/flexcar.css">
<link href='http://fonts.googleapis.com/css?family=Quando' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,300' rel='stylesheet' type='text/css'>
<script src="js/vendor/custom.modernizr.js"></script>
<script>
Modernizr.load({
    // test if browser understands media queries
    test: Modernizr.mq('only all'),
    // if not load ie8-grid
    nope: 'css/ie8-grid-foundation-4.css'
});
</script>
<!--[if lt IE 9]>
<link rel="stylesheet" href="css/ie-fixes.css">
<![endif]-->
</head>
<body>
<div class="header">
  <div class="row">
    <div class="columns large-12">
      <div class="row header-inner">
  
        <div class="columns large-8">
          <nav>
              <p>
                
                     <font face="Copperplate Gothic Bold" color="white" size="500"><b>E-FamilyCourt : The Family Site</b></font>
              </p>
            <section>
                   
              <ul class="sf-menu large-12">
                  
                <li class="active"><a href="newgh.jsp">home</a></li>
                <li><a href="../Guest/login.jsp">Sign In</a></li>
           
                <li class="has-dropdown"><a href="#">Sign Up</a>    
                         <ul class="dropdown" >
                             
                    <li><a href="../Guest/PetitionerRegistration.jsp">petitioner</a></li>
                    <li><a href="../Guest/AdvocateRegistration.jsp">Advocate</a></li>
                         </ul></li>
                           </section>
          </nav>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="columns large-12 small-top-menu">
      <div class="row">
        <div class="columns large-12 plr0 top-nav">
          <form name="dropdown" class="dropdown" action="#">
            <nav>
              <section>
                <select name="selected" id="target" accesskey="E" onChange="goToNewPage(document.dropdown.selected)">
                  <option value="index.html">home</option>
                  <option value="about.html">about us</option>
                  <option value="blog.html">blog</option>
                  <option value="gallery.html">gallery</option>
                  <option value="services.html">services</option>
                  <option value="contact.html">contact us</option>
                </select>
              </section>
            </nav>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="slider">
    <div class="row">
      <div class="columns large-12">
        <div class="row flexslider-row">
          <div class="columns large-12">
            <div class="flexslider">
              <ul class="slides">
                <li> <img src="images/uu.jpg" alt=""> </li>
                <li> <img src="images/ss.jpg" alt=""> </li>
                <li> <img src="images/k.jpg" alt=""> </li>
                <li> <img src="images/tt.jpg" alt=""> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="tagline">
  <div class="row">
    <div class="columns large-12">
      <div class="center">
        <h1>WELCOME TO OUR WEBSITE</h1>
        <p>E-FamilyCourt is a step towards using computer in a domain where their impeccable processing capabilities will be exploited. </p>
      </div>
    </div>
  </div>
</div>
<div class="service-box">
  <div class="row service">
    <div class="columns large-4">
      <h1 class="service-subtitle">Family Site</h1>
      <p><img src="images/images.jpg" alt="" class="threeUp"></p>
      <p>It handles all activities that are happening in a family court. Through this site a user can file a case through an advocate and clearly track the progress of case. Our site offers the facility for the users to access real time information about advocates. </p>
      <p> <a class="button custom">details</a> </p>
    </div>
    <div class="columns large-4">
      <h1 class="service-subtitle">Family Site</h1>
      <p><img src="images/images.jpg" alt="" class="threeUp"></p>
      <p> Development of E- FAMILY COURT is anticipated to bring benefits to a particular family court in managing their petitioner details, petitions and hearing updates as well as to reduce the redundant work carried out by the judge, court reporter and other members. </p>
      <p> <a class="button custom">details</a> </p>
    </div>
    <div class="columns large-4">
      <h1 class="service-subtitle">Family Site</h1>
      <p><img src="images/images.jpg" alt="" class="threeUp"></p>
      <p> This application generally signifies the importance of family court hearing management in its effectiveness and efficiency in better managing the data and information of petitioners and advocates. Reduce the redundant work carried out by the judge
 </p>
      <p> <a class="button custom">details</a> </p>
    </div>
  </div>
</div>
<div class="front-testimonial">
  <div class="row">
    <div class="columns large-12">
      <div class="flexcar">
        <ul class="slides">
          <li>
            <div class="row">
              <div class="columns large-3"> <img src="images/familyone.jpg" alt="" class="test-img"> </div>
              <div class="columns large-9">
                <h1>Welcome to the Family Site </h1>
                <p> This application generally signifies the importance of family court hearing management in its effectiveness and efficiency in better managing the data and information of petitioners and advocates. Reduce the redundant work carried out by the judge </p>
                <div class="row">
                  <div class="columns large-12">
                    <p class="test-credit"><span class="name">Family Courts</span><span class="profession"> Kerala State</span>, <span class="company">Kerala,India</span></p>
                  </div>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="row">
              <div class="columns large-3"> <img src="images/imageone.jpg" alt="" class="test-img"> </div>
              <div class="columns large-9">
                <h1>Our web site </h1>
                <p> This application generally signifies the importance of family court hearing management in its effectiveness and efficiency in better managing the data and information of petitioners and advocates. Reduce the redundant work carried out by the judge </p>
                <div class="row">
                  <div class="columns large-12">
                    <p class="test-credit"><span class="name">Advocates</span><span class="profession"> See Details</span>, <span class="company">Kerala</span></p>
                  </div>
                </div>
              </div>
            </div>
          </li>
          <li>
            <div class="row">
              <div class="columns large-3"> <img src="images/im.jpg" alt="" class="test-img"> </div>
              <div class="columns large-9">
                <h1>Family court-The family web site </h1>
                <p> This application generally signifies the importance of family court hearing management in its effectiveness and efficiency in better managing the data and information of petitioners and advocates. Reduce the redundant work carried out by the judge </p>
                <div class="row">
                  <div class="columns large-12">
                    <p class="test-credit"><span class="name">Petitioner</span><span class="profession">Enter details</span>, <span class="company">Kerala State</span></p>
                  </div>
                </div>
              </div>
            </div>
          </li>
        </ul>
        <div class="test-nav"> <span class="leftarrow"><img src="images/leftarrow.png" alt=""></span><span class="rightarrow"><img src="images/rightarrow.png" alt=""></span> </div>
      </div>
    </div>
  </div>
</div>
     <footer class="footer">
  <div class="row">
    <div class="columns large-12 footer-inner">
      <div class="row">
        <div class="columns large-4 useful-links">
          <div>
            <h2 class="footer-title">Quick links</h2>
            <ul class="footer-list">
              <li><a href="#">Home</a></li>
              <li><a href="#">About Us</a></li>
              <li><a href="#">Products</a></li>
              <li><a href="#">Gallery</a></li>
              <li><a href="#">Contact Us</a></li>
            </ul>
          </div>
        </div>
        <div class="columns large-4 contact">
          <div>
            <h2 class="footer-title">Contactus</h2>
            <ul class="footer-list">
              <li><span class="small-icon"><img src="images/address.png" alt=""></span>255, Willson Street,Caulfield, Melbourne</li>
              <li><span class="small-icon"><img src="images/phone.png" alt=""></span>Tel:(122)3456789, (121)3456079, (121)2341234</li>
              <li><span class="small-icon"><img src="images/fax.png" alt=""></span>(121)5647289, (122)34526589</li>
              <li><span class="small-icon"><img src="images/email.png" alt=""></span>email@domain.com</li>
              <li><span class="social-media"><a href="#">t</a></span><span class="social-media"><a href="#">f</a></span><span class="social-media"><a href="#">y</a></span><span class="social-media"><a href="#">g</a></span></li>
            </ul>
          </div>
        </div>
        <div class="columns large-4 about">
          <div>
            <h2 class="footer-title">Aboutus</h2>
            <p><img src="images/download.jpg" alt=""></p>
            <p>This application generally signifies the importance of family court hearing management in its effectiveness and efficiency in better managing the data and information of petitioners and advocates. Reduce the redundant work carried out by the judge</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</footer>
<div class="credit-row">
  <div class="row">
    <div class="columns large-11 credit"> &copy; 2018 All rights reserved by <a href="#">Calisto.</a> Design by: <a href="http://topwebsitetemplates.org">topwebsitetemplates.org</a></div>
    <div class="columns large-1"> <img src="images/toparrow.png" alt="" class="scrollToTop"> </div>
  </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/hoverIntent.js"></script>
<script src="js/superfish.js"></script>
<script src="js/slider/jquery.flexslider.js"></script>
<script>
Modernizr.load({
    test: Modernizr.placeholder,
    nope: 'js/placeholder.min.js'
});
function goToNewPage() {
    if (document.getElementById('target').value) {
        window.location.href = document.getElementById('target').value;
    }
}
</script>
<script>
$(document).ready(function () {
    $('ul.sf-menu').superfish({
        animation: {
            height: 'show'
        },
        delay: 400
    });
    $("img.scrollToTop").click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, "slow");
    });
    $('.flexslider').flexslider();
    $('.flexcar').flexslider();
});
</script>
</body>
</html>
