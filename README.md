# Projeto de Monitoramento com Grafana, Prometheus, Nginx e k6

Este projeto implementa uma solução de monitoramento completa utilizando Docker para orquestrar os serviços. A stack inclui Grafana para visualização de dados, Prometheus para coleta de métricas, Node Exporter para métricas do host, Nginx como web server e k6 para testes de carga.

## Tecnologias Utilizadas

- **Docker e Docker Compose:** Para containerização e orquestração dos serviços.
- **Grafana:** Plataforma de visualização e análise de dados. Os dashboards e data sources são provisionados automaticamente.
- **Prometheus:** Sistema de monitoramento e alerta. Coleta métricas do Node Exporter e do Nginx Exporter.
- **Node Exporter:** Exportador de métricas de hardware e do SO Linux.
- **Nginx:** Servidor web de alta performance.
- **Nginx Prometheus Exporter:** Exporta métricas do Nginx para o Prometheus.
- **k6:** Ferramenta de teste de carga para avaliar a performance da aplicação.
- **InfluxDB:** Banco de dados de série temporal para armazenar os resultados dos testes de carga do k6.

## O que foi feito

1.  **Containerização:** Todos os serviços são executados em contêineres Docker, definidos no arquivo `docker-compose.yaml`.
2.  **Orquestração:** O `docker-compose.yaml` define a inicialização e a interconexão dos serviços, com `depends_on` para garantir a ordem correta de subida.
3.  **Provisionamento Automático do Grafana:**
    -   **Data Sources:** O data source do Prometheus é configurado automaticamente através do arquivo `grafana/provisioning/datasources/datasource.yml`.
    -   **Dashboards:** Um dashboard pré-configurado para o Node Exporter é importado automaticamente. A configuração está em `grafana/provisioning/dashboards/default.yml` e o JSON do dashboard em `grafana/provisioning/dashboards/node-exporter-full.json`.
4.  **Coleta de Métricas:**
    -   O Prometheus está configurado no arquivo `prometheus.yml` para coletar métricas do `node-exporter` e do `nginx-exporter`.
    -   O Nginx está configurado em `nginx/nginx.conf` para expor uma página de status (`/stub_status`) que o `nginx-exporter` utiliza.
5.  **Testes de Carga:**
    -   O `Dockerfile` define a imagem do k6, que clona um repositório com os scripts de teste.
    -   O serviço `k6` no `docker-compose.yaml` executa os testes de carga e envia os resultados para o InfluxDB.

## Como Executar o Projeto

1.  **Pré-requisitos:**
    -   Docker e Docker Compose instalados.

2.  **Clone o repositório:**
    ```bash
    git clone <URL do repositório>
    cd <nome do diretório>
    ```

3.  **Inicie os serviços:**
    ```bash
    docker-compose up -d
    ```

4.  **Acesse os serviços:**
    -   **Grafana:** [http://localhost:3000](http://localhost:3000) (o dashboard do Node Exporter já estará disponível)
    -   **Prometheus:** [http://localhost:9090](http://localhost:9090)
    -   **Nginx:** [http://localhost:80](http://localhost:80)

5.  **Para parar os serviços:**
    ```bash
    docker-compose down
    ```