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
  end
end
