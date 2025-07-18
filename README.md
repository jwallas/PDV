# Sistema de Pedidos - Delphi

Projeto desenvolvido como parte de avaliação prática para vaga de Desenvolvedor Delphi Sênior.

Este sistema básico simula um **PDV (Ponto de Venda)**, permitindo:
- Cadastro e seleção de clientes e produtos.
- Inclusão de itens no pedido.
- Cálculo automático de subtotal.
- Gravação de pedidos.

---

## 📦 Arquitetura Modular do Projeto

O código está estruturado em camadas bem definidas, localizadas dentro da pasta `/src`:

/src
├── Controllers
├── Interfaces
├── Models
├── Queries
├── Repositories
├── Views
└── ViewsModels


### 📂 Explicação das Pastas

- **Controllers/**  
  Controla o fluxo do sistema, intermediando Views, Models e Repositories.

- **Interfaces/**  
  Define abstrações que reduzem o acoplamento e facilitam a manutenção.

- **Models/**  
  Representa entidades do negócio: Cliente, Produto, Pedido, ItemPedido.

- **Queries/**  
  Consultas específicas do sistema, usadas para relatórios e carregamentos parciais.

- **Repositories/**  
  Responsáveis pela camada de acesso a dados com **SQLite**, incluindo:
  - Criação automática do banco e tabelas no primeiro uso.
  - Operações CRUD encapsuladas.
  - Independência da UI para persistência.

- **Views/**  
  Telas (VCL Forms) responsáveis pela interação com o usuário.

- **ViewsModels/**  
  Camada opcional para organização de dados da interface no padrão MVVM.

---

## ✅ Benefícios do Modelo

- Aplicação de princípios **SOLID**.
- Separação entre **lógica de negócios** e **persistência**.
- Banco de dados **SQLite** leve e local, sem dependência de servidores externos.
- Reaproveitamento futuro do código com diferentes tecnologias (ex.: FireDAC, REST).
- Facilitada a manutenção, testes e expansão do sistema.

---

## 📋 Tecnologias Utilizadas

- Delphi 
- VCL
- ClientDataSet 
- TDBGrid para exibição dos itens do pedido
- SQLITE
---

## 🚀 Como Executar

1. Clone o repositório.
2. Abra o arquivo do projeto (`PDV.dproj`) no Delphi.
3. Compile e execute o projeto.

Não é necessária configuração de banco de dados externo, pois o sistema irá criar o banco e as tabelas.

---

## 🗂️ Estrutura Principal

- **TFormPDV**: Tela principal do sistema, responsável pela entrada de pedidos.
- **Componentes principais**:
  - `TPanel pnlTopo`: Área de entrada de produtos e dados do cliente.
  - `TDBGrid dbGridProdutos`: Exibição dos itens adicionados.
  - `TPanel pnlSubtotal`: Exibe o subtotal atualizado.
  - `TClientDataSet ClientDataSetItens`: Gerencia os itens do pedido.
- **Menus**:
  - `Cadastros`: Acesso a cadastros de clientes e produtos.
  - `Consultas`: Visualização de pedidos realizados.

---

## 💡 Funcionalidades

- Buscar e exibir cliente pelo código.
- Buscar e exibir produto pelo código.
- Entrada de quantidade e valor unitário.
- Inclusão automática no grid e atualização do subtotal.
- Permite cancelamento do pedido.
- Exclusão de itens.
- Gravação do pedido.

---

## ⚙️ Observações Técnicas

- O banco de dados (`pdv.db`) é criado automaticamente.
- As tabelas são geradas caso não existam.
- CRUD operando via **FireDAC**.
- Validações básicas implementadas nos eventos `OnExit` dos campos.

---

## 📞 Contato

Desenvolvido por [José Wallas Machado].  
Email: [jwallas211@gmail.com]

---


