<%@ page language='java' contentType='text/html; charset=utf-8' pageEncoding='utf-8'%>
<script src='https://code.jquery.com/jquery-3.6.0.min.js'></script>
<script>
function listFruits() {
	$.ajax({
		url: 'fruits.jsp',
		dataType: 'json',
		success: fruits => {
			if(fruits.length) {
				const fruitArr = []
				$.each(fruits, (i, fruit) => {
					fruitArr.push(
						`<li>
							\${fruit.fruitName},
							\${fruit.price}
						</li>`
					)
				})
				$('#fruits').append(fruitArr.join(''))
			} else $('#fruits').append('<li>과일이 없습니다.</li>')
		}
	})
}

$(listFruits)
</script>

<ul id='fruits'>
	
</ul>