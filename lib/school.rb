require 'pry'

class School
  attr_accessor :roster, :studentname, :grade
  attr_reader #:roster

  def initialize(school)
    @school = school
    @roster = {} #our hash
  end

  def add_student(studentname, grade)
    @studentname = studentname #our hash value
    @grade = grade #our hash key
    roster[@grade] ||= [] #can't push a value into an array whose key that doesn't exist yet, so must first create the new key and point it to an empty array...
    ##note: ||= above is the OR Equal which in this context means: if roster[@grade] has a value leave it, otherwise set the value to [] (i think)
    ##note: a ||= b is equivalent to a || a = b (whatever that means)
    roster[@grade].push(@studentname) #then push the new value into the array
  end
  #
  # def initialize(brand)
  #   BRANDS << brand ###this needs to be here, in the initialize(brand) method
  #   @brand = brand
  #   BRANDS.uniq!
  # end
  #
  # def cobble
  #   puts "Your shoe is as good as new!"
  #   self.condition = "new"
  # end
  #
  def school=(school)
    @school = school
  end

  def grade(grade)
    roster.each do |key, value|
      if key == grade
        return value #this works, tried with select but couldn't get just the value
        #binding.pry
      end #end if statement
    end #end do loop
  end #end method

  # def grade(grade)
  #   roster.select do |key, value|
  #     key == grade #this returns correct key/value, bu want just the value...
  #       binding.pry
  #     #end #end if statement
  #   end #end do loop
  # end #end method

  # def sort
  #   # results = roster.sort_by do |item|
  #   #   item[@studentname]
  #   #sorted = []
  #   #h.sort_by {|k, v| [v, k] }
  #   #roster.sort_by {|v, k| [k, v] }
  #   #roster.sort_by(&:reverse)
  #   roster.sort_by {|value, key| value }.sort
  #   # roster.each do |key, value|
  #   #   sorted << value.sort
  #   #   end
  #   #   sorted.sort
  #   end

  #hash.sort_by { |k, v|  v.length }
  #roster.sort_by { |k, v| v }.to_h
  #@friends.sort!{|a,b| a['name']<=>b['name']}
  #sort = roster.sort{|a,b| a['@studentname']<=>b['@studentname']}

  # def sort
  #   # results = roster.sort_by do |item|
  #   #   item[@studentname]
  #   sorted = []
    #roster.sort_by { |value, key| value
    #roster.sort_by { |a, b| b[1] <=> a[1] }
    #roster.sort { |a, b| a[1] <=> b[1] }
    #properties.sort_by! { |p| p[:legal_description] }
    #roster.sort_by! { |p| p[studentname] }
    #roster.sort_by {|k, v| [v] }
    #h.sort_by {|k, v| [v, k] }
    #roster.sort_by {|v, k| [k, v] }
    #roster.sort_by(&:reverse)
#    roster.sort_by {|value, key| value }.sort
    # roster.collect do |key, value|
    #   #sorted <<
    #   key[value].sort
    #   end
      #sorted.sort
    #end


  #   def sort
  #     roster.sort do |a,b|
  #     # a and b are two element arrays in the format [key,value]
  #     value_comparison = a.last <=> b.last
  #     if value_comparison.zero?
  #       # compare keys if values are equal
  #       a.first <=> b.first
  #     else
  #       value_comparison
  #     end
  #   end
  # end
    # => [['have',3],['those',5],['the',6],['we',6]]



    def sort
      sorted = {}
      roster.each do |grades, students|
        sorted[grades] = students.sort
      end
      sorted
    end

end #end class
