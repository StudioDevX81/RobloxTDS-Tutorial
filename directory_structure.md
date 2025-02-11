# Directory Structure

## Root Directory 🚀

The root directory contains essential files and folders for setting up and organizing the project in **Roblox Studio**.

### Files in Root 📁

- **README.md**: Project overview and key information.
- **LICENSE**: Project licensing details.
- **directory_structure.md**: Documentation for project directory structure.

---

## Folders 📂

### 1. **ServerScriptService/** 🖥️

Contains server-side scripts.

- `ServerScript/`: Server script for creating collisions and spawning mobs.

### 2. **ReplicatedStorage/** 🔄

Shared modules accessible by both server and client.

- `Modules/`: Contains reusable modules.
  - `Mob/`: Module for mob spawning.
  - `Tower/`: Module for tower-related functionality.
- `Events/`: Remote events for communication between server and client.
  - `placeTower/`: Event for handling tower placement.
- `Towers/`: Organized tower data.
  - `Towers/`: Folder containing individual towers.
    - `TestTower/`: Example test tower.
  - `Upgrades/`: Folder for tower upgrade configurations.

### 3. **ServerStorage/** 🗄️

Storage for server-side entities and resources.

- `Entities/`: Organized storage for different types of game entities.
  - `Units/`: Folder for units.
  - `Mobs/`: Folder for mobs.

### 4. **Workspace/** 🌍

Holds visible game objects and spatial elements.

- `Entities/`: Entities visible in the game world.
  - `Towers/`: Folder for towers.
  - `Units/`: Folder for units.
  - `Mobs/`: Folder for mobs.
- `Map/`: Contains map-related elements.
  - `Info/`: Information about the map.
    - `Health/`: Base health.
    - `MaxHealth/`: Maximum base health.
  - `Waypoints/`: Folder for map waypoints.
  - `Start/`: Start point of the map.
  - `Base/`: Base point of the map.

### 5. **StarterGui/** 🖥️

Contains client-side user interface scripts and elements.

- `ClientGui/`: GUI components for the client.
  - `ClientScript/`: Scripts for client GUI interactions.
  - `PlaceTower/`: Button logic for placing towers in the game.

---

## Структура Директорий (Roblox Studio) 📚

## Корневая директория 🚀

Корневая директория содержит основные файлы и папки для настройки и организации проекта в **Roblox Studio**.

### Файлы в корне 📁

- **README.md**: Обзор и ключевая информация о проекте.
- **LICENSE**: Подробности о лицензировании проекта.
- **directory_structure.md**: Документация структуры директорий проекта.

---

## Папки 📂

### 1. **ServerScriptService/** 🖥️

Содержит серверные скрипты.

- `ServerScript/`: Серверный скрипт для создания коллизий и спавна мобов.

### 2. **ReplicatedStorage/** 🔄

Общие модули, доступные как серверу, так и клиенту.

- `Modules/`: Содержит переиспользуемые модули.
  - `Mob/`: Модуль для спавна мобов.
  - `Tower/`: Модуль для функционала башен.
- `Events/`: Удалённые события для связи между сервером и клиентом.
  - `placeTower/`: Событие для обработки размещения башен.
- `Towers/`: Организованные данные о башнях.
  - `Towers/`: Папка с отдельными башнями.
    - `TestTower/`: Тестовая башня.
  - `Upgrades/`: Папка для конфигураций улучшений башен.

### 3. **ServerStorage/** 🗄️

Хранилище сущностей и ресурсов на стороне сервера.

- `Entities/`: Организованное хранилище различных типов игровых сущностей.
  - `Units/`: Папка для юнитов.
  - `Mobs/`: Папка для мобов.

### 4. **Workspace/** 🌍

Содержит видимые игровые объекты и пространственные элементы.

- `Entities/`: Сущности, видимые в игровом мире.
  - `Towers/`: Папка для башен.
  - `Units/`: Папка для юнитов.
  - `Mobs/`: Папка для мобов.
- `Map/`: Содержит элементы, относящиеся к карте.
  - `Info/`: Информация о карте.
    - `Health/`: Здоровье базы.
    - `MaxHealth/`: Максимальное здоровье базы.
  - `Waypoints/`: Папка для точек маршрута.
  - `Start/`: Стартовая точка карты.
  - `Base/`: Базовая точка карты.

### 5. **StarterGui/** 🖥️

Содержит клиентские пользовательские интерфейсы и скрипты.

- `ClientGui/`: Компоненты пользовательского интерфейса клиента.
  - `ClientScript/`: Скрипты для взаимодействий с GUI и механика размещения башни.
  - `PlaceTower/`: Кнопка для размещения башен.

