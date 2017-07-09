class SquarePiece < SolidRuby::Printed
  SquarePiece::GOLDEN = 1.618
  def initialize(tall=false, divet=false)
    @h = 25 #@w * RoundPiece::GOLDEN
    @w = @h  #30
    @tall = tall
    @divet = divet
  end

  def part(_show)
    fill_r = @w / 5.0
    inset = @w / 10.0
    gap_h = (@w/ RoundPiece::GOLDEN)/2.0

    res = cube(@w, @w, @h).center_xy.fillet(fill_r)

    if @tall
      res = res.translate(z: @h + gap_h)
      res += cube(@w, @w, @h).center_xy.fillet(fill_r)

      res += cube(@w-inset, @w-inset, gap_h)
      .center_xy.fillet(fill_r).translate(z: @h)
      # gap += cylinder(d1: @w*1.4, d2: @w*1.4-inset, h: 1, fn: 4)
      #   .rotate(z: 45)
      #   .translate(x: 0, z: @h)
      #
      # gap += cylinder(d1: @w*1.4-inset, d2: @w*1.4, h: 1, fn: 4)
      #   .rotate(z: 45)
      #   .translate(x: 0, z: @h+gap_h-1)
      #
      # res += (gap * cube(@w, @w, @h).center_xy.fillet(fill_r).translate(z: @h))
    end

    #res += hull(cylinder(d1: @w, d2: @w-inset, h: 10, fn: 4), sphere(r: fill_r)).translate(x: - 30)

    #res += sphere(r: fill_r).translate(x: - 30, z: gap_h/2.0)

    if @divet
      res -= sphere(d: @w/2.0)
    end

    res
  end
end
