package rm.repository;



import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import rm.entity.Patiekalai;

@Repository
public interface PatiekalaiImpl extends JpaRepository<Patiekalai, Integer> {

}
