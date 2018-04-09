<%-- 
    Document   : adminhome
    Created on : 9 Apr, 2018, 6:32:59 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--><html><!--<![endif]-->
<head>
<title>Admin home</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/foundation.min.css">
<link rel="stylesheet" href="css/superfish.css">
<link rel="stylesheet" href="css/stylesheet.css">
<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
<!--[if lt IE 9]>
<link rel="stylesheet" href="css/ie-fixes.css">
<![endif]-->
<script src="js/custom.modernizr.js"></script>
<script>
Modernizr.load({
    // test if browser understands media queries
    test: Modernizr.mq('only all'),
    // if not load ie8-grid
    nope: 'css/ie8-grid-foundation-4.css'
});
</script>
</head>
<body>
<div class="header-outter">
  <div class="row header">
    <div class="columns large-12">
      <div class="row header-inner">
        <div class="columns large-3"> 
          <div><section> <h1></h1></section> </div>
        </div>
        <div class="columns top-menu large-9 top-nav plr0">
          <nav>
            <section>
              <ul class="sf-menu large-12">
                <li class="active"><a href="adminhome.jsp">Home</a>
                </li>
                
                
            <li class="has-dropdown"><a href="">Approvals</a>
                  <ul class="dropdown">
                    
                    <li><a href="../Admin/ApprovePetitioner.jsp">petitioners</a></li>
                    <li><a href="../Admin/ApproveAdvocate.jsp">Advocates</a></li>
                    <li><a href="../Admin/ApproveWitness.jsp">witness</a></li>
               <li><a href="../Admin/ApproveConsultationMatters.jsp">consultation matters</a></li>
                    <li><a href="../Admin/ApproveCounsellingMatters.jsp">counseling matters</a></li>
                    <li><a href="../Admin/ApproveCaseSittingMatters.jsp">case sitting matters</a></li>
               
                  </ul>
                </li>
               
             <li class="has-dropdown"><a href="">views</a>
                  <ul class="dropdown">
                    
                    <li><a href="../Admin/ViewPetitioners.jsp">petitioners</a></li>
                    <li><a href="../Admin/ViewRegisteredAdvocate.jsp">advocates</a></li>
                    <li><a href="../Admin/ViewFeedBack.jsp">feedbacks</a></li>
               
                  </ul>
                </li>
               
            
                <li class="has-dropdown"><a href="">Activities</a>
                  <ul class="dropdown">
                    
                    <li><a href="../Admin/AddAdvocate.jsp">Add Advocates</a></li>
                    <li><a href="../Admin/AddCouncillor.jsp">Add Councillors</a></li>
                    <li><a href="../Admin/AddJudge.jsp">Add Judges</a></li>
                    <li><a href="../Admin/court.jsp">add family courts</a></li>
                    <li><a href="../Admin/casecategory.jsp">Add case categories</a></li>
                    <li><a href="../Admin/DistrictDetails.jsp">Add districts</a></li>
              
               
                  </ul>
                </li>
                
                <li><a href="../Guest/login.jsp">sign out</a></li>
              </ul>
            </section>
          </nav>
        </div>
      </div>
    </div>
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
</div>
<div class="row content-wrapper call-to-action">
  <div class="columns large-12">
    <div class="row content-wrapper-inner">
      <div class="columns large-7"> </div>
      <div class="columns large-5 action-box">
        <div class="action-box-inner">
          <h1>Welcome to <br>E-FamilyCourt <br>The Family Site</h1>
          <p>Nunc placerat, purus mid tincidunt dictumst, duis ultrices porttitor porttitor scelerisque, dapibus, tristique! Et hac eu est? Integer ac rhoncus placerat ut augue placerat sed cum</p>
          <p><a class="button black">check details</a><a class="button orange">shop now</a> </p>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row content-wrapper">
  <div class="columns large-12 plr0">
    <div class="row content-wrapper-inner front-service-boxes">
      <div class="columns content large-4 front-service-box"> <img src="images/homeimg1.jpg" alt="">
        <div class="center">
          <h4>lorem ipsum sit dolor </h4>
          <p>dapibus dignissim dictumst parturient</p>
        </div>
        <hr>
      </div>
      <div class="columns content large-4 front-service-box"> <img src="images/homeimg2.jpg" alt="">
        <div class="center">
          <h4>lorem ipsum sit dolor </h4>
          <p>dapibus dignissim dictumst parturient</p>
        </div>
        <hr>
      </div>
      <div class="columns content large-4 front-service-box"> <img src="images/homeimg3.jpg" alt="">
        <div class="center">
          <h4>lorem ipsum sit dolor </h4>
          <p>dapibus dignissim dictumst parturient</p>
        </div>
        <hr>
      </div>
    </div>
  </div>
