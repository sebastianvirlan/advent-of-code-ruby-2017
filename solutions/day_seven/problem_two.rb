# frozen_string_literal: true

# Being the following list
#
# pbga (66)
# xhth (57)
# ebii (61)
# havc (66)
# ktlj (57)
# fwft (72) -> ktlj, cntj, xhth
# qoyq (66)
# padx (45) -> pbga, havc, qoyq
# tknk (41) -> ugml, padx, fwft
# jptl (61)
# ugml (68) -> gyxo, ebii, jptl
# gyxo (61)
# cntj (57)
#
# You would be able to recreate the structure of the towers that looks like this:
#                  gyxo
#                 /
#           ugml  - ebii
#         /       \
#        |         jptl
#        |
#        |         pbga
#      /          /
# tknk ---  padx - havc
#      \          \
#        \         qoyq
#        |
#        |         ktlj
#         \       /
#           fwft - cntj
#                 \
#                 xhth

# The programs explain the situation: they can't get down. Rather, they could get down, if they weren't expending all
# of their energy trying to keep the tower balanced. Apparently, one program has the wrong weight, and until it's fixed,
# they're stuck here.

# For any program holding a disc, each program standing on that disc forms a sub-tower. Each of those sub-towers are
# supposed to be the same weight, or the disc itself isn't balanced. The weight of a tower is the sum of the weights of
# the programs in that tower.

# In the example above, this means that for ugml's disc to be balanced, gyxo, ebii, and jptl must all have the same
# weight, and they do: 61.

# However, for tknk to be balanced, each of the programs standing on its disc and all programs above it must each match.
# This means that the following sums must all be the same:

# - ugml + (gyxo + ebii + jptl) = 68 + (61 + 61 + 61) = 251
# - padx + (pbga + havc + qoyq) = 45 + (66 + 66 + 66) = 243
# - fwft + (ktlj + cntj + xhth) = 72 + (57 + 57 + 57) = 243

# As you can see, tknk's disc is unbalanced: ugml's stack is heavier than the other two. Even though the nodes above
# ugml are balanced, ugml itself is too heavy: it needs to be 8 units lighter for its stack to weigh 243 and keep the
# towers balanced. If this change were made, its weight would be 60.

# Input: http://adventofcode.com/2017/day/7/input
# Given that exactly one program is the wrong weight, what would its weight need to be to balance the entire tower?

require_relative('base.rb')
require_relative('tower.rb')

module DaySeven
  class ProblemTwo < Base
    def initialize(input)
      @input = input
    end

    def resolve
      Tower.new(input_map).wrong_balance_program
    end
  end
end
