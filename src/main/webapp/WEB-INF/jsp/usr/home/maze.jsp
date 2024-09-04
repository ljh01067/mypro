<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<title>Document</title>

<div id ="maze-container">
<div id="maze"></div>

<button id="btn">무작위 미로 생성</button>
</div>

</div>
<style>
body {
  margin: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background-color: #f0f0f0;
  overflow: hidden;
}
div[class~="block"] {
  width: 15px;
  height: 15px;
  position: absolute;
}
.black {
  background-color: black;
}
.white {
  background-color: white;
}
.red {
  background-color: red;
  z-index: 2;
}
.blue {
  background-color: blue;
}
#maze {
  width: 100%;
  height: 100%;
  position: relative;
}
#maze-container {
  position: relative;
  width: 345px;
  height: 345px;
}
.left {
  left: 15px;
}
.right {
  right: 15px;
}
</style>
<script>
$(document).ready(function () {
	  var wall = "-1",
	    start = "0",
	    end = "1",
	    empty = "2";
	  var maze;
	  var mazeSize = 10;

	  function setMaze(size) {
	    var maze,
	      visited,
	      i,
	      j,
	      width = size * 2 + 3,
	      height = size * 2 + 3;
	    maze = new Array(height);
	    visited = new Array(height);
	    for (i = 0; i < height; i++) {
	      maze[i] = new Array(width);
	      visited[i] = new Array(width);
	    }
	    for (i = 0; i < height; i++) {
	      for (j = 0; j < width; j++) {
	        maze[i][j] = wall;
	        visited[i][j] = false;
	      }
	    }
	    // 시작점 좌표 (1,1)
	    DFS(maze, visited, 1, 1);
	    return maze;
	  }

	  function DFS(maze, visited, y, x) {
	    maze[y][x] = start;
	    visited[y][x] = true;
	    subDFS(maze, visited, y, x);
	    // 끝점 좌표는 미로의 최우하단
	    maze[maze.length - 2][maze.length - 2] = end;
	  }

	  function subDFS(maze, visited, y, x) {
	                var directions = [0, 1, 2, 3];
	                directions.sort(function() { return 0.5 - Math.random(); });

	                var dx = [-2, 2, 0, 0],
	                    dy = [0, 0, -2, 2],
	                    wx = [-1, 1, 0, 0],
	                    wy = [0, 0, -1, 1];

	                for (var i = 0; i < 4; i++) {
	                    var dir = directions[i];
	                    var newY = y + dy[dir];
	                    var newX = x + dx[dir];
	                    if (newY > 0 && newY < maze.length - 1 && newX > 0 && newX < maze[0].length - 1 && !visited[newY][newX]) {
	                        maze[newY][newX] = empty;
	                        maze[y + wy[dir]][x + wx[dir]] = empty;
	                        visited[newY][newX] = true;
	                        visited[y + wy[dir]][x + wx[dir]] = true;
	                        subDFS(maze, visited, newY, newX);
	                    }
	                }
	            }

	            function printMaze(maze) {
	                $("#maze").empty();
	                for (var i = 0; i < maze.length; i++) {
	                    for (var j = 0; j < maze[i].length; j++) {
	                        var className = "white";
	                        if (maze[i][j] == wall) className = "black obstacle";
	                        else if (maze[i][j] == start) className = "red";
	                        else if (maze[i][j] == end) className = "blue";
	                        $("#maze").append(
	                            "<div class='block " +
	                            className +
	                            "' style='top: " +
	                            i * 15 +
	                            "px; left: " +
	                            j * 15 +
	                            "px;'></div>"
	                        );
	                    }
	                }
	            }

	            function resetMaze() {
	                maze = setMaze(mazeSize);
	                printMaze(maze);
	            }

	            $("#btn").on("click", function () {
	                resetMaze();
	            });

	            document.addEventListener("keydown", function (e) {
	                var redBlock = $(".red");
	                var currentTop = parseInt(redBlock.css("top"));
	                var currentLeft = parseInt(redBlock.css("left"));
	                var blockSize = 15;
	                var newTop = currentTop;
	                var newLeft = currentLeft;

	                if (e.keyCode == 37) { // 왼쪽
	                    newLeft = currentLeft - blockSize;
	                } else if (e.keyCode == 38) { // 위쪽
	                    newTop = currentTop - blockSize;
	                } else if (e.keyCode == 39) { // 오른쪽
	                    newLeft = currentLeft + blockSize;
	                } else if (e.keyCode == 40) { // 아래쪽
	                    newTop = currentTop + blockSize;
	                }

	                var mazeY = newTop / blockSize;
	                var mazeX = newLeft / blockSize;

	                // 벽인지 검사
	                if (maze[mazeY][mazeX] != wall) {
	                    redBlock.css({ top: newTop + "px", left: newLeft + "px" });
	                }
	            });

	  // 초기 상태로 설정
	  resetMaze();
	});

</script>
</body>
</html>