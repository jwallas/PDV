# Sistema de Pedidos - Delphi

Projeto desenvolvido como parte de avaliação prática para vaga de Desenvolvedor Delphi Sênior.

Este sistema básico simula um **PDV (Ponto de Venda)**, permitindo:
- Cadastro e seleção de clientes e produtos.
- Inclusão de itens no pedido.
- Cálculo automático de subtotal.
- Gravação de pedidos.

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
- Gravação do pedido (simulada).

---

## ⚙️ Observações Técnicas

- A persistência dos dados e consultas estão sendo feitas no banco SQLITE.
- Foi utilizado um modelo de MVC para acesso a dados.
- Validações básicas implementadas nos eventos `OnExit` dos campos.
- O subtotal é recalculado automaticamente após alterações no `ClientDataSetItens`.

---

## 📞 Contato

Desenvolvido por [José Wallas Machado].  
Email: [jwallas211@gmail.com]

---


