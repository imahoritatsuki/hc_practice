class RandomGroup
  MEMBERS = ["A", "B", "C", "D", "E", "F"].freeze

  def split_two_group
    first_group = generate_first_group
    second_group = generate_second_group(first_group)
    p first_group
    p second_group
  end

  def generate_first_group
    first_group_size = rand(2..3)
    MEMBERS.sample(first_group_size).sort
  end

  def generate_second_group(first_group)
    MEMBERS - first_group
  end
end

result = RandomGroup.new
result.split_two_group
