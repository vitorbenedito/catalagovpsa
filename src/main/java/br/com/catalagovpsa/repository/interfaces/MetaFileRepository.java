package br.com.catalagovpsa.repository.interfaces;

import java.util.List;

import br.com.catalagovpsa.model.MetaFile;
import br.com.catalagovpsa.model.TypeMetaFile;


public interface MetaFileRepository {

	public String COLLECTION_NAME = "metafile";	
	
	public void add(MetaFile metaFile);
	
	public MetaFile getMax(String cnpj, Long referenceId, TypeMetaFile type);
	
	public List<MetaFile> findByProduct(String cnpj, Long referenceId);
	
	public MetaFile get(String cnpj, Long id);
	
	public void delete(String cnpj, Long referenceId);
	
}
