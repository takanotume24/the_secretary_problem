module TheSecretaryProblem
  VERSION = "0.1.0"

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
      @members = Array.new(number_of_people) {|i| Applicant.new(i) }.shuffle
    end
  end

  class Applicant
    getter point : Int32

    def initialize(point : Int32)
      @point = point
    end
  end


  def self.choise(applicants, k)
    top_point = 0
    
    applicants.members.each_index do |i|
      applicant_point = applicants.members[i].point

      if i < k
        if applicant_point > top_point
          top_point = applicant_point
        end
        next
      end

      if applicant_point > top_point
        return i
      end
    end
  end

  def self.main
    applicants = Applicants.new 10
    puts choise applicants,5
  end
end
