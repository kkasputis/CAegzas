package rm.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import rm.entity.Komentarai;

@Repository
public interface KomentaraiImpl extends JpaRepository<Komentarai, Integer> {

	@Transactional
	@Modifying
	@Query(value = "DELETE FROM komentarai WHERE komentaro_id = ?1 ", nativeQuery = true)
	void deleteComment(int id);

	@Query(value = "SELECT * FROM komentarai WHERE user_name = ?1 ", nativeQuery = true)
	List<Komentarai> findAllUserComments(String userName);
}
