#!/usr/bin/ruby

puts (5..6).flat_map{|n| %w[g a b o r].to_a.permutation.map(&:join)}
