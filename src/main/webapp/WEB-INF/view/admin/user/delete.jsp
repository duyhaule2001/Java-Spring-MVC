<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>ユーザー削除</title>
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
        <div class="col-md-6 col-12 mx-auto">
          <h3>ユーザーID = ${id} 削除</h3>
          <hr />
          <div class="alert alert-danger" role="alert">
            ユーザーを削除してもよろしいいでしょうか？
          </div>
          <form:form
            method="post"
            action="/admin/user/delete"
            modelAttribute="newUser"
          >
            <div class="mb-3" style="display: none">
              <label for="exampleInputPassword1" class="form-label">ID:</label>
              <form:input value="${id}" path="id" class="form-control" />
            </div>
            <button type="submit" class="btn btn-danger">Ok</button>
          </form:form>
        </div>
      </div>
    </div>
  </body>
</html>