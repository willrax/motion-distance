class DistanceController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor
    create_view
    fetch_location
  end

  def fetch_location
    @distance = Motion::Distance.new
    @distance.activity_type = CLActivityTypeFitness

    @distance.get do |distance|
      unless distance[:error]
        @label.text = distance[:total].to_s
      end
    end
  end

  def create_view
    @label = UILabel.alloc.init
    @label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
    @label.textAlignment = NSTextAlignmentCenter
    @label.text = "Tracking..."

    Motion::Layout.new do |layout|
      layout.view self.view
      layout.subviews "label" => @label
      layout.metrics "space" => 250
      layout.vertical "|-space-[label]"
      layout.horizontal "|-[label]-|"
    end
  end
end
