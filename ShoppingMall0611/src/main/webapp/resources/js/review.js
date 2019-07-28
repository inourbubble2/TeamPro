var reviewService = (function() {
	
	function modify(reviewVO, callback, error){
		console.log("reviewService.modify...");
		$.ajax({
			url : "/reviews/modify/" + reviewVO.reviewNo,
			type : "put",
			data : JSON.stringify(reviewVO),
			contentType : "application/json; charset=utf-8",
			headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
  //          beforeSend : function(xhr) {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
//                xhr.setRequestHeader("Accept", "application/json");
               // xhr.setRequestHeader("content-Type", "application/json");
              //  xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            //},
			success : function() {
				alert("리뷰 수정 성공");
				modal.style.display = "none";
				showList(1);
			},
			error : function(xhr, status, er) {
				alert(er);
			}
		});
	}

	function getReview(reviewNo, callback, error) {
		console.log(reviewNo);

		$.getJSON("/reviews/" + reviewNo, function(data) {
			if (callback) {
				console.log("callback...");
				console.log(data);
				callback(data);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});

	}

	function getList(param, callback, error) {

		var productCode = param.productCode;
		var page = param.page || 1;

		$.getJSON("/reviews/" + productCode + "/" + page + ".json",
				function(data) {
					if (callback) {
						// callback(data); //댓글 목록만 가져오는 경우
						callback(data.reviewCnt, data.list);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});

	}

	function displayTime(timeValue) {
		var dateObj = new Date(timeValue);
		var str = "";

		var yy = dateObj.getFullYear();
		var mm = dateObj.getMonth() + 1;
		var dd = dateObj.getDate();

		return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
				(dd > 9 ? '' : '0') + dd ].join('');
	}

	return {
		getReview : getReview,
		getList : getList,
		displayTime : displayTime,
		modify : modify
	};
})();