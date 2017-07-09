guard :shell do
  watch(/quarto.rb/) { system('ruby quarto.rb') }
  watch(%r{^lib/.+/.+\.rb}) { system('ruby quarto.rb') }
end
