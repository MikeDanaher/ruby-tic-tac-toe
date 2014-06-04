module GameConfig

  def self.options_3x3
    options = {
                :size           => 9,
                :number_of_rows => 3,
                :winning_rows   => [ [0, 1, 2],
                                     [3, 4, 5],
                                     [6, 7, 8],
                                     [0, 3, 6],
                                     [1, 4, 7],
                                     [2, 5, 8],
                                     [0, 4, 8],
                                     [2, 4, 6] ]
              }
  end

end
