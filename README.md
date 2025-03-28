# ðŸ“„ JasperReports REST API via Docker

### ðŸ‡§ðŸ‡· API REST para geraÃ§Ã£o de relatÃ³rios JasperReports 7.0.2 via Docker  
### ðŸ‡ºðŸ‡¸ REST API for JasperReports 7.0.2 report generation via Docker

---

## ðŸ§° Tecnologias / Technologies

- Java 17
- JasperReports 7.0.2
- Node.js (Express API)
- Docker / Docker Compose
- Suporte a JSON e PostgreSQL como fontes de dados

---

## ðŸš€ Como usar / How to use

### ðŸ”§ PrÃ©-requisitos / Prerequisites

- Docker instalado / Docker installed
- RelatÃ³rios `.jasper` compilados
- Bibliotecas `.jar` do JasperReports na pasta `/lib`

---

### ðŸ“¥ Passo a passo / Step-by-step

```bash
# Clone o repositÃ³rio / Clone the repository
git clone https://github.com/seu_usuario/jasperreports-rest-docker.git
cd jasperreports-rest-docker

# Construa a imagem / Build the image
docker build -t jasper-api .

# Rode o container / Run the container
docker run -p 8080:8080 jasper-api
```

---

## ðŸ“ Estrutura do projeto / Project structure

```
.
â”œâ”€â”€ Dockerfile               # Java + Node.js
â”œâ”€â”€ docker-compose.yml       # Docker Compose (opcional)
â”œâ”€â”€ server.js                # API REST com Express
â”œâ”€â”€ lib/                     # Coloque aqui os .jar do JasperReports
â”œâ”€â”€ reports/                 # Seus arquivos .jasper
â”œâ”€â”€ output/                  # PDFs gerados
â””â”€â”€ README.md
```

---

## ðŸŒ Endpoints da API / API Endpoints

| MÃ©todo | Endpoint             | DescriÃ§Ã£o ðŸ‡§ðŸ‡· / Description ðŸ‡ºðŸ‡¸                      |
|--------|----------------------|----------------------------------------------------|
| GET    | `/health`            | Verifica se a API estÃ¡ no ar / Health check       |
| POST   | `/upload`            | Envia `.jasper` via form-data / Upload `.jasper`  |
| POST   | `/generate/json`     | Gera PDF via JSON / Generate PDF from JSON        |
| POST   | `/generate/sql`      | Gera PDF via banco PostgreSQL / From PostgreSQL   |
| GET    | `/reports`           | Lista `.jasper` disponÃ­veis / List templates      |
| GET    | `/reports/:file.pdf` | Baixa um PDF gerado / Download generated PDF      |

---

## ðŸ“¦ Exemplo de geraÃ§Ã£o com JSON

```bash
curl -X POST http://localhost:8080/generate/json \
  -H "Content-Type: application/json" \
  -d '{
    "template": "example.jasper",
    "params": { "titulo": "Teste" },
    "data": [
      { "produto": "Teclado", "valor": 100 },
      { "produto": "Mouse", "valor": 50 }
    ]
  }' --output teste.pdf
```

---

## âœ… ObservaÃ§Ãµes

- O JasperReports nÃ£o vem com linha de comando nativa â€” esta API resolve isso!
- Inclua suas bibliotecas JasperReports (7.0.2+) na pasta `lib/`
- Use o Jaspersoft Studio para compilar seus `.jrxml` â†’ `.jasper`

---

## ðŸ§‘â€ðŸ’» Autor / Author

Este projeto foi gerado com o apoio do ChatGPT, adaptado para uso real.  
Sinta-se Ã  vontade para clonar, contribuir ou adaptar.

---

ðŸŸ¢ **PRONTO PARA PRODUÃ‡ÃƒO** â€” leve, flexÃ­vel e dockerizado.  
ðŸ” Integre com Adianti, Laravel, bots, CRON, microserviÃ§os ou qualquer backend.
