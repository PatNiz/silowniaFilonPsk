import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class Sesja extends HttpServlet {
    private static final long serialVersionUID=1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html; charset=utf-8");
        PrintWriter PW = response.getWriter();
        HttpSession sesja = request.getSession();
        PW.println("<html>");
        PW.println("<head><title> Przykład wykorzystania sesji </title></head>");
        PW.println("<body>");

        try {
            if (sesja.isNew()) {
                PW.println("<p> Wszedłeś na stronę po raz pierwszy </p>");

            } else {
                Date data = new Date(sesja.getCreationTime());
                long czas = sesja.getLastAccessedTime() - sesja.getCreationTime();
                PW.println("<p>");
                PW.println("Sesja trwa od: " + data.toString() + ". ");
                PW.println("od jej rozpoczęcia upłynęło:" + czas / 1000 + "sekund.");
                PW.println("</p>");

            } }finally{
                PW.println("</body>");
                PW.println("</html>");
                PW.close();
            }
        }
    }

