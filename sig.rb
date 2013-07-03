child_processes = 23
dead_processes = 0

child_processes.times do
  fork do
    r = rand(10)
    puts "[CHLD]I'm #{Process.pid}, will sleep #{r} sec."
    sleep r
    abort "[CHLD]I'm #{Process.pid}. I was aborted."
  end
end

trap(:CHLD) do
  dead_processes += 1
  puts "[Parent]Detect signal! #{Process.wait} is dead. [#{dead_processes}] deads"
  abort "[Parent] Parent was aborted." if dead_processes == child_processes
end

#Parent process do large computing
loop do
  #puts "Result is [#{(Math.sqrt(rand(44)) ** 8).floor}]"
  print "(*)"
  (Math.sqrt(rand(44)) ** 8).floor
  sleep 0.7
end
