require_relative "ui"

def salvar_rank(nome, pontos_totais)
  conteudo = "#{nome}\n#{pontos_totais}"
  File.write = "rank.txt", conteudo # Grava no arquivo
end

def le_rank
  conteudo = File.read "rank.txt"
  conteudo.split "\n"
end

def escolhe_palavra_secreta
  avisa_escolhendo_palavra_secreta
  texto = File.read('dicionario.txt')
  todas_as_palavras = texto.split "\n" # Que o texto nas quebras de linha
  numero_escolhido = rand(todas_as_palavras.size) # Pega um numero aleatório que corresponderá a uma palavra
  palavra_secreta = todas_as_palavras[numero_escolhido].downcase
  avisa_palavra_escolhida palavra_secreta
end

def escolhe_palavra_secreta_sem_consumir_muita_memoria
  avisa_escolhendo_palavra_secreta
  arquivo = File.new('dicionario.txt') # Abrea arquivo
  quantidade_de_palavras = arquivo.gets.to_i # Busca a quantidade de palavras na primeira linha do arquivo.
  numero_escolhido = rand(quantidade_de_palavras) # Busca um numero
  for linha in 1..(numero_escolhido-1)
    arquivo.gets # Percorre as palavras dentro do arquivo, desconsiderando as que não são o numero escolhido.
  end
  palavra_secreta = arquivo.gets.downcase # Seleciona a palavra.
  arquivo.close # Fecha arquivo.
  avisa_palavra_escolhida palavra_secreta
end

def palavra_mascarada(chutes, palavra_secreta)
  for letra in palavra_secreta.chars
    if chutes.include? letra
      puts letra
    else
      puts '_'
    end
  end
end

def pede_um_chute_valido(chutes, erros, mascara)
  cabecalho_de_tentativa chutes, erros, mascara
  loop do 
    chute = pede_um_chute
    chutes << chute

    if chutes.include? chute
      avisa_chute_efetuado chute
    else
      return chute
    end
  end
end

def joga(nome)
  palavra_secreta = escolhe_palavra_secreta

  erros = 0
  chutes = []
  pontos_ate_agora = 0

  while erros < 5
    mascara = palavra_mascarada(chutes, palavra_secreta)
    pede_um_chute_valido chutes, erros, mascara
    chutou_uma_letra = chute.size == 1
    if chutou_uma_letra
      letra_procurada = chute[0]
      total_encontrado = palavra_secreta.count letra_procurada
      if total_encontrado == 0
        avisa_letra_nao_encontrada
        erros += 1
      else
        avisa_letra_encontrada total_encontrado
      end
    else
      acertou = chute == palavra_secreta
      if acertou
        avisa_acertou
        pontos_ate_agora += 100
        break
      else
        avisa_errou
        pontos_ate_agora -= 30
        erros += 1
      end
    end
  end
  avisa_pontos pontos_ate_agora
  pontos_ate_agora
end

def jogo_da_forca
  nome = da_boas_vindas
  pontos_totais = 0

  avisa_campeao_atual le_rank

  loop do
    pontos_totais+= joga nome
    avisa_pontos_totais pontos_totais
    if le_rank[1].to_i < pontos_totais
      salvar_rank nome, pontos_totais
    end
    if nao_quer_jogar
      break
    end
  end
end
