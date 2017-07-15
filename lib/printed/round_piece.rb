class RoundPiece < SolidRuby::Printed
  RoundPiece::GOLDEN = 1.618
  def initialize(tall=false, divet=false)
    @d = 25
    @h = @d
    @tall = tall
    @divet = divet
  end

  def part(_show)
    inset = @d / 10.0
    slope_h = 2
    res = cylinder(h: @h - slope_h, d: @d)

    if @tall
      gap_h = @h/10.0
      res = res.translate(z: @h + gap_h + slope_h)
      res += cylinder(h: @h - slope_h, d: @d)
      res += cylinder(h: slope_h, d1: @d, d2: @d-inset).translate(z: @h - slope_h)
      res += cylinder(h: slope_h, d1: @d-inset, d2: @d).translate(z: @h + gap_h)

      res += cylinder(h: gap_h, d: @d-inset).translate(z: @h)
    end

    if @divet
      res -= sphere(d: @d/2.0)
    end

    res
  end
end
