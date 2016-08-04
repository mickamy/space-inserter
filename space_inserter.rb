def read_file(path)
  lines = []
  begin
    File.open(path) do |file|
      file.read.split("\n").each do |line|
        lines << line
      end
    end
  end
  lines
  rescue SystemCallError => e
    puts %Q(class=[#{e.class}] message=[#{e.message}])
  rescue IOError => e
    puts %Q(class=[#{e.class}] message=[#{e.message}])
end

def write_file(path, lines, ask)

  regxp = /[a-z|A-Z][^\x01-\x7E]|[^\x01-\x7E][a-z|A-Z]/

  begin
    File.open(path, 'w') do |file|
      lines.each do |line|
        text = convert(line, regxp, ask)
        file.puts text
      end
    end
  end
  rescue SystemCallError => e
    puts %Q(class=[#{e.class}] message=[#{e.message}])
  rescue IOError => e
    puts %Q(class=[#{e.class}] message=[#{e.message}])
end

def convert(text, regxp, ask)
  before = text
  index = text =~ regxp
  while index
    last_i = index
    replaced = text.clone.insert(index + 1, ' ')

    if ask
      puts text
      puts replaced
      print 'Looks better? [y/n]: '
      user_input = gets.gsub("\n", '')
    else
      user_input = 'y'
    end

    if user_input == 'y'
      text = replaced
      last_i += 1
    elsif user_input == 'n'
    else
      puts
      puts 'Must be y or n!'
      puts
      next
    end
    index = text =~ regxp
    if last_i == index
      break
    end
  end
  puts "Before: #{before}"
  puts "After:  #{text}"
  text
end

mode = ''
ask = true

until mode == 'y' || mode == 'n'
  print '半角スペースを挿入するたびに確認しますか？ [y/n]: '
  mode = gets.gsub("\n", '')
  if mode == 'y'
    ask = true
  elsif mode == 'n'
    ask = false
  else
    puts
    puts 'Must be y or n!'
    puts
  end
end

lines = read_file 'input.txt'
write_file('output.txt', lines, ask)