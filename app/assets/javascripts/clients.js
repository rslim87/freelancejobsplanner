
$(document).on("click", ".allClients", function(event){	
	event.preventDefault(); 
	if ( !$.trim( $('.allInfo').html() ).length  ) {
	 	$(".allInfo").append("<ul id='userInfo'></ul>")
	 	$(".allInfo").prepend('<h2>List of all Clients:</h2>')
	 	$.get("/clients" + ".json", function(data){
	 		var clients = data
	 		clients.forEach(function(client){
	 		var link = "<a href =" + "/clients/" + client["id"] + ">" + client["fullname"] + "</a>"	
	 			$(".allInfo ul").append('<li>' + link +'</li>')
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