package hanium.ourmeeting.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;

import java.util.Optional;

@Configuration
public class JpaConfig {

    @Bean
    public AuditorAware<String> auditorProvider() {
        // TODO 로그인 기능을 구현 후 SpringSecurity 사용하면 SecurityContext 에서, 사용하지 않으면 username 넣어둔 곳에서 꺼내서 반환하도록
        return () -> Optional.of("TEMP");
    }
}
