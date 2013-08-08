package br.com.catalagovpsa.repository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.catalagovpsa.model.MetaFile;
import br.com.catalagovpsa.model.Product;
import br.com.catalagovpsa.model.TypeMetaFile;
import br.com.catalagovpsa.repository.interfaces.MetaFileRepository;


@Transactional
@Repository("metaFileRepository")
public class MetaFileRepositoryImpl implements MetaFileRepository {

	@Autowired
	private MongoTemplate template;

	public void add(MetaFile metaFile) {
		template.save(metaFile, COLLECTION_NAME);
	}

	public MetaFile getMax(String cnpj, Long referenceId, TypeMetaFile type) {
	
		List<MetaFile> list = template.find(new Query(Criteria.where("cnpj").is(cnpj).and("referenceId").is(referenceId).and("type").is(type.name())).with( new PageRequest(0,1,Direction.DESC,"date") ), MetaFile.class, COLLECTION_NAME);
		
		if(list != null && list.size() > 0)
		{
			return list.get(0);
		}
		
		return null;
	}
	
	public List<MetaFile> findByProduct(String cnpj, Long referenceId) {
		return template.find(new Query(Criteria.where("cnpj").is(cnpj).and("referenceId").is(referenceId)), MetaFile.class, COLLECTION_NAME);
	}
	
	public MetaFile get(String cnpj, Long id) {
		return template.findOne(new Query(Criteria.where("cnpj").is(cnpj).and("id").is(id)), MetaFile.class, COLLECTION_NAME);
	}
		
	public void delete(String cnpj, Long referenceId) {
		Product file = template.findOne(new Query(Criteria.where("referenceId").is(referenceId)), Product.class, COLLECTION_NAME);
		template.remove(file, COLLECTION_NAME);
	}	
	
}
