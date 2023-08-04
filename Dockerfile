FROM ruby:3.1.2

# Trabajaremos desde el directorio app que es el nombre de la app
WORKDIR /app

# En este contenedor instalaremos las depencias de nodejs y postgresql
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Loque estamos haciendo en esta línea es decirle que copie el gemfile que
# esta en el root y lo pegue en el directorio donde se va a trabajar,
# el puento hace referencia a la carpeta app que especificamos arriba
COPY Gemfile .
COPY Gemfile.lock .

# Corremos el comando bundle install para instalar las dependencias
RUN bundle install

# Creamso un file entrypoint para que cada vez que se ejecute la app se restablezca el puerto, y asi evitar
# que la app diga que el puerto 3000 está en uso.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Si se inicializa la app desde el contenedor va a estar en línea pero solo en el contenedor,
# no tendremos acceso desde el navgador, por ello tenemos que exponer el puerto 3000 por donde la app va a ingresar
EXPOSE 3000

# Por ultimo correremos rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
