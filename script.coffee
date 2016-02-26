$(document).ready ->

	$("body").append("<p>Hello world (js)</p>")

	$('form#intForm').submit ->
		#alert("howdy (form submit)")

		elt1 = $('#int1').val()
		alert(elt1)

		values = [
			$('#int1').val()
			$('#int2').val()
			$('#int3').val()
		]

		#alert(values[1])

		maxValue = Math.max values...

		#alert(maxValue)
		console.log maxValue 

		percents = [ 100.0* v / maxValue for v in values][0]
		console.log percents
		console.log percents[0]

		#$('#bar1').css("background-color", "yellow")
		$('#bar1').css("width", percents[0] + "%")
		$('#bar2').css("width", percents[1] + "%")
		$('#bar3').css("width", percents[2] + "%")
		false	

	sz = 10  # length and width of grid

	makeGrid = ->
		for i in [1..sz]
			$('body').append("<div class='row'>") 
			for j in [1..sz]
				$('body').append("<div class='box'> </div>") 
			$('body').append("</div>") 

	makeGrid()
	#$("body").append("<p>Hello world 2(js)</p>")
