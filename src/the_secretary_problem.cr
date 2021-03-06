module TheSecretaryProblem
  VERSION = "0.1.0"

  enum SimResult
    NO1_SELECTED
    UNDER_2_SELECTED
    NOBODY_SELECTED
  end

  class Result
    property no_1_selected_count : Int32
    property under_2_selected_count : Int32
    property nobody_selected_count : Int32

    def initialize
      @no_1_selected_count = 0
      @under_2_selected_count = 0
      @nobody_selected_count = 0
    end

    def sum
      @no_1_selected_count + @under_2_selected_count + @nobody_selected_count
    end

    def p_success
      @no_1_selected_count / sum
    end

    def p_nobody
      @nobody_selected_count / sum
    end

    def p_notbest
      @under_2_selected_count / sum
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

      @simulation_time.times do |i|
        case main @n, @k
        when SimResult::NO1_SELECTED
          result.no_1_selected_count += 1
        when SimResult::UNDER_2_SELECTED
          result.under_2_selected_count += 1
        when SimResult::NOBODY_SELECTED
          result.nobody_selected_count += 1
        end
      end
      return result
    end

    def choise(applicants, k) : Applicant | Nil
      if applicants.nil?
        abort
      end

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

    def check(applicants, applicant) : SimResult
      case
      when applicant.nil?
        return SimResult::NOBODY_SELECTED
      when applicant.point == applicants.members.size - 1
        return SimResult::NO1_SELECTED
      else
        return SimResult::UNDER_2_SELECTED
      end
    end

    def main(n, k)
      applicants = Applicants.new n
      choised_applicant = choise applicants, k
      return check applicants, choised_applicant
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

  class TheoreticalFormula
    def initialize(n : Int32, k : Int32)
      @n = n
      @k = k
    end

    def p_success
      sum = 0
      t = @k + 1

      (@n - @k - 1).times do |i|
        sum += 1 / ((t + i) - 1)
      end

      (@k / @n) * sum
    end

    def p_nobody
      @k / @n
    end

    def p_notbest
      1 - p_nobody - p_success
    end
  end
end
