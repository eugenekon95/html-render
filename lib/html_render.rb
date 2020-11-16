class Animal
  attr_accessor :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end
  ANIMAL_VOICES = {
    dog: 'bark',
    cat: 'meow',
    raven: 'croak',
    monkey: 'whoop'
    
  }
  

  def voice
    voice = ANIMAL_VOICES.keys.include?(@animal) ? ANIMAL_VOICES[@animal] : "hello"
    p voice
  end
end

class Pet < Animal
  attr_accessor :health, :mood, :hunger, :sleeping, :stamina, :agility, :intelect, :purity

  def initialize(animal, name, health = 10, mood = 10, hunger = 10, sleeping = 10, stamina = 10, agility = 10, intelect = 10, purity = 10)
    super(animal, name)
    @health = health
    @mood = mood
    @hunger = hunger
    @sleeping = sleeping
    @stamina = stamina
    @agility = agility
    @intelect = intelect
    @purity = purity
  end

  #----------user actions----------
  def feed
    p "You are feeding #{@name}"
    @hunger = @hunger + rand(6)
    p "Characteristics after event : Hunger = #{@hunger}"
    pastTime()
  end

  def wash
    p "You are washing #{@name}"
    @purity = @purity + rand(6)
    @mood = @mood + rand(6)
    p "Characteristics after event : Purity = #{@purity}  Mood: = #{@mood}"
    pastTime()
  end

  def train
    p "You are training #{@name}"
    @agility = @agility + rand(5)
    @intelect = @intelect + rand(5)
    @stamina = @stamina + rand(10)
    @hunger = @hunger - rand(15)
    @sleeping = @sleeping - rand(5)
    @mood = @mood - rand(5)
    @purity = @purity - rand(5)

    puts "Characteristics after event :
    Agility = #{@agility}  Mood: = #{@mood}  Intelect = #{@intelect}  Stamina: = #{@stamina}
    Hunger = #{@hunger}  Sleeping: = #{@sleeping} Purity = #{@purity}"
    pastTime()
  end

  def play
    p "You are playing with #{@name}"
    @mood = @mood + rand(5)
    @stamina = @stamina - rand(5)
    @hunger = @hunger - rand(5)
    @sleeping = @sleeping - rand(5)

    puts "Characteristics after event :
    Hunger = #{@hunger}  Mood: = #{@mood}  Sleeping = #{@sleeping}  Stamina: = #{@stamina}"
    pastTime()
  end

  def sleep
    p "#{@name} is sleeping "
    @mood += rand(5)
    @stamina += rand(5)
    @hunger -= rand(5)
    @sleeping += rand(15)

    puts "Characteristics after event :
    Hunger = #{@hunger}  Mood: = #{@mood} Sleeping = #{@sleeping}  Stamina: = #{@stamina}"
    pastTime()
  end

  def walk
    p "#{@name} is walking "
    @stamina = @stamina + rand(5)
    @hunger = @hunger - rand(5)
    @sleeping = @sleeping - rand(5)
    @purity = @purity - rand(5)

    puts "Characteristics after event :
    Hunger = #{@hunger}  Purity: = #{@purity} Sleeping = #{@sleeping}  Stamina: = #{@stamina}"
    pastTime()
  end

  def search
    p "#{@name} is searching "
    @stamina = @stamina - rand(5)
    @intelect = @intelect + rand(5)
    puts "Characteristics after event :
    Stamina = #{@stamina}  Intelect: = #{@intelect}"
    pastTime()
  end

  def status
    puts " #{@name}
      |health| = #{@health}   |hunger| = #{@hunger}       |purity| = #{@purity}     |agility| = #{@purity}
      |stamina| = #{@stamina}  |sleeping| = #{@sleeping}  |intelect| = #{@intelect}   |mood| = #{@mood}
      "
  end

  def spectate
    p "You spectating on #{@name}"
    randomEvent()
    pastTime()
  end

  def help
    puts "Tamagotchi MY PET methods"
    p "Feed: Feeding the animal increases hunger property on random value"
    p "Wash: Washing the animal increases purity property decreases mood on random value"
    p "Train: Training the animal increases agility, intelect properties dicreases stamina hunger sleeping mood purity on random value"
    p "Play: Playing with animal increases mood property decreases stamina hunger sleeping on random value"
    p "Sleep: Animal sleep increases mood stamina sleeping decreases hunger on random value"
    p "Walk: Animal walking decreases stamina hunger sleeping purity on random value"
    p "Search: Animal train searching skill increases intelect decreases stamina on random value"
    p "Status: Show animal status"
    p "Spectate: Just spectating on animal"
  end

  #----------private methods----------
  private

  def pastTime
    hours = rand(6)
    if hours == 0
      p "Past less than an hour"
    else
      p "Past #{hours} hours"
    end

    @hunger = @hunger - rand(2)
    @sleeping = @sleeping - rand(2)
    @purity = @purity - rand(2)
    status()
    checkPet()
  end

  def randomEvent
    event = rand(5)
    case event
    when event == 1
      p "Rain is started #{@name} is very upset and running into pethouse"
      @purity = @purity - rand(10)
      @sleeping = @sleeping - rand(10)
      @mood = @mood - rand(10)

    when event == 2
      p "#{@name} broke your shoes and hide"
      @purity = @purity - rand(10)
      @sleeping = @sleeping - rand(10)
      @mood = @mood + rand(20)

    when event == 3
      p "#{name} found old broken pet toy"
      @purity = @purity - rand(20)
      @sleeping = @sleeping - rand(20)
      @mood = @mood + rand(10)

    when event == 4
      p "#{name} trying to bite you"
      @mood = @mood - rand(10)
      @intelect = @intelect - rand(10)

    when event == 5
      p "#{name} going into your house"
      @mood = @mood + rand(10)
      @intelect = @intelect + rand(10)

    else
      p "Nothing happens"
    end
  end

  def hungry?
    @hunger <= 1
  end

  def sleepy?
    @sleeping <= 1
  end

  def bored?
    @mood <= 1
  end

  def tired?
    @stamina <= 1
  end

  def runnaway?
    if @purity <= 0 || @hunger <= 0
    end
  end

  def petIsDead
    if @hunger < 0 && @purity < 0 && @stamina < 0
      puts "I`m dying goodbye"
      puts "Game Over"
      exit

    end
  end

  def checkPet() # todo
    puts("Feed me") if hungry?
    puts("Play with me!") if bored?
    puts("Freedom") if runnaway?
    puts("I need rest!") if sleepy?
    petIsDead()
  end
