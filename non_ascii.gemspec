Gem::Specification.new do |s|
  s.name = "non_ascii"
  s.version = 0.1.0
  s.authors = ["Viacheslav Ptsarev"]
  s.email = ["leemour@gmail.com"]
  s.homepage = "https://github.com/leemour/non_ascii"
  s.licenses = ["MIT"]
  s.summary = %q{Find non-ASCII characters in files}
  s.description = %q{Command line tool that outputs lines in files with non-ASCII characters highlighted}
  s.date = "2013-12-14"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end