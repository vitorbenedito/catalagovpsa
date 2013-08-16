

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
			
			



