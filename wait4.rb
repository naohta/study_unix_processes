favourite = fork do
  sleep 3
  exit 77
end

middle_child = fork do
  sleep 5
  abort "I want to be waited on!"
end

pid, status = Process.waitpid2 favourite
puts status.exitstatus
