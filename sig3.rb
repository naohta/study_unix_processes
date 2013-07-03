child_processes = 99999999923
dead_processes = 0

child_processes.times do
  fork do
    r = rand(10)
    puts "[CHLD]I'm #{Process.pid}, will sleep #{r} sec."
    sleep r
    abort "[CHLD]I'm #{Process.pid}. I was aborted."
  end
end

$stdout.sync = true
trap(:CHLD) do
  begin
    while pid = Process.wait(-1, Process::WNOHANG)
      dead_processes += 1
      puts "[Parent]Detect signal! #{pid} is dead. [#{dead_processes}] deads"
      abort "[Parent] Parent was aborted." if dead_processes == child_processes
    end
  rescue Errno::ECHILD
  end
end

#Parent process do large computing
loop do
  #puts "Result is [#{(Math.sqrt(rand(44)) ** 8).floor}]"
  print "(*)"
  (Math.sqrt(rand(44)) ** 8).floor
  sleep 0.7
end
