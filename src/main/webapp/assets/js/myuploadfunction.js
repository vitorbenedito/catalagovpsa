$(function () {
    $('#fileupload').fileupload({
        dataType: 'json',
        
        done: function (e, data) {
        	$("ul:has(li)").remove();
            $.each(data.result, function (index, file) {
            	
            	var img = '';
            	
            	if(file.fileURL != null)
            	{
            		img = '<img src="'+file.fileURL+'" class="img-style row1" id="img_mini" alt="foto">';
            	}
            	else
            	{
            		"<img src='<c:url value='' class='img-style row1' id='img_mini' alt='foto'>";
            	}
            	
                $("#productDiv").append(
                		$('<li class="span1" id="dropzone"/>')
                		.append($('<a href="#" onmouseover="showImg(this)"/>').text(img))
                		
                		)
            }); 
        },
        
        progressall: function (e, data) {
	        var progress = parseInt(data.loaded / data.total * 100, 10);
	        $('#progress .bar').css(
	            'width',
	            progress + '%'
	        );
   		},
   		
		dropZone: $('#dropzone')
    });
});