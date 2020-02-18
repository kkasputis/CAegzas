package rm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import rm.security.entity.AppUser;
@Repository
public interface AppUserImpl extends JpaRepository<AppUser, Integer> {
	  @Query(value = "SELECT * FROM app_user WHERE user_name = ?1",  nativeQuery = true)
	  List<AppUser> findListWithName(String name);
}
