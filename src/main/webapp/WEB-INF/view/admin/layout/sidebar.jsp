<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<div id="layoutSidenav_nav">
  <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
      <div class="nav">
        <div class="sb-sidenav-menu-heading">基本</div>
        <a class="nav-link" href="/admin">
          <div class="sb-nav-link-icon">
            <i class="fas fa-tachometer-alt"></i>
          </div>
          ダッシュボード
        </a>
        <a class="nav-link" href="/admin/user">
          <div class="sb-nav-link-icon">
            <i class="fas fa-tachometer-alt"></i>
          </div>
          ユーザー
        </a>
        <a class="nav-link" href="/admin/product">
          <div class="sb-nav-link-icon">
            <i class="fas fa-tachometer-alt"></i>
          </div>
          製品
        </a>
        <a class="nav-link" href="/admin/order">
          <div class="sb-nav-link-icon">
            <i class="fas fa-tachometer-alt"></i>
          </div>
          注文
        </a>
      </div>
    </div>
    <div class="sb-sidenav-footer">
      <div class="small">Logged in as:</div>
      LE DUY HAU
    </div>
  </nav>
</div>
