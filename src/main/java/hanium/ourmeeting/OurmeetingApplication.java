package hanium.ourmeeting;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class OurmeetingApplication {

	public static void main(String[] args) {
		SpringApplication.run(OurmeetingApplication.class, args);
	}

}
