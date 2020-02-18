package rm.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import rm.security.entity.UserRole;

@Repository
public interface UserRoleImpl extends JpaRepository<UserRole, Integer> {
	
}
