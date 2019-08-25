# Page Login loja de serviços
class Book < SitePrism::Page
    # links
    element :click_book, :xpath, '(//span[contains(text(),"Livro - ")])[2]'
    element :next_book, :xpath, '(//span[contains(text(),"Livro - ")])[3]' 
    #element :ameri_book, :xpath, ''
    #element :get_isbn, :xpath, '(//table/tbody/tr[contains(text(),"Código de barras")])[1]'
  
    include RSpec::Matchers
    def login      
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
    def wait_element_visible_in(element)
      element.visible?
    end

    def outros
      get_isbn = find('table tbody tr', text: 'Código de barras')
      isbn = get_isbn.all('td')[1]
      puts isbn.text
      get_autor = find('table tbody tr', text: 'Autor')
      autor = get_autor.all('td')[1]
      puts autor.text

      new_window = open_new_window

      within_window (new_window) do
        visit 'https://www.shoptime.com.br/'
        expect(page).to have_content 'Shoptime'
        fill_in 'h_search-input', with: isbn.text
        find('h_search-btn').send_keys :enter
        find('h1', text: click_book.text)
        expect('table tbody tr', text: 'Código de barras').to eql?(isbn.text)
        expect('table tbody tr', text: 'Autor(a)').to eql?(autor.text)
        sleep 2
        new_window.close
      end
      new_window = open_new_window

      within_window (new_window) do
        visit 'https://www.americanas.com.br/'
        expect(page).to have_content 'Americanas'
        fill_in 'h_search-input', with: isbn.text
        find('h_search-btn').send_keys :enter
        find('h3', text: click_book.text)
        expect('table tbody tr', text: 'Código de barras').to eql?(isbn.text)
        expect('table tbody tr', text: 'Autor(a)').to eql?(autor.text)
        sleep 2
        new_window.close
      end
    end
end
