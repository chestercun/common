module Common
  module DSL
    module ProjectEuler

      def time (msg='',&blk)
        begin_time = Time.now
        blk.call
        end_time = Time.now
        puts %Q(Time elapsed #{(end_time-begin_time)*1000} ms)
      end

    end
  end
end
