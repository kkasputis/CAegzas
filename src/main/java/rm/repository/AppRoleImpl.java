package rm.repository;



import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;

import rm.security.entity.AppRole;

	@Repository
	public interface AppRoleImpl extends JpaRepository<AppRole, Long> {

	}

