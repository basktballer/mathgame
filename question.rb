class Question

  attr_reader :var1, :var2, :operator

  def initialize(player)
    @player = player
    @var1 = rand(1..9)
    @var2 = rand(1..9)
    @operator = :+
  end

  def question
    "#{@player}: What does #{@var1} plus #{@var2} equal?"
  end

  def check_answer(ans)
    ans != @var1 + @var2
  end

end