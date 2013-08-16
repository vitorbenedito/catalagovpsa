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

		String fileName = nameConcat(file.getName(),metaFile.getCnpj(),metaFile.getReferenceId(), false);				
		
		ObjectListing objectListing = s3.listObjects(new ListObjectsRequest().withBucketName(BUCKET_NAME).withPrefix(fileName));
		if (objectListing.getObjectSummaries().size() > 0) {
			throw new IOException("File exists on storage");
		}								

		s3.putObject(new PutObjectRequest(BUCKET_NAME, fileName, file).withCannedAcl(CannedAccessControlList.PublicRead));				
		
		String url = MessageFormat.format("https://{0}.s3.amazonaws.com/{1}", BUCKET_NAME, fileName);
						
		metaFile.setFileURL(url);
		
		Thumbnails.of(file)
        .size(160, 160)
        .toFile(file);			
		
		String fileNameThumb = nameConcat(file.getName(),metaFile.getCnpj(),metaFile.getReferenceId(), true);
		
		s3.putObject(new PutObjectRequest(BUCKET_NAME, fileNameThumb , file).withCannedAcl(CannedAccessControlList.PublicRead));
		String urlThumbnails = MessageFormat.format("https://{0}.s3.amazonaws.com/{1}", BUCKET_NAME, fileNameThumb);
		
		metaFile.setThumbnailURL( urlThumbnails );

		repository.add(metaFile);

		// delete temp file
		file.delete();

	}	
	
	public String nameConcat(String name, String cnpj, Long productId, boolean isThumb)
	{		
		if(name != null)
		{
			if( name.lastIndexOf(".") > 0)
			{
				String fileName = name.substring(0, (name.lastIndexOf(".")) - 1 );
				String type = name.substring( name.lastIndexOf("."), name.length() );				
				
				name = fileName + cnpj + productId;
				if(isThumb)
				{
					name = name + "_thumb";
				}
				
				return name + type;				
			}
			else
			{			
				return name + cnpj + productId;
			}
		}
		
		return "photo_" + name + "_" + productId.toString() + ".jpg";
	}

}