 <!-- Page Footer-->
          <footer class="main-footer" style="margin-top: 300px;">
            <div class="container-fluid">
              <div class="row">
                <div class="col-sm-6">
                  <p>
                    Sistema de Gerenciamento Escolar- SGE &copy; 2019</h6>
                  </p>
                </div>
              </div>
            </div>
          </footer>
        </div>
      </div>
    </div>
    <!-- Javascript files-->
    <script src="js/jquery.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.cookie.js"> </script>
    <script src="js/jquery.validate.min.js"></script>
    <!-- <script src="js/Chart.min.js"></script> -->
    <!-- <script src="js/charts-home.js"></script> -->
    <script src="js/front.js"></script>
    <script src="js/jquery.maskedinput.min.js"></script>
    <script src="js/sweetalert2.min.js"></script>
    <script src="js/chosen.jquery.min.js"></script>
    <script src="js/select2.min.js"></script>
    <script src="js/highcharts.js"></script>
    <script src="js/highcharts-3d.js"></script>
    <script src="js/exporting.js"></script>

    
    <script type="text/javascript">
      $('.datas').mask('99/99/9999');
      $('.sei').mask('9999.9999.999');
      $('.fone').mask('(99) 9999-9999?9');

      function excluir(url)
      {
        swal({
          title: 'Tem certeza que deseja excluir?',
          text: "Não poderá ser desfeito!",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Sim, excluir!'
        }).then(function () {
          window.location.href = url;
          //swal(url)
        });
      }
  function mudaMaximo()
  {
    var textoOptionSelecionado = $('#item option:selected').text(); // armazendando em variavel
    var res = textoOptionSelecionado.split(" - ") ;
    var num = res[2].split(" ");
    $('#qtd_existente').attr('max', num[0]);
  }

  $("select").chosen();
  $(function () {
    $('[data-toggle="tooltip"]').tooltip()
  })
/*$(".selectsim").select2({
  theme: "classic"
});*/

// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
<!-- Modal content -->
    
  </body>
</html>