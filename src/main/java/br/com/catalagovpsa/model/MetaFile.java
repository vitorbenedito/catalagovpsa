package br.com.catalagovpsa.model;

import java.util.Calendar;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

import br.com.catalagovpsa.utils.ParametrosRest;

@JsonIgnoreProperties({"file","thumbnail"})
public class MetaFile {
		
	private String id;
	
	private Long referenceId;
	private String cnpj;
	private Long sequenceId;	
	
	private String type;					
	
	private String fileName;
	private String fileSize;
	private String fileURL;
	private String fileType;
	
	private String thumbnailURL;
	
	private Long date;		
	
	public MetaFile() {
		
	}
	
	public MetaFile( String cnpj, long referenceId) {
				
		this.cnpj = cnpj;
		this.referenceId = referenceId;
		
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}	
	public Long getSequenceId() {
		return sequenceId;
	}
	public void setSequenceId(Long sequenceId) {
		this.sequenceId = sequenceId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}		
	public String getFileURL() {
		return fileURL;
	}
	public void setFileURL(String fileURL) {
		this.fileURL = fileURL;
	}
	
	public Long getReferenceId() {
		return referenceId;
	}
	public void setReferenceId(Long referenceId) {
		this.referenceId = referenceId;
	}
	public Long getDate() {
		return date;
	}
	public void setDate(Long date) {
		this.date = date;
	}
	public String getCnpj() {
		return cnpj;
	}
	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}		
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAlteradoApos() {
		if(getCalendar() != null)
		{
			return ParametrosRest.calendarToStringDataHora(getCalendar());
		}
		return "01/01/1990 00:00:00";
	}
	
	public Calendar getCalendar() {
		if(date != null)
		{
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(date);
			return calendar;
		}
		return null;
	}
	
	public static List<MetaFile> completeWithEmptyFiles(List<MetaFile> list){
		
		if(list == null)
		{
			list = new ArrayList<MetaFile>();
		}
		
		MetaFile metaFile = new MetaFile();
		metaFile.setFileURL( null );
		
		for(int i = list.size(); i < 5; i++)
		{
			list.add( metaFile );
		}
		
		return list;
		
	}

	public String getThumbnailURL() {
		return thumbnailURL;
	}

	public void setThumbnailURL(String thumbnailURL) {
		this.thumbnailURL = thumbnailURL;
	}	
	
	
}
