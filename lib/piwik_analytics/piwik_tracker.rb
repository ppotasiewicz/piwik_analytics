module PiwikAnalytics
  class PiwikTracker
    attr_accessor :document_title, :goal

    def goal_as_js
      if goal.class == Hash
        "#{@goal[:id]}, #{@goal[:price]}"
      else
        @goal.to_s
      end
    end
  end
end
