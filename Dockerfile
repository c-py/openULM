FROM elixir:latest

RUN apt-get update && \
  apt-get install -y \ 
    postgresql-client \
    inotify-tools
  
RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force

RUN mix do compile

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["mix", "phx.server"]