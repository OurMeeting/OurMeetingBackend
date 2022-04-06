package hanium.ourmeeting.repository;

import hanium.ourmeeting.entity.MemberMeeting;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberMeetingRepository extends JpaRepository<MemberMeeting, Long> {
}
