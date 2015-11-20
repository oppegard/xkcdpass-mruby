#!/usr/bin/env ruby
support_dir = File.dirname(__FILE__)
# Unofficial Alternate 12Dicts Package
words_path  = File.join(support_dir, '2of12id.txt')
words_file  = File.open(words_path)

words_by_type = Hash.new([])

words_file.each_line do |line|
  # Remove explanations: {word}
  line.gsub! /\{.+?\}/, ''

  # Remove unneeded characters: (,),-,~,|
  line.tr! '()~|-', ''

  # Match ad{verbs,jectives}, nouns, and verbs
  line.match /\s+(?'word_type'[ANV]):\s+/ do |match_data|
    words_by_type[match_data['word_type']] += match_data.pre_match.split
    words_by_type[match_data['word_type']] += match_data.post_match.split
  end
end

words_file.close

File.open(File.join(support_dir, 'words.rb'), 'w') do |words_rb_file|
  words_rb_file.write("module XkcdpassMruby")

  {'ADJVS' => 'A', 'NOUNS' => 'N', 'VERBS' => 'V'}.each_pair do |word_type,hash_key|
    words_rb_file.write("\n  #{word_type} = %w{\n    ")
    words_rb_file.write(words_by_type[hash_key].uniq!.join(",\n    "))
    words_rb_file.write("\n  }\n")
  end

  words_rb_file.write("end\n")
end
