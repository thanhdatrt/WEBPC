/*price range*/

 $('#sl2').slider();

	var RGBChange = function() {
	  $('#RGB').css('background', 'rgb('+r.getValue()+','+g.getValue()+','+b.getValue()+')')
	};	
		
/*scroll to top*/

$(document).ready(function(){
	$(function () {
		$.scrollUp({
	        scrollName: 'scrollUp', // Element ID
	        scrollDistance: 300, // Distance from top/bottom before showing element (px)
	        scrollFrom: 'top', // 'top' or 'bottom'
	        scrollSpeed: 300, // Speed back to top (ms)
	        easingType: 'linear', // Scroll to top easing (see http://easings.net/)
	        animation: 'fade', // Fade, slide, none
	        animationSpeed: 200, // Animation in speed (ms)
	        scrollTrigger: false, // Set a custom triggering element. Can be an HTML string or jQuery object
					//scrollTarget: false, // Set a custom target element for scrolling to the top
	        scrollText: '<i class="fa fa-angle-up"></i>', // Text for element, can contain HTML
	        scrollTitle: false, // Set a custom <a> title if required.
	        scrollImg: false, // Set true to use image
	        activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
	        zIndex: 2147483647 // Z-Index for the overlay
		});
	});
});

	var responsiveSlider = function () {

	var slider = document.getElementById("slider_elenment");
	var sliderWidth = slider.offsetWidth;
	var slideList = document.getElementById("slideWrap");
	var count = 1;
	var items = slideList.querySelectorAll("li").length;
	var prev = document.getElementById("prev");
	var next = document.getElementById("next");

	window.addEventListener('resize', function () {
		sliderWidth = slider.offsetWidth;
	});

	var prevSlide = function () {
		if (count > 1) {
			count = count - 2;
			slideList.style.left = "-" + count * sliderWidth + "px";
			count++;
		}
		else if (count = 1) {
			count = items - 1;
			slideList.style.left = "-" + count * sliderWidth + "px";
			count++;
		}
	};

	var nextSlide = function () {
		if (count < items) {
			slideList.style.left = "-" + count * sliderWidth + "px";
			count++;
		}
		else if (count = items) {
			slideList.style.left = "0px";
			count = 1;
		}
	};

	next.addEventListener("click", function () {
		nextSlide();
	});

	prev.addEventListener("click", function () {
		prevSlide();
	});

	setInterval(function () {
		nextSlide()
	}, 5000);

};

window.onload = function () {
	responsiveSlider();
}
