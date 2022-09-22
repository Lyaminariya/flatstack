class Raspberry
    @@states = {0 => "Отсутствует", 1 => "Цветение", 2 => "Зеленая", 3 => "Красная"}

    def initialize(index=0, state)
        @index = index
        @state = 0
    end

    def grow!
        @state < 3 ? @state += 1 : @state
    end

    def ripe?
        @state == 3
    end
end

class RaspberryBush
    def initialize(count)
        @raspberries = []
        count.times do |index|
            raspberry = Raspberry.new(index)
            @raspberries << raspberry
        end
    end

    def grow_all!
        @raspberries.each(&:grow!)
    end

    def ripe_all?
        @raspberries.map(&:ripe?).all?
    end

    def give_away_all!
        @raspberries = []
    end
end

class Human
    def initialize(name, plant)
        @name = name
        @plant = plant
    end

    def work!
        @plant.grow_all!
    end

    def harvest
        if @plant.ripe_all?
            puts "Урожай собран"
            @plant.give_away_all!
        else
            puts "Урожай ещё не созрел"
        end
    end

    def knowledge_base
        puts "Воры и другие нечистые на руку субъекты называют «малиной» притоны, а в русском фольклоре «малиной» обычно именуют безоблачно прекрасную и сладкую жизнь."
    end
end

if __FILE__ == $PROGRAM_NAME
    raspberry_bush = RaspberryBush.new(10)
    human = Human.new("Ivan", raspberry_bush)
    human.knowledge_base
    human.work!
    human.harvest
    human.work!
    human.work!
    human.harvest
end