//main.js


document.addEventListener("keyup", keyupFunction);
document.addEventListener("keydown", keydownFunction);




// PLAYING AUDIO FILE ON PRESSING KEYS: A - S - D - F - G - H - J - K - L

function keydownFunction(e) {
	//var y = e.key;
	if(e.which == 65){/* a */
		document.getElementById("video1").style.opacity = "1";
		myAudio.volume = 1.0;
		
	 } else if (e.which == 83) {/* s */
	 	document.getElementById("video2").style.opacity = "1";
	 	myAudio2.volume = 1.0;
	 	
	 } else if (e.which == 68) {/* d */
	 	document.getElementById("video3").style.opacity = "1";
	 	myAudio3.volume = 1.0;

	 } else if (e.which == 70) {/* f */
	 	document.getElementById("video4").style.opacity = "1";
	 	myAudio4.volume = 1.0;
	 	
	 } else if (e.which == 71) {/* g */
	 	document.getElementById("video5").style.opacity = "1";
	 	myAudio5.volume = 1.0;

	 } else if (e.which == 72) {/* h */
	 	document.getElementById("video6").style.opacity = "1";
	 	myAudio6.volume = 1.0;
	 	
	 } else if (e.which == 74) {/* i */
	 	document.getElementById("video7").style.opacity = "1";
	 	myAudio7.volume = 1.0;

	 } else if (e.which == 75) {/* j */
	 	document.getElementById("video8").style.opacity = "1";
	 	myAudio8.volume = 1.0;
	 	
	 } else if (e.which == 76) {/* k */
	 	document.getElementById("video9").style.opacity = "1";
	 	myAudio9.volume = 1.0;

	 } else if (e.which == 186) {/* semi-colon */
	 	document.getElementById("video10").style.opacity = "1";
	 	myAudio10.volume = 1.0;

	 } else if (e.which == 90) {/* z */
	 	document.getElementById("video11").style.opacity = "1";
	 	myAudio10.volume = 1.0;

	 } else if (e.which == 88) {/* x */
	 	document.getElementById("video12").style.opacity = "1";
	 	myAudio10.volume = 1.0;

	 } else if (e.which == 81) {/* q */
	 	document.getElementById("world").style.visibility = "hidden";
	 	document.getElementById("local").style.visibility = "visible";
	 	myAudio13.volume = 1.0;


 	}
 	console.log(e.keyCode);
 } 

// WHEN KEY GOT RELEASED SOUND GETS PAUSED

function keyupFunction(e) {
  // var y = e.key;
	if(e.which == 65){/* a */
		document.getElementById("video1").style.opacity = "0";
		myAudio.volume = 0;
		
	 } else if (e.which == 83) {/* s */
	 	document.getElementById("video2").style.opacity = "0";
	 	myAudio2.volume = 0;
	 	
	 } else if (e.which == 68) {/* d */
	 	document.getElementById("video3").style.opacity = "0";
	 	myAudio3.volume = 0;

	 } else if (e.which == 70) {/* f */
	 	document.getElementById("video4").style.opacity = "0";
	 	myAudio4.volume = 0;
	 	
	 } else if (e.which == 71) {/* g */
	 	document.getElementById("video5").style.opacity = "0";
	 	myAudio5.volume = 0;

	 } else if (e.which == 72) {/* h */
	 	document.getElementById("video6").style.opacity = "0";
	 	myAudio6.volume = 0;
	 	
	 } else if (e.which == 74) {/* i */
	 	document.getElementById("video7").style.opacity = "0";
	 	myAudio7.volume = 0;

	 } else if (e.which == 75) {/* j */
	 	document.getElementById("video8").style.opacity = "0";
	 	myAudio8.volume = 0;
	 	
	 } else if (e.which == 76) {/* k */
	 	document.getElementById("video9").style.opacity = "0";
	 	myAudio9.volume = 0;

	 } else if (e.which == 186) {/* semi-colon */
	 	document.getElementById("video10").style.opacity = "0";
	 	myAudio10.volume = 0;

	 } else if (e.which == 90) {/* z */
	 	document.getElementById("video11").style.opacity = "0";
	 	myAudio10.volume = 0;

	 } else if (e.which == 88) {/* x */
	 	document.getElementById("video12").style.opacity = "0";
	 	myAudio10.volume = 0;

	 } else if (e.which == 81) {/* q */
	 	document.getElementById("world").style.visibility = "visible";
	 	document.getElementById("local").style.visibility = "hidden";
	 	myAudio13.volume = 0;
 	}
 	console.log(e);
 }

myAudio.play();
myAudio.volume = 0;
myAudio2.play();
myAudio2.volume = 0;
myAudio3.play();
myAudio3.volume = 0;
myAudio4.play();
myAudio4.volume = 0;
myAudio5.play();
myAudio5.volume = 0;
myAudio6.play();
myAudio6.volume = 0;
myAudio7.play();
myAudio7.volume = 0;
myAudio8.play();
myAudio8.volume = 0;
myAudio9.play();
myAudio9.volume = 0;
myAudio10.play();
myAudio10.volume = 0;
myAudio13.play();
myAudio13.volume = 0;
// audio file 2 press G
//function keydownFunction(e) {
//	var z = e.key;
//	if(e.which == 71){
//		x.play();
//	 }
//}



//THIS IS THE START OF THE FIRST CODE OPTION FOR THE WEBCAM


(function(){
	var streamOne = document.getElementById('streamOne'),
		vendorUrl = window.URL || window.webkitURL;

	navigator.getMedia = navigator.getUserMedia ||
						 navigator.webkitGetUserMedia ||
						 navigator.mozGetUserMedia ||
						 navigator.msGetUserMedia;

	//capture video
	navigator.getMedia({
		video: true,
		audio: false
	}, function(stream) {
		streamOne.src = vendorUrl.createObjectURL(stream);
		streamOne.play();
	}, function(error) {
		//an error occured
		//error.code
	});

})();



$("terminal").animate({ scrollTop: $(document).height() - $(window).height() }, 10000, function() {
    $(this).animate({ scrollTop: 0 }, 1000);
});

var $lines = $('.prompt p');
$lines.hide();
var lineContents = new Array();

var terminal = function() {

  var skip = 0;
  typeLine = function(idx) {
    idx == null && (idx = 0);
    var element = $lines.eq(idx);
    var content = lineContents[idx];
    if(typeof content == "undefined") {
      $('.skip').hide();
      return;
    }
    var charIdx = 0;

    var typeChar = function() {
      var rand = Math.round(Math.random() * 150) + 7;

      setTimeout(function() {
        var char = content[charIdx++];
        element.append(char);
        if(typeof char !== "undefined")
          typeChar();
        else {
          element.append('<br/><span class="output">' + element.text().slice(9, -1) + '</span>');
          element.removeClass('active');
          typeLine(++idx);
        }
      }, skip ? 0 : rand);
    }
    content = 'echo "' + content + '"';
    element.append('~$ ').addClass('active');
    typeChar();
  }

  $lines.each(function(i) {
    lineContents[i] = $(this).text();
    $(this).text('').show();
  });

  typeLine();
}

terminal();
