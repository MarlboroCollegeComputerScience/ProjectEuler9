# euler9.rb
#
#  $ time ruby euler9.rb
#  (a,b,c)=200,375,425; a*b*c = 31875000 
#  user 0m0.724s
#
# Jim Mahoney | cs.marlboro.edu | April 2014 | MIT License

def pythagorean(a,b,c)
  return a*a + b*b == c*c
end

def search(perimeter)
  (1 .. perimeter).each do |a|
    ((1+a) .. perimeter).each do |b|
      c = perimeter - a - b
      if a < b and c > 0 and pythagorean(a,b,c) then
        return [a, b, c]
      end
    end
  end
end

def answer(perimeter)
  abc = search perimeter
  product = abc.inject(:*)
  return "(a,b,c)=#{ abc.join(',') }; a*b*c = #{ product } \n"
end

print( answer 1000 )
