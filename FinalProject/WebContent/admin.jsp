<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.*"%>
<%@page import="com.learn.mycart.helper.*"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver"); %>
<%

    User user = (User) session.getAttribute("current-user");
    if (user == null) {

        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;

    } else {

        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "You are not admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;

        }

    }


%>

<%  CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
        List<Category> list = cdao.getCategories();
        
        //getting count
        Map<String,Long> m= Helper.getCounts(FactoryProvider.getFactory());
        
        
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>

 <style>
        body{
          background-image: url("img/bg4.jpg");
          background-repeat: no-repeat;
          background-size: cover;
        }
        
        </style>
    </head>
    <body>

        <%@include  file="components/navbar.jsp" %>

        <div class="container admin">


            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>




            <div class="row mt-3">

                <!--first col-->
                <div class="col-md-4">

                    <!--first box-->
                    <div class="card">
                        <div class="card-body text-center" data-toggle="modal" data-target="#view-user">
                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="img/team.png" alt="user_icon">

                            </div> 
                            <h1><%= m.get("userCount") %></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>

                        </div>

                    </div>



                </div>

                <!--second col-->

                <div class="col-md-4">


                    <div class="card text-center" data-toggle="modal" data-target="#view-category">

                        <div class="card-body">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="img/list.png" alt="user_icon">

                            </div> 

                            <h1><%= list.size() %></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>

                        </div>

                    </div>


                </div>


                <!--third col-->
                <div class="col-md-4">


                    <div class="card" >

                        <div class="card-body text-center" data-toggle="modal" data-target="#view-product">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="img/package.png" alt="user_icon">

                            </div> 

                            <h1><%= m.get("productCount") %></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>

                        </div>

                    </div>


                </div>





            </div>

            <!--second row-->

            <div class="row mt-3">

                <!--second :row first col-->
                <div class="col-md-6">


                    <div class="card" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="img/playlist.png" alt="user_icon">

                            </div> 

                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>

                        </div>

                    </div>
                </div>

                <!--second row : second col-->

                <div class="col-md-6">

                    <div class="card" data-toggle="modal" data-target="#add-product-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 125px;" class="img-fluid " src="img/plus.png" alt="user_icon">

                            </div> 

                            <p class="mt-2">Click here to add new Product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>

                        </div>

                    </div>

                </div>




            </div>



        </div>



        <!--add category modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">


                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required />

                            </div>


                            <div class="form-group">
                                <textarea style="height: 150px;" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>

                            </div>

                            <div class="cotnainer text-center">

                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                            </div>



                        </form>




                    </div>

                </div>
            </div>
        </div>




        <!--End add category modal-->

        <!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

        <!--product modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--form-->

                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct"/>

                            <!--product title-->

                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required />
                            </div>

                            <!--product description-->

                            <div class="form-group">
                                <textarea style="height: 150px;" class="form-control" placeholder="Enter product description" name="pDesc"></textarea>

                            </div>

                            <!--product price-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required />
                            </div>

                            <!--product discount-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required />
                            </div>


                            <!--product quantity-->

                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product Quantity" name="pQuantity" required />
                            </div>


                            <!--product category-->


                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                    <%                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"> <%= c.getCategoryTitle()%> </option>
                                    <%}%>
                                </select>

                            </div>



                            <!--product file-->

                            <div class="form-group">
                                <label for="pPic">Select Picture of product</label>  
                                <br>
                                <input type="file" id="pPic" name="pPic" required />

                            </div>


                            <!--submit button-->
                            <div class="container text-center">

                                <button class="btn btn-outline-success">Add product</button>

                            </div>



                        </form>
                        <!--end form-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>


        <!--End product modal-->
        
        <!-- open Category -->

	<!-- Modal -->
	<div class="modal fade" id="view-category" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">View Categories</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="data">
		<%
           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/mycart?useSSL = false", "root", "root");
           Statement statement = connection.createStatement() ;
          ResultSet resultset = statement.executeQuery("select * from category");
       %>
      <center>
      <TABLE BORDER="1" >
      <TR style="text-align:center;">
      <TH>Category ID</TH>
      <TH>Category Name</TH>
      <TH>Category Discription</TH>
      </TR>
      <% while(resultset.next()){ %>
      <TR style="text-align:center;">
       <TD> <%= resultset.getString(1) %></td>
       <TD> <%= resultset.getString(2) %></TD>
       <TD> <%= resultset.getString(3) %></TD>
       <!--  <td><a href="editform.jsp?id=${u.getId()}">Edit</a></td>
       <td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td> -->
      </TR>
      <% } %>
     </TABLE>
     </center>
    </div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					
				</div>
			</div>
		</div>
	</div>

	<!-- end category -->
        <!-- open Product -->

	<!-- Modal -->
	<div class="modal fade" id="view-product" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">View Products</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="data">
		<%
         
      resultset = statement.executeQuery("select * from product");
       %>
      <center>
      <TABLE BORDER="1">
      <TR style="text-align:center;">
      <TH>Product ID</TH>
      <TH>Product Name</TH>
      <TH>Product Discription</TH>
      <TH>Product photo</TH>
      <TH>Product Price</TH>
      <TH>Product Discount</TH>
      <TH>Product Quantity</TH>

      </TR>
      <% while(resultset.next()){ %>
      <TR style="text-align:center;">
       <TD> <%= resultset.getString(1) %></TD>
       <TD> <%= resultset.getString(2) %></TD>
       <TD> <%= resultset.getString(3) %></TD>
       <TD> <%= resultset.getString(4) %></TD>
       <TD> <%= resultset.getString(5) %></TD>
       <TD> <%= resultset.getString(6) %></TD>
       <TD> <%= resultset.getString(7) %></TD>
      <!--  <td><a href="editform.jsp?id=${u.getId()}">Edit</a></td>
       <td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td> -->
      </TR>
      <% } %>
     </TABLE>
     </center>
    </div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					
				</div>
			</div>
		</div>
	</div>

	<!-- end product -->
        
        
        
        <%@include  file="components/common_modals.jsp" %>
    </body>
</html>
