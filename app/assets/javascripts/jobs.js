
$(document).on("click", "a.allJobs", function(event){
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



$(document).on("click", ".js-next", function(event){
	event.preventDefault();
	var nextId = parseInt($(".js-next").attr("data-id")) + 1;
	$.get("/jobs/" + nextId + ".json", function(data){
		$(".jobName").text(data["name"])
		$(".jobPay").text(data["payrate"])
		console.log(data)
	})
})