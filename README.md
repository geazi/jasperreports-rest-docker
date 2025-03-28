# JasperReports REST API via Docker

### API REST para geração de relatórios JasperReports 7.0.2 via Docker  
### REST API for JasperReports 7.0.2 report generation via Docker

---

## Tecnologias / Technologies

- Java 17  
- JasperReports 7.0.2  
- Node.js (Express API)  
- Docker / Docker Compose  
- Suporte a JSON e PostgreSQL como fontes de dados  

---

## Como usar / How to use

### Pré-requisitos / Prerequisites

- Docker instalado / Docker installed  
- Relatórios `.jasper` compilados  
- Bibliotecas `.jar` do JasperReports na pasta `/lib`  

---

### Passo a passo / Step-by-step

```bash
# Clone o repositório / Clone the repository
git clone https://github.com/seu_usuario/jasperreports-rest-docker.git
cd jasperreports-rest-docker

# Construa a imagem / Build the image
docker build -t jasper-api .

# Rode o container / Run the container
docker run -p 8080:8080 jasper-api
```

---

## Estrutura do projeto / Project structure

```
.
├── Dockerfile
├── docker-compose.yml
├── server.js
├── lib/
├── reports/
├── output/
└── README.md
```

---

## Endpoints da API / API Endpoints

| Método | Endpoint             | Descrição / Description               |
|--------|----------------------|---------------------------------------|
| GET    | `/health`            | Verifica se a API está no ar          |
| POST   | `/upload`            | Envia `.jasper` via form-data         |
| POST   | `/generate/json`     | Gera PDF via JSON                     |
| POST   | `/generate/sql`      | Gera PDF via banco PostgreSQL         |
| GET    | `/reports`           | Lista `.jasper` disponíveis           |
| GET    | `/reports/:file.pdf` | Baixa um PDF gerado                   |

---

## Exemplo de geração com JSON

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

## Observações

- Inclua suas bibliotecas JasperReports (7.0.2+) na pasta `lib/`
- Use o Jaspersoft Studio para compilar seus `.jrxml` → `.jasper`  

---

## Autor / Author

Este projeto foi gerado com o apoio do ChatGPT.  
Sinta-se à vontade para clonar, contribuir ou adaptar.
