<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%@ page import="com.poscoict.posledger.assets.model.User_Doc" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%-- <%@ include file="common/taglibs.jsp" %> --%>

<!DOCTYPE html>
<html lang="ko" class="high">
<head>
    <title>PosLedger Assets Application</title>

    <link href="bootstrap.min.css" rel="stylesheet" type="text/css"></link>

    <!-- Custom styles for this template -->
    <link href="shop-item.css" rel="stylesheet">
</head>

<body>

<!--<h2>Your token is ${accessToken}</h2>-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">POSTECH</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/assets/index">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Contact</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Page Content -->
<div class="container">

    <div class="row">

        <div class="col-lg-3">
            <h1 class="my-4">Signature Service</h1>
            <div class="list-group">
                <a href="/assets/main" class="list-group-item">Make a signature</a>
                <a href="/assets/mysign?userid=${sessionUser.id}" class="list-group-item">My Signature</a>
                <a href="#" class="list-group-item active">My Document</a>
                <a href="/assets/addUser" class="list-group-item"l>Upload File</a>
            </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">
            <div class="card card-outline-secondary my-4">
                <div class="card-header">
                    <h1>${sessionUser.id}'s Document List</h1>
                </div>
                <div class="card-body">
                    <%
                        //List<User_Doc> docList = (List<User_Doc>)request.getAttribute("docList");
                        //User_Doc doc;

                        String docList[] = (String[])request.getAttribute("docIdList");
                        String docPathList[] = (String[])request.getAttribute("docPathList");
                        String docNum[] = (String[])request.getAttribute("docNumList");
                        String userid = (String)request.getAttribute("userId");

                        String docid[] = new String[docList.length];

                        String queryDoc="";
                        int i=0;
                        for(i=0; i<docid.length; i++) {
                            docid[i] = "<a href=/assets/mydoc?userid=" + userid + "&docid=" + docList[i] + "&docnum=" + docNum[i] + ">" + docPathList[i] + "</a>";
                            queryDoc = "<a href=/assets/queryDoc?docid=" + docList[i] + "&docnum=" + docNum[i] + ">" + "- Query Your Final Document" + "</a>";
                    %>
                    <%=docid[i]%>
                    <%=queryDoc%><br>
                    <%
                        }
                    %>
                    <hr>
<%--                    <a href="#" class="btn btn-success">Leave a Review</a>--%>
                </div>
            </div>
            <!-- /.card -->

        </div>
        <!-- /.col-lg-9 -->

    </div>
</div>
<%--<%
    //List<User_Doc> docList = (List<User_Doc>)request.getAttribute("docList");
    //User_Doc doc;

    String docList[] = (String[])request.getAttribute("docList");
    String userid = (String)request.getAttribute("userId");
    String docid[] = new String[docList.length];
    String queryDoc="";
    int i=0;
    for(i=0; i<docid.length; i++) {
        docid[i] = "File - <a href=/assets/mydoc?userid=" + userid + "&docid=" + docList[i] + ">" + docList[i] + "</a>";
        queryDoc = "query - <a href=/assets/queryDoc?docid=" + docList[i] + ">" + docList[i] + "</a>";
        %>
         <%=docid[i]%><br>
         <%=queryDoc%><br>
<%
    }
%>--%>

<input type="hidden" name="userid" value="${sessionUser.id}">
<%--
<c:forEach items="${docList}" var="docList">
    <a href="">${list}</a>
</c:forEach>
--%>
</body>

<script src="${ctx}/js/jquery-min.js"></script>
</html>