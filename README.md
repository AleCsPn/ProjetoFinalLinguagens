# Sistema de Gerenciamento de Produtos

Sistema desktop desenvolvido em C# Windows Forms para gerenciamento e cadastro de produtos em um supermercado.

## 📋 Descrição

Este projeto é um sistema de cadastro que permite gerenciar informações sobre produtos, incluindo nome, quantidade em estoque, setor e seu preço. O sistema utiliza MySQL como banco de dados e oferece uma interface gráfica intuitiva para cadastro e busca de informações.

## 🚀 Tecnologias Utilizadas

- **C# (.NET Framework)** - Linguagem de programação
- **Windows Forms** - Framework para interface gráfica
- **MySQL 8.1.0** - Sistema de gerenciamento de banco de dados
- **ADO.NET** - Acesso a dados
- **Visual Studio** - IDE de desenvolvimento

## 📦 Dependências

O projeto utiliza as seguintes bibliotecas NuGet:

- MySql.Data 8.1.0


## 🗄️ Estrutura do Banco de Dados

O sistema utiliza duas tabelas principais:

### Tabela `setor`
- `idsetor` (INT, AUTO_INCREMENT, PRIMARY KEY)
- `nomesetor` (VARCHAR(45))

Gêneros pré-cadastrados: Rock, Metal, Pagode, Gospel, Funk

### Tabela `produtos`
- `idproduto` (INT, AUTO_INCREMENT, PRIMARY KEY)
- `nome` (VARCHAR(45))
- `quantidade` (INT)
- `preco` (DOUBLE)
- `fk_setor` (INT, FOREIGN KEY)

### Stored Procedures

- `sp_insereProduto` - Insere um novo produto
- `sp_listaProdutos` - Lista todos os produtos com seus setores, estoques e preços.
- `sp_listaSetor` - Lista todos os Setores existentes até então

## ⚙️ Instalação e Configuração

### Pré-requisitos

- Visual Studio 2019 ou superior
- MySQL Server 8.0 ou superior
- .NET Framework 4.7.2 ou superior

### Passo a Passo

1. **Clone o repositório**
   ```bash
   git clone <url-do-repositorio>
   cd "Semana 12 - Projeto CSharp - Modelo"
   ```

2. **Configure o Banco de Dados**
   - Abra o MySQL Workbench ou outro cliente MySQL
   - Execute o script `DumpBancoCadastro.sql` para criar as tabelas e procedures
   ```sql
   source DumpBancoCadastro.sql
   ```

3. **Configure a String de Conexão**
   - Abra o arquivo `App.config` no projeto SistemaCadastro
   - Atualize a string de conexão com suas credenciais do MySQL
   ```xml
   <connectionStrings>
     <add name="MySqlConnection" 
          connectionString="Server=localhost;Database=cadastro;Uid=root;Pwd=sua_senha;" 
          providerName="MySql.Data.MySqlClient"/>
   </connectionStrings>
   ```

4. **Restaure os Pacotes NuGet**
   - No Visual Studio, clique com o botão direito na solução
   - Selecione "Restore NuGet Packages"

5. **Compile e Execute**
   - Pressione `F5` ou clique em "Start" no Visual Studio

## 🎯 Funcionalidades

- ✅ **Cadastro de Produtos** - Adicione novos Produtos com informações completas
- 🔍 **Busca de Produtos** - Pesquise Produtos cadastrados
- 📝 **Alteração de Dados** - Edite informações de produtos existentes
- 🗑️ **Remoção de Produtos** - Exclua registros do sistema
- 🛒 **Gerenciamento de Setores** - Adicione novos setores
- 📊 **Visualização em Lista** - Veja todas os produtos cadastrados


## 🎨 Interface

O sistema possui uma interface com navegação por abas:

- **Aba Cadastro** - Formulário para inserir novas bandas
- **Aba Busca** - Interface para pesquisar e visualizar bandas cadastradas

A navegação é facilitada por botões laterais com indicador visual de aba selecionada.


## 📝 Licença

Este projeto é um trabalho acadêmico desenvolvido para fins de aprendizado e para cumprir os requisitos de conclusão do período.

## 👥 Autor

Desenvolvido como projeto final da matéria de Linguagem I no curso de Bacharelado em Sistemas da Informação por Alexandre Costa Penha da Silva

