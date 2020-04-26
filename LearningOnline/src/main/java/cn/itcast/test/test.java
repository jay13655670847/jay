package cn.itcast.test;
import cn.itcast.dao.CourseDao;
import cn.itcast.dao.RegisterUserDao;
import cn.itcast.domain.Course;
import cn.itcast.domain.User;
import cn.itcast.service.RegisterUserService;
import cn.itcast.service.impl.LoginUserServiceImpl;
import cn.itcast.service.impl.RegisterUserServiceImpl;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class test {



    @org.junit.Test
    public void testSpring(){
        ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
        RegisterUserServiceImpl serviceImpl = (RegisterUserServiceImpl) ac.getBean("registerUserServiceImpl");
        User user=new User();
        user.setUsername("sssss");
        user.setPassword("1234567");
        serviceImpl.save(user);

    }

    @Test
    public void testSave() throws IOException {
        User user=new User();
        user.setUsername("zhangsan");
        user.setPassword("1234567");

        InputStream in= Resources.getResourceAsStream("SqlMapConfig.xml");
        SqlSessionFactory factory=new SqlSessionFactoryBuilder().build(in);
        SqlSession sqlSession = factory.openSession();
        CourseDao dao = sqlSession.getMapper(CourseDao.class);
//        String search=null;
//        List<Course> courses = dao.findCourse(0, 10,search);
//
//        System.out.println(courses);
//        int counts = dao.selectCounts("试题");
//        System.out.println(counts);
//        RegisterUserServiceImpl service = sqlSession.getMapper()
//        service.save(user);

        dao.saveCounts(2,300);

        sqlSession.commit();
        sqlSession.close();
        in.close();
    }

    @Test
    public void test() throws IOException {
        InputStream in= Resources.getResourceAsStream("SqlMapConfig.xml");
        SqlSessionFactory factory=new SqlSessionFactoryBuilder().build(in);
        SqlSession sqlSession = factory.openSession();
        CourseDao dao = sqlSession.getMapper(CourseDao.class);

        dao.saveCounts(2,100);
    }
}
