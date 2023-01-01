package admin.dao;

import java.sql.Connection;

import admin.domain.Admin;

public interface AdminDao {

	public Admin idcheck(Connection conn , int id);
}
