package br.com.catalagovpsa.service;

import java.io.File;
import java.io.IOException;
import java.text.MessageFormat;

import net.coobird.thumbnailator.Thumbnails;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.catalagovpsa.model.MetaFile;
import br.com.catalagovpsa.repository.interfaces.MetaFileRepository;
import br.com.catalagovpsa.service.interfaces.UploadService;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ListObjectsRequest;
import com.amazonaws.services.s3.model.ObjectListing;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.Region;

@Transactional
@Service("uploadService")
public class UploadServiceImpl implements UploadService {

	private String BUCKET_NAME = "catalagovpsa";

	@Autowired
	private MetaFileRepository repository;

	@Autowired
	private AmazonS3 s3;	

	public void upToAmazon(MetaFile metaFile, File file) throws IOException {

		if (!s3.doesBucketExist(BUCKET_NAME)) {
			s3.createBucket(BUCKET_NAME, Region.SA_SaoPaulo);
		}

		ObjectListing objectListing = s3.listObjects(new ListObjectsRequest().withBucketName(BUCKET_NAME).withPrefix(file.getName()));
		if (objectListing.getObjectSummaries().size() > 0) {
			throw new IOException("File exists on storage");
		}	
		
		Thumbnails.of(file)
        .height(350)
        .toFile(file);	

		s3.putObject(new PutObjectRequest(BUCKET_NAME, file.getName(), file).withCannedAcl(CannedAccessControlList.PublicRead));
		String url = MessageFormat.format("https://{0}.s3.amazonaws.com/{1}", BUCKET_NAME, file.getName());
						
		metaFile.setFileURL(url);
		
		Thumbnails.of(file)
        .size(160, 160)
        .toFile(file);			
		
		s3.putObject(new PutObjectRequest(BUCKET_NAME, file.getName() + "_thumbnail", file).withCannedAcl(CannedAccessControlList.PublicRead));
		String urlThumbnails = MessageFormat.format("https://{0}.s3.amazonaws.com/{1}", BUCKET_NAME, file.getName() + "_thumbnail");
		
		metaFile.setThumbnailURL( urlThumbnails );

		repository.add(metaFile);

		// delete temp file
		file.delete();

	}	

}