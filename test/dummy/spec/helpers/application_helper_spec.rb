require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the WelcomeHelper. For example:
#
# describe WelcomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  it { expect(helper).to be_is_a ActionAuthorizer::Helper }
end