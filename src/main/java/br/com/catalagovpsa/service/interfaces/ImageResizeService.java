package br.com.catalagovpsa.service.interfaces;

import java.io.File;
import java.io.IOException;

public interface ImageResizeService {

	File resize(File image) throws IOException;

}