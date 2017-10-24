require 'prawn'

module GeneratePdf
  PDF_OPTIONS = {
    # Escolhe o Page size como uma folha A4
    :page_size   => "A4",
    # Define o formato do layout como portrait (poderia ser landscape)
    :page_layout => :portrait,
    # Define a margem do documento
    :margin      => [40, 75]
  }

  def self.locacao cliente, veiculo, dataSaida, dataEntrada, precoDiaria, calculaLocacao
    # Apenas uma string aleatório para termos um corpo de texto pro contrato


    Prawn::Document.new(PDF_OPTIONS) do |pdf|
      # Define a cor do traçado
      pdf.fill_color "000000"
      # Cria um texto com tamanho 30 PDF Points, bold alinha no centro
      pdf.text "Locação", :size => 50, :style => :bold, :align => :center
      # Move 80 PDF points para baixo o cursor
      pdf.move_down 80
      # Escreve o texto do contrato com o tamanho de 14 PDF points, com o alinhamento justify
      # Move mais 30 PDF points para baixo o cursor
      pdf.move_down 30
      # Escreve o texto com os detalhes que o usuário entrou
      #pdf.text "#{details}", :size => 12, :align => :justify, :inline_format => true
      # Move mais 30 PDF points para baixo o cursor
      pdf.move_down 10
      # Adiciona o nome com 12 PDF points, justify e com o formato inline (Observe que o <b></b> funciona para deixar em negrito)
      #pdf.text "Com o cliente: <b>#{name}</b> por R$#{price}", :size => 12, :align => :justify, :inline_format => true
      # Muda de font para Helvetica
      pdf.font "Helvetica", :size => 18, :style => :bold
      pdf.text "Cliente: #{cliente}", :size => 18, :style => :bold, :color => '000000'
      pdf.text "Veiculo: #{veiculo}", :size => 18, :style => :bold
      pdf.text "Data Saida do Veiculo: #{dataSaida}", :size => 18, :style => :bold
      pdf.text "Data da volta para a locadora: #{dataEntrada}", :size => 18, :style => :bold
      pdf.text "Valor da diaria do Veiculo: R$ #{precoDiaria}", :size => 18, :style => :bold
      pdf.text "Valor total da locação: R$ #{calculaLocacao}", :size => 18, :style => :bold

      # Inclui um texto com um link clicável (usando a tag link) no bottom da folha do lado esquerdo e coloca uma cor especifica nessa parte (usando a tag color)
      # Inclui em baixo da folha do lado direito a data e o némero da página usando a tag page
      pdf.number_pages "Gerado: #{(Time.now).strftime("%d/%m/%y as %H:%M")} - Página <page>", :start_count_at => 0, :page_filter => :all, :at => [pdf.bounds.right - 140, 7], :align => :right, :size => 8
      # Gera no nosso PDF e coloca na pasta public com o nome locacao.pdf
      pdf.render_file("public/pdf/locacao#{(DateTime.now).strftime('%d-%m-%y_%H-%M-%S')}.pdf")
    end
  end

end
