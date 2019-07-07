class Image

  def initialize(array)
    @image = array
  end

  def output_image
    @image.each do |x|
      puts x.join
    end
  end

  def blur!
    blur = []
    @image.each_with_index do |row, i|
      row.each_with_index do |z, row_i|
        blur << [i, row_i] if z == 1
      end
    end

    blur.each do |y|
      @image[y[0]][y[1] + 1] = 1 if y[1] + 1 <= @image[y[0]].length - 1
      @image[y[0]][y[1] - 1] = 1 if y[1] - 1 >= 0
      @image[y[0] + 1][y[1]] = 1 if y[0] + 1 <= @image.length - 1
      @image[y[0] - 1][y[1]] = 1 if y[0] - 1 >= 0
    end
  end

end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])
image.blur!
image.output_image