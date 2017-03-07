package com.ezsmart.umcs.dao;

import java.util.Map;

import javax.sql.DataSource;

import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

import com.ezsmart.umcs.persistence.AccountMapper;
import com.ezsmart.umcs.persistence.EventMapper;

public class SessionFactoryManager {

    private SessionFactoryManager() {

    }

    public static SqlSessionFactory buildSessionFactory(Map<String, String> properties) {
        DataSource dataSource = DataSourceFactory.getDataSource(properties);
        return initSessionFactory(dataSource);
    }

    private static SqlSessionFactory initSessionFactory(DataSource dataSource) {
        TransactionFactory transactionFactory = new JdbcTransactionFactory();
        Environment environment = new Environment("development", transactionFactory, dataSource);
        Configuration configuration = new Configuration(environment);
        // configuration.addMapper(CustomerMapper.class);
        configuration.addMapper(EventMapper.class);
        configuration.addMapper(AccountMapper.class);
        // configuration.addMappers("com.ezsmart.umcs.persistence");
        return new SqlSessionFactoryBuilder().build(configuration);
    }
}
