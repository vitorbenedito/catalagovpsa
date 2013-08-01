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
				alert("S� � possivel realizar o upload de at� 5 fotos.");
				upload.abort();
			}
		},
		start : function(e, data) {
			if ($("a.thumbnail").length <= 5) {
				$("body").mask("Aguarde ...");
				$(".progress").show();
				$('.progress.active .bar').css('width', '0%');
			} else {
				alert("S� � possivel realizar o upload de at� 5 fotos.");
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

$(function() {

	$('.dialogs,.comments').slimScroll({
        height: '300px'
    });
	
	$('#tasks').sortable();
	$('#tasks').disableSelection();
	$('#tasks input:checkbox').removeAttr('checked').on('click', function(){
		if(this.checked) $(this).closest('li').addClass('selected');
		else $(this).closest('li').removeClass('selected');
	});

	var oldie = $.browser.msie && $.browser.version < 9;
	$('.easy-pie-chart.percentage').each(function(){
		var $box = $(this).closest('.infobox');
		var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
		var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
		var size = parseInt($(this).data('size')) || 50;
		$(this).easyPieChart({
			barColor: barColor,
			trackColor: trackColor,
			scaleColor: false,
			lineCap: 'butt',
			lineWidth: parseInt(size/10),
			animate: oldie ? false : 1000,
			size: size
		});
	})

	$('.sparkline').each(function(){
		var $box = $(this).closest('.infobox');
		var barColor = !$box.hasClass('infobox-dark') ? $box.css('color') : '#FFF';
		$(this).sparkline('html', {tagValuesAttribute:'data-values', type: 'bar', barColor: barColor , chartRangeMin:$(this).data('min') || 0} );
	});




  var data = [
	{ label: "social networks",  data: 38.7, color: "#68BC31"},
	{ label: "search engines",  data: 24.5, color: "#2091CF"},
	{ label: "ad campaings",  data: 8.2, color: "#AF4E96"},
	{ label: "direct traffic",  data: 18.6, color: "#DA5430"},
	{ label: "other",  data: 10, color: "#FEE074"}
  ];

  var placeholder = $('#piechart-placeholder').css({'width':'90%' , 'min-height':'150px'});
  $.plot(placeholder, data, {
	
	series: {
        pie: {
            show: true,
			tilt:0.8,
			highlight: {
				opacity: 0.25
			},
			stroke: {
				color: '#fff',
				width: 2
			},
			startAngle: 2
			
        }
    },
    legend: {
        show: true,
		position: "ne", 
	    labelBoxBorderColor: null,
		margin:[-30,15]
    }
	,
	grid: {
		hoverable: true,
		clickable: true
	},
	tooltip: true, //activate tooltip
	tooltipOpts: {
		content: "%s : %y.1",
		shifts: {
			x: -30,
			y: -50
		}
	}
	
 });

 
  var $tooltip = $("<div class='tooltip top in' style='display:none;'><div class='tooltip-inner'></div></div>").appendTo('body');
  placeholder.data('tooltip', $tooltip);
  var previousPoint = null;

  placeholder.on('plothover', function (event, pos, item) {
	if(item) {
		if (previousPoint != item.seriesIndex) {
			previousPoint = item.seriesIndex;
			var tip = item.series['label'] + " : " + item.series['percent']+'%';
			$(this).data('tooltip').show().children(0).text(tip);
		}
		$(this).data('tooltip').css({top:pos.pageY + 10, left:pos.pageX + 10});
	} else {
		$(this).data('tooltip').hide();
		previousPoint = null;
	}
	
 });






	var d1 = [];
	for (var i = 0; i < Math.PI * 2; i += 0.5) {
		d1.push([i, Math.sin(i)]);
	}

	var d2 = [];
	for (var i = 0; i < Math.PI * 2; i += 0.5) {
		d2.push([i, Math.cos(i)]);
	}

	var d3 = [];
	for (var i = 0; i < Math.PI * 2; i += 0.2) {
		d3.push([i, Math.tan(i)]);
	}
	

	var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
	$.plot("#sales-charts", [
		{ label: "Domains", data: d1 },
		{ label: "Hosting", data: d2 },
		{ label: "Services", data: d3 }
	], {
		hoverable: true,
		shadowSize: 0,
		series: {
			lines: { show: true },
			points: { show: true }
		},
		xaxis: {
			tickLength: 0
		},
		yaxis: {
			ticks: 10,
			min: -2,
			max: 2,
			tickDecimals: 3
		},
		grid: {
			backgroundColor: { colors: [ "#fff", "#fff" ] },
			borderWidth: 1,
			borderColor:'#555'
		}
	});


	$('#recent-box [data-rel="tooltip"]').tooltip({plw8ment: tooltip_plw8ment});
	function tooltip_plw8ment(context, source) {
		var $source = $(source);
		var $parent = $source.closest('.tab-content')
		var off1 = $parent.offset();
		var w1 = $parent.width();

		var off2 = $source.offset();
		var w2 = $source.width();

		if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
		return 'left';
	}
})
