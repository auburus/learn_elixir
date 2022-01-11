
all:
	@echo Available commands:
	@printf "    run\n"
	@printf "    start_db\n"
	@printf "    stop_db\n"

run: start_db
	mix phx.server

start_db:
	(docker ps | grep postgres) || ((docker rm postgres || true ) && docker run -d --network=host -e POSTGRES_PASSWORD=postgres --name postgres postgres)
	@sleep 1
	mix ecto.create

stop_db:
	(docker stop postgres && docker rm postgres ) || true
