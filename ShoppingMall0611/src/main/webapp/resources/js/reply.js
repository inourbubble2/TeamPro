console.log("Reply Module........");

var replyService = (function() {
	//호스트주소에 시작부터 끝까지 인덱스번호를 가져옴.
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	//'/{contextPath}'를 가져온다
	var contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
	
	function add(reply, callback, error) {
		console.log("add reply...............");
		
		$.ajax({
			type : 'post',
			url : contextPath + '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}

	function getList(param, callback, error) {

	    var inquiryNo = param.inquiryNo;
	    var page = param.page || 1;
	    
	    $.getJSON(contextPath + "/replies/pages/" + inquiryNo + "/" + page + ".json",
	        function(data) {
	    	
	          if (callback) {
	            //callback(data); // 댓글 목록만 가져오는 경우 
	            callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우 
	          }
	        }).fail(function(xhr, status, err) {
	      if (error) {
	        error();
	      }
	    });
	  }

	function remove(replyNo, id, callback, error) {
		console.log("--------------------------------------");  
		console.log(JSON.stringify({replyNo:replyNo, id:id}));  
		    
	    $.ajax({
	    	type : 'delete',
	    	url : '/replies/' + replyNo,
	    	data:  JSON.stringify({replyNo:replyNo, id:id}),
	    	contentType: "application/json; charset=utf-8",
	    	success : function(deleteResult, status, xhr) {
	    		if (callback) {
	    			callback(deleteResult);
	    		}
	    	},
	    	error : function(xhr, status, er) {
	    		if (error) {
	    			error(er);
	    		}
	    	}
	    });
	}
	
	function update(Title, callback, error) {

		console.log("RNO: " + Title.replyNo);

		$.ajax({
			type : 'put',
			url : contextPath + '/replies/' + Title.replyNo,
			data : JSON.stringify(Title),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	function get(replyNo, callback, error) {

		$.get(contextPath + "/replies/" + replyNo + ".json", function(result) {

			if (callback) {
				callback(result);
			}

		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	// 현재 시간을 가져옴
	function displayTime(timeValue) {
		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	};

	return {
		add : add,
		get : get,
		getList : getList,
		remove : remove,
		update : update,
		displayTime : displayTime
	};

})();
