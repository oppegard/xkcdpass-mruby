def __main__(argv)
  if argv[1] == "version"
    puts "v#{XkcdpassMruby::VERSION}"
  else
    password = [
      XkcdpassMruby::ADJVS.sample,
      XkcdpassMruby::NOUNS.sample,
      XkcdpassMruby::ADJVS.sample,
      XkcdpassMruby::VERBS.sample
    ].join('-')
    puts password
  end
end
