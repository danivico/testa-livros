# Page Login loja de serviços
class Book < SitePrism::Page
    # links
    element :click_book, :xpath, '(//span[contains(text(),"Livro - ")])[1]'
    element :next_book, :xpath, '(//span[contains(text(),"Livro - ")])[2]'
    #element :ameri_book, :xpath, ''
    #element :get_isbn, :xpath, '(//table/tbody/tr[contains(text(),"Código de barras")])[1]'
  
    def login
      #binding.pry
      
      if click_book.text.include?('Box ')
        puts 'passou no if'
        puts click_book.text
        next_book.click
        
      else
        puts 'passou no else'
        puts click_book.text
        click_book.click
      end
    end

    def outros
      get_isbn = find('table tbody tr', text: 'Código de barras')
      isbn = get_isbn.all('td')[1]
      puts isbn.text
      get_autor = find('table tbody tr', text: 'Autor')
      autor = get_autor.all('td')[1]
      puts autor.text

      nova_janela = window_opened_by {visit 'https:\\www.amazon.com.br'}
      within_window -> {page.title == 'Amazon.com.br'}

      fill_in 'twotabsearchtextbox', with: isbn.text
      find('twotabsearchtextbox').send_keys :enter
      sleep 2
      como assim
      end
  end