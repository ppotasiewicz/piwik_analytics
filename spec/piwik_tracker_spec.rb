require 'piwik_analytics/piwik_tracker'

describe PiwikAnalytics::PiwikTracker do
  before(:each) do
    @obj = PiwikAnalytics::PiwikTracker.new
  end
  context "setters" do
    it 'should have document_title setter' do
      @obj.should respond_to :document_title

      @obj.document_title="foo"
      @obj.document_title.should eq "foo"
    end
  end
end
