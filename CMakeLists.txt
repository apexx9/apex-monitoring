cmake_minimum_required(VERSION 3.24)
project(APEXMonitor VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 6.8 REQUIRED COMPONENTS Quick QuickControls2)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(apex-monitor
    app/main.cpp
)

qt_add_qml_module(apex-monitor
    URI ApexMonitor
    VERSION 1.0
    QML_FILES
        ui/Main.qml
        ui/Theme.qml
        ui/BentoTile.qml
        ui/TelemetryChart.qml
        ui/OverviewPage.qml
)

target_link_libraries(apex-monitor PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
)

if(WIN32)
    set_target_properties(apex-monitor PROPERTIES WIN32_EXECUTABLE TRUE)
endif()
