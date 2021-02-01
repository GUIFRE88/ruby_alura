puts "Bem vindo ao jogo da adivinhação"
puts "Qual é o seu nome?"
nome = gets # Pega o valor digitado pelo usuário

puts "\n\n\n\n\n\n\n" # Imprime quebra de linha
puts "Começaremos o jogo para vc, #{nome}"

puts "Escolhendo um número secreto entre 0 e 200..."
numero_secreto = 175
puts "Escolhido... que tal adivinhar hoje nosso número secreto?"

puts "\n\n\n\n\n\n\n" # Imprime quebra de linha
puts "Tentativa 1"
puts "Entre com um numero"
chute = gets
puts "Será que acertou? Você chutou #{chute}"

if chute.to_i == numero_secreto # Transforma o número do chute em INTEIRO, pois a função 'gets' transforma o valor digitado em STRING.
    puts "Acertou!"
else
    puts "Errou!"
end

# Continuar na aula 02.
# Oitavao video