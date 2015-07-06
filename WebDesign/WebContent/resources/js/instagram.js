var accessToken = '419280286.be7a4f1.d40cf3afc89e4faa9a53abb3d605d483';
var limit = 8;
var setSize = "medium";

function loadImages(hashtag) {
	var getImagesURL = 'https://api.instagram.com/v1/tags/'+hashtag+'/media/recent?client_id=be7a4f1f95034386b3d243a8d144450a&access_token='
			+ accessToken + '';
	$.ajax({
		type : "GET",
		dataType : "jsonp",
		cache : false,
		url : getImagesURL,
		success : function(data) {
			for (var i = 0; i < limit; i += 1) {
				if (setSize == "small") {
					var size = data.data[i].images.thumbnail.url;
				} else if (setSize == "medium") {
					var size = data.data[i].images.low_resolution.url;
				} else {
					var size = data.data[i].images.standard_resolution.url;
				}
				$("#clientes").append(
						"<div class='col-sm-3'>"
								+ "<figure style='margin-top: 10px;'>"
								+ "<a href='" + data.data[i].link
								+ "' target='_blank'>" + "<img src='" + size
								+ "'></a>" + "<figcaption>"
								+ data.data[i].user.username + "</figcaption>"
								+ "</figure>");
			}
		}
	});
}
