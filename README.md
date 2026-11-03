# APEX Monitor

A native Qt/C++ workstation for observing, recording and analysing robotics hardware.

> **Milestone 01 · UI foundation**
>
> The current Overview is a visual prototype. Values are illustrative and explicitly labelled as demo data. No hardware connection is active yet.

## Visual reference

The Overview is a native QML adaptation of the supplied `web3-bento.tsx` component. It preserves the reference's key design decisions:

- Four-column, varied-span bento composition rather than a uniform card grid.
- 26 px rounded tiles, fine neutral borders and compact 12 px gutters.
- The original lime primary accent (`oklch(0.89 0.2 128`) and lilac secondary accent (`oklch(0.74 0.12 300`), approximated in sRGB for QML.
- Strong, compact headings and monospaced technical measurements.
- Segmented range controls, line-chart comparison, stacked bars, range indicator and event stream.
- Dark charcoal surfaces without gradients, glass effects or neon decoration.

The financial/Web3 meaning has been replaced with robotics telemetry; the layout language and interaction patterns are retained.

## Stack

- C++20
- Qt 6.12 / Qt Quick / QML
- CMake + Ninja
- Qt Quick Controls

## Build on Windows

The included `windows-mingw` preset targets the Qt 6.12 MinGW 13.1 installation used during development.

```powershell
cmake --preset windows-mingw
cmake --build --preset windows-mingw
.uildapex-monitor.exe
```

If Qt is installed elsewhere, update `CMAKE_PREFIX_PATH` and the compiler paths in `CMakePresets.json`.

## Current status

- [x] Native Qt application bootstrap
- [x] Theme tokens based on the supplied reference palette
- [x] Reusable BentoTile component
- [x] Overview composition and visual component patterns
- [ ] Real serial discovery and connection lifecycle
- [ ] Device and channel models
- [ ] Live telemetry pipeline and chart data
- [ ] Recording, playback and analysis

No serial device is opened by this prototype. The displayed COM11 / UART settings are example configuration only.

## Architecture direction

QML owns presentation only. Hardware I/O, packet decoding, telemetry buffering, persistence and signal processing will live in C++ services and models. UI updates will be batched through Qt properties, signals and model notifications—not driven directly from serial callbacks.
