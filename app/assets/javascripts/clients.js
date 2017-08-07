$(document).on("click", "a.jobs", function(event){
	event.preventDefault(); 
	$("div.allJobs").prepend('List of all Jobs:')
	$.get("/jobs" + ".json", function(data){
		var jobs = data
		jobs.forEach(function(job){
		var link = "<a href =" + "/jobs/" + job["id"] + ">" + job["name"] + "</a>"	
			$("div.allJobs ul").append('<li>' + link +'</li>')
		});
		$("div.allJobs").css({
			'border': '2px black solid',
			'padding': '5px'
		});	
		$("div.allJobs ul").css({
			'list-style': 'none',
			'padding': '5px',
			'margin': '5px'
		});
	});
});