require "./the_secretary_problem.cr"

module TheSecretaryProblem
  n = ARGV[0].to_i
  simulation_time = ARGV[1].to_i

  puts "k,P_success,P_nobody,P_notbest, 理論式 P_success, 理論式 P_nobody, 理論式 P_notbest"
  n.times do |i|
    sim = Simulation.new n: n, k: i, simulation_time: simulation_time
    theo = TheoreticalFormula.new n: n, k: i
    result = sim.run
    puts "#{i},#{result.p_success},#{result.p_nobody},#{result.p_notbest}, #{theo.p_success}, #{theo.p_nobody}, #{theo.p_notbest}"
  end
end