</div>
<div class="row content-wrapper welcome-service-row plr0">
  <div class="columns large-12 plr0">
    <div class="row content-wrapper-inner">
      <div class="columns content service-box large-4">
        <h2>Our Services</h2>
        <ul class="bullet">
          <li><a>placerat eros lorem enim</a></li>
          <li><a>ridiculus elementum auctor ultricies</a></li>
          <li><a>placerat eros lorem enim</a></li>
          <li><a>ridiculus elementum auctor ultricies</a></li>
          <li><a>placerat eros lorem enim</a></li>
          <li><a>ridiculus elementum auctor ultricies</a></li>
          <li><a>placerat eros lorem enim</a></li>
          <li><a>ridiculus elementum auctor ultricies</a></li>
        </ul>
      </div>
      <div class="columns content welcome-box large-8">
        <h2>Welcome to our website</h2>
        <p class="subheader"> <b>Sociis tortor odio eu ridiculus dignissim et porttitor quis. Diam pulvinar porta ut, tortor! Est duis rhoncus dictums Dictumst, amet nunc. Lundium? Dictumst scelerisque arcu amet ut phasellus</b></p>
        <div class="row">
          <div class="columns large-6"> <img src="images/office.jpg" alt=""> </div>
          <div class="columns large-6"> Cum magna diam Duis ac, magna augue natoque odio nisi sedmag nascetur? Turpis, in et sed parturient velit, lacus Magnafacilisiset cursus montes Turpis magnis parturient turpis, magnaturpis habit, integer ultricies odio adipiscing eros nisi nuncaliquet Cum magna diam Duis ac, magna augue natoque odio nisi sed magna nascetur Turpis, in et sed parturient velit, lacusMagna facilisiset cursus montes Turpis magnis parturient turpismagna turpis habitasse, integer ultricies odio adipiscing eros nisi nunc aliquet urpis, in et sed parturient velit, lacus Magnafacilisiset cursus montes Turpis magnis parturient turpis, magnaturpis habitasse, integer ultricies odio adipiscing eros nisi nuncaliquet Cum magna diam Duis ac, magna augue natoque odio nisi sed magna nascetur? Turpis, in et sed </div>
        </div>
      </div>
    </div>
  </div>
</div>
<footer class="row footer">
  <div class="columns large-12">
    <div class="row content-wrapper-inner">
      <div class="columns large-8">
        <div class="row">
          <div class="columns large-12">
            <h3>testimonials</h3>
          </div>
        </div>
        <div class="row">
          <div class="columns large-3"><img src="images/test1.jpg" alt="" class="test-img"></div>
          <div class="columns content large-9 testimonials-text">Massa pulvinar magna integer aliquam? Urna ut! Lacus facilisis dolor arcu, lorem sitpellentesque duis eros odio vel! Augue natoque, nisi in magna turpis pid Nisi dolorvut tempor nec magnis Habitasse magna placerat Massa pulvinar magna integer alipellentesque duis eros odio vel! Augue natoque, nisi in magna turpis pid Nisi dolorvut tempor nec magnis Habitasse magna placerat
            <p><span class="credit"><span class="name">Robert Jones</span><span class="profession">Web Consultant, New York</span></span></p>
          </div>
        </div>
      </div>
      <div class="columns content large-4 whychooseus">
        <h3>why choose us</h3>
        <p>Turpis magnis parturient turpis, magna turpis habitasse, integer ultricies odio adipiscing eros nisi nunc aliquet Cum magna diam Duis ac, magna augue natoque odio nisi sed magna nascetur? Turpis sed parturient velit, </p>
        <a class="button grey">learn more</a> </div>
    </div>
  </div>
</footer>
<div class="footer-meta">
  <div class="row">
    <div class="columns large-4">
      <ul class="large-block-grid-4">
        <li><a class="media-wrapper" href="#"><img src="images/facebook1.png" alt=""></a></li>
        <li><a class="media-wrapper" href="#"><img src="images/twitter1.png" alt=""></a></li>
        <li><a class="media-wrapper" href="#"><img src="images/youtube1.png" alt=""></a></li>
      </ul>
    </div>
    <div class="columns content large-8">
      <p>&copy; Copyright. All rights reserved Banjaar. Design by: <a href="http://topwebsitetemplates.org">topwebsitetemplates.org</a></p>
    </div>
  </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/hoverIntent.js"></script>
<script src="js/superfish.js"></script>
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
});
</script>
</body>
</html>