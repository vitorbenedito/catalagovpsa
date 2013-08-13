package br.com.catalagovpsa.service.interfaces;

import java.io.File;
import java.io.IOException;

import br.com.catalagovpsa.model.MetaFile;

public interface UploadService {
	public void upToAmazon(MetaFile metaFile, File file) throws IOException;
}