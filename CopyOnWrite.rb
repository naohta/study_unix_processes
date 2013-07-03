arr = [1,2,3]

fork do
  p arr
  arr << 4
  p arr
end
