class QuartoAssembly < SolidRuby::Assembly

  # Assemblies are used to show how different parts interact on your design.

  # Skip generation of the 'output' method for this assembly.
  # (will still generate 'show')
  skip :output

  def part(show)
    # Create a test cube
    res = RoundPiece.new.translate(x: -600)
    res += RoundPiece.new(false, true).translate(x: -400)
    res += RoundPiece.new(true, true).translate(x: -200)
    res += RoundPiece.new(true)

    res += SquarePiece.new.translate(y: 200, x: -600)
    res += SquarePiece.new(false, true).translate(y: 200, x: -400)
    res += SquarePiece.new(true, true).translate(y: 200, x: -200)
    res += SquarePiece.new(true).translate(y: 200)

    # always make sure the lowest statement always returns the object that you're working on
    res
  end

  # with view you can define more outputs of a file.
  # This is useful when you are designing subassemblies of an object.
  view :round
  def round
    RoundPiece.new
  end

  view :round_tall
  def round_tall
    res += RoundPiece.new(true)
  end

  view :round_divet
  def round_divet
    RoundPiece.new(false, true)
  end

  view :round_tall_divet
  def round_tall_divet
    res += RoundPiece.new(true, true)
  end

  view :square
  def square
    SquarePiece.new
  end

  view :square_tall
  def square_tall
    res += SquarePiece.new(true)
  end

  view :square_divet
  def square_divet
    SquarePiece.new(false, true)
  end

  view :square_tall_divet
  def square_tall_divet
    res += SquarePiece.new(true, true)
  end
end
