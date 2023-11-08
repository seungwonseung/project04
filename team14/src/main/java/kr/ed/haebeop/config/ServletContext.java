package kr.ed.haebeop.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = {"kr.ed.haebeop"})
public class ServletContext implements WebMvcConfigurer {
    @Override
    public void configureViewResolvers(ViewResolverRegistry registry) {
        InternalResourceViewResolver bean = new InternalResourceViewResolver();
        bean.setViewClass(JstlView.class);
        bean.setPrefix("/WEB-INF/views/");
        bean.setSuffix(".jsp");
        registry.viewResolver(bean);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
        registry.addResourceHandler("/data/**").addResourceLocations("/data/");
        registry.addResourceHandler("/admin/**").addResourceLocations("/admin/");
        registry.addResourceHandler("/ajax/**").addResourceLocations("/ajax/");
        registry.addResourceHandler("/check/**").addResourceLocations("/check/");
        registry.addResourceHandler("/api/**").addResourceLocations("/api/");
        registry.addResourceHandler("/util/**").addResourceLocations("/util/");
        registry.addResourceHandler("/member/**").addResourceLocations("/member/");
        registry.addResourceHandler("/board/**").addResourceLocations("/board/");
        registry.addResourceHandler("/fileboard/**").addResourceLocations("/fileboard/");
        registry.addResourceHandler("/news/**").addResourceLocations("/news/");
        registry.addResourceHandler("/notice/**").addResourceLocations("/notice/");
        registry.addResourceHandler("/test/**").addResourceLocations("/test/");
        registry.addResourceHandler("/main/**").addResourceLocations("/main/");
        registry.addResourceHandler("/lecture/**").addResourceLocations("/lecture/");
        registry.addResourceHandler("/cart/**").addResourceLocations("/cart/");
        registry.addResourceHandler("/payment/**").addResourceLocations("/payment/");
        registry.addResourceHandler("/instructor/**").addResourceLocations("/instructor/");

    }
}
