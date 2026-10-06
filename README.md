# Facu & Pichu — Casamiento
Panel privado para proveedores, pagos, fondo disponible, regalos, gastos estimados y por presupuestar. Invitados con estado, adulto/menor, mesa, menú y exportación CSV. Comprobantes JPG, PNG y PDF hasta 2 MB por proveedor.

## Arquitectura
Frontend HTML/CSS/JS, Vercel Functions y Neon Postgres mediante Drizzle. Los datos privados y comprobantes permanecen en Neon; no se incluyen en el repositorio. Acceso mediante cookie firmada HttpOnly/Secure/SameSite y clave compartida. Las escrituras usan una versión para evitar sobrescribir cambios concurrentes. Usar Actualizar para traer cambios de otro dispositivo.

## Configuración
Variables de servidor: DATABASE_URL (Neon), ACCESS_PASSWORD, SESSION_SECRET (aleatoria de 32 bytes o más). Aplicar migrations/0001.sql al nuevo proyecto antes de usar. Cargar wedding_state con id=1 y el JSON de inicialización privado. No incluir secretos ni datos iniciales en Git.

## Vercel
Preset Other, raíz ./, sin build command. Node.js 22 o superior. Las funciones api/ se detectan automáticamente. No configurar datos privados en variables VITE_ ni NEXT_PUBLIC_.

## Verificación
`npm test` prueba firmas de sesión, rechazo de manipulación y validación de importes y estados. Probar persistencia y conflictos entre dos sesiones antes de publicar.

## Datos monetarios
No se mezclan ARS y USD. Los costos desconocidos son null, no cero. Regalos y pagos aparte no consumen el fondo disponible. El saldo de catering no se estima automáticamente hasta obtener el nuevo precio.

## Dashboard de invitados

Disponible en `/invitados` y en la sección Invitados del dashboard general.
Incluye contadores configurables, filtros combinables, tarjetas o tabla, vistas guardadas en el navegador, edición múltiple y lista independiente para el civil.
La vista Country exporta TXT o CSV solo con DNI, o nombre y DNI; excluye documentos faltantes, inválidos o repetidos. Catering exporta nombre, menú, edad y ubicación.
Las respuestas sin vincular se revisan aparte y no se cuentan como personas adicionales hasta confirmar el cruce. Los campos opcionales `dni` (cadena de 7 u 8 dígitos) y `civil` (booleano) se conservan con el estado sincronizado en Neon.

## Plano a escala

El salón admite ancho y profundidad entre 3 y 80 m, configurables desde el formulario o las cuatro esquinas. Las medidas iniciales (20 × 15 m) son solo una referencia. La cuadrícula representa metros; el zoom no modifica medidas guardadas.
Cada espacio admite ancho, profundidad, movimiento, redimensionamiento desde esquinas y giro de 90°. Mesas, livings y mesa de novios reciben invitados; barra, DJ, fotos, pista, entrada y espacios personalizados son zonas sin asientos. Al achicar el salón se conservan las dimensiones de los elementos y se reubican dentro del borde. No se impiden superposiciones.
