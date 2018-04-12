package api;

import java.util.Properties;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.jpa.HibernatePersistenceProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;

@Configuration
public class DatabaseConfig {

    private DataSource soplonDs;

    @Bean
    protected DataSource sessionDataSource() {
        if (soplonDs == null) {
            BasicDataSource ds = new BasicDataSource();
            ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
            ds.setUrl("jdbc:mysql://localhost:3306/mariadb_soplon?verifyServerCertificate=false&useSSL=true&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC");
            ds.setUsername("root");
            ds.setPassword("admin");
            soplonDs = ds;
        }
        return soplonDs;
    }

    @Bean
    protected LocalContainerEntityManagerFactoryBean sessionsEntityManagerFactory() {
        LocalContainerEntityManagerFactoryBean emf = new LocalContainerEntityManagerFactoryBean();
        emf.setDataSource(sessionDataSource());
        emf.setPersistenceUnitName("soplonPU");
        emf.setPackagesToScan("entities");
        emf.setJpaProperties(getJpaProperties());
        emf.setPersistenceProvider(new HibernatePersistenceProvider());
        return emf;
    }

    @Bean
    protected PlatformTransactionManager sessionTransactionManager() {
        JpaTransactionManager jpaTransactionManager = new JpaTransactionManager(sessionsEntityManagerFactory().getObject());
        jpaTransactionManager.setDataSource(sessionDataSource());
        return jpaTransactionManager;
    }

    private Properties getJpaProperties() {
        Properties properties = new Properties();
        properties.put("hibernate.dialect", "org.hibernate.dialect.MySQLDialect");
        properties.put("hibernate.connection.charSet", "UTF-8");
        properties.put("hibernate.show_sql", "false");
        properties.put("hibernate.format_sql", "true");
        return properties;
    }

}
