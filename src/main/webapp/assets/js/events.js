$(function(){
	$('#loading').bind("ajaxSend", function() {
	    $(this).show();
    }).bind("ajaxComplete", function() {
	    $(this).hide();
    });
});


function replaceAll(find, replace, str) {
  return str.replace(new RegExp(find, 'g'), replace);
}

	$('#search').keyup(function()
			{
				searchTable($(this).val());
			});

			function searchTable(inputVal)
			{
				var table = $('#productDiv');
				table.find('li').each(function(index, row)
				{
					var allCells = $(row).find('.link');
					if(allCells.length > 0)
					{
						var found = false;
						allCells.each(function(index, td)
						{
							var regExp = new RegExp(inputVal, 'i');
							if(regExp.test($(td).text()))
							{
								found = true;
								return false;
							}
						});
						if(found == true)
						{
							$(row).show();							
						}else{
							$(row).hide();
						}
					}
				});
			}
			
			$(document).ready(function(){
				$('.date').mask('11/11/1111');
				$('.time').mask('00:00:00');
				$('.date_time').mask('99/99/9999 00:00:00');
				$('.cep').mask('99999-999');
				$('.phone').mask('9999-9999');
				$('.phone_with_ddd').mask('(99) 9999-9999');
				$('.phone_us').mask('(999) 999-9999');
				$('.mixed').mask('AAA 000-S0S');
				$('.cpf').mask('999.999.999-99', {reverse: true});
				$('.money').mask('000.000.000.000.000,00', {reverse: true});
				$('.ip_address').mask('0ZZ.0ZZ.0ZZ.0ZZ', {translation: {'Z': "[0-9]?"}});
			});
			
			
			



