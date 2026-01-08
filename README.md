# 🚀 CI - Flujo de Despliegue con Spring Boot

![Build Status](https://github.com/JohanKYT/CI-FlujoDespliegue-Final/actions/workflows/ci.yml/badge.svg)
![Java](https://img.shields.io/badge/Java-21-orange)
![Spring Boot](https://img.shields.io/badge/Spring_Boot-3.x-green)
![Docker](https://img.shields.io/badge/Docker-Ready-blue)

Este repositorio contiene la implementación de un flujo de **Integración Continua (CI)** automatizado utilizando **GitHub Actions**. El pipeline valida el código, ejecuta pruebas y empaqueta la aplicación en una imagen Docker lista para despliegue.

---

## ✅ Cumplimiento de Requerimientos

El flujo de trabajo automatizado (`.github/workflows/ci.yml`) cumple con los puntos solicitados de la siguiente manera:

### 1. Build del proyecto con Maven
* **Implementación:** Se utiliza el comando `mvn clean verify`.
* **Explicación:** Este comando limpia compilaciones previas y compila todo el código fuente desde cero asegurando que no existan errores de sintaxis o dependencias rotas.
* **Ubicación:** Archivo `ci.yml`, paso: *"Build & Test with Maven"*.

### 2. Tests Unitarios e Integración
* **Implementación:** El ciclo de vida `verify` de Maven.
* **Explicación:** Al ejecutar `mvn verify`, Maven dispara automáticamente:
    * Fase `test`: Ejecuta los tests unitarios.
    * Fase `integration-test`: Ejecuta los tests de integración (validando el contexto de Spring con `@SpringBootTest`).
* **Evidencia:** El check verde en GitHub Actions confirma que todas las pruebas pasaron exitosamente.

### 3. Construcción de Imagen Docker
* **Implementación:** Comando `docker build` y archivo `Dockerfile`.
* **Explicación:** Se utiliza un `Dockerfile` optimizado (Multistage build / Eclipse Temurin) para empaquetar el JAR generado. La imagen se etiqueta con el SHA del commit (`github.sha`) para mantener un historial de versiones único.
* **Ubicación:** Archivo `ci.yml`, paso: *"Build Docker image"*.

---

## 📂 Estructura del Proyecto

```text
├── .github/workflows/
│   └── ci.yml        # ⚙️ Configuración del Pipeline de GitHub Actions
├── src/              # ☕ Código fuente Java y Tests
├── Dockerfile        # 🐳 Receta para construir la imagen Docker
├── pom.xml           # 📦 Dependencias Maven
└── README.md         # 📄 Documentación
🛠️ Tecnologías Utilizadas
Lenguaje: Java 21 (Eclipse Temurin)

Framework: Spring Boot 3

Gestor de Dependencias: Maven

Contenedorización: Docker

CI/CD: GitHub Actions

📋 Cómo probar localmente
Si deseas ejecutar el proceso manualmente en tu máquina:

Ejecutar Tests y Build:

Bash

./mvnw clean verify
Construir imagen Docker:

Bash

docker build -t mi-app-spring:v1 .
Correr el contenedor:

Bash

docker run -p 8080:8080 mi-app-spring:v1
Autores: Kevin Maquis, Juan Antamba, Rodrigo Andrade - Universidad: UDLA - Ingeniería de Software
