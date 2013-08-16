$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        
        done: function (e, data) {        	        	        	        	        
        	console.log("passou aqui 1"); 
        	$("#thumbnailsUL").empty();
        	
            $.each(data.result, function (index, file) {
            	            	
            	var li = '';
            	
            	if(file.fileURL != null)
            	{
            		li = '<li class="span1" id="dropzone"><a href="#" onmouseover="showImg("'+file.fileURL+'")"><img src="'+file.thumbnailURL+'" class="img-style row1" id="img_mini" alt="foto"></a></li>';
            	}
            	else
            	{
            		li = '<li class="span1" id="dropzone"><a href="#" onmouseover="showImg("'+file.fileURL+'")"><img src="/catalagovpsa/assets/img/square.gif" class="img-style row1" id="img_mini" alt="foto"></a></li>';
            	}
            	
            	$("#thumbnailsUL").append(li);              	            	
            	            	          	               
            });
            
            $('#progress .bar').css(
       	         'width',0
       	    );
            
            $('.row1').adipoli({
                'startEffect' : 'normal',
                'hoverEffect' : 'popout'
            });
                                            
        },
        
        progressall: function (e, data) {
	        var progress = parseInt(data.loaded / data.total * 100, 10);
	        $('#progress .bar').css(
	            'width',
	            progress + '%'
	        );
   		},
   		
   		fail: function (e, data) {	        
   			$('#progress .bar').css(
       	         'width',0
       	    );
   		},
   		
		dropZone: $('#dropzone')
    });
});