class Image

  def initialize(array)
    @image = array
  end

  def output_image
    @image.each do |x|
      puts x.join
    end
  end

  def blur!(distance=1)
    distance.times do
      blur_y!
    end
  end

  private

    def blur_y!
      blur_y = []
      @image.each_with_index do |row, i|
        row.each_with_index do |z, row_i|
          blur_y << [i, row_i] if z == 1
        end
      end

      blur_y.each do |y|
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
image.blur!(1)
image.output_image