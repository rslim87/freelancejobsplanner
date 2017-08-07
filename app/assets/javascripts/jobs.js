
function Job(name, jobdate, payrate, categories, paid, equipment, client){
	this.name = name
	this.jobdate = jobdate
	this.payrate = payrate
	this.categories = categories
	this.paid = paid
	this.equipment = equipment
	this.client = client
}

Job.prototype.dateAndTime = function(jobdate) {
	var d = jobdate.replace(/[T]/g, ' ')
	d = d.split('.')[0]
	d = new Date(d);

	var m_names = new Array("January", "February", "March", 
	"April", "May", "June", "July", "August", "September", 
	"October", "November", "December");

	var curr_date = d.getDate(d);
	var curr_month = d.getMonth();
	var curr_year = d.getFullYear();
	var a_p = "";
	var curr_hour = d.getHours();
	if (curr_hour < 12)
	   {
	   a_p = "AM";
	   }
	else
	   {
	   a_p = "PM";
	   }
	if (curr_hour == 0)
	   {
	   curr_hour = 12;
	   }
	if (curr_hour > 12)
	   {
	   curr_hour = curr_hour - 12;
	   }

	var curr_min = d.getMinutes();

	var final_date = m_names[curr_month] + " " + curr_date + ", " + curr_year + " at " + curr_hour + ":" + curr_min + a_p

	return final_date;

}

Job.prototype.category = function(categories) {
	categoriescollection = [];
	for (i = 0; i < categories.length; i++) {
		categoriescollection.push(categories[i].title)

	};
	return categoriescollection
};


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
	$(".jobCategories").empty()
	var nextId = parseInt($(".js-next").attr("data-id")) + 1;
	$.get("/jobs/" + nextId + ".json", function(data){
		job = new Job(data.name, data.jobdate, data.payrate, data.categories, data.paid, data.equipment, data.client.fullname)
		$(".jobName").text(job.name + "'s information:")
		$(".jobDate").text("Date and Time: " + job.dateAndTime(data.jobdate))
		$(".jobPay").text("Pay rate: $" + job.payrate)
		$.each(job.category(data.categories), function(index, value){
			$(".jobCategories").append('<li>' + value + '</li>')
		})
		console.log(data)
		console.log(job.category(data.categories))


	})
})

