<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>ユーザー情報</title>

    <link href="/css/styles.css" rel="stylesheet" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- <link rel="stylesheet" href="/css/demo.css" /> -->
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body class="sb-nav-fixed">
    <div id="layoutSidenav">
      <jsp:include page="../layout/header.jsp" />
      <jsp:include page="../layout/sidebar.jsp" />
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4 vh-100">
            <h1 class="mt-4">製品管理</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">
                <a href="/admin">ダッシュボード</a> / <a href="/admin/user">ユーザー</a> / 詳細情報
              </li>
            </ol>
            <div class=" mt-5">
              <div class="row">
                <div class="col-12 mx-auto">
                  <div class="d-flex justify-content-between">
                    <h3>ユーザー情報</h3>
                  </div>
                  <hr />
        
                  <div class="card" style="width: 60%">
                    <div class="card-header">詳細情報</div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item">ID： ${userInfor.id}</li>
                      <li class="list-group-item">
                        メールアドレス：${userInfor.email}
                      </li>
                      <li class="list-group-item">氏名：${userInfor.fullName}</li>
                      <li class="list-group-item">住所：${userInfor.address}</li>
                    </ul>
                  </div>
                  <a href="/admin/user" class="btn btn-success mt-3">戻る</a>
                </div>
              </div>
          </div>
        </main>
        
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="js/scripts.js"></script>
  </body>
</html>
