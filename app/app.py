# Se importa la clase flask de la propia libreria de flask, 
# es la clase encargada de levantar la aplicacion, el servidor no funciona sin este importe.
from dotenv import load_dotenv
load_dotenv()

from flask import Flask, render_template, redirect, url_for, request
from flask_mysqldb import MySQL
from .config import Config

# Creacion de la instancia de aplicación, _name_ es una varible estatica especial de python
# le dice a flask donde esta ubicado el archivo principal y donde buscar recursos. Nunca cambia.
app = Flask(__name__)
app.config.from_object(Config)

# Conexion a MYSQL

#app.config['MYSQL_HOST'] = 'localhost'
#app.config['MYSQL_USER'] = 'root'
#app.config['MYSQL_PASSWORD'] = 'root'
#app.config['MYSQL_DB'] = 'donaciones'

conexion = MySQL(app)


def limpiar_categoria(cat):
    cat = cat.split(",")[0]
    cat = cat.lower()
    cat = cat.replace(" ", "-")
    cat = cat.replace("á","a").replace("é","e").replace("í","i").replace("ó","o").replace("ú","u")
    return cat


# Decoradores de ruta, sirven para que flask sepa que funciones
# ejecutar cuando alguien entre en alguna ruta en especifico
@app.route("/")
# Funcion normal de python, lo que sea que esta funcion haga es lo que vera el usuario en el navegador
def index():
    cursor = conexion.connection.cursor()

    cursor.execute("SELECT DATABASE();")
    db = cursor.fetchone()

    cursor.execute("SELECT COUNT(*) FROM centros;")
    count = cursor.fetchone()

    return f"DB: {db} | COUNT: {count}"

def pagina_no_encontrada(error):
    return render_template('404.html'), 404

    # redirect redirige al usuario a otra URL
    # url_for genera la URL de una ruta usando el nombre de la función de Flask
    #return redirect(url_for('index'))


@app.route("/about")
def about():
    return "Página sobre nosotros"

@app.route("/contacto")
def contacto():
    return "Contactanos"

@app.route("/encuesta")
def encuesta():
    return render_template("encuesta.html")
    
if __name__ == "__main__":
    app.register_error_handler(404, pagina_no_encontrada)
    app.run(debug=True)
