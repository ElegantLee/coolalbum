/**
 * 
 */
function praisePoint(val){
	var photo = new Object();
	photo.id = val;
	console.log("send message:" + JSON.stringify(photo));
	$.ajax({
		type : "POST",
		url : "/coolalbum/photo/praisepoint.action",
		dataType : "json",
		//contentType:"application/json",
		data : photo,
		success : function(data) {
			console.log("recv message:" + JSON.stringify(data));
			$("#photo"+val).text(JSON.stringify(data));
			console.log(" table value:" + JSON.stringify(v_scenery.photos));
		},
		error : function(data, type, err) {
			console.log(type);
			console.log(err);
		}
	});
}

function collecteThisPhoto(userId,photoId){
	var collectionFlag=$("#collectionFlag"+photoId).text();
	var collection = new Object();
	collection.userId=userId;
	collection.photoId=photoId;
	console.log("send message:" + JSON.stringify(collection));
	if(collectionFlag=="已收藏"){
		$.ajax({
			type : "POST",
			url : "/coolalbum/collection/deletecollectephoto.action",
			dataType : "json",
			//contentType:"application/json",
			data : collection,
			success : function(data) {
				console.log("recv message:" + JSON.stringify(data));
				$("#collectionFlag"+photoId).text("");
				console.log(" table value:" + JSON.stringify(v_scenery.photos));
			},
			error : function(data, type, err) {
				console.log(type);
				console.log(err);
			}
		});
	}
	else{
		$.ajax({
			type : "POST",
			url : "/coolalbum/collection/collectephoto.action",
			dataType : "json",
			//contentType:"application/json",
			data : collection,
			success : function(data) {
				console.log("recv message:" + JSON.stringify(data));
				$("#collectionFlag"+photoId).text("已收藏");
				console.log(" table value:" + JSON.stringify(v_scenery.photos));
			},
			error : function(data, type, err) {
				console.log(type);
				console.log(err);
			}
		});
	}
	
	
}
