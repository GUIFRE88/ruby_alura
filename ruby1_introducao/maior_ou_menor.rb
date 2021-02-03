def da_boas_vindas
  puts "Bem vindo ao jogo da adivinhação"
  puts "Qual é o seu nome?"
  nome = gets.strip # Pega o valor digitado pelo usuário
  puts "\n\n\n\n\n\n\n" # Imprime quebra de linha
  puts "Começaremos o jogo para vc, #{nome}"
end

def sorteia_numero_secreto
  puts "Escolhendo um número secreto entre 0 e 200..."
  sorteado = rand(200)
  puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
  sorteado # Retorna o numero secreto
end

def pede_um_numero(tentativa, limite_de_tentativas)
  puts "\n\n\n\n\n\n\n" # Imprime quebra de linha
  puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
  puts "Entre com um numero"
  chute = gets
  puts "Será que acertou? Você chutou #{chute.to_s}"
  chute.to_i
end

def verifica_se_acertou(numero_secreto, chute)
  acertou = numero_secreto == chute # Transforma o número do chute em INTEIRO, pois a função 'gets' transforma o valor digitado em STRING.
  if acertou
    puts "Acertou!"
    return true
  end

  maior = numero_secreto > chute
  if maior
    puts "O número secreto é maior!"
  else
    puts "O número secreto é menor!"
  end
  false # Retorna false
end

da_boas_vindas
numero_secreto = sorteia_numero_secreto

pontos_ate_agora = 1000
limite_de_tentativas = 5 # Cria variáve de limite de tentativas para o FOR
chutes = []

for tentativa in 1..limite_de_tentativas
  chute = pede_um_numero tentativa, limite_de_tentativas
  chutes << chute

  # .abs - trás o valor absoluto do numero, se for negativo tiva o simbolo
  pontos_a_perder = (chute - numero_secreto).abs / 2.0
  pontos_ate_agora -= pontos_a_perder

  break if verifica_se_acertou numero_secreto, chute
end

puts "Você ganhou #{pontos_ate_agora} pontos."

## 05. Case when, while, loop do