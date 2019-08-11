/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controllers.models;

/**
 *
 * @author ABHISHEK R
 */
import java.sql.*;
import com.java.controllers.dbconnect;
import java.util.ArrayList;
public class BookDb {
                Connection conn=null;
                Statement stmt=null;
                dbconnect connect=new dbconnect();
                
    public ArrayList<Book> selectAllBooks() {
		
                ResultSet rs = null;
		ArrayList<Book> books = new ArrayList<Book>();
		
		try {
			conn=connect.connecttodb();
                
			if(conn != null) {
				stmt = conn.createStatement();
				/*String strQuery = "select B.book_id, A.auth_name, P.pub_name, price, description, "
						+ "publish_date, cover_image, inventory "  
						+ "from books";*/
                                String bookfields_query="select B.book_id, A.auth_name, P.pub_name, B.title, B.pub_year, B.type, B.price, B.desc "
                                                        +"from books B, author A, publisher P "
                                                        +"where B.auth_id=A.auth_id and "
                                                        +"B.pub_id=P.pub_id;";
				rs = stmt.executeQuery(bookfields_query);
				while(rs.next()) {
					Book b = new Book();
                                        b.setbook_id(rs.getInt("book_id"));
                                        b.setauth_name(rs.getString("auth_name"));
                                        b.setpub_name(rs.getString("pub_name"));
                                        b.settitle(rs.getString("title"));
                                        b.setpub_year(rs.getString("pub_year"));
                                        b.settype(rs.getString("type"));
                                        b.setprice(rs.getFloat("price"));
                                        b.setdesc(rs.getString("desc"));
                                        
					books.add(b);
				}
			}
		} catch (SQLException e) {
			for(Throwable t: e) {
				t.printStackTrace();
			}
		} catch (Exception et) {
			et.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.err.println(e);
			}
		}		
		return books;
	}
    
	public ArrayList<Book> selectAllBooksFromCategory(String type) {
		
		ResultSet rs = null;
		ArrayList<Book> books = new ArrayList<Book>();
		
		try {
			conn = connect.connecttodb();
			
			if(conn != null) {
				stmt = conn.createStatement();
				String strQuery = "select B.book_id, A.auth_name, P.pub_name, B.title, B.pub_year, B.type, B.price, B.desc "
                                                        +"from books B, author A, publisher P "
                                                        +"where B.auth_id=A.auth_id and "
                                                        +"B.pub_id=P.pub_id and B.type='"+type+"';";
				rs = stmt.executeQuery(strQuery);
				while(rs.next()) {
					Book b = new Book();
                                        b.setbook_id(rs.getInt("book_id"));
                                        b.setauth_name(rs.getString("auth_name"));
                                        b.setpub_name(rs.getString("pub_name"));
                                        b.settitle(rs.getString("title"));
                                        b.setpub_year(rs.getString("pub_year"));
                                        b.settype(rs.getString("type"));
                                        b.setprice(rs.getFloat("price"));
                                        b.setdesc(rs.getString("desc"));
                                        
					books.add(b);				
                                }
			}
		} catch (SQLException e) {
			for(Throwable t: e) {
				t.printStackTrace();
			}
		} catch (Exception et) {
			et.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.err.println(e);
			}
		}		
		return books;
	}
        public Book selectBook(int book_id) {
		ResultSet rs = null;
		Book b = new Book();
		
		try {
			conn = connect.connecttodb();
			
			if(conn != null) {
				stmt = conn.createStatement();
				
				String strQuery = "select B.book_id, A.auth_name, P.pub_name, B.title, B.pub_year, B.type, B.price, B.desc "
                                                        +"from books B, author A, publisher P "
                                                        +"where B.auth_id=A.auth_id and "
                                                        +"B.pub_id=P.pub_id and B.type="+book_id+";";
				rs = stmt.executeQuery(strQuery);
				if (rs.next()) {
					b.setbook_id(rs.getInt("book_id"));
                                        b.setauth_name(rs.getString("auth_name"));
                                        b.setpub_name(rs.getString("pub_name"));
                                        b.settitle(rs.getString("title"));
                                        b.setpub_year(rs.getString("pub_year"));
                                        b.settype(rs.getString("type"));
                                        b.setprice(rs.getFloat("price"));
                                        b.setdesc(rs.getString("desc"));
                                        
				}
			}
		} catch (SQLException e) {
			for(Throwable t: e) {
				t.printStackTrace();
			}
		} catch (Exception et) {
			et.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (stmt != null) {
					stmt.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				System.err.println(e);
			}
		}
		return b;
	}
    
}
