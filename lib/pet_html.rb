
    class PetHtml
      def initialize(animal = "dog", name = "Black", health = 10, mood = 10, hunger = 10, sleeping = 10, stamina = 10, agility = 10, intelect = 10, purity = 10)
          @animal = animal
          @name = name
          @health = health
          @mood = mood
          @hunger = hunger
          @sleeping = sleeping
          @stamina = stamina
          @agility = agility
          @intelect = intelect
          @purity = purity
        end

    def makeHTML(filename = "index.html", content)
      file = File.new(filename, "w+")
      file.puts("<html>
          <head>
            <meta charset='utf-8'>
            <title>Tamagotchi</title>
          </head>
          <body>
            <p>#{content}</p>
          </body>
        </html>")
      file.close()
      case content
      when 'wash'
        file = File.new(filename, "w+")
        file.puts("<body>
          <p>Purity = #{@purity += rand(6)}</p>
          <p> Mood = #{@mood += rand(6)}</p>
        </body>")
        file.close()
       when 'feed'
        file = File.new(filename, "w+")
        file.puts("<body>
          <h2>You are feeding #{@name}</h2>
          <i> Characteristics after event </i>
          <p> Hunger = #{@hunger += rand(6)}</p>
        </body>")
        file.close()

      when 'train'
        file = File.new(filename, "w+")
        file.puts("<body>
          <h2>You are training #{@name}</h2>
          <i> Characteristics after event </i>
          <p> Hunger = #{@hunger -= rand(6)}</p>
          <p> Purity = #{@purity -= rand(6)}</p>
          <p> Mood = #{@mood -= rand(6)}</p>
          <p> Agility = #{@agility += rand(6)}</p>
          <p> Intelect = #{@intelect += rand(6)}</p>
        </body>")
        file.close()


      when 'walk'
        file = File.new(filename, "w+")
        file.puts("<body>
          <h2>You are walking with #{@name}</h2>
          <i> Characteristics after event </i>
          <p> Hunger = #{@hunger -= rand(6)}</p>
          <p> Purity = #{@purity -= rand(6)}</p>
          <p> Mood = #{@mood += rand(6)}</p>
          <p> Stamina = #{@stamina -= rand(6)}</p>
          
        </body>")
        file.close()

      when 'play'
        file = File.new(filename, "w+")
        file.puts("<body>
          <h2>You are playing with #{@name}</h2>
          <i> Characteristics after event </i>
          <p> Hunger = #{@hunger -= rand(6)}</p>
          <p> Sleeping = #{@sleeping -= rand(6)}</p>
          <p> Mood = #{@mood += rand(6)}</p>
          <p> Stamina = #{@stamina -= rand(6)}</p>
          
        </body>")
        file.close()

      when 'sleep'
        file = File.new(filename, "w+")
        file.puts("<body>
          <h2>#{@name} is sleeping</h2>
          <i> Characteristics after event </i>
          <p> Hunger = #{@hunger -= rand(6)}</p>
          <p> Sleeping = #{@sleeping += rand(15)}</p>
          <p> Mood = #{@mood += rand(6)}</p>
          <p> Stamina = #{@stamina += rand(6)}</p>
          <p> Sleeping = #{@sleeping}</p>
          
        </body>")
        file.close()

      when 'search'
        file = File.new(filename, "w+")
        file.puts("<body>
          <h2>#{@name} is searching</h2>
          <i> Characteristics after event </i>
          <p> Hunger = #{@hunger -= rand(6)}</p>
          <p> Mood = #{@mood += rand(6)}</p>
          <p> Stamina = #{@stamina -= rand(6)}</p>
          <p> Intelect = #{@intelect += rand(6)}</p>  
        </body>")
        file.close()
        
      when 'status'
        file = File.new(filename, "w+")
        file.puts("<body>
          <h2>#{@name} status</h2>
          <i> Characteristics</i>
          <p> Hunger = #{@hunger}</p>
          <p> Mood = #{@mood}</p>
          <p> Stamina = #{@stamina}</p>
          <p> Intelect = #{@intelect}</p>
          <p> Agility = #{@agility}</p>
          <p> Sleeping = #{@sleeping}</p>
        </body>")
        file.close()


      else
        file = File.new(filename, "w+")
        file.puts("<body>
          <p>Nothing to show</p>
        </body>")
        file.close()
      end
      return file  
      
        
    end    
  end

pet = PetHtml.new()
pet.makeHTML( 'feed')