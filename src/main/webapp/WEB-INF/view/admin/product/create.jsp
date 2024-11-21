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
    <script>
      $(document).ready(() => {
        const avatarFile = $("#avatarFile");
        avatarFile.change(function (e) {
          const imgURL = URL.createObjectURL(e.target.files[0]);
          $("#avatarPreview").attr("src", imgURL);
          $("#avatarPreview").css({ display: "block" });
        });
      });
    </script>
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
                <a href="/admin">ダッシュボード</a> / ユーザー
              </li>
            </ol>
            <div class="mt-5">
              <div class="row">
                <div class="col-md-6 col-12 mx-auto">
                  <h3>ユーザー登録</h3>
                  <hr />
                  <form:form
                    method="post"
                    action="/admin/user/create"
                    modelAttribute="newProduct"
                    enctype="multipart/form-data"
                    class="row g-3"
                  >
                    <div class="mb-3 col-6 col-md-6">
                      <label for="name" class="form-label">商品名</label>
                      <form:input
                        path="name"
                        type="text"
                        class="form-control"
                      />
                    </div>
                    <div class="mb-3 col-6 col-md-6">
                      <label for="price" class="form-label">金額</label>
                      <form:input
                        path="price"
                        type="number"
                        class="form-control"
                      />
                    </div>
                    <div class="mb-3 col-12 col-md-12">
                      <label for="detailDesc" class="form-label"
                        >詳細情報</label
                      >
                      <form:input
                        path="detailDesc"
                        type="text"
                        class="form-control"
                      />
                    </div>

                    <div class="mb-3 col-6 col-md-6">
                      <label for="shortDesc" class="form-label"
                        >簡単な説明</label
                      >
                      <form:input
                        path="shortDesc"
                        type="text"
                        class="form-control"
                      />
                    </div>

                    <div class="mb-3 col-6 col-md-6">
                      <label for="quantity" class="form-label">数量</label>
                      <form:input
                        path="quantity"
                        type="number"
                        class="form-control"
                      />
                    </div>

                    <div class="mb-3 col-6 col-md-6">
                      <label class="form-label">ブランド</label>
                      <form:select class="form-select" path="factory">
                        <form:option value="APPLE">Apple(Macbook)</form:option>
                        <form:option value="DELL">Dell</form:option>
                        <form:option value="ASUS">Asus</form:option>
                        <form:option value="ACER">Acer</form:option>
                        <form:option value="LG">LG</form:option>
                      </form:select>
                    </div>

                    <div class="mb-3 col-6 col-md-6">
                      <label class="form-label">使用的</label>
                      <form:select class="form-select" path="target">
                        <form:option value="ゲーミング">ゲーミング</form:option>
                        <form:option value="学習">学習</form:option>
                        <form:option value="ビジネス">ビジネス</form:option>
                      </form:select>
                    </div>

                    <div class="mb-3 col-12 col-md-6">
                      <label for="avatarFile" class="form-label">写真</label>
                      <input
                        class="form-control"
                        type="file"
                        id="avatarFile"
                        name="leduyhauFile"
                        accept=".png, .jpg, .jpeg"
                      />
                    </div>
                    <div class="mb-3 col-12">
                      <img
                        style="max-height: 250px; display: none"
                        alt="avatar preview"
                        id="avatarPreview"
                      />
                    </div>

                    <button type="submit" class="btn btn-primary col-md-2">
                      登録
                    </button>
                  </form:form>
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
