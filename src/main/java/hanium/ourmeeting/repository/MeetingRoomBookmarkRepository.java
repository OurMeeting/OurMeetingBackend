package hanium.ourmeeting.repository;

import hanium.ourmeeting.entity.MeetingRoomBookmark;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MeetingRoomBookmarkRepository extends JpaRepository<MeetingRoomBookmark, Long> {
}
