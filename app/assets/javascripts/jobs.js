
function Job(name, jobdate, payrate, categories, paid, equipment, client) {
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


$(document).on("click", ".allJobs", function(event){	
	event.preventDefault(); 
	if ( !$.trim( $('.allInfo').html() ).length  ) {
		$(".allInfo").append("<ul id='userInfo'></ul>")
		$(".allInfo").prepend('<h2><a href = /jobs>List of all Jobs:</a></h2>')
		$.get("/jobs" + ".json", function(data){
			var jobs = data
			jobs.forEach(function(job){
			var link = "<a href =" + "/jobs/" + job["id"] + ">" + job["name"] + "</a>"	
				$("div.allInfo ul").append('<li>' + link +'</li>')
			});
			$("div.allInfo").css({
				'padding': '5px'
			});	
			$("div.allInfo ul").css({
				'line-height': '30px',
				'padding': '5px',
				'margin': '5px'
			});
		});
	} else {
		$("#userInfo").remove();
		$("h2").remove();
	}
});



$(document).on("click", ".js-next", function(event){
	event.preventDefault();
	var nextId = parseInt($(".js-next").attr("data-id")) + 1;
	$.get("/jobs/" + nextId + ".json", function(data){
		job = new Job(data.id, data.name, data.jobdate, data.payrate, data.categories, data.paid, data.equipment, data.client.id, data.client.fullname)
		$(".jobName").text(data.name + "'s information:")
		$(".jobDate").text("Date and Time: " + job.dateAndTime(data.jobdate))
		$(".jobPay").text("Pay rate: $" + data.payrate)
		$(".jobCategories").empty()
		$.each(job.category(data.categories), function(index, value){
			$(".jobCategories").append('<li>' + value + '</li>')
		})
		$(".jobPaid").text("Paid: " + data.paid)
		$(".jobEquipment").text("Equipment: " + data.equipment)
		$(".jobClient").html("Client: " + "<a href =" + "/clients/" + data.client.id + ">" + data.client.fullname + "</a>")
		$(".js-next").attr("data-id", data.id);
	})

})

$(document).ajaxError(function() {
    alert("There are no more jobs");
});

$(document).on("click", "a.addJob", function(event) {
	event.preventDefault();
	$("#mainclient").hide();
 	$("#jobIndex").remove();
	$.get('/jobs/new', function(data){
		// $('.addAJob').html($(data).find('.new_job').html());
		$('.jobAdding').html($(data).filter('.new_job').html())
		$('.jobAdding').prepend("<h3> Add a Job </h3>")
	});
});



$(function() {
	$('body').on("submit", ".jobAdding", function(event) {
		event.preventDefault();

		var values = $(this).serialize();
			
		var jobs = $.post("/jobs", values);
		jobs.done(function(data) {
		job = new Job(data.id, data.name, data.jobdate, data.payrate, data.categories, data.paid, data.equipment, data.client.id, data.client.fullname)
		
		$(".jobName").text(data.name + "'s information:")
		$(".jobDate").text("Date and Time: " + job.dateAndTime(data.jobdate))
		$(".jobPay").text("Pay rate: $" + data.payrate)
		$(".jobCategories").empty()
		$.each(job.category(data.categories), function(index, value) {
			$(".jobCategories").append('<li>' + value + '</li>')
		})
		$(".jobPaid").text("Paid: " + data.paid)
		$(".jobEquipment").text("Equipment: " + data.equipment)
		$(".jobClient").html("Client: " + "<a href =" + "/clients/" + data.client.id + ">" + data.client.fullname + "</a>")
		$(".js-next").attr("data-id", data.id);
		})
		$(this).hide();
		$("div").last().addClass("first");
	});
});

