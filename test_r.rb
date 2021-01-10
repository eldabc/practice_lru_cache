class LruCache  
 
  def initialize(size)   
    @size = size  
    @array = []
    @array_cache = []
  end  
 
  def put(key,value)
    push = false
 
    if @array.length == @size
      counts = Hash.new(0)
      @array_cache.each { |name| counts[name[:value]] += 1 }
      t = counts.min_by { |k,v| v }

      @array.delete_if {|elemento| elemento[:value] == t[0]}
      @array_cache = []
    end

    if @array.empty?
      push = true
    end

    @array.each do |n|
      @array_cache.push(key: n[:key], value: n[:value])
      if n[:key] == key 
        push = false
        break
      else
        push = true
      end
    end

    if push
      @array.push(key: key, value: value)
      @array_cache.push(key: key, value: value)
      puts @array
      puts "--------------------"
    end
  end  

  def get(key)
    not_found = false
    @array.each do |n|         
      if n[:key] == key 
        puts "Value Get key #{key} -> #{n[:value]} "
        not_found = false
        break
      else
        not_found = true 
      end
    end

    if not_found
      puts "Value Get key #{key} -> -1 "
    end
  end
end  

lru = LruCache.new(2)  
lru.put(1,1) #-> [1]
lru.put(2,2) #-> [1,2]
lru.get(1) #returns 1 
lru.put(3,3) #evicts key 2 -> [1,3]
lru.get(2) #returns -1 (not found)
lru.put(4,4) #evicts key 1 -> [3,4]
lru.get(1) #returns -1 (not found) -> [3,4]
lru.get(3) #returns 3 
lru.get(4) #returns 4 