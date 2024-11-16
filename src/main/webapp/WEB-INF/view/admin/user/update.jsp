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
    <title>ユーザー修正</title>

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
                <a href="/admin">ダッシュボード</a> / ユーザー
              </li>
            </ol>
            <div class=" mt-5">
              <div class="row">
                <div class="col-md-6 col-12 mx-auto">
                  <h3>ユーザー情報修正</h3>
                  <hr />
                  <form:form
                    method="post"
                    action="/admin/user/update"
                    modelAttribute="newUser"
                  >
                    <div class="mb-3" hidden="true">
                      <label for="exampleInputPassword1" class="form-label">ID:</label>
                      <form:input path="id" class="form-control" />
                    </div>
                    <div class="mb-3">
                      <label for="exampleInputEmail1" class="form-label">メール</label>
                      <form:input
                        path="email"
                        type="email"
                        class="form-control"
                        disabled="true"
                      />
                    </div>
        
                    <div class="mb-3">
                      <label for="exampleInputEmail1" class="form-label"
                        >電話番号</label
                      >
                      <form:input path="phone" type="number" class="form-control" />
                    </div>
        
                    <div class="mb-3">
                      <label for="exampleInputEmail1" class="form-label">氏名:</label>
                      <form:input path="fullName" type="text" class="form-control" />
                    </div>
                    <div class="mb-3">
                      <label for="exampleInputPassword1" class="form-label">住所</label>
                      <form:input path="address" type="text" class="form-control" />
                    </div>
        
                    <button type="submit" class="btn btn-warning">アップデート</button>
                  </form:form>
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
