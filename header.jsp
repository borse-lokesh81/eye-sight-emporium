 <header>
         <!-- header inner -->
         <div class="header">
         <div id="navbar">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                     <div class="full">
                        <div class="center-desk">
                           <div class="logo">
                              <a href="index.html"><img src="images/logo3.png" alt="#" /></a>
                           </div>
                        </div>
                     </div>
                  </div>
                 
                  <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                     <nav class="navigation navbar navbar-expand-md navbar-dark ">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarsExample04">
                           <ul class="navbar-nav mr-auto">
                              <li class="nav-item active">
                                 <a class="nav-link" href="index.jsp">Home</a>
                              </li>
                               <%
       if(session.getAttribute("email")==null){
       
       %>
        <li class="nav-item">
          <a class="nav-link" href="register.jsp">Register</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">Login</a>
        </li>
      <%
       }
       else{
      %>
       <li class="nav-item">
          <a class="nav-link" href="welcome.jsp">Products</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="viewcart.jsp">Cart</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="orders.jsp">My Orders</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="doctor.jsp">doctor suggetions</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="Eyecheckup.jsp">Eye checkup</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.jsp">Logout</a>
        </li>
       
        <%
       }
        %>
                           </ul>
                        </div>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
         </div>
         
      </header>