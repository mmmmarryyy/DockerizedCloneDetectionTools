# DockerizedCloneDetectionTools

## NIL

### Использование

1. **Сборка контейнера:**

```
bash ./build_NIL.sh
```

2. **Запуск контейнера:**

```
bash ./run_NIL.sh [options]
```

**Опции:**
   * -d <путь_к_датасету>: Путь к датасету IJaDataset (по умолчанию: bcb_reduced)
   * -b: Включить bce (по умолчанию: выключено)

**Примеры:**
   * Запуск с использованием всего датасета: `bash ./run_NIL.sh`
   * Запуск с использованием подпути (например, bcb_reduced/2): `bash ./run_NIL.sh -d bcb_reduced/2`
   * Запуск с включением bce: `bash ./run_NIL.sh -b`

### Результат исполнения

Результат исполнения появится в директории `NIL/results/`

## CCStokener

### Runner

1. **Сборка контейнера:**

```
bash ./build_CCStokener_runner.sh
```

2. **Запуск контейнера:**

```
bash ./run_CCStokener_runner.sh [options]
```

**Опции:**
   * -d <путь_к_датасету>: Путь к датасету IJaDataset (по умолчанию: `./bcb_reduced/`)
   * -l <язык>: Язык программирования, для которого производиться поиск клонов (по умолчанию: `java`)

**Примеры:**
   * Запуск с использованием всего датасета: `bash ./run_CCStokener_runner.sh`
   * Запуск с использованием подпути (например, bcb_reduced/2): `bash ./run_CCStokener_runner.sh -d ./bcb_reduced/2`
   * Запуск с указанием языка: `bash ./run_CCStokener_runner.sh -l java`

#### Результат исполнения

Результат исполнения появится в директории `CCStokener/runner/results_<timestamp>/`

### Verify

1. **Сборка контейнера:**

```
bash ./build_CCStokener_verify.sh
```

2. **Запуск контейнера:**

```
bash ./run_CCStokener_verify.sh [options]
```

**Опции:**
   * -d <путь_к_датасету>: Путь к датасету IJaDataset (по умолчанию: `./bcb_reduced/`)
   * -l <язык>: Язык программирования, для которого производиться поиск клонов (по умолчанию: `java`)

**Примеры:**
   * Запуск с использованием всего датасета: `bash ./run_CCStokener_verify.sh`
   * Запуск с использованием подпути (например, bcb_reduced/2): `bash ./run_CCStokener_verify.sh -d ./bcb_reduced/2`
   * Запуск с указанием языка: `bash ./run_CCStokener_verify.sh -l java`

#### Результат исполнения

Результат исполнения появится в директории `CCStokener/verify/results_<timestamp>/`

## NiCad

### Использование

1. **Сборка контейнера:**

```
bash ./build_NiCad.sh
```

2. **Запуск контейнера:**

```
bash ./run_NiCad.sh
```

### Результат исполнения

Результат исполнения появится в директории `NiCad/results/`
