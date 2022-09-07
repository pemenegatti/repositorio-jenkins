#language:pt

Funcionalidade: Criar um cadastro

	@wip
	Cenario:Criar um cadastro valido

		Dado que o usuario esteja na tela de cadastro
		E preencho o formulario
		E clico em cadastrar
		Entao o cadastrar e realizado
		
	Cenario: Criar um cadastro com email-invalido

		Dado que o usuario esteja na tela de cadastro
		E preencho o formulario com um email invalido
		E clico em cadastrar
		Entao o cadastrar nao e realizado
		
	Cenario: Criar um cadastro com nome com caracter especial

		Dado que o usuario esteja na tela de cadastro
		E preencho o formulario com um nome com um caracter especial
		E clico em cadastrar
		Entao o cadastrar nao e realizado
	