class ChatbotController < ApplicationController
  def ask
    # Inicializamos la variable vacía para que no cause problemas al cargar por primera vez
    @respuesta = nil
  end

  def answer
    # Forzamos a que lea el parámetro 'pregunta' que viene del formulario
    pregunta = params[:pregunta].to_s.strip.downcase
    
    # Guardamos el resultado en la variable de instancia
    @respuesta = respuesta_amorosa(pregunta)
    
    # Renderizamos explícitamente la vista 'ask' pasando la variable
    render :ask
  end

  private

  def respuesta_amorosa(pregunta)
    if pregunta.include?("ansiedad") || pregunta.include?("miedo")
      "Respira conmigo: inhala contando hasta 4, exhala contando hasta 4 🌈. Piensa en algo bonito que te haga sonreír."
    elsif pregunta.include?("molesta") || pregunta.include?("bullying")
      "Si alguien te molesta en internet, guarda la calma y cuéntaselo a tus papás, algun maestro o alguien de tu confianza. 💖."
    elsif pregunta.include?("triste") || pregunta.include?("tristeza")
      "Está bien sentirse triste a veces 🌸. Haz algo que disfrutes, escucha música, baila, canta o dibuja, y habla con alguien que te quiera."
    elsif pregunta.include?("amor propio") || pregunta.include?("quererme")
      "El amor propio es como una flor: hay que regarlo todos los días. Recuerda que tu valor es unico, tal como eres. 🌸"
    elsif pregunta.include?("respeto") || pregunta.include?("tratar")
      "El respeto es la base de todo. Trata a los demás como te gustaría que te traten a ti. Y también respétate a ti mismo. 🤝"
    elsif pregunta.include?("aceptación") || pregunta.include?("diferente")
      "Todos somos diferentes, y eso es hermoso. Como los colores del arcoíris, cada uno tiene su propia luz. 🌈"
    elsif pregunta.include?("temor")
      "El miedo es natural, pero no debe detenerte. Respira hondo, confía en ti y da un paso pequeño, te daras cuenta que tienes el poder para superarlo. 🦋"
    elsif pregunta.include?("gracias")
      "¡De nada! Siempre estoy aquí para ti. Eres importante y vales mucho. ❤️"
    elsif pregunta.include?("internet") || pregunta.include?("acoso")
      "Si alguien te molesta en internet, no estás solo. No respondas con enojo, guarda evidencia y cuéntaselo a un adulto de confianza. 🛡️💬"
    else
      "Gracias por tu pregunta ✨. Estoy aquí para escucharte y acompañarte con cariño."
    end
  end
end