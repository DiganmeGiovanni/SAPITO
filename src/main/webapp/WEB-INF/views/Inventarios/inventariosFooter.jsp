<%-- 
    Document   : inventariosFooter
    Created on : Feb 22, 2015, 9:16:39 PM
    Author     : R2R
--%>

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/js/libs/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/js/libs/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/resources/js/libs/metisMenu.min.js"></script>


<script src="${pageContext.request.contextPath}/resources/js/libs/raphael-min.js"></script>

<!-- Datatables js -->
<script src="${pageContext.request.contextPath}/resources/js/libs/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/libs/dataTables.bootstrap.min.js"></script>

<!-- Sweetalert js -->
<script src="${pageContext.request.contextPath}/resources/js/libs/sweet-alert.min.js"></script>

<script type="text/javascript">
                function isInteger(s)
                {
                    var i;
                    s = s.toString();
                    for (i = 0; i < s.length; i++)
                    {
                        var c = s.charAt(i);
                        if (isNaN(c))
                        {
                            alert("S�lo puede ingresar n�meros en este campo");
                            return false;
                        }
                    }
                    return true;
                }
</script>
<script type="text/javascript">
                function AllowAlphabet()
                {
                    if (!frm.alphabet.value.match(/^[a-zA-Z]+$/) && frm.alphabet.value !=="")
                    {
                        frm.alphabet.value="";
                        frm.alphabet.focus();
                        alert("S�lo puede introducir car�cteres en este campo");
                    }
                }
</script><!-- Script by hscripts.com -->