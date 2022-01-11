
.PHONY: all
all:
	@echo Available commands:
	@printf "    setenv        Prepare the environment\n"
	@printf "    run           Run local dev environment\n"
	@printf "    start_db\n"
	@printf "    stop_db\n"

.PHONY: setenv
setenv:
	mix deps.get
	$(MAKE) start_db
	mix ecto.setup

.PHONY: run
run: start_db
	mix phx.server

.PHONY: start_db
start_db:
	(docker ps | grep postgres) || ((docker rm postgres || true ) && docker run -d --network=host -e POSTGRES_PASSWORD=postgres --name postgres postgres)
	@sleep 1
	mix ecto.create

.PHONY: stop_db
stop_db:
	(docker stop postgres && docker rm postgres ) || true
