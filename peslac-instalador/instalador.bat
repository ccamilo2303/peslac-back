@echo off
chcp 65001
echo ╔══╗╔╗─╔╗╔══╗╔════╗╔══╗╔╗──╔══╗╔══╗╔══╗╔══╗╔╗─╔╗───
echo ╚╗╔╝║╚═╝║║╔═╝╚═╗╔═╝║╔╗║║║──║╔╗║║╔═╝╚╗╔╝║╔╗║║╚═╝║───
echo ─║║─║╔╗─║║╚═╗──║║──║╚╝║║║──║╚╝║║║───║║─║║║║║╔╗─║───
echo ─║║─║║╚╗║╚═╗║──║║──║╔╗║║║──║╔╗║║║───║║─║║║║║║╚╗║───
echo ╔╝╚╗║║─║║╔═╝║──║║──║║║║║╚═╗║║║║║╚═╗╔╝╚╗║╚╝║║║─║║───
echo ╚══╝╚╝─╚╝╚══╝──╚╝──╚╝╚╝╚══╝╚╝╚╝╚══╝╚══╝╚══╝╚╝─╚╝───
echo\
echo\ 
echo ───────────────╔═══╗╔═══╗╔══╗╔╗──╔══╗╔══╗─────────
echo ───────────────║╔═╗║║╔══╝║╔═╝║║──║╔╗║║╔═╝─────────
echo ───────────────║╚═╝║║╚══╗║╚═╗║║──║╚╝║║║───────────
echo ───────────────║╔══╝║╔══╝╚═╗║║║──║╔╗║║║───────────
echo ───────────────║║───║╚══╗╔═╝║║╚═╗║║║║║╚═╗─────────
echo ───────────────╚╝───╚═══╝╚══╝╚══╝╚╝╚╝╚══╝─────────
echo\
echo\
echo\

docker stop peslac-back_graphql-engine_1
docker stop peslac-back_postgres_1
docker rm peslac-back_graphql-engine_1
docker rm peslac-back_postgres_1
docker volume rm peslac-back_db_data
echo\
echo\
echo\

docker-compose -p peslac-back up -d

echo\
echo\
echo\
echo Instalación existosa
echo\
echo\
echo\
@Pause