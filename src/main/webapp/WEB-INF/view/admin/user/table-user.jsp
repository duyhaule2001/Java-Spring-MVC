<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- Latest compiled and minified CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- <link rel="stylesheet" href="/css/demo.css" /> -->
  </head>
  <body>
    <div class="container mt-5">
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
                <th scope="col">アクション</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach items="${users1}" var="user">
                <tr>
                  <th scope="row">${user.id}</th>
                  <td>${user.email}</td>
                  <td>${user.fullName}</td>
                  <td class="d-flex">
                    <button type="button" class="btn btn-success">見る</button>
                    <button type="button" class="btn btn-warning mx-2">
                      アップデート
                    </button>
                    <button type="button" class="btn btn-danger">削除</button>
                  </td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </body>
</html>
