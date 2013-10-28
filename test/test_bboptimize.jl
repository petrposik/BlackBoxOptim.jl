function rosenbrock2d(x)
  return (1.0 - x[1])^2 + 100.0 * (x[2] - x[1]^2)^2
end

facts("bboptimize") do
  context("example 1 from README") do
    best, fitness = bboptimize(rosenbrock2d, (-5.0, 5.0); dimensions = 2)
    @fact fitness < 0.001 => true
  end

  context("example 2 from README") do
    best, fitness = bboptimize(rosenbrock2d, [(-5.0, 5.0), (0.0, 1.0)])
    @fact fitness < 0.001 => true
  end

  context("example 3 from README") do
    best, fitness = bboptimize(rosenbrock2d, (-5.0, 5.0); dimensions = 2, method = :de_rand_1_bin)
    @fact fitness < 0.001 => true
  end
end