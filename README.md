# Despensas Bienestar 🤝

Aplicación web desarrollada con Flask y MySQL que muestra los **centros de donación** en la ciudad de Chihuahua, permitiendo filtrar por categoría (alimentos, ropa, juguetes, etc.).

## Tecnologías
- Python 3.12
- Flask 3.1.3
- Flask-MySQLdb
- MySQL 8.0
- HTML / CSS / JS

## Estructura del proyecto
```
Fundamentos_Flask/
├── app/
│   ├── app.py               # Aplicación principal
│   ├── static/
│   │   ├── css/base.css
│   │   └── js/base.js
│   └── templates/
│       ├── base.html
│       ├── index.html
│       └── 404.html
├── donaciones.sql           # Script para crear y poblar la base de datos
├── requirements.txt
└── README.md
```

## Instalación y configuración

### 1. Clonar el repositorio
```bash
git clone https://github.com/tu-usuario/tu-repositorio.git
cd tu-repositorio
```

### 2. Crear y activar el entorno virtual
```bash
python3 -m venv venv

# En Linux/Mac:
source venv/bin/activate

# En Windows:
venv\Scripts\activate
```

### 3. Instalar dependencias
```bash
pip install -r requirements.txt
```

### 4. Configurar la base de datos MySQL
```bash
mysql -u root -p < donaciones.sql
```

### 5. Configurar credenciales en `app/app.py`
Edita las siguientes líneas con tus datos de MySQL:
```python
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'tu_usuario'
app.config['MYSQL_PASSWORD'] = 'tu_contraseña'
app.config['MYSQL_DB'] = 'donaciones'
```

### 6. Ejecutar la aplicación
```bash
cd app
python app.py
```

La app estará disponible en `http://localhost:5000`

## Centros de donación incluidos
- **Banco de Alimentos Chihuahua** – Alimentos y donaciones económicas
- **Casa Hogar Esperanza** – Ropa y juguetes
- **Cruz Roja Mexicana** – Donaciones económicas, alimentos y otros

## Categorías disponibles
- Donaciones Económicas
- Ropa
- Alimentos y Despensas
- Juguetes
- Materiales de Construcción
- Otros
