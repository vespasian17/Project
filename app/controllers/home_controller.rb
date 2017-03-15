class HomeController < ApplicationController
  def index
      @instruction = Instruction.all
  end
end
