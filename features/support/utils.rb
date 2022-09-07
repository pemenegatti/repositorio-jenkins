# frozen_string_literal: true

# Modulo responsavel pelo utilidades
module Utils
  class << self
    def tirar_foto(nome_arquivo, resultado)
      caminha_arquivo = "screenshots/test_#{resultado}"
      foto = "#{caminha_arquivo}/#{nome_arquivo}.png"
      Capybara.page.save_screenshot(foto)
    end
  end
end
