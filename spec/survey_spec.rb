require "spec_helper"

describe Survey do
  it("converts the name to capitalized") do
      survey = Survey.create({:name => "the silly monkey"})
      expect(survey.name()).to(eq("The Silly Monkey"))
  end

end
