window.addEventListener('load', () => {
    $('.hudanimado').hide()
});


window.addEventListener("message", function(event) {
    var v = event.data 
    var date = new Date;
    var minute = date.getMinutes()
    var hour = date.getHours()
    var year = date.getFullYear();
    var month = date.getMonth(); // beware: January = 0; February = 1, etc.
    var day = date.getDate();
    let dollar = Intl.NumberFormat('en-US');
    if (v.show == true) {
        $('.toditito').fadeIn(200)
        $('.hora').html(hour+':'+minute)
        $('.day').html(day+'.'+(month+1)+'.'+year)
        
    } else if (v.show == false) {
        $('.toditito').fadeOut(200)
    }

    if (v.showmoney == true) {
        $('.moneyh').html(v.money+'$')
    }


    if (v.coche == true) {
        $('.s1').html(v.s1)
        $('.s2').html(v.s2)

    }

    if(v.pausa == true) {
        $('.toditito').fadeOut(1000)
    } else if(v.pausa == false) {
        $('.toditito').fadeIn(1000)
    }

});


$(document).keyup((e) => {
    if (e.key === "Escape") {
        setTimeout(() => {
            $.post('https://zHudSplit/exit', JSON.stringify({}));
        }, 300);
    }
});

var rgbStart = [139,195,74]
var rgbEnd = [183,28,28]

$(function(){
	window.addEventListener('message', function(event) {
		if (event.data.action == "setValue"){
			if (event.data.key == "job"){
				setJobIcon(event.data.icon)
			}
			setValue(event.data.key, event.data.value)

		}else if (event.data.action == "updateStatus"){
			updateStatus(event.data.status);
		}else if (event.data.action == "setTalking"){
			setTalking(event.data.value)
		}else if (event.data.action == "toggle"){
			if (event.data.show){
				$('#ui').show();
			} else{
				$('#ui').hide();
			}
		/*}else if (event.data.action == "updateWeight"){
			updateWeight(event.data.weight)*/
		}
	});

});

function setValue(key, value){
	$('#'+key+' span').html(value)

}


function updateStatus(status){
	var hunger = status[0]
	var thirst = status[1]
	var drunk = status[2]
	$('#hunger .bg').css('height', hunger.percent+'%')
	$('#water .bg').css('height', thirst.percent+'%')

}

function colourGradient(p, rgb_beginning, rgb_end){
    var w = p * 2 - 1;

    var w1 = (w + 1) / 2.0;
    var w2 = 1 - w1;

    var rgb = [parseInt(rgb_beginning[0] * w1 + rgb_end[0] * w2),
        parseInt(rgb_beginning[1] * w1 + rgb_end[1] * w2),
            parseInt(rgb_beginning[2] * w1 + rgb_end[2] * w2)];
    return rgb;
};