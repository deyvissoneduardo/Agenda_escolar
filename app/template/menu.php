<!-- Main Navbar-->
<header class="header">
    <nav class="navbar">
        <!-- Search Box-->
        <div class="search-box">
            <button class="dismiss"><i class="icon-close"></i></button>
            <form id="searchForm" action="#" role="search">
                <input type="search" placeholder="O que você deseja encontrar?" class="form-control">
            </form>
        </div>
        <div class="container-fluid">
            <div class="navbar-holder d-flex align-items-center justify-content-between">
                <!-- Navbar Header-->
                <div class="navbar-header">
                    <!-- Navbar Brand --><a href="index.php" class="navbar-brand">
                        <div class="brand-text brand-big hidden-lg-down"><span></span>###<strong>####</strong></div>
                        <div class="brand-text brand-small"><strong>####</strong></div>
                    </a>
                    <!-- Toggle Button--><a id="toggle-btn" href="#"
                        class="menu-btn active"><span></span><span></span><span></span></a>
                </div>
                <!-- Navbar Menu -->
                <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                    <!-- Search-->
                    <!-- <li class="nav-item d-flex align-items-center"><a id="search" href="#"><i class="icon-search"></i></a></li> -->


                    <!-- Logout    -->
                    <li class="nav-item"></li>
                    #####
                    <li class="nav-item"><a href="index.php" class="nav-link logout">Sair<i
                                class="fa fa-sign-out"></i></a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="page-content d-flex align-items-stretch">
<?php include 'sidebar.php'; ?>