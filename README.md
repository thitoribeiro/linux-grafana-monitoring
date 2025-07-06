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

---

# Monitoring Project with Grafana, Prometheus, Nginx and k6

This project implements a complete monitoring solution using Docker to orchestrate the services. The stack includes Grafana for data visualization, Prometheus for metrics collection, Node Exporter for host metrics, Nginx as a web server, and k6 for load testing.

## Technologies Used

- **Docker and Docker Compose:** For containerization and service orchestration.
- **Grafana:** Data visualization and analysis platform. Dashboards and data sources are provisioned automatically.
- **Prometheus:** Monitoring and alerting system. Collects metrics from Node Exporter and Nginx Exporter.
- **Node Exporter:** Exporter for hardware and OS metrics from Linux.
- **Nginx:** High-performance web server.
- **Nginx Prometheus Exporter:** Exports Nginx metrics to Prometheus.
- **k6:** Load testing tool to evaluate application performance.
- **InfluxDB:** Time-series database to store the results of k6 load tests.

## What was done

1.  **Containerization:** All services run in Docker containers, defined in the `docker-compose.yaml` file.
2.  **Orchestration:** The `docker-compose.yaml` file defines the initialization and interconnection of services, with `depends_on` to ensure the correct startup order.
3.  **Automatic Grafana Provisioning:**
    -   **Data Sources:** The Prometheus data source is configured automatically through the `grafana/provisioning/datasources/datasource.yml` file.
    -   **Dashboards:** A pre-configured dashboard for the Node Exporter is imported automatically. The configuration is in `grafana/provisioning/dashboards/default.yml` and the dashboard JSON is in `grafana/provisioning/dashboards/node-exporter-full.json`.
4.  **Metrics Collection:**
    -   Prometheus is configured in the `prometheus.yml` file to collect metrics from `node-exporter` and `nginx-exporter`.
    -   Nginx is configured in `nginx/nginx.conf` to expose a status page (`/stub_status`) that the `nginx-exporter` uses.
5.  **Load Testing:**
    -   The `Dockerfile` defines the k6 image, which clones a repository with the test scripts.
    -   The `k6` service in `docker-compose.yaml` runs the load tests and sends the results to InfluxDB.

## How to Run the Project

1.  **Prerequisites:**
    -   Docker and Docker Compose installed.

2.  **Clone the repository:**
    ```bash
    git clone <repository URL>
    cd <directory name>
    ```

3.  **Start the services:**
    ```bash
    docker-compose up -d
    ```

4.  **Access the services:**
    -   **Grafana:** [http://localhost:3000](http://localhost:3000) (the Node Exporter dashboard will be available)
    -   **Prometheus:** [http://localhost:9090](http://localhost:9090)
    -   **Nginx:** [http://localhost:80](http://localhost:80)

5.  **To stop the services:**
    ```bash
    docker-compose down
    ```