end




def htmlRender(filename,command)
  file = File.new(filename, "w+")
  file.puts("<body>
    <p>Hello World!</p>
  </body>
")
file.close
case command
when "feed"
  file = File.new(filename, "w+")
  file.puts("<body>
    <p>Feed</p>
  </body>
")
  
when "wash"
  file = File.new(filename, "w+")
  file.puts("<body>
    <p>Wash</p>
  </body>
")

when "train"
  file = File.new(filename, "w+")
  file.puts("<body>
    <p>Train</p>
  </body>
")

when "play"
  file = File.new(filename, "w+")
  file.puts("<body>
    <p>Play</p>
  </body>
")

when "sleep"
  file = File.new(filename, "w+")
  file.puts("<body>
    <p>Sleep</p>
  </body>
")

when "walk"
  file = File.new(filename, "w+")
  file.puts("<body>
    <p>Walk</p>
  </body>
")
when "search"
  file = File.new(filename, "w+")
  file.puts("<body>
    <p>Search</p>
  </body>
")

when "search"
  file = File.new(filename, "w+")
  file.puts("<body>
    <p>Search</p>
  </body>
")

when "spectate"
  file = File.new(filename, "w+")
  file.puts("<body>
    <p>Spectate</p>
  </body>
")

  

else
  exit
  
end
end
htmlRender("index.html","wash")


def startGame
  p "MY PET GAME"
  p "Choose Animal type"
  animalType = gets.chomp.downcase
  p "Choose Animal name"
  animalName = gets.chomp.downcase
  pet = Pet.new(animalType, animalName)
  p "#{animalType} #{animalName} was born"

  while true
    puts "
  Choose action
 1.feed             5.sleep
 2.wash             6.walk
 3.train            7.search
 4.play             8.status
 9.spectate         10.voice
 11.help            12.exit
 13.clear
 Comand: "
    command = gets.chomp()
    case command
    when "feed"
      pet.feed
    when "wash"
      pet.wash
    when "train"
      pet.train
    when "play"
      pet.play
    when "sleep"
      pet.sleep
    when "walk"
      pet.walk
    when "search"
      pet.search
    when "status"
      pet.status
    when "spectate"
      pet.spectate
    when "voice"
      pet.voice
    when "help"
      pet.help
    when "clear"
      system "cls"
    when "exit"
      exit

    else
      puts " Hint typo string command example feed"
    end

  end
end
