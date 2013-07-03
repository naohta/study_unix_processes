message = 'Good Morning'
recipient = 'tree@mybackyard.com'

pid = fork do
  StatsCollector.record message, recipient
end

Process.detach(pid)

