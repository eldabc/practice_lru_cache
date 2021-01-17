def num_islands(grid)
  return 0 if grid.nil? or grid.empty? or grid[0].nil? or grid[0].empty?
  num_islands = 0
  (0...grid.size).each do |f|
      (0...grid[0].size).each do |c|
          next if grid[f][c] != '1'
          bfs(grid, f, c)
          num_islands += 1
      end
  end
  puts num_islands
end

def bfs(grid, f, c)
  queue = [[f, c]]
  while cur = queue.shift
      grid[cur[0]][cur[1]] = '0'
      if cur[0] - 1 >= 0 and grid[cur[0] - 1][cur[1]] == '1'
          queue.push([cur[0] - 1, cur[1]])
          grid[cur[0] - 1][cur[1]] = '0'
      end
      if cur[0] + 1 < grid.size and grid[cur[0] + 1][cur[1]] == '1'
          queue.push([cur[0] + 1, cur[1]])
          grid[cur[0] + 1][cur[1]] = '0'
      end
      if cur[1] - 1 >= 0 and grid[cur[0]][cur[1] - 1] == '1'
          queue.push([cur[0], cur[1] - 1])
          grid[cur[0]][cur[1] - 1] = '0'
      end
      if cur[1] + 1 < grid[0].size and grid[cur[0]][cur[1] + 1] == '1'
          queue.push([cur[0], cur[1] + 1])
          grid[cur[0]][cur[1] + 1] = '0'
      end
  end
end

grid = [
	["1","1","1","1","0"],
	["1","1","0","1","0"],
	["1","1","0","0","0"],
	["0","0","0","0","0"]
]

num_islands(grid)