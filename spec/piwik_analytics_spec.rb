require "piwik_analytics"

describe PiwikAnalytics do
  context 'tracking api' do
    it 'should have a piwik_tracker method' do
      PiwikAnalytics.should respond_to :piwik_tracker
    end
    it 'should return a PiwikTracker' do
      PiwikAnalytics.piwik_tracker.should be_an_instance_of(PiwikAnalytics::PiwikTracker)
    end
  end
end
