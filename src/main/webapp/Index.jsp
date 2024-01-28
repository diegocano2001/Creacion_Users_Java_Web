<%-- 
    Document   : Index
    Created on : 27/01/2024, 8:18:02 p. m.
    Author     : Juan Diego Cano 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <title>Formulario de Usuarios</title>
        <style>
            body {
                background: rgb(2,0,36);
                background: radial-gradient(circle, rgba(2,0,36,1) 0%, rgba(34,235,196,1) 41%, rgba(0,212,255,1) 100%);
                background-size: cover;
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                margin: 0;
            }

            .container {
                background-color: rgba(255, 255, 255, 0.8); 
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px #000000;
            }

            .form-group {
                margin-bottom: 15px;
                
            }
        </style>
    </head>
    <body>

        <div class="container mt-5">
            <h1 class="text-center">Registrar Usuarios</h1>

            <form action="SvUsuarios" method="post">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombre">Nombre</label>
                        <input type="text" class="form-control" id="nombre" name="nombre" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="apellidos">Apellidos</label>
                        <input type="text" class="form-control" id="apellidos" name="apellidos" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="telefono">Número de teléfono</label>
                        <input type="number" class="form-control" id="telefono" name="telefono" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="ciudad">Ciudad</label>
                        <input type="text" class="form-control" id="ciudad" name="ciudad" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="pais">País</label>
                        <input type="text" class="form-control" id="pais" name="pais" required>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Guardar</button>
            </form>

        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
            var mensaje = '<%= request.getAttribute("mensaje")%>';
            console.log(mensaje);
            // Mostrar el mensaje de error si está presente
            if (mensaje !== 'null') {
                Swal.fire({
                    icon: "error",
                    title: "Oops...",
                    text: mensaje,
                    timer: 5000

                            //showConfirmButton: false
                });
            }
        </script>

    </body>
</html>
