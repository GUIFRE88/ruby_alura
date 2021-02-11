class Livro
    attr_reader :titulo, :preco, :ano_lancamento
    def initialize(titulo, preco, ano_lancamento)
        @titulo = titulo
        @preco = preco
        @ano_lancamento = ano_lancamento
    end
end

livro_rails = Livro.new("Agile Web Development with Rails",80,2021)
livro_ruby = Livro.new("Programming in Ruby 1.9",60,2021)

def imprime_nota_fiscal(livros)
    livros.each do |livro|
        puts "Titulo #{livro.titulo} e preço #{livro.preco}"
    end
end
livros = [livro_rails, livro_ruby]
imprime_nota_fiscal livros


# Continuar
# Orientação a Objetos: Melhores Tecnicas com Ruby
#  02. Modelos anêmicos e encapsulamento.