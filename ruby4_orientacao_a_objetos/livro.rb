class Livro
  # Cria atributos da classe
  attr_reader :titulo, :preco,:ano_lancamento # Cria atributos de apenas leitura
  # Cria o inicializador da classe, passando os valores dos parametros para os atributos da classe
  def initialize(titulo, preco, ano_lancamento, possui_reimpressao)
    @titulo = titulo
    @ano_lancamento = ano_lancamento
    @possui_reimpressao = possui_reimpressao
    @preco = calcula_preco(preco)
  end

  def possui_reimpressao?
    @possui_reimpressao
  end

  def to_csv
    "#{@titulo}, #{@ano_lancamento}, #{@preco}"
  end

  private # Metodos apenas chamados na classe mesmo

  def calcula_preco(base)
    if @ano_lancamento <2006
      if @possui_reimpressao
        base * 0.9
      else
        base * 0.5
      end
    elsif @ano_lancamento <= 2010
      if @possui_reimpressao
        base * 0.96
      else
        base
      end
    end
  end
end

def livro_para_newsletter(livro)
  if livro.ano_lancamento < 1999
    puts "###########################"
    puts "Newsletter/Liquidação"
    puts livro.titulo
    puts livro.preco
    puts livro.possui_reimpressao?
    puts "###########################"
  end
end

module Contador
  def <<(livro)
    push(livro)
    if @maximo_necessario.nil? || @maximo_necessario < size
      @maximo_necessario = size
    end
    self
  end
  def maximo_necessario
    @maximo_necessario
  end
end

class Estoque
  attr_reader :livros
  def initialize
    @livros = []
    @livros.extend Contador
  end

  def exporta_csv
    @livros.each do |livro|
      puts livro.to_csv
    end
  end

  def mais_barato_que(valor)
    @livros.each do |livro|
      livro.preco <= valor
    end
  end

  def total
    @livros.size
  end

  def adiciona(livro)
    @livros << livro if livro
  end
end

algoritimos = Livro.new("Algoritimos", 100, 1998, true)
arquitetura = Livro.new("Arquitetura", 70, 2011, true)

estoque = Estoque.new
estoque << algoritimos
puts estoque.livros.maximo_necessario
estoque << arquitetura
estoque << Livro.new("Programando em C", 100, 1999, true)
estoque << Livro.new("Programando em Ruby", 100, 2004, true)

estoque.livros.delete algoritimos

# Continuar
# Orientação a Objetos: Melhores Tecnicas com Ruby
#  02. Modelos anêmicos e encapsulamento.