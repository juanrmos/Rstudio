# Script de Configuración Inicial
# Ejecuta este script ANTES de correr los análisis

# 1. Crear carpeta de outputs si no existe
if (!dir.exists("outputs")) {
  dir.create("outputs")
  cat("✓ Carpeta 'outputs' creada exitosamente\n")
} else {
  cat("✓ Carpeta 'outputs' ya existe\n")
}

# 2. Verificar que existe el archivo de datos
if (file.exists("DRTC-H.xlsx")) {
  cat("✓ Archivo DRTC-H.xlsx encontrado\n")
} else {
  cat("✗ ERROR: No se encuentra el archivo DRTC-H.xlsx\n")
  cat("  Por favor, coloca el archivo en la misma carpeta que este script\n")
  stop("Archivo de datos no encontrado")
}

# 3. Instalar/cargar paquetes necesarios
paquetes_necesarios <- c(
  "readxl", "dplyr", "ggplot2", "lubridate", 
  "stringr", "scales", "tidyr", "forcats",
  "knitr", "kableExtra"
)

cat("\nVerificando paquetes necesarios...\n")
for (pkg in paquetes_necesarios) {
  if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat(paste0("Instalando ", pkg, "...\n"))
    install.packages(pkg, dependencies = TRUE)
  } else {
    cat(paste0("✓ ", pkg, " ya está instalado\n"))
  }
}

# 4. Resumen
cat("\n========================================\n")
cat("CONFIGURACIÓN COMPLETADA\n")
cat("========================================\n\n")
cat("Puedes proceder a ejecutar los análisis:\n")
cat("1. Renderiza 'operaciones.qmd' primero\n")
cat("2. Luego renderiza 'presentacion.qmd'\n\n")
cat("¡Buena suerte con tu investigación! 🎓\n")

