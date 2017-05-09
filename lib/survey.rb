class Survey < ActiveRecord::Base
  has_many :questions
  before_save :capitalize_words

  private

  def capitalize_words
    self.name = name.split.map {|word| word.capitalize}.join(" ")
  end
end


class Question < ActiveRecord::Base
  belongs_to :survey
end
