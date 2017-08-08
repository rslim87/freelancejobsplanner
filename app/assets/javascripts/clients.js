$(document).on("click", "a.jobs", function(event){
	event.preventDefault(); 

	$("div.displayjobs").prepend('List of all Jobs:')
	var url = $(this).attr('href')
	 $.get(url + ".json", function(data){
	 	$.each(data, function(index){
	 		$("div.displayjobs ul").append('<li>' + data[index].name + '</li>')
	 	});
	});
});

$(document).on("click", "a.addJob", function(event){
	event.preventDefault();
	$.get('/jobs/new', function(data){
		// $('.addAJob').html($(data).find('.new_job').html());
		$('.jobAdding').html($(data).filter('.new_job').html())
	})

})