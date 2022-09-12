class MainController < ApplicationController
  def test
    @amount = params[:amount].to_i
    @emptyLine = params[:emptyLine]
  end
  
  def test3
    @subArray = params[:subArray]
    @scoreArray = params[:scoreArray]
    @MT_line = []
    if(!@scoreArray.nil?)
      @scoreArray = @scoreArray.map{ |e| e.to_i}
    end

    for i in 1..@subArray.length() 
      if(@subArray[i-1] == ""|| @scoreArray[i-1] == "" ) 
        @MT_line.push(i)
      end
    end
    
    
    if(@MT_line.length() > 0 )
      redirect_to("/main/test/?amount=#{@subArray.length()}&emptyLine=#{@MT_line}")
      return
    end

    @maxScore = @scoreArray[0].to_i
    @maxSub = @subArray[0]
    @sumScore = 0
    for i in 0..@subArray.length()-1
      @sumScore += @scoreArray[i].to_i
      if(@scoreArray[i].to_i > @maxScore)
        @maxScore = @scoreArray[i].to_i
        @maxSub = @subArray[i]
      end
      
      #save ลง database 
      @all_sameSubject = Subject.where(name:@subArray[i])
      if(@all_sameSubject.empty?)
        Subject.create(name:@subArray[i], score:@scoreArray[i])
      else
        for sub in @all_sameSubject
          sub.update(score:@scoreArray[i])
        end
      end

    end

    if(@MT_line.length() == 0 )
      redirect_to("/score/list")
    end
  end

  def list
    @allSubject = Subject.all
    @maxScore = -1
    @maxSub = ""
    @sumScore = 0
    @allSubject.each do |s| 
      @sumScore += s.score.to_i
      if(s.score.to_i > @maxScore)
        @maxScore = s.score.to_i
        @maxSub = s.name
      end
    end


  end

  def delete
    @id = params[:id].to_i
    s = Subject.find_by(id: @id)
    s.destroy
    redirect_to("/score/list")
  end

  def edit
    @id = params[:id].to_i
    @s = Subject.find_by(id: @id)
    @name = @s.name
    @score = @s.score
  end

  def save
    @id = params[:id]
    @name = params[:name]
    @score = params[:score].to_i
    s = Subject.find_by(id:@id)
    s.update(name:@name, score:@score)
    redirect_to("/score/list")
  end


end
