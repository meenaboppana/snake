	# moveNextSquare = (nextHead) ->
 #        switch nextHead
 #          when null
 #            alert("YOU LOSE! STARTING NEW GAME...")
 #            location.reload();
 #            console.log "ERROR: off the grid"
 #          else 
 #            [head_row,head_col] = nextHead  

 #            #new_obj = {row: head_row, col: head_col}

	# 		#for i in [0..snake.length-1]
	# 		# console.log "snake length",snake.length  
	# 		#console.log snake
	# 		# console.log "snake[0]",snake[0]   
	# 		# i = 0
	# 		# if snake[0].row == head_row and snake[0].col == head_col
	# 		# 	alert("yay")

	# 		# console.log "snake", snake[0] 
	# 		# console.log "snake", snake[1]
	# 		# console.log "snake", snake[2]
	# 		# console.log "snake", snake[3]   
	# 		# console.log "object", {row: head_row, col: head_col} 

	# 		head = $(tupleToString(head_row, head_col))
	# 		head.addClass('selected')
	# 		snake.push({row: head_row, col: head_col})

 #            # delete the tail, if not at food 
	# 		if not isAtFood()
	#             tail_row = snake[0].row
	#             tail_col = snake[0].col

	#             tail = $(tupleToString(tail_row, tail_col))
	#             tail.removeClass('selected')
	#             snake.splice(0,1)
           