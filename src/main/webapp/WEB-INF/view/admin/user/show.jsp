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
    <title>ダッシュボード - LE DUY HAU</title>

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
          <div class="container-fluid px-4">
            <h1 class="mt-4">製品管理</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">
                <a href="/admin">ダッシュボード</a> / ユーザー
              </li>
            </ol>
            <div class="mt-5">
              <div class="row">
                <div class="col-12 mx-auto">
                  <div class="d-flex justify-content-between">
                    <h3>ユーザーリスト</h3>
                    <a href="/admin/user/create" class="btn btn-primary"
                      >ユーザー登録</a
                    >
                  </div>
                  <hr />
                  <table class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th scope="col">ID</th>
                        <th scope="col">メール</th>
                        <th scope="col">氏名</th>
                        <th scope="col">権限</th>
                        <th scope="col">アクション</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${users1}" var="user">
                        <tr>
                          <th scope="row">${user.id}</th>
                          <td>${user.email}</td>
                          <td>${user.fullName}</td>
                          <td>${user.role.name}</td>
                          <td class="d-flex">
                            <a
                              href="/admin/user/${user.id}"
                              type="button"
                              class="btn btn-success"
                              >見る</a
                            >

                            <a
                              href="/admin/user/update/${user.id}"
                              type="button"
                              class="btn btn-warning mx-2"
                              >アップデート</a
                            >

                            <a
                              href="/admin/user/delete/${user.id}"
                              type="button"
                              class="btn btn-danger mx-2"
                              >削除</a
                            >
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
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
