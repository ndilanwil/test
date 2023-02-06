require 'io/console'
require 'run/version'
require 'yaml'

class RunError < StandardError; end

class Array
  def average
    (reduce(:+).to_f/size).round(2)
  end
end

module Run
  extend self

  def race(args)
    help if !(args & %w[-h --help]).empty?

    parse_options(args) unless args.empty?

    @max_length||=4000

    @eot=0x03
    @eof=0x04

    if quotes.empty?
      puts "No quotes with less than #{@max_length} characters found"
      exit
    end

    @color="\e[4;32m"
    @no_color="\e[m"

    @lines=quotes[rand(quotes.size)].chars.each_slice(term_width).map(&:join)
    @line=0
    @pos=0

    # average length of English words
    @word_length=5

    @start_time=time
    print_text

    loop do
      update_text
      break if @line==@lines.size-1 and pos==@lines.last.size
    end

    save_wpm
    puts "\nWPM: #{wpm}"
  end

  def help
    puts <<~eof
    Usage: run

    Options:
      -h: show this message
      -s: print stats
      -l: message length [1: short, 2: medium, 3: long]
      -q: print quotes.yml path
    eof
    exit
  end

  def parse_options(args)
    if args.first=='-s'
      stats
      exit
    end

    if args.first=='-q'
      puts quotes_file
      exit
    end

    if args.shift=='-l' and args.first.to_i > 0
      @max_length=args.first.to_i
      return
    end

    puts "Unknown option"
    bye
  rescue => e
    "Bad options. For help: `run -h`"
    exit
  end

  def stats
    str=File.open(wpm_file).read
    scores=str.split(" ").map(&:to_i).select.with_index{|e,i| i.odd?}
    puts "Number of races: #{str.count("\n")}"
    puts "Average speed: #{scores.average}WPM"
  end

  def time
    Time.now.to_i
  end

  def wpm
    @lines.join(' ').size*60/((time-@start_time)*@word_length)
  end

  def wpm_file
    "#{ENV['HOME']}/.wpm_history"
  end

  def save_wpm
    open(wpm_file,'a') do |f|
      f.puts "#{Time.now.strftime("%Y-%M-%d")} #{wpm}"
    end
  end

  def quotes
    YAML.load(open(quotes_file))
        .sort_by(&:length)
        .select {|e| e.size<@max_length}
  rescue => e
    "Error while reading #{quotes_file}"
  end

  def quotes_file
    "#{__dir__}/run/quotes.yml"
  end

  def print_text
    print "\r"+text.sub(/(.{#{pos}})/,"#{@color}\\1#{@no_color}")+"\r"
  end

  # width of the terminal
  def term_width
    IO.console.winsize.last
  end

  def update_text
    system('stty raw -echo')
    c=STDIN.getc
    bye if c==@eof.chr or c==@eot.chr
    carriage_return if @pos>=term_width-1
    @pos+=1 if c==text[pos]
  ensure
    system('stty -raw echo')
    print_text
  end

  def carriage_return
    @pos=0
    @line+=1
  end

  def text
    @lines[@line]
  end

  def pos
    @pos
  end

  def bye
    puts "\nBye"
    exit
  end
end
