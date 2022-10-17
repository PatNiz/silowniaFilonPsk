package pl.filon.silowniaFilonPsk.client.home;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pl.filon.silowniaFilonPsk.guest.Entry;

import java.util.List;
import java.io.IOException;

@WebServlet("")
public class HomeController extends HttpServlet {

    private EntryDao bookEntryDao = new EntryDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Entry> entries = bookEntryDao.findAll();
        request.setAttribute("entries", entries);
        request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Entry bookEntry = getBookEntry(request);
        bookEntryDao.save(bookEntry);
        response.sendRedirect(request.getContextPath());
    }
    private Entry getBookEntry(HttpServletRequest request) {
        String author = request.getParameter("author");
        String message = request.getParameter("message");
        return new Entry(author, message);
    }
}
