package com.mycompany.pruebatecnicajava;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.EnvioApi;

@WebServlet(name = "SvUsuarios", urlPatterns = {"/SvUsuarios"})
public class SvUsuarios extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String ciudad = request.getParameter("ciudad");
        String pais = request.getParameter("pais");

        // Crear una instancia de EnvioApi
        EnvioApi envioApi = new EnvioApi(nombre, apellidos, email, telefono, ciudad, pais);

        // Enviar la instancia a la API y obtener la respuesta del servidor
        RespuestaApi respuestaApiObj = enviarDatosApi(envioApi);

        // Obtener la respuesta y el código de estado
        String respuestaApi = respuestaApiObj.getRespuesta();
        int codigoEstado = respuestaApiObj.getCodigoEstado();

        // Verificar el código de estado HTTP
        if (codigoEstado == 201) {
            // Datos guardados correctamente
            request.setAttribute("mensaje", "Los datos se guardaron correctamente.");
            request.setAttribute("data", respuestaApi);
            request.getRequestDispatcher("/Perfil.jsp").forward(request, response);

        } else {
            // Error al guardar datos
            request.setAttribute("mensaje", "Error al guardar los datos. Por favor, inténtalo de nuevo.");
            request.getRequestDispatcher("/Index.jsp").forward(request, response);
        }

    }

    public class RespuestaApi {

        private String respuesta;
        private int codigoEstado;

        public RespuestaApi(String respuesta, int codigoEstado) {
            this.respuesta = respuesta;
            this.codigoEstado = codigoEstado;
        }

        public String getRespuesta() {
            return respuesta;
        }

        public int getCodigoEstado() {
            return codigoEstado;
        }
    }

    private RespuestaApi enviarDatosApi(EnvioApi envioApi) throws IOException {
        String apiUrl = "https://65b59af041db5efd2867cb3e.mockapi.io/api/usuarios/usuarios";
        URL url = new URL(apiUrl);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();

        // Configurar la conexión para enviar datos por POST
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        connection.setRequestProperty("Content-Type", "application/json");

        // Convertir el objeto EnvioApi a JSON y enviarlo al servidor
        String jsonInputString = convertirObjetoJson(envioApi);

        try (OutputStream os = connection.getOutputStream()) {
            byte[] input = jsonInputString.getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        // Obtener la respuesta del servidor (si es necesario)
        int responseCode = connection.getResponseCode();
        System.out.println("Respuesta del servidor: " + responseCode);

        // Leer la respuesta del servidor
        String respuesta;
        try (BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
            respuesta = br.lines().collect(Collectors.joining(System.lineSeparator()));
        } catch (IOException e) {
            // En caso de error al leer la respuesta del servidor, imprimir el stack trace
            e.printStackTrace();
            respuesta = null;
            return new RespuestaApi("Error al leer la respuesta del servidor", 500);

        }

        connection.disconnect();

        // Devolver la respuesta y el código de estado
        return new RespuestaApi(respuesta, responseCode);
    }

    private String convertirObjetoJson(EnvioApi envioApi) {

        return String.format(
                "{\"Nombre\":\"%s\",\"Apellidos\":\"%s\",\"Email\":\"%s\",\"Telefono\":\"%s\",\"Ciudad\":\"%s\",\"Pais\":\"%s\"}",
                envioApi.getNombre(), envioApi.getApellidos(), envioApi.getEmail(),
                envioApi.getTelefono(), envioApi.getCiudad(), envioApi.getPais()
        );
    }
}
