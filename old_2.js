// Generated by CoffeeScript 1.10.0
"TODO: \n1. Detect a collision \n2. Restart when crashing into wall or collision \n3. Make the snake move forward at each step\n4. Introduce bits of food at random squares\n5. Make snake get longer after eating food \n6. Make it pretty ";
$(document).ready(function() {
  var food_col, food_row, generateFood, head_col, head_row, initializeSnake, isAtFood, makeGrid, moveNextSquare, nextSquare, snake, sz, tupleToString;
  $('form#intForm').submit(function() {
    return "elt1 = $('#int1').val()\nalert(elt1)\n\nvalues = [\n	$('#int1').val()\n	$('#int2').val()\n	$('#int3').val()\n]\n\n#alert(values[1])\n\nmaxValue = Math.max values...\n\n#alert(maxValue)\nconsole.log maxValue \n\npercents = [ 100.0* v / maxValue for v in values][0]\nconsole.log percents\nconsole.log percents[0]\n\n#$('#bar1').css(\"background-color\", \"yellow\")\n$('#bar1').css(\"width\", percents[0] + \"%\")\n$('#bar2').css(\"width\", percents[1] + \"%\")\n$('#bar3').css(\"width\", percents[2] + \"%\")\nfalse	";
  });
  sz = 10;
  makeGrid = function() {
    var body, box, col_plus_ind, i, j, k, l, ref, ref1, row, row_plus_ind;
    body = $('body');
    for (i = k = 0, ref = sz - 1; 0 <= ref ? k <= ref : k >= ref; i = 0 <= ref ? ++k : --k) {
      row_plus_ind = "row_" + i;
      row = $('<div>');
      row.addClass('row');
      row.addClass(row_plus_ind);
      body.append(row);
      for (j = l = 0, ref1 = sz - 1; 0 <= ref1 ? l <= ref1 : l >= ref1; j = 0 <= ref1 ? ++l : --l) {
        col_plus_ind = "col_" + j;
        box = $('<div>');
        box.addClass('box');
        box.addClass(col_plus_ind);
        row.append(box);
      }
    }
    return console.log("CALLED");
  };
  nextSquare = function(row, col, dir) {
    switch (dir) {
      case 0:
        if (col > 0) {
          return [row, col - 1];
        } else {
          return null;
        }
        break;
      case 1:
        if (row > 0) {
          return [row - 1, col];
        } else {
          return null;
        }
        break;
      case 2:
        if (col < sz - 1) {
          return [row, col + 1];
        } else {
          return null;
        }
        break;
      case 3:
        if (row < sz - 1) {
          return [row + 1, col];
        } else {
          return null;
        }
    }
  };
  tupleToString = function(row, col) {
    var col_name, row_name;
    row_name = '.row_' + row;
    col_name = '.col_' + col;
    return row_name + ' ' + col_name;
  };
  snake = [];
  head_row = sz - 1;
  head_col = 0;
  food_row = null;
  food_col = null;
  isAtFood = function() {
    var c, food, r, ref;
    if (food_row === head_row && food_col === head_col) {
      console.log("AT FOOD");
      food = $(tupleToString(food_row, food_col));
      food.removeClass('food');
      ref = generateFood(), r = ref[0], c = ref[1];
      food = $(tupleToString(r, c));
      food.addClass('food');
      return true;
    } else {
      return false;
    }
  };
  moveNextSquare = function(nextHead) {
    var head, tail, tail_col, tail_row;
    switch (nextHead) {
      case null:
        return console.log("ERROR: off the grid");
      default:
        head_row = nextHead[0], head_col = nextHead[1];
        head = $(tupleToString(head_row, head_col));
        head.addClass('selected');
        snake.push({
          row: head_row,
          col: head_col
        });
        if (!isAtFood()) {
          tail_row = snake[0].row;
          tail_col = snake[0].col;
          tail = $(tupleToString(tail_row, tail_col));
          tail.removeClass('selected');
          return snake.splice(0, 1);
        }
    }
  };
  generateFood = function() {
    return food_col = Math.floor(Math.random() * sz);
  };
  food_row = Math.floor(Math.random() * sz);
  return [food_row, food_col];
  initializeSnake = function() {
    var c, food, head, r, ref;
    head = $(tupleToString(head_row, head_col));
    head.addClass('selected');
    snake.push({
      row: head_row,
      col: head_col
    });
    ref = generateFood(), r = ref[0], c = ref[1];
    food = $(tupleToString(r, c));
    food.addClass('food');
    return $(document).keydown(function(e) {
      switch (e.which) {
        case 37:
          return moveNextSquare(nextSquare(head_row, head_col, 0));
        case 38:
          return moveNextSquare(nextSquare(head_row, head_col, 1));
        case 39:
          return moveNextSquare(nextSquare(head_row, head_col, 2));
        case 40:
          return moveNextSquare(nextSquare(head_row, head_col, 3));
        default:
          return console.log("Non-arrow key pressed");
      }
    });
  };
  console.log("BEFORE MAKEGRID");
  makeGrid();
  initializeSnake();
  return console.log(nextSquare(sz - 1, 0, 1));
});
