<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 12/12/2022
  Time: 21:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <link rel="shortcut icon" type="image/png" href="../../static/img/favicon.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<section class="h-100 gradient-form" style="background-color: #eee;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-xl-10">
                <div class="card rounded-3 text-black">
                    <div class="row g-0">
                        <div class="col-lg-6">
                            <div class="card-body p-md-5 mx-md-4">

                                <form method="post" modelAttribute="register">
                                    <p>Register</p>

                                    <div class="form-outline">
                                        <input type="text" id="name" class="form-control"
                                               placeholder="Name" name="name" />
                                        <label class="form-label" for="email">Name</label>
                                    </div>
                                    <div class="form-outline">
                                        <input type="tel" id="phone" class="form-control"
                                               placeholder="Phone" name="phone" />
                                        <label class="form-label" for="phone">Phone</label>
                                    </div>
                                    <div class="form-outline">
                                        <input type="text" id="address" class="form-control"
                                               placeholder="Address" name="address" />
                                        <label class="form-label" for="address">Address</label>
                                    </div>

                                    <div class="form-outline">
                                        <input type="email" id="email" class="form-control"
                                               placeholder="Email" name="email" />
                                        <label class="form-label" for="email">Email</label>
                                    </div>

                                    <div class="form-outline">
                                        <input type="password" id="password" class="form-control" name="password" placeholder="Password"/>
                                        <label class="form-label" for="password">Password</label>
                                    </div>

                                    <div class="form-group">
                                        <input type="submit" value="Register" class="form-control btn btn-primary">
                                    </div>

                                </form>

                            </div>
                        </div>
                        <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                            <div class="text-dark px-3 py-4 p-md-5 mx-md-4">
                                <div class="text-center">
                                    <img src="../../static/img/logo.png"
                                         style="width: 185px;" alt="logo"
                                         class="mb-5">
<%--                                    <h4 class="mt-1 mb-5 pb-1">Welcome back sur !</h4>--%>
                                    <div class="d-flex align-items-center justify-content-center pb-4">
                                        <p class="mb-0 me-2">have an account?</p>
                                        <a href="/login" class="btn btn-outline-danger">Login</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
