<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Eyesight Emporium</title>
<%@include file="head.jsp" %>
</head>
<body>
<%@include file="header.jsp" %>
<section class="banner_main">
         <div id="banner1" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#banner1" data-slide-to="0" class="active"></li>
               <li data-target="#banner1" data-slide-to="1"></li>
               <li data-target="#banner1" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container">
                     <div class="carousel-caption">
                        <div class="text-bg">
                           <h1> <span class="blu">Welcome <br></span>To Our Sunglasses</h1>
                           <figure><img src="images/LK-AIR-Banner.jpg" alt="#"/></figure>
                           <a class="read_more" href="welcome.jsp">Shop Now</a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <div class="carousel-caption">
                        <div class="text-bg">
                           <h1> <span class="blu">Welcome <br></span>To Our Sunglasses</h1>
                           <figure><img src="images/banner2.png" alt="#"/></figure>
                           <a class="read_more" href="welcome.jsp">Shop Now</a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <div class="carousel-caption">
                        <div class="text-bg">
                           <h1> <span class="blu">Welcome <br></span>To Our Sunglasses</h1>
                           <figure><img src="images/banner_img.png" alt="#"/></figure>
                           <a class="read_more" href="welcome.jsp">Shop Now</a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a class="carousel-control-prev" href="#banner1" role="button" data-slide="prev">
            <i class="fa fa-arrow-left" aria-hidden="true"></i>
            </a>
            <a class="carousel-control-next" href="#banner1" role="button" data-slide="next">
            <i class="fa fa-arrow-right" aria-hidden="true"></i>
            </a>
         </div>
      </section>
      <section class="banner_main">
         <div id="banner2" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#banner2" data-slide-to="0" class="active"></li>
               <li data-target="#banner2" data-slide-to="1"></li>
               <li data-target="#banner2" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container">
                     <div class="carousel-caption">
                        <div class="text-bg">
                           <h1> <span class="blu">Monthly <br></span>Trending deals</h1>
                           <figure><img src="images/VC-Banner.jpg" alt="#"/></figure>
                           <a class="read_more" href="welcome.jsp">Shop Now</a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <div class="carousel-caption">
                        <div class="text-bg">
                           <h1> <span class="blu">Monthly <br></span>Trending deals</h1>
                           <figure><img src="images/web banner.jpg" alt="#"/></figure>
                           <a class="read_more" href="welcome.jsp">Shop Now</a>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <div class="carousel-caption">
                        <div class="text-bg">
                           <h1> <span class="blu">Monthly <br></span>Trending deals</h1>
                           <figure><img src="images/banner_img.png" alt="#"/></figure>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a class="carousel-control-prev" href="#banner2" role="button" data-slide="prev">
            <i class="fa fa-arrow-left" aria-hidden="true"></i>
            </a>
            <a class="carousel-control-next" href="#banner2" role="button" data-slide="next">
            <i class="fa fa-arrow-right" aria-hidden="true"></i>
            </a>
         </div>
      </section>
      
     <%@include file="footer.jsp" %>
</body>
</html>


