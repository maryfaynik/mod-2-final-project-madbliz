class MadlibsController < ApplicationController

    file = File.read('app/controllers/concerns/template.json')
    TEMP ||= JSON.parse(file)

    def new
        
        @template = TEMP["templates"].sample
        @index = TEMP["templates"].find_index {|temp, blah| temp["title"] == @template["title"]}
     
        @madlib = Madlib.new

        @title = @template["title"]
        @blanks = @template["blanks"]

        
       
    end

    def create
        
        # gets the JSON
        index = params["template_index"].to_i
        template = TEMP["templates"][index]

        # Extracts parts of the madlib
        sentences = template["value"]
        blanks = template["blanks"]
        title = template["title"]

        #Make the madlib
        madlib = Madlib.create(title: title)

        # Add the blanks and values
        values = params["blanks"]
        values.each_with_index do |value, index|
            madlib.blanks << Blank.create(speech_part: blanks[index], input: value, madlib_id: madlib.id)
        end

    

        ## smoosh the sentences and values together to make the madlib body
        ## also create sentence objects for later use...
        body = ""
        sentences.each_with_index do |sentence, index|
            body += "#{sentence}#{values[index]}"
            madlib.sentences << Sentence.create(value: sentence, madlib_id: madlib.id)
        end
        madlib.body = body
        madlib.save
    
        redirect_to madlib_path(madlib)

    end

    def show
        @madlib = Madlib.find(params[:id])
        @blanks = @madlib.blanks
        @sentences = @madlib.sentences
       
        if current_user
            @is_favorite = Favorite.find_by(madlib_id: @madlib.id, user_id: current_user)
        end
    
    end

    # def favorite
    # end

end
