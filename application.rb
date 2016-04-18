require_relative "src/tsp_runner"

cities = [[1, 2], [3, 4], [8, 7], [10, 12], [2, 4]]
tst = TspRunner.new(cities)
p tst.solve
