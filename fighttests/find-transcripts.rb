#!/usr/bin/env ruby
#

def transcripts_from_file(fh)
  fh.each_line do |line|
    if line =~ (/Fight test (\S+) summary:/)
      Dir.glob("transcripts/#{$1}*.transcript").each do |path|
        puts path
      end
    end
  end
end

files = ARGV

if files.size==0
  transcripts_from_file($stdin)
else
  files.each do |file|
    transcripts_from_file(File.open(file))
  end
end
