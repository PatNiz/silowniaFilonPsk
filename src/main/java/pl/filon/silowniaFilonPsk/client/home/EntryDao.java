package pl.filon.silowniaFilonPsk.client.home;


import pl.filon.silowniaFilonPsk.config.DataSourceProvider;
import pl.filon.silowniaFilonPsk.guest.Entry;

import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

class EntryDao {
    private final DataSource dataSource;

    public EntryDao() {
        try {
            this.dataSource = DataSourceProvider.getDataSource();
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }

    void save(Entry entry) {
        String sql = String.format("INSERT INTO book_entry(author, message) VALUES('%s', '%s')",
                entry.getAuthor(), entry.getMessage());
        try (Connection connection = dataSource.getConnection();
             Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    List<Entry> findAll() {
        String sql = "SELECT id, author, message FROM book_entry ORDER BY id DESC";
        List<Entry> entries = new ArrayList<>();
        try (Connection connection = dataSource.getConnection();
             Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                String author = resultSet.getString("author");
                String message = resultSet.getString("message");
                entries.add(new Entry(author, message));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return entries;
    }
}