<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 10/12/2022
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="visionary crofting is a breif project in Youcode">
    <link rel="shortcut icon" type="image/png" href="../../static/img/favicon.png">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../../static/css/all.min.css">
    <link rel="stylesheet" href="../../static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../static/css/owl.carousel.css">
    <link rel="stylesheet" href="../../static/css/magnific-popup.css">
    <link rel="stylesheet" href="../../static/css/animate.css">
    <link rel="stylesheet" href="../../static/css/meanmenu.min.css">
    <link rel="stylesheet" href="../../static/css/main.css">
    <link rel="stylesheet" href="../../static/css/responsive.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet">
    <title>Visionary crofting</title>
</head>
<body>
<div class="loader">
    <div class="loader-inner">
        <div class="circle"></div>
    </div>
</div>

<!-- header -->
<div class="top-header-area" id="sticker">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12 text-center">
                <div class="main-menu-wrap">
                    <div class="site-logo">
                        <a href="/">
                            <img src="../../static/img/logo.png" alt="">
                        </a>
                    </div>

                    <nav class="main-menu">
                        <ul>
                            <li class="current-list-item"><a href="/">Home</a></li>
                            <li><a href="/about">About</a></li>
                            <li><a href="/contact">Contact</a></li>
                            <li><a href="/products">Products</a></li>
                            <li><a href="/dashboard">Dashboard</a></li>
                            <li>
                                <div class="header-icons">
                                    <a class="shopping-cart" href="/cart"><i class="fa-solid fa-cart-shopping"></i></a>
                                    <a class="mobile-hide search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                                    <% if (session.getAttribute ( "client" ) != null) { %>
                                        <a class="" href="/logout">Logout</a>
                                    <% } else {%>
                                        <a class="" href="/login"><i class="fas fa-sign-in-alt"></i></a>
                                    <% } %>


                                </div>
                            </li>
                        </ul>
                    </nav>
                    <a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
                    <div class="mobile-menu"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end header -->

<!-- search area -->
<div class="search-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <span class="close-btn"><i class="fas fa-window-close"></i></span>
                <div class="search-bar">
                    <div class="search-bar-tablecell">
                        <h3>Search For:</h3>
                        <input type="text" placeholder="Keywords">
                        <button type="submit">Search <i class="fas fa-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end search area -->