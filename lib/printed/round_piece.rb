class RoundPiece < SolidRuby::Printed
  RoundPiece::GOLDEN = 1.618
  def initialize(tall=false, divet=false)
    @d = 25
    @h = @d #@d * RoundPiece::GOLDEN
    @tall = tall
    @divet = divet
  end

  def part(_show)
    res = cylinder(h: @h, d: @d)
    inset = @d / 10.0

    if @tall
      gap_h = (@d / RoundPiece::GOLDEN) / 2.0
      res = res.translate(z: @h + gap_h)
      res += cylinder(h: @h, d: @d)
      res += cylinder(h: inset, d1: @d, d2: @d-inset).translate(z: @h)
      res += cylinder(h: inset, d1: @d-inset, d2: @d).translate(z: @h + gap_h-inset)
      #res -= cylinder(h: gap_h + 2, d: @d-inset).translate(z: @h - 1)
      res += cylinder(h: gap_h, d: @d-inset).translate(z: @h)

    end

    if @divet
      res -= sphere(d: @d/2.0)
    end

    res
  end
end
