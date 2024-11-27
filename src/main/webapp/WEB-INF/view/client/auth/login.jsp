<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>ログイン - LDH Shop</title>
    <link href="css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <div id="layoutAuthentication">
      <div id="layoutAuthentication_content">
        <main>
          <div class="container">
            <div class="row justify-content-center">
              <div class="col-lg-5">
                <div class="card shadow-lg border-0 rounded-lg mt-5">
                  <div class="card-header">
                    <h3 class="text-center font-weight-light my-4">ログイン</h3>
                  </div>
                  <div class="card-body">
                    <form method="POST" action="/login">
                      <div class="form-floating mb-3">
                        <input
                          class="form-control"
                          id="inputEmail"
                          type="email"
                          placeholder="name@example.com"
                          name="username"
                        />
                        <label for="inputEmail">メールアドレス</label>
                      </div>
                      <div class="form-floating mb-3">
                        <input
                          class="form-control"
                          id="inputPassword"
                          type="password"
                          placeholder="Password"
                          name="password"
                        />
                        <label for="inputPassword">パスワード</label>
                      </div>
                      <c:if test="${param.error != null}">
                        <div class="my-2" style="color: red">
                          メールアドレスまたはパスワードが間違っています。
                        </div>
                      </c:if>
                      <div>
                        <input
                          type="hidden"
                          name="${_csrf.parameterName}"
                          value="${_csrf.token}"
                        />
                      </div>
                      <div
                        class="d-flex align-items-center justify-content-center mt-4 mb-0"
                      >
                        <button class="btn btn-primary btn-block" type="submit">
                          ログイン
                        </button>
                      </div>
                    </form>
                  </div>
                  <div class="card-footer text-center py-3">
                    <div class="small">
                      <a href="register.html">新規登録</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="js/scripts.js"></script>
  </body>
</html>
