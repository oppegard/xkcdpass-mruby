MRuby::Gem::Specification.new('xkcdpass-mruby') do |spec|
  spec.license = 'MIT'
  spec.author  = 'MRuby Developer'
  spec.summary = 'xkcdpass-mruby'
  spec.bins    = ['xkcdpass-mruby']

  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'
  spec.add_dependency 'mruby-io',    :mgem => 'mruby-io'
end
