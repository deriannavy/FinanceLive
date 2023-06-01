# Finanzas Live
[![En desarrollo](https://img.shields.io/badge/En%20desarrollo-blue?style=flat)](https://github.com/deriannavy)

Aplicación web basada en phoenix live que permitirá visualizar y hacer estimaciones sobre los gastos diarios, mensuales o anuales, los cuales hayas registrado.

## Funciones

- [x] Crud de cuentas
- [ ] Crud gasto diario
- [ ] Tablas de gastos mensuales
- [ ] Filtros personalizados de cantidades


## Tecnologías & Arquitectura

Finanzas Live usa una arquitectura basada en solo el backend donde cada interacción con la interfaz del frontend es una llamada al backend para que este se encargue de la operación dando como resultado la interación con datos en tiempo real.

- Elixir
- Phoenix framework

## Instalación

Finanzas live requiere elixir, y mix (manejador de paquetes) para funcionar adecuadamente una vez teniendo ambos, en la carpeta raíz, ejecutar:

```bash
mix get.deps
```

Una vez instaladas las liberías necesarias para ejecutar la aplicación en modo interactivo:

```bash
mix iex -S phx.server
```

