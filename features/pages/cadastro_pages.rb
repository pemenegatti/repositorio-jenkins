# frozen_string_literal: true

# Classe responsavel pelo acesso do site
class AcessarSite < SitePrism::Page
  set_url '/'

  element :nome, 'input[id="nome_cad"]'
  element :email, 'input[id="email_cad"]'
  element :senha, 'input[id="senha_cad"]'
  element :cadastrar, 'input[value="Cadastrar"]'

  def preencher_formulario
    nome.set('teste')
    email.set('testes@testes.com')
    senha.set('1234')
  end

  def clicar_cadastrar
    cadastrar.click
  end

  def confirmar_cadastro
    page.accept_alert
  end
end
