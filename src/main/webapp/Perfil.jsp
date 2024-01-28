<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.json.JSONObject"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Perfil</title>
        <!-- Agrega el enlace a Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-VkY1nQpOVDDtD1ByU2NDDdE1iWSc6TD4ZO0nFBORZOIfeVVJgaz5dIveRuLJAkTe48J2li7QlCqEPcrjALj5Uw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <style>
            .list-group-item {
                border-radius: 10px;

            }
        </style>
    </head>
    <body>

        <div class="container mt-4">
            <div class="card" style="background: rgb(2,0,36);background: radial-gradient(circle, rgba(2,0,36,1) 0%, rgba(34,235,196,1) 41%, rgba(0,212,255,1) 100%);">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h1 class="text-center mb-0">My Perfil</h1>
                    <a href="Index.jsp" class="btn btn-primary"> <img src="https://cdn-icons-png.flaticon.com/512/1387/1387940.png" width="20"> Nuevo Registro</a>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <!-- Agrega una imagen al lado del card -->
                            <img src="https://lofrev.net/wp-content/photos/2017/05/user_logo.png" alt="Foto" width="310">
                        </div>
                        <div class="col-md-8">

                            <%
                                // Obtener la cadena JSON del atributo de la solicitud
                                String data = (String) request.getAttribute("data");

                                // Verificar si data no es 'null'
                                if (data != null && !data.equals("null")) {
                                    // Convertir la cadena JSON a un objeto JSONObject
                                    try {
                                        JSONObject jsonData = new JSONObject(data);
                            %>
                            <li class="list-group-item"><strong>Nombre:</strong><%= jsonData.getString("Nombre")%></li><br>
                            <li class="list-group-item"><strong>Apellidos:</strong> <%= jsonData.getString("Apellidos")%></li><br>
                            <li class="list-group-item"><strong>Email:</strong> <%= jsonData.getString("Email")%></li><br>
                            <li class="list-group-item"><strong>Teléfono:</strong> <%= jsonData.getString("Telefono")%></li><br>
                            <li class="list-group-item"><strong>Ciudad:</strong> <%= jsonData.getString("Ciudad")%></li><br>
                            <li class="list-group-item"><strong>País:</strong> <%= jsonData.getString("Pais")%></li><br>
                                <%
                                        } catch (Exception e) {
                                            // Manejar la excepción si hay un problema al parsear la cadena JSON
                                            out.println("Error al parsear la cadena JSON: " + e.getMessage());
                                        }
                                    }
                                %>

                        </div>


                    </div>

                </div>

            </div>

        </div>

        <!-- Agrega los scripts de Bootstrap y SweetAlert -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
            // Resto de tu código JavaScript
            var mensaje = '<%= request.getAttribute("mensaje")%>';

            if (mensaje !== 'null') {
                Swal.fire({
                    icon: "success",
                    title: "Usuarios",
                    text: mensaje,
                    showConfirmButton: false,
                    timer: 1500
                });
            }
        </script>

    </body>
</html>
