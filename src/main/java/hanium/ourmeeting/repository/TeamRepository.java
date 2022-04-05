package hanium.ourmeeting.repository;

import hanium.ourmeeting.entity.Team;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TeamRepository extends JpaRepository<Team, Long> {
}
