require "erb"

describe "views/piwik_tracking_tag.html.erb" do
  let(:url) { nil }
  let(:id_site) { nil }

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
end
