package hanium.ourmeeting.repository;

import hanium.ourmeeting.config.JpaConfig;
import hanium.ourmeeting.entity.Team;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.context.annotation.Import;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaTest
@Import(JpaConfig.class)
class AuditingTest {

    @Autowired
    TeamRepository teamRepository;

    @Test
    void Auditing_작동_확인() {
        Team team = Team.builder()
                .name("test-team")
                .build();
        Team savedTeam = teamRepository.save(team);

        assertThat(savedTeam.getId()).isNotNull();
        assertThat(savedTeam.getCreatedBy()).isNotNull();
        assertThat(savedTeam.getLastModifiedBy()).isNotNull();
        assertThat(savedTeam.getCreatedDate()).isNotNull();
        assertThat(savedTeam.getLastModifiedDate()).isNotNull();
    }
}