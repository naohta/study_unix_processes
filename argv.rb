p "# whole"
p ARGV

p "# --help option"
p ARGV.include?('--help')

p "# -c option"
p ARGV.include?('-c') && ARGV[ARGV.index('-c')+1]
