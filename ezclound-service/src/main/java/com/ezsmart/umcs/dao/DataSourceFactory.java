package com.ezsmart.umcs.dao;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

public class DataSourceFactory {

    public static DataSource getDataSource(Map<String, String> properties) {
        String connectURI = properties.getOrDefault("url", "jdbc:oracle:thin:@117.27.146.10:5211/jksj");
        String driverClassName = properties.getOrDefault("driverClassName", "oracle.jdbc.driver.OracleDriver");
        String username = properties.getOrDefault("username", "usr_umcs");
        String password = properties.getOrDefault("password", "yizong2016");
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName(driverClassName);
        ds.setUrl(connectURI);
        ds.setUsername(username);
        ds.setPassword(password);
        ds.setValidationQuery("select * from dual");
        //validationQuery
        return ds;
    }

    public static void main(String[] args) {
        DataSource ds = getDataSource(new HashMap<String, String>());
    }
}
