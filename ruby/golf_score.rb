class GolfScore

  def initialize
    @input = STDIN.read
  end

  def process_scores
    input_to_array
    split_to_two_array
    differences_par_and_hits
  end

  def output
    naming_score
  end

  private

  def input_to_array
    splited_input = @input.split("\n")
    @arrayed_input = splited_input.map do |s|
      s.split(",").map(&:to_i)
    end
  end

  def split_to_two_array
    @par_each_hole = @arrayed_input[0]
    @hits_each_hole = @arrayed_input[1]
  end

  def differences_par_and_hits
    @scores_each_hole = @par_each_hole.each_with_index.map do |par, index|
      @hits_each_hole[index] - par
    end
  end

  def naming_score
    count = 0
    named_scores = []
    @scores_each_hole.each do |score|
      case 
      when @hits_each_hole[count] == 1 && @par_each_hole[count] != 5
        named_scores << "ホールインワン"
      when score == -4
        named_scores << "コンドル"
      when score == -3
        named_scores << "アルバトロス"
      when score == -2
        named_scores << "イーグル"
      when score == -1
        named_scores << "バーディ"
      when score == 0
        named_scores << "パー"
      when score == 1
        named_scores << "ボギー"
      when score >= 2
        named_scores << "#{score}ボギー"
      end
      count += 1
    end 
    named_scores.join(",")
  end
end


golf_score = GolfScore.new
golf_score.process_scores
puts golf_score.output