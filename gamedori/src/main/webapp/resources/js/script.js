window.onload = function () {

	//재열: 찜아이콘 마우스 오버
	$(document).ready(function () {
		$('.jjim').mouseover(function () {
					$(this).removeClass('xi-heart-o');
					$(this).addClass('xi-heart');
				});
		$('.jjim').mouseout(function () {
				$(this).removeClass('xi-heart');		
				$(this).addClass('xi-heart-o');
				});
	});//재열

	//유나: 메인, 회원가입, 이메일인증, 장바구니
	//main
	$(window).on('scroll', function() {
	$('.fade-in').each(function() {
		const scrollPos = $(this).offset().top;
		const windowHeight = $(window).height();
		const scrollTop = $(window).scrollTop();

		if (scrollPos < scrollTop + windowHeight * 0.8) {
		$(this).css('opacity', 1);
		}
	});
	});

	$(window).on('scroll', function() {
	$('.fade-in1').each(function() {
		const scrollPos = $(this).offset().top;
		const windowHeight = $(window).height();
		const scrollTop = $(window).scrollTop();

		if (scrollPos < scrollTop + windowHeight * 0.8) {
		$(this).css('opacity', 1);
		}
	});
	});

	$(window).on('scroll', function() {
	$('.fade-in2').each(function() {
		const scrollPos = $(this).offset().top;
		const windowHeight = $(window).height();
		const scrollTop = $(window).scrollTop();

		if (scrollPos < scrollTop + windowHeight * 3.2) {
		$(this).css('opacity', 1);
		}
	});
	});

	$(window).on('scroll', function() {
	$('.fade-in3').each(function() {
		const scrollPos = $(this).offset().top;
		const windowHeight = $(window).height();
		const scrollTop = $(window).scrollTop();

		if (scrollPos < scrollTop + windowHeight * 4.4) {
		$(this).css('opacity', 1);
		}
	});
	});

	$(window).on('scroll', function() {
	$('.fade-in4').each(function() {
		const scrollPos = $(this).offset().top;
		const windowHeight = $(window).height();
		const scrollTop = $(window).scrollTop();

		if (scrollPos < scrollTop + windowHeight * 8.6) {
		$(this).css('opacity', 1);
		}
	});
	});
	//main
	//유나


	//주원 전체선택, 팝오버
	$(document).ready(function () {

		//전체선택 체크
		$('#check-all').click(function() {
			if ($(this).prop('checked')) {
			$('.item').prop('checked', true);
			} else {
			$('.item').prop('checked', false);
			}
		});

		//팝오버
		$('[data-toggle="popover"]').popover({
			placement: 'top',
			'content':'장바구니에 담았습니다!',
			delay: {
				"show": 200,
				"hide": 1000
			}
		});

		$('[data-toggle="popover"]').click(function () {

			setTimeout(function () {
				$('.popover').fadeOut('slow');
			}, 1000);
		});

	});
	//주원 전체선택, 팝오버

}
