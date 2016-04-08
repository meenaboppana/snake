"""
TODO: 
1. Detect a collision 
2. Restart when crashing into wall or collision 
3. Make the snake move forward at each step
4. Introduce bits of food at random squares
5. Make snake get longer after eating food 
6. Make it pretty 
"""


$(document).ready ->
	$('form#intForm').submit ->
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

	sz = 50  # length and width of grid

	makeGrid = ->
		body = $('body')
		for i in [0..sz-1]
			row_plus_ind = "row_"+i 
			row = $('<div>')
			row.addClass('row')
			row.addClass(row_plus_ind)

			body.append(row)

			for j in [0..sz-1]
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

	# Returns a (row, col) pair representing the next square to move head to
	# or returns an error if person tries to move off screen
	nextSquare = (row, col, dir) ->
		switch dir 
			when 0 # left
			  if col > 0 then [row,col-1] else null #console.log "ERROR: off the grid"
			when 1 # up
			  if row > 0 then [row-1,col] else null #console.log "ERROR: off the grid"
			when 2 # right
			  if col < sz-1 then [row,col+1] else null #console.log "ERROR: off the grid"
			when 3 # down
			  if row < sz-1 then [row+1,col] else null #console.log "ERROR: off the grid"
			  		  

	tupleToString = (row,col) ->
		row_name = '.row_' + row 
		col_name = '.col_' + col 
		row_name + ' ' + col_name


	snake = []
	head_row = sz-1
	head_col = 0

	food_row = null 
	food_col = null  

	dir = 2 # initialize direction to go to right

	isAtFood = ->
		if food_row == head_row and food_col == head_col
			console.log "AT FOOD"
			food = $(tupleToString(food_row, food_col))
			food.removeClass('food')
			[r,c] = generateFood()
			food = $(tupleToString(r,c)) 
			food.addClass('food')
			return true 
		else 
			return false 

	isAtSelf = -> 
		head = $(tupleToString(head_row, head_col))
		return head.hasClass('selected')

		

	# moves head to next square, given tuple of where to move to
	moveNextSquare = (nextHead) ->
		switch nextHead
			when null
				alert("YOU LOSE! STARTING NEW GAME...")
				location.reload();
				console.log "ERROR: off the grid"
			else 
	            [head_row,head_col] = nextHead  

	            head = $(tupleToString(head_row, head_col))

	            if isAtSelf()
	            	alert("YOU LOSE! STARTING NEW GAME...")
		            location.reload();
		            console.log "ERROR: collision with self"

	            head.addClass('selected')
	            snake.push({row: head_row, col: head_col})

	            # delete the tail, if not at food 
	            if not isAtFood()
		            tail_row = snake[0].row
		            tail_col = snake[0].col

		            tail = $(tupleToString(tail_row, tail_col))
		            tail.removeClass('selected')
		            snake.splice(0,1)


	generateFood = ->

		randCol = Math.floor(Math.random() * sz)
		randRow = Math.floor(Math.random() * sz)
		food_row = randRow
		food_col = randCol
		food = $(tupleToString(food_row, food_col))
		while food.hasClass('selected')
			randCol = Math.floor(Math.random() * sz)
			randRow = Math.floor(Math.random() * sz)
			food_row = randRow
			food_col = randCol
			food = $(tupleToString(food_row, food_col))
		return [randRow, randCol]

		# while true 
		# 	console.log "here"
		# 	randCol = Math.floor(Math.random() * sz)
		# 	randRow = Math.floor(Math.random() * sz)
		# 	food_row = randRow
		# 	food_col = randCol
		# 	notSnake = 1
		# 	for box in snake
		# 		if food_row == box.row and food_col == box.col 
		# 			console.log "true"
		# 			notSnake = 0
		# 	if notSnake == 1        
		# 		console.log "hereeeeeee"
		# 		return [randRow, randCol]

	# moveSnakeForward = ->
	# 	moveNextSquare( nextSquare(head_row,head_col,dir))
	# 	console.log "hi moving forward"

	setInterval () ->
        moveNextSquare( nextSquare(head_row,head_col,dir))
    , 200


	initializeSnake = ->
		head = $(tupleToString(head_row, head_col))
		head.addClass('selected')

		snake.push({row: head_row, col: head_col})
		console.log "snake", snake 

		[r,c] = generateFood()
		food = $(tupleToString(r,c))
		food.addClass('food')

		#console.log "HI"

		$(document).keydown( (e) ->
			#console.log "we are here"

		    switch e.which

		        # when 37 #then console.log "YOOOOO"  # left
		        #   switch nextSquare(row,col,0)
		        #     when null
		        #       console.log "ERROR: off the grid"
		        #     else 
		        #       [row,col] = nextSquare(row,col,0)
		        #       head = $(tupleToString(row,col))

		        when 37 #then break  # up
		          dir = 0
		          moveNextSquare( nextSquare(head_row,head_col,0))

		        when 38 #then break  # up
		          dir = 1
		          moveNextSquare( nextSquare(head_row,head_col,1))

		        when 39 #then break # right
		          dir = 2
		          moveNextSquare( nextSquare(head_row,head_col,2))

		        when 40 #then break # down
		          dir = 3
		          moveNextSquare( nextSquare(head_row,head_col,3))

		        else console.log "Non-arrow key pressed"

		        #default: return # exit this handler for other keys
		    #e.preventDefault() # prevent the default action (scroll / move caret)
		)

	makeGrid()
	initializeSnake()
	console.log nextSquare(sz-1,0,1)
	#$("body").append("<p>Hello world 2(js)</p>")
