class Image

  def initialize(list_of_numbers)
    @list_of_numbers = list_of_numbers
    for row in list_of_numbers do
      puts(row.join(" "))
    end
    
  end

  def find_one()
    array_clone = Marshal.load(Marshal.dump(@list_of_numbers))
    i = 0
     
    for row in @list_of_numbers do
      j = 0
     
      #do something to each row
      print(row,"\n")
      for number in row do
        #print("[",i,"][",j,"]\n")
        if number == 1
          print("found a one @[",i,"][",j,"]\n")

          if i != 0
            array_clone[i - 1][j] = 1
          end
          if i != @list_of_numbers.length - 1
            array_clone[i + 1][j] = 1
          end
          if j != 0
            array_clone[i][j - 1] = 1
          end
          if j != @list_of_numbers.length - 1
            array_clone[i][j + 1] = 1
          end

        end
        j += 1
      end
      i += 1
    end
    @list_of_numbers = array_clone
    print @list_of_numbers
  end

end

image = Image.new([
  [0,0,0,0],
  [0,1,0,0],
  [0,0,0,1],
  [0,0,0,0]
])
image.find_one()