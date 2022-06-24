package cn.edu.ldu.dao;

import cn.edu.ldu.bean.Author;

public interface AuthorDao {
    public int addAuthor(Author author);
    public Author findlogin(String authorName,String password);

}
