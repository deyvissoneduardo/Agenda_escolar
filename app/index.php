<?php
require './template/header.php';
?>
<div class="page login-page" style="border-radius: 9px;">
    <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
            <div class="row">
                <!-- Logo & Information Panel-->
                <div class="col-lg-6">
                    <div class="info d-flex align-items-center">
                        <div class="content align=center">
                            <div class="logo">
                                <div style="border-radius: 10%; padding-top: 30px; align=center">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Form Panel    -->
                <div class="col-lg-6 bg-white">
                    <div class="form d-flex align-items-center">
                        <div class="content">
                            <form id="login-form" method="post">
                                <div class="i-checks">
                                </div>
                                <div class="form-group">
                                    <input id="email" type="text" name="email" required="" class="input-material "
                                        placeholder="CPF:" mask="999.999.999-99" size="11" maxlength="11">
                                    <label for="email" class="label-material"></label>
                                </div>
                                <div class="form-group">
                                    <input id="senha" type="password" name="senha" required="" class="input-material"
                                        placeholder="Senha:">
                                    <label for="senha" class="label-material"></label>
                                </div><a id="login" href="principal.php" class="btn btn-info">Entrar</a>
                                <!-- This should be submit button but I replaced it with <a> for demo purposes-->
                            </form>
                            <a href="#" style="text-align: center">Esqueceu sua senha?</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyrights text-center">
        <p style="color: #FFF;">Copyright © 2019 -<a href="http://www.ipabpericias.com.br" class="external"> ##</a></p>
        <!-- Please do not remove the backlink to us unless you support further theme's development at https://bootstrapious.com/donate. It is part of the license conditions. Thank you for understanding :)-->
    </div>
</div>