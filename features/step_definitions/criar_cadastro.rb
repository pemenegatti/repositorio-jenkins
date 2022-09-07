# frozen_string_literal: true

Dado('que o usuario esteja na tela de cadastro') do
  @site.load
end

Dado('preencho o formulario') do
  @site.preencher_formulario
end

Dado('clico em cadastrar') do
  @site.clicar_cadastrar
end

Entao('o cadastrar e realizado') do
  @site.confirmar_cadastro
end
