class HomeController < UIViewController
  
  def loadView
    self.view = UIView.alloc.init
  end

  def viewDidLoad
    # the points we're going to animate to
    @points = [[0, 0], [250, 0], [0, 250], [250, 250]]
    @current_index = 0

    # usual method of adding views to our window
    @view = UIView.alloc.initWithFrame [@points[@current_index], [100, 100]]
    @view.backgroundColor = UIColor.blueColor
    # @window.addSubview(@view)

    animate_to_next_point
  end

  def animate_to_next_point
    @current_index += 1

    # keep current_index in the range [0,3]
    @current_index = @current_index % @points.count

    UIView.animateWithDuration(0.3,
      animations: lambda {
         @view.frame = [@points[@current_index], [100, 100]]
      },
      completion:lambda {|finished|
        self.animate_to_next_point
        self.cycle_to_next_color
      }
    )

=begin
    UIView.animateWithDuration(2,
      delay: 1,
      options: UIViewAnimationOptionCurveLinear,
      animations: lambda {
         @view.frame = [@points[@current_index], [100, 100]]
      }, completion:lambda {|finished|
        self.animate_to_next_point
      })
=end

  end

  def cycle_to_next_color
    @color_index ||= 0
    @color_index = (@color_index + 1) % 5

    case @color_index
    when 0
      @view.backgroundColor = UIColor.redColor

    when 1
      @view.backgroundColor = UIColor.greenColor

    when 2
      @view.backgroundColor = UIColor.blueColor

    when 3
      @view.backgroundColor = UIColor.orangeColor

    when 4
      @view.backgroundColor = UIColor.yellowColor

    end
  end
  
end
