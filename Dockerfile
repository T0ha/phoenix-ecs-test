FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y wget gnupg
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb 
RUN dpkg -i erlang-solutions_1.0_all.deb
RUN apt-get update
RUN apt-get install -y esl-erlang elixir webpack

COPY docker_test /opt/app

WORKDIR /opt/app

RUN mix local.hex --force
RUN mix do deps.get, compile

EXPOSE 4000

CMD mix phx.server
