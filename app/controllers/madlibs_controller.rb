class MadlibsController < ApplicationController

    file = File.read('app/controllers/concerns/template.json')
    TEMP ||= JSON.parse(file)

    def new
        
        @template = TEMP["templates"].sample
        @index = TEMP["templates"].find_index {|temp, blah| temp["title"] == @template["title"]}
     
        @madlib = Madlib.new

        @blanks = @template["blanks"]
       
    end

    def create
    
        index = params["template_index"].to_i
        template = TEMP["templates"][index]

    

        sentences = template["value"]
        blanks = template["blanks"]
        title = template["title"]

        madlib = Madlib.create(title: title)

        values = params["blanks"]
        values.each_with_index do |value, index|
            madlib.blanks << Blank.create(speech_part: blanks[index], input: value, madlib_id: madlib.id)
        end

        ## smoosh the sentences and values together to make the madlib body
        body = ""
        sentences.each_with_index do |sentence, index|
            body += "#{sentence}#{values[index]}"
        end
        madlib.body = body
        madlib.save

        redirect_to madlib_path(madlib)

    end

    def show
        @madlib = Madlib.find(params[:id])
    end

    def favorite
    end

end
