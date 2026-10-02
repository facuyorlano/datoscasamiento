# Facu & Pichu — Casamiento
Dashboard responsive sin dependencias. Proveedores con rubro, contacto, moneda, importe contratado, pago acumulado, saldo y vencimiento. Presupuesto separado ARS/USD. Invitados con estado, mesa, menú, contacto y notas. Importación de nombres por línea; exportación CSV compatible con Excel (respeta filtros); respaldo/restauración JSON.

## Ejecutar
`python3 -m http.server 8000`

## Vercel
Importar este repositorio en Vercel, seleccionar Other, sin comando de build y directorio de salida raíz (`.`).

## Persistencia
Esta primera versión guarda en localStorage del navegador. No sincroniza entre dispositivos. Descargar respaldo periódicamente. Los datos ingresados no se envían al repositorio ni a un servidor. Para uso compartido es necesario configurar una base de datos y autenticación antes de cargar información real en la nube.
