$(document).bind('drop dragover', function(e) {
	e.preventDefault();
});

function submitSearch(url) {
	el = $('#search-produtos');
	if(!$("#filter-product").val())
	{
		return;
	}
	el.attr('action', url + $("#filter-product").val());
	el.submit();
}

function prepareLinkDetails() {
	$("a.remove").click(function(event) {
		return doAction(event);
	});
}

function prepareLinks() {
	$(".nav > li > a").click(function(event) {
		return doAction(event);
	});
}

function doAction(event) {
	var el = $(event.currentTarget);
	$("body").mask("Aguarde ...");
	$('.progress.active .bar').css('width', '0%');
	$.ajax(el.attr('href')).done(function(event) {
		$("div.active:not(.progress)").html(event);
		$('.progress').hide();
	}).fail(function(event) {
		alert("Erro!");
		$('.progress.active .bar').css('width', '0%');
		$('.progress').hide();
	}).always(function(event) {
		$("body").unmask();
		prepareUpload();
		prepareLinkDetails();
	});
	return false;
}

function prepareUpload() {
	$('.progress').hide();

	$("#btn-upload").click(function() {
		$("#fileupload").trigger('click');
	});

	var upload = $('#fileupload').fileupload({
		dropZone : $('#dropbox'),
		pasteZone : $(document),
		acceptFileTypes : /(\.|\/)(gif|jpe?g|png)$/i,
		done : function(e, data) {
			$("div.active:not(.progress)").html(data.result);
			prepareUpload();
		},
		change : function(e, data) {
			var total = data.files.length + $("a.thumbnail").length;
			if (total > 5) {
				alert("Só é possivel realizar o upload de até 5 fotos.");
				upload.abort();
			}
		},
		start : function(e, data) {
			if ($("a.thumbnail").length <= 5) {
				$("body").mask("Aguarde ...");
				$(".progress").show();
				$('.progress.active .bar').css('width', '0%');
			} else {
				alert("Só é possivel realizar o upload de até 5 fotos.");
				upload.abort();
			}
		},
		always : function(e) {
			$("body").unmask();
			prepareLinkDetails();
			$('.progress').hide();
		},
		progressall : function(e, data) {
			var progress = parseInt(data.loaded / data.total * 100, 10);
			$('.progress.active .bar').css('width', progress + '%');
		}
	});
}

prepareUpload();
prepareLinks();
prepareLinkDetails();