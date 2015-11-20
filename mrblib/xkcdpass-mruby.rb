def __main__(argv)
  if argv[1] == "version"
    puts "v#{XkcdpassMruby::VERSION}"
  else
    # File.open('words') do |words_file|
    #   words = words_file.readlines
      puts XkcdpassMruby::WORDS.sample(4).map {|word| word.chomp}.join('-').downcase
    # end
  end
end
