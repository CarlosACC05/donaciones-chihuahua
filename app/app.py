# Se importa la clase flask de la propia libreria de flask, 
# es la clase encargada de levantar la aplicacion, el servidor no funciona sin este importe.
from dotenv import load_dotenv
load_dotenv()

import os
import MySQLdb
from flask import Flask, render_template, redirect, url_for, request, jsonify
from flask_mysqldb import MySQL
from config import Config

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
    # return '<h1 style="color: blue;">Hola Carlos, tu servidor Flask está funcionando.<h1>'
    categorias = [
        "Todas",
        "Donaciones Económicas",
        "Ropa",
        "Alimentos y Despensas",
        "Juguetes",
        "Materiales para reciclar",
        "Medicamentos",
        "Otros"
    ]
    
    data = {
        'titulo': 'Despensas Bienestar',
        'bienvenida': 'Bienvenido a Despensas Bienestar',
        'numero_botones': len(categorias),
        'botones': categorias
        }

    # Si existe un parametro llamado categoria en la url lo captura en categoria y lo imprime en la terminal
    categoria = request.args.get("categoria")

    try:
        cursor = conexion.connection.cursor()


        if categoria and categoria != "Todas":

            sql = """
            SELECT 
            centros.id_centro,
            centros.nombre,
            centros.descripcion,
            centros.direccion,
            centros.telefono,
            centros.email,
            centros.pagina_web,
            categorias.nombre
            FROM centros
            JOIN centro_categoria 
            ON centros.id_centro = centro_categoria.id_centro
            JOIN categorias 
            ON categorias.id_categoria = centro_categoria.id_categoria
            WHERE categorias.nombre = %s
            """

            cursor.execute(sql, (categoria,))

        else:

            sql = """
            SELECT 
            centros.id_centro,
            centros.nombre,
            centros.descripcion,
            centros.direccion,
            centros.telefono,
            centros.email,
            centros.pagina_web,
            GROUP_CONCAT(categorias.nombre SEPARATOR ', ') AS categorias
            FROM centros
            JOIN centro_categoria 
            ON centros.id_centro = centro_categoria.id_centro
            JOIN categorias 
            ON categorias.id_categoria = centro_categoria.id_categoria
            GROUP BY centros.id_centro
            """
            cursor.execute(sql)
        centros = cursor.fetchall()
        print(centros)

        cursor.close()

        centros = [
        list(c) + [limpiar_categoria(c[7])]
        for c in centros
        ]
        print(centros)


    except Exception as ex:
        print("ERROR SQL:", ex)
        data['mensaje'] = 'Error'
        centros = []

    # 4) Mandar centros al HTML
    return render_template("index.html", data=data, centros=centros, api_key=app.config["API_KEY"])

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


@app.route("/import-db", methods=["POST"])
def import_db():
    # --- Auth ---
    api_key = app.config.get("API_KEY")
    if not api_key or request.headers.get("X-API-Key") != api_key:
        return jsonify({"error": "Unauthorized"}), 401

    # --- Locate the SQL dump (project root, one level above app/) ---
    sql_path = os.path.join(os.path.dirname(__file__), "..", "donaciones.sql")
    sql_path = os.path.abspath(sql_path)

    if not os.path.exists(sql_path):
        return jsonify({"error": f"SQL file not found at {sql_path}"}), 500

    try:
        with open(sql_path, "r", encoding="utf-8") as f:
            sql_content = f.read()
    except Exception as ex:
        return jsonify({"error": f"Could not read SQL file: {ex}"}), 500

    # --- Execute each statement individually ---
    try:
        conn = MySQLdb.connect(
            host=app.config["MYSQL_HOST"],
            user=app.config["MYSQL_USER"],
            passwd=app.config["MYSQL_PASSWORD"],
            db=app.config["MYSQL_DB"],
            port=app.config.get("MYSQL_PORT", 3306),
            charset="utf8mb4",
        )
        cursor = conn.cursor()

        # Split on semicolons, skip blank / comment-only lines
        statements = [s.strip() for s in sql_content.split(";") if s.strip()]
        executed = 0
        for stmt in statements:
            # Skip pure comment blocks
            lines = [l for l in stmt.splitlines() if not l.strip().startswith("--") and l.strip()]
            if not lines:
                continue
            try:
                cursor.execute(stmt)
                executed += 1
            except MySQLdb.Error as stmt_err:
                # Log but continue — e.g. table already exists
                print(f"[import-db] Statement warning: {stmt_err}")

        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({
            "success": True,
            "message": f"Import complete. {executed} statement(s) executed.",
        }), 200

    except Exception as ex:
        return jsonify({"error": f"Import failed: {ex}"}), 500


if __name__ == "__main__":
    app.register_error_handler(404, pagina_no_encontrada)
    app.run(debug=True)