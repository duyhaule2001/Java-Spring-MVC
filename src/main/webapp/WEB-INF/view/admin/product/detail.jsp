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
    <title>ユーザー登録</title>

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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  </head>
  <body class="sb-nav-fixed">
    <div id="layoutSidenav">
      <jsp:include page="../layout/header.jsp" />
      <jsp:include page="../layout/sidebar.jsp" />
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4 pb-5">
            <h1 class="mt-4">製品管理</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">
                <a href="/admin">ダッシュボード</a> /
                <a href="/admin/product">製品 </a>/ 詳細情報
              </li>
            </ol>
            <div class="mt-5">
              <div class="row">
                <div class="col-12 mx-auto">
                  <div class="d-flex justify-content-between">
                    <h3>製品情報</h3>
                  </div>
                  <hr />

                  <div class="card" style="width: 60%">
                    <div class="card-header">詳細情報</div>
                    <ul class="list-group list-group-flush">
                      <c:if test="${not empty productInfo.image}">
                        <li class="list-group-item">
                          <img
                            id="currentImage"
                            src="/images/product/${productInfo.image}"
                            alt="写真"
                            style="
                              max-width: 300px;
                              max-height: 300px;
                              display: block;
                            "
                          />
                        </li>
                      </c:if>
                      <li class="list-group-item">ID： ${productInfo.id}</li>

                      <li class="list-group-item">
                        製品名：${productInfo.name}
                      </li>
                      <li class="list-group-item">
                        金額：${productInfo.price}
                      </li>
                    </ul>
                  </div>
                  <a href="/admin/product" class="btn btn-success mt-3">戻る</a>
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
