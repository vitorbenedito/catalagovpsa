package br.com.catalagovpsa.service;

import java.io.File;
import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;

import br.com.catalagovpsa.service.interfaces.ImageResizeService;

@Service
public class ImageResizeServiceImpl implements ImageResizeService {

	public File resize(File image) throws IOException {
		return resizeImage(image, 250, 250);
	}

	private File resizeImage(File originalImage, int scaledWidth, int scaledHeight) throws IOException {
		Thumbnails.of(originalImage).size(255, 255).outputFormat(FilenameUtils.getExtension(originalImage.getName())).toFile(originalImage);
		return originalImage;
	}
}
