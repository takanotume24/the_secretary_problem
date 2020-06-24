require "./the_secretary_problem.cr"

module TheSecretaryProblem
  n = ARGV[0].to_i
  simulation_time = ARGV[1].to_i

  n.times do |i|
    sim = Simulation.new n: n, k: i, simulation_time: simulation_time
    result = sim.run
    puts "#{i},#{result.no_1_selected_count},#{result.nobody_selected_count},#{result.under_2_selected_count}"
  end
end
