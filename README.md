# galaxy-local
Local Galaxy Quickstart using Docker

## Getting Started

### Prerequisits
- docker
- docker-compose

### Instructions
1. Clone repository
2. `docker-compose build`
3. `docker-compose up -d`
4. Navigate to localhost:8080
5. Install tools (https://galaxyproject.org/admin/tools/add-tool-from-toolshed-tutorial/)
6. Configure tools to allow unescaped html output (as needed)

### Configuration
1. Edit galaxy.yml and restart container using `docker-compose restart`
