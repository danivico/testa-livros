Dado(/^que eu esteja na home da loja submarino$/) do
    visit 'https://www.submarino.com.br'
end

Quando(/^eu procuro pelo primeiro livro$/) do

    obj_login = Book.new
    obj_login.login
    #sleep 2
end

Então (/^eu copio o ISBN e pesquiso em outros sites$/) do

    obj_login = Book.new
    obj_login.outros
end
