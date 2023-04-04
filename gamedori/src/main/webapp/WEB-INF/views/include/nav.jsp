<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <nav class="navbar navbar-light position-fixed bottom-50 end-0">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div style="width:200px;" class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
                <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">
                    <a href="#" id="logo" class="d-flex align-items-center mb-2 mb-lg-0 text-decoration-none">
                    GAMEDORI<svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
                    </a>
                </h5>
                <button type="button" class="btn-close btn-close-black" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <hr>
                <div class="offcanvas-body">
                    <ul class="navbar-nav justify-content-center pe-3">
                        <li class="nav-item">
                            <a class="nav-link active d-flex" aria-current="page" href="#"><i class="xi-user xi-2x me-2"></i>마이페이지</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex" href="#"><i class="xi-truck xi-2x me-2"></i>주문배송</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex" href="#"><i class="xi-cart-o xi-2x me-2"></i>장바구니</a>
                        </li>
                    </ul>
                    <hr>
                    <ul class="navbar-nav justify-content-center pe-3">
                        <li class="nav-item">
                            <a class="nav-link active d-flex" aria-current="page" href="#"><i class="xi-kakaotalk xi-2x me-2"></i>카카오톡</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex" href="#"><i class="xi-facebook-official xi-2x me-2"></i>페이스북</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link d-flex" href="#"><i class="xi-instagram xi-2x me-2"></i>인스타그램</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
      </nav>