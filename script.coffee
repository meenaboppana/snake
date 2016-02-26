$(document).ready ->

	#$("body").append("<p>Hello world (js)</p>")

	$('form#intForm').submit ->
		#alert("howdy (form submit)")

		"""
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
		"""

	sz = 10  # length and width of grid

	makeGrid = ->
		body = $('body')
		for i in [1..sz]
			row_plus_ind = "row_"+i 
			row = $('<div>')
			row.addClass('row')
			row.addClass(row_plus_ind)

			body.append(row)

			for j in [1..sz]
				col_plus_ind = "col_"+j
				box = $('<div>')
				box.addClass('box')
				box.addClass(col_plus_ind)
				# box.addClass('selected')

				# box.attr('class', 'box')
				# box.attr('class', 'selected')
				# "<div class='box selected'>"
				# box.attr('class', box.attr('class') + ' ' + 'selected')

				row.append(box)

	initializeSnake = ->
		head = $('.row_10 .col_1') #.css("border", "5px solid green")
		head.addClass('selected')

		$(document).keydown (e) ->
		    switch e.which

		        when 37 then console.log "YOOOOO"  # left

		        when 38 then break  # up

		        when 39 then break # right

		        when 40 then break # down

		        #default: return # exit this handler for other keys
		    
		    #e.preventDefault() # prevent the default action (scroll / move caret)


	makeGrid()
	initializeSnake()
	#$("body").append("<p>Hello world 2(js)</p>")
