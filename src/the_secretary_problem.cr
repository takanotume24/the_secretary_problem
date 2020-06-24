module TheSecretaryProblem
  VERSION = "0.1.0"

  enum SimResult
    NO1_SELECTED
    UNDER_2_SELECTED
    NO_ONE_SELECTED
  end

  class Result
    property success_count : Int32
    property under_secound_count : Int32
    property no_one_count : Int32

    def initialize
      @success_count = 0
      @under_secound_count = 0
      @no_one_count = 0
    end
  end

  class Simulation
    def initialize(k : Int32, n : Int32, simulation_time : Int32)
      @k = k
      @n = n
      @simulation_time = simulation_time
    end

    def run
      result = Result.new

      simulation_time.times do |i|
      end
    end
  end

  class Applicants
    getter members : Array(Applicant)

    def initialize(number_of_people : Int32)
      @members = Array.new(number_of_people) { |i| Applicant.new(i) }.shuffle
    end
  end

  class Applicant
    getter point : Int32

    def initialize(point : Int32)
      @point = point
    end
  end

  def self.choise(applicants, k) : Applicant | Nil
    top_point = 0

    applicants.members.each_index do |i|
      applicant = applicants.members[i]

      if i < k
        if applicant.point > top_point
          top_point = applicant.point
        end
        next
      end

      if applicant.point > top_point
        return applicant
      end
    end
  end

  def self.main(n, k)
    applicants = Applicants.new n
    puts choise applicants, k
  end
end
