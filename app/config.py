import os

class Config:
    API_KEY = os.getenv("API_KEY")
    
    MYSQL_PORT = int(os.getenv("MYSQL_PORT", 3306))
    MYSQL_HOST = os.getenv("MYSQL_HOST")
    MYSQL_USER = os.getenv("MYSQL_USER")
    MYSQL_PASSWORD = os.getenv("MYSQL_PASSWORD")
    MYSQL_DB = os.getenv("MYSQL_DB")

    # Validación REAL
    required = [MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DB]
    if not all(required):
        raise Exception("Faltan variables de entorno de MySQL")