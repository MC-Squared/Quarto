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
    gap_h = @h/10.0#(@w/ RoundPiece::GOLDEN)/2.0
    slope_h = 2

    res = cube(@w, @w, @h-slope_h).center_xy.fillet(fill_r)

    if @tall
      res = res.translate(z: @h + gap_h + slope_h)
      res += cube(@w, @w, @h - slope_h).center_xy.fillet(fill_r)

      res += hull(
        cube(@w, @w, 0.1)
          .center_xy
          .fillet(fill_r),
        cube(@w-inset, @w-inset, 0.1)
          .center_xy
          .fillet(fill_r)
          .translate(z: slope_h)
        )
          .translate(z: @h - slope_h)

        res += hull(
          cube(@w, @w, 0.1)
            .center_xy
            .fillet(fill_r),
          cube(@w-inset, @w-inset, 0.1)
            .center_xy
            .fillet(fill_r)
            .translate(z: -slope_h)
          )
            .translate(z: @h + gap_h + slope_h)

      res += cube(@w-inset, @w-inset, gap_h)
      .center_xy.fillet(fill_r).translate(z: @h)
    end
    if @divet
      res -= sphere(d: @w/2.0)
    end

    res
  end
end
