<br>
<br>
<br>
<br>
<!--JavaScript at end of body for optimized loading-->
<script src="js/usuarios.js" type="text/javascript"></script>
<script src="js/login.js" type="text/javascript"></script>
<script src="js/marcas.js" type="text/javascript"></script>
<script src="js/materialize.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var options = {
            "opacity": 0.6,
            "outDuration": 100,
            "startingTop": '100%',
            "dismissible": true

        };

        elems = document.querySelectorAll('.modal');
        instances = M.Modal.init(elems, options);

        var optionsScroll = {
            "throttle": 100,
            "scrollOffset": 200,
            "activeClass": 'active'


        };

        var elems = document.querySelectorAll('.scrollspy');
        var instances = M.ScrollSpy.init(elems, "");
        
        var elems = document.querySelectorAll('select');
        var instances = M.FormSelect.init(elems, "");
        
        var elems = document.querySelectorAll('.tooltipped');
        var instances = M.Tooltip.init(elems, "");
        
        var elems = document.querySelectorAll('.sidenav');
        var instances = M.Sidenav.init(elems, "");

        var elems = document.querySelectorAll('.dropdown-trigger');
        var instances = M.Dropdown.init(elems, "");
    });
    //$(document).ready(function () {
      //  $('.sidenav').sidenav();
    //});



</script>


</body>
</html>
