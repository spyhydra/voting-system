<%@ page import="com.jdbc.conn.Dbconnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Voting page</title>
    <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap"
        rel="stylesheet">
    <link rel="shortcut icon" href="assets/images/fav.jpg">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
</head>

<body>
    <div class="header container-fluid bg-white">
        <div id="menu-jk" class="nav-col text-white shadow-md mb-3">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 pt-2 pb-2 align-items-center">

                        <a data-bs-toggle="collapse" data-bs-target="#menu"
                            class="float-end text-dark d-lg-none pt-1 ps-3"><i class="bi pt-1 fs-1 cp bi-list"></i></a>
                    </div>
                    <div id="menu" class="col-lg-6 d-none d-lg-block">
                        <ul class="float-end mul d-inline-block">
                            <li class="float-md-start px-4 pe-1 pt-4">
                                <a href="displayParticipants.jsp" class="fw-bold fs-8 text-primary"> display candidate </a>
                            </li>
                            <li class="float-md-start px-4 pe-1 pt-4">
                                <a href="candidate.jsp" class="fw-bold fs-8 text-primary"> add candidate </a>
                            </li>
                            <li class="float-md-start px-4 pe-1 py-3">
                                <button class="btn fw-bold fs-8 btn-outline-primary px-5">Login</button>
                            </li>
                            <li class="float-md-start px-4 pe-1 py-3">
                                <button class="btn fw-bold fs-8 btn-primary">Register as Voter</button>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-xl big-padding">
        <div class="row section-title">
            <h2 class="fs-4"></h2>
            <p></p>
        </div>
        <div class="row">
            <%
                try{
                    Connection con = Dbconnection.getConnection();
                    System.out.println("connected");

                    Statement st= con.createStatement();
                    ResultSet rs= st.executeQuery("select * from participants");
                    //PrintWriter pw = response.getWriter();

                    while(rs.next()){
            %>
             <form action="Voting" method="post">
            <div class="col-lg-4 col-md-6">
                <div class="text-white text-center mb-4 votcard shadow-md bg-white p-4 pt-5">
                    <img class="rounded-pill shadow-md p-2" src="assets/images/testimonial/member-01.jpg" alt="">
                    <h4 class="mt-3 fs-5 mb-1 fw-bold"><% out.println(rs.getString("Name")); %></h4>
                    <h6 class="fs-7"> Participated in: <span class="text-primary fw-bold"><% out.println(rs.getString("CompetitionName")); %></span></h6>
                    <p class="text-dark mt-3 mb-3 fs-8"></p>

                    <input type="hidden" name="id" value="<%= rs.getString("ID") %>">
                    <button class="btn btn-danger fw-bolder px-4 ms-2 fs-8" name="arbitraryName" type="submit">Vote</button>


                </div>
            </div>
             </form>
            <%     }
            }
            catch (Exception e){
                e.printStackTrace();
            }
            %>







        </div>
    </div>

    <div class="copy">
        <div class="container">

            <span>
                <a href=""><i class="fab fa-github"></i></a>
                <a href=""><i class="fab fa-google-plus-g"></i></a>
                <a href="https://in.pinterest.com/prabnr/pins/"><i class="fab fa-pinterest-p"></i></a>
                <a href="https://twitter.com/prabinraja89"><i class="fab fa-twitter"></i></a>
                <a href="https://www.facebook.com/freewebtemplatesbysmarteye"><i class="fab fa-facebook-f"></i></a>
            </span>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-6 fw-bold fs-5" id="exampleModalLabel">View Manifesto</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                </div>
            </div>
        </div>
    </div>


</body>
<script src="assets/js/jquery-3.2.1.min.js"></script>
<script src="assets/js/popper.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
<script src="assets/plugins/testimonial/js/owl.carousel.min.js"></script>
<script src="assets/js/script.js"></script>

</html>