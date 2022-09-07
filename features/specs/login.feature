#language:pt

Funcionalidade: Realizar login
	
	Cenario:Realizar um login valido

		Dado que o usuario esteja na tela de cadastro
		E va para a tela de login
		Quando realizado o login com email e senha valida
		E clico em logar
		Entao o login e realizado com sucesso
		
	Cenario: Realizar um login com email-invalido

		Dado que o usuario esteja na tela de cadastro
		E va para a tela de login
		Quando realizado o login com um email invalido
		E clico em logar
		Entao o login nao deve ser realizado
		
	Cenario: Realizar um login com senha-invalida

		Dado que o usuario esteja na tela de cadastro
		E va para a tela de login
		Quando realizado o login com uma senha invalida
		E clico em logar
		Entao o login nao deve ser realizado