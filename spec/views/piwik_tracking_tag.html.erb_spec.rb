require "erb"
require "piwik_analytics"

describe "views/piwik_tracking_tag.html.erb" do
  let(:url) { nil }
  let(:id_site) { nil }
  let(:tracker) { PiwikAnalytics.piwik_tracker }

  before(:each) do
    filename = File.join(File.dirname(__FILE__), '..', '..', 'app', 'views', 'piwik_analytics', 'piwik_tracking_tag.html.erb')
    @template = ERB.new(File.read(filename))
  end

  it "should render url" do
    url = "example.com"
    @template.result(binding).should =~ /http:\/\/example.com/
  end

  it "should render id_site" do
    id_site = 4
    @template.result(binding).should =~ /"piwik\.php", 4/
  end

  context "tracker" do
    before(:each) do
      @tracker = PiwikAnalytics.piwik_tracker
    end
    context "document title is set" do
      before(:each) do
        @tracker.document_title = "FooBar"
      end
      it "should render document_title" do
        # Usually the render-helper calls this and passes along to render
        tracker = PiwikAnalytics.piwik_tracker
        @template.result(binding).should =~ /piwikTracker\.setDocumentTitle\("FooBar"\);/
      end
    end

    context "document title is not set" do
      before(:each) do
        @tracker.document_title = nil
      end
      it 'should not render dociment_title' do
        tracker = PiwikAnalytics.piwik_tracker
        @template.result(binding).should_not =~ /setDocumentTitle/
      end
    end

    context "goal is set" do
      it 'should render simple goal' do
        @tracker.goal = 7
        tracker = PiwikAnalytics.piwik_tracker
        @template.result(binding).should =~ /piwikTracker\.trackGoal\(7\);/
      end
      it 'should render a goal with custom revenue' do
        @tracker.goal = {:id => 7, :price => 123}
        tracker = PiwikAnalytics.piwik_tracker
        @template.result(binding).should =~ /piwikTracker\.trackGoal\(7, 123\);/
      end
    end

    context "goal is not set" do
      it 'should not render a goal' do
        @tracker.goal = nil
        tracker = PiwikAnalytics.piwik_tracker
        @template.result(binding).should_not =~ /trackGoal/
      end
    end
  end
end
