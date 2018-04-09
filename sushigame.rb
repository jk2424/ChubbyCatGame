require 'gosu'



class SushiGame < Gosu::Window
  def initialize
    super(800, 500)
    self.caption = "Feed Chubby Cat Sushi!"
    @background_image = Gosu::Image.new("images/Background.png", :tileable => true)
    @image = Gosu::Image.new('images/sushi.png')
    @x = 200
    @y = 200
    @width = 122
    @height = 84
    @velocity_x = 4
    @velocity_y = 4
    @visible = 0
    @cat = Gosu::Image.new('images/Cat.png')
    @eat = 0
    @font = Gosu::Font.new(30 )
    @score = 0
    @playing = true
    @start_time = 0
  end

  def draw
    if @visible > 0
      @image.draw(@x - @width / 2, @y - @height / 2, 1)
    end
    @background_image.draw(0, 0, 0)
    @cat.draw(mouse_x - 60, mouse_y - 57, 1)
    if @eat == 0
      c = Gosu::Color::NONE
    elsif @eat ==1
      c = Gosu::Color::GREEN
    elsif @eat == -1
      c= Gosu::Color::RED
    end
    draw_quad(0,0, c, 800, 0, c, 800, 500, c, 0, 500, c)
    @eat = 0
    @font.draw(@score.to_s, 740, 25, 2)
    @font.draw(@time_left.to_s, 30, 25, 2)
    unless @playing
      @font.draw("Chubby Cat needs a nap!!!", 220, 180, 3)
      @visible = 20
      @time_left = 0
      @font.draw("Press Spacebar to Wake up Chubby Cat", 150, 250, 3)
    end
  end

  def update
    if @playing
      @x += @velocity_x
      @y += @velocity_y
      @velocity_x *= -1 if @x + @width / 2 > 800 || @x - @width / 2 < 0
      @velocity_y *= -1 if @y + @height / 2 > 500 || @y - @height / 2 < 0
      @visible -= 1
      @visible = 60 if @visible < -10 && rand < 0.02
      @time_left = (25 - ((Gosu.milliseconds - @start_time) / 1000))
      @playing = false if @time_left < 0
    end
  end


  def button_down(id)
    if @playing
      if(id == Gosu::MsLeft)
        if Gosu.distance(mouse_x, mouse_y, @x, @y)< 70 && @visible >= 0
          @eat = 1
          @score += 10
        else
          @eat = -1
          @score -=2
        end
      end
  else
    if(id == Gosu::KbSpace)
      @playing = true
      @visible = -10
      @start_time = Gosu.milliseconds
      @score = 0
    end
    end
  end


end


window = SushiGame.new
window.show
