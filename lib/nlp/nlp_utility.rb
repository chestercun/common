# necessary for enums
require 'nlp/pos_tagger'

module Common::NLP
  class << self

    def kick_push
      :coast # lupe!
    end

    def falco_punch(n)
      n.split(//).reverse.join('->')
    end
    
    def check_pos(i)
      puts "correct" if i == POS::Noun
    end
  end
end
