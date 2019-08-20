class Tennis 

    def initialize
        @score_1 = '0'
        @score_2 = '0'
    end

    def score_1
        if deuce?
            return 'deuce'
        end
        @score_1
    end

    def score_2
        if deuce?
            return 'deuce'
        end
        @score_2
    end

    def advantage?(score)
        score == 'advantage'
    end

    def add_point(player)
        if player == 1
            @score_1, @score_2 = whatever(@score_1, @score_2)     
        else
            @score_2, @score_1 = whatever(@score_2, @score_1)     
        end
    end

    def add_point2(score, opponent_score)
        if advantage?(opponent_score) 
            opponent_score = '40'
        else 
            score = add_point_to_score(score)
        end   
        [score, opponent_score]
    end

    def deuce?
        @score_1 == '40' && @score_2 == '40'
    end

    private

    def add_point_to_score(score)
        case score
        when '0' 
            '15'
        when '15'
             '30'
        when '30'
            '40'
        when '40'
            if deuce?
                'advantage'
            else
                'WIN'
            end
        end
    end
end

describe Tennis do
    it "test scores are initially 0" do 
        tennis = Tennis.new
        expect(tennis.score_1).to eq('0')
        expect(tennis.score_2).to eq('0')
    end

    it "test player 1 wins a ball" do
        tennis = Tennis.new
        tennis.add_point(1)
        expect(tennis.score_1).to eq('15')
        expect(tennis.score_2).to eq('0')
    end

    it "test player 2 wins a ball" do
        tennis = Tennis.new
        tennis.add_point(2)
        expect(tennis.score_2).to eq('15')
        expect(tennis.score_1).to eq('0')
    end

    it "test player 2 wins two balls" do
        tennis = Tennis.new
        tennis.add_point(2)
        tennis.add_point(2)
        expect(tennis.score_2).to eq('30')
        expect(tennis.score_1).to eq('0')
    end

    it "test player 1 wins two balls" do
        tennis = Tennis.new
        tennis.add_point(1)
        tennis.add_point(1)
        expect(tennis.score_1).to eq('30')
        expect(tennis.score_2).to eq('0')
    end

    it "test player 1 wins three balls" do
        tennis = Tennis.new
        tennis.add_point(1)
        tennis.add_point(1)
        tennis.add_point(1)
        expect(tennis.score_1).to eq('40')
        expect(tennis.score_2).to eq('0')
    end

    it "test player 1 wins four balls" do
        tennis = Tennis.new
        tennis.add_point(1)
        tennis.add_point(1)
        tennis.add_point(1)
        tennis.add_point(1)
        expect(tennis.score_1).to eq('WIN')
        expect(tennis.score_2).to eq('0')
    end

    it "test player 1 wins four balls" do
        tennis = Tennis.new
        3.times{ tennis.add_point(1) }
        3.times{ tennis.add_point(2) }
        expect(tennis.score_1).to eq('deuce')
        expect(tennis.score_2).to eq('deuce')
    end

    it 'test player 2 wins a ball after deuce' do
        tennis = Tennis.new
        3.times{ tennis.add_point(1) }
        4.times{ tennis.add_point(2) }
        expect(tennis.score_1).to eq('40')
        expect(tennis.score_2).to eq('advantage')
    end

    it 'test player 2 wins a ball after deuce' do
        tennis = Tennis.new
        3.times{ tennis.add_point(1) }
        4.times{ tennis.add_point(2) }
        tennis.add_point(1)
        expect(tennis.score_1).to eq('deuce')
        expect(tennis.score_2).to eq('deuce')
    end

    it 'test player 1 wins a ball after deuce' do
        tennis = Tennis.new
        3.times{ tennis.add_point(2) }
        4.times{ tennis.add_point(1) }
        tennis.add_point(2)
        expect(tennis.score_2).to eq('deuce')
        expect(tennis.score_1).to eq('deuce')
    end

end



