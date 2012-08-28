module Common
  module DSL
    module ProjectEuler

      def time (msg='',&blk)
        # user's message
        puts msg
        
        # actual timing
        begin_time = Time.now
        blk.call
        end_time = Time.now

        # show time diff
        puts %Q(Time elapsed #{(end_time-begin_time)*1000} ms)
      end

    end
  end
end
