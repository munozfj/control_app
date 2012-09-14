module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Control-8"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def minutes_in_words(timestamp)
     minutes = (((Time.now - timestamp).abs)/60).round
     
     return nil if minutes < 0
     
     case minutes
       when 0..4            then 'menos de 5 minutos'
       when 5..14           then 'menos de 15 minutos'
       when 15..29          then 'menos de 30 minutos'
       when 30..59          then 'mas de 30 minutos'
       when 60..119         then 'mas de 1 hora'
       when 120..239        then 'mas de 2 horas'
       when 240..479        then 'mas de 4 horas'
       when 480..719        then 'mas de 8 horas'
       when 720..1439       then 'mas de 12 horas'
       when 1440..11519     then 'mas de ' << pluralize((minutes/1440).floor, 'dia')
       when 11520..43199    then 'mas de ' << pluralize((minutes/11520).floor, 'semana')
       when 43200..525599   then 'mas de ' << pluralize((minutes/43200).floor, 'mes')  
       else                      'mas de ' << pluralize((minutes/525600).floor, 'anio')
     end
   end
  
end
