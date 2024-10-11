# Workshop SSI 2024: Subindo um banco de dados em container

Repositório criado para a SSI 2024.

## Passo a passo

* No terminal, execute o seguinte comando: `docker pull postgres:16`
* Copie os arquivos `init_db.sql` e `docker.sh` para a raiz do codespace
* O `docker.sh` é um script, logo ele precisa de permissão de execução. Execute o seguinte comando para concedê-la: `chmod +x docker.sh`
* Execute o `docker.sh`

## O que fizemos?

```bash
docker run --rm -d --name workshop-ssi \
    # Associa a porta 5432 do host com a porta 5432 do container
	-p 5432:5432 \ 

    # Define a senha do banco e o diretório **no container** onde os dados ficam
    # armazenados com variáveis de ambiente
	-e POSTGRES_PASSWORD=banana \ # 
	-e PGDATA=/var/lib/postgresql/data/pgdata \

    # Associamos pastas do nosso host (à esquerda do ":") para o container (à
    # direita do ":") com bind mounts ( `-v` ou `--volume` )
	-v $PWD/dados:/var/lib/postgresql/data \
	-v $PWD/init_db.sql:/docker-entrypoint-initdb.d/init_db.sql \

    # Executamos o container a partir da imagem do postgres, versão 16
	postgres:16
```
* Fizemos a associação da porta 5432 do host com a porta 5432 do container ( `-p` ou `--port` )
* Definimos a senha e o diretório do container onde os dados ficam armazenados usando variáveis de ambiente ( `-e` ou `--env` )
* Associamos pastas do nosso host (à esquerda do ":") para o container (à direita do ":") com bind mounts ( `-v` ou `--volume` )
* Executamos o container a partir da imagem do postgres, versão 16 ( `postgres:16` )
