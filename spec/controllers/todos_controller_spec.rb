require 'spec_helper'

describe TodosController do

  describe "#new" do
    context "successfully shows the new form" do
      specify do
        get :new
      end
    end
  end

end
