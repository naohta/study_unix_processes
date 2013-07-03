fork do
  10.downto(1){puts "I'm a child. #{Process.pid}"}
end
333.downto(301){puts "I'm a parent. #{Process.pid}"}

