#Archivo principal de la aplicacion
#Flask sera el servidor de nuestra API
from flask import Flask, jsonify, request
#esta linea importa la clase Flask desde la libreria flask

app= Flask(__name__)

# Datos de ejemplo
usuarios = [
    {
        'id_usuario': 1,
        'nombre': 'Juan',
        'apellido': 'Perez',
        'edad': 30,
        'email': 'juan@gmail.com',
        'fecha_registro': '2023-10-26'
    },
    {
        'id_usuario': 2,
        'nombre': 'María',
        'apellido': 'Gómez',
        'edad': 25,
        'email': 'maria@example.com',
        'fecha_registro': '2023-10-27'
    }
]

cursos = [
    {
        'curso_id': 1,
        'nombre_curso': 'Finanzas Personales',
        'descripcion': 'Curso básico de finanzas personales',
        'fecha_creacion': '2023-10-26'
    },
    {
        'curso_id': 2,
        'nombre_curso': 'Inversiones para Principiantes',
        'descripcion': 'Introducción al mundo de las inversiones',
        'fecha_creacion': '2023-10-27'
    }
]

#RUTA RAÍZ
@app.route('/')
def index():
    return jsonify({"Saludo":"AppEducacion Financiera"})

# RUTAS PARA USUARIO
@app.route('/usuarios/', methods=['GET'])
def obtener_usuarios():
    return jsonify(usuarios)

@app.route('/usuarios/<int:id_usuario>', methods=['GET'])
def obtener_usuario(id_usuario):
    usuario = next((u for u in usuarios if u['id_usuario'] == id_usuario), None)
    if usuario:
        return jsonify(usuario)
    return jsonify({'mensaje': 'Usuario no encontrado'}), 404

@app.route('/usuarios', methods=['POST'])
def crear_usuario():
    datos = request.get_json()
    nuevo_usuario = {
        'id_usuario': len(usuarios) + 1,
        'nombre': datos['nombre'],
        'apellido': datos['apellido'],
        'edad': datos['edad'],
        'email': datos['email'],
        'fecha_registro': '2023-10-28'  # Fecha simulada
    }
    usuarios.append(nuevo_usuario)
    return jsonify({'mensaje': 'Usuario creado con éxito'}), 201

# RUTAS PARA CURSO
@app.route('/cursos', methods=['GET'])
def obtener_cursos():
    return jsonify(cursos)

@app.route('/cursos/<int:curso_id>', methods=['GET'])
def obtener_curso(curso_id):
    curso = next((c for c in cursos if c['curso_id'] == curso_id), None)
    if curso:
        return jsonify(curso)
    return jsonify({'mensaje': 'Curso no encontrado'}), 404

@app.route('/cursos', methods=['POST'])
def crear_curso():
    datos = request.get_json()
    nuevo_curso = {
        'curso_id': len(cursos) + 1,
        'nombre_curso': datos['nombre_curso'],
        'descripcion': datos['descripcion'],
        'fecha_creacion': '2023-10-28'  # Fecha simulada
    }
    cursos.append(nuevo_curso)
    return jsonify({'mensaje': 'Curso creado con éxito'}), 201



if __name__=='__main__':
    app.run(debug=True)