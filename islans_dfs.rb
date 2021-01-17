def num_islands(grid)
  return 0 if grid.nil? or grid.empty? or grid[0].nil? or grid[0].empty?
  num_islands = 0
  (0...grid.size).each do |f|
      (0...grid[0].size).each do |c|
          next if grid[f][c] != '1'
          dfs(grid, f, c)
          num_islands += 1
      end
  end
  puts num_islands
end

def dfs(grid, f, c)
  return if f < 0 or f >= grid.size or c < 0 or c >= grid[0].size or grid[f][c] == '0'
  grid[f][c] = '0'
  dfs(grid, f - 1, c)
  dfs(grid, f + 1, c)
  dfs(grid, f, c - 1)
  dfs(grid, f, c + 1)
end

grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
num_islands(grid)