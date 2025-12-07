# Proje ve Çýktý Ayarlarý
TARGET = main.exe
OUTPUT_DIR = ./OsProject/bin
SRC_DIR = ./OsProject/src
INCLUDE_DIR = ./OsProject/include
EXECUTABLE = $(OUTPUT_DIR)/$(TARGET)

# FreeRTOS Kaynak ve Include Yollarý
FREERTOS_DIR = FreeRTOS
FREERTOS_SRC = $(FREERTOS_DIR)/source
FREERTOS_PORTABLE = $(FREERTOS_DIR)/portable/ThirdParty/GCC/Posix

# FreeRTOS Kaynak Dosyalarý
FREERTOS_FILES = $(wildcard $(FREERTOS_SRC)/*.c) \
                 $(wildcard $(FREERTOS_PORTABLE)/*.c)

# --- Hedefler (Targets) ---

.PHONY: all
all: compile run

# Dizin Oluþturma
# --- Hata Veren Kýsým (Deðiþtirilecek) ---
.PHONY: directories
directories:
	@mkdir -p $(OUTPUT_DIR) 

# --- Yeni ve Düzeltilmiþ Kýsým ---
.PHONY: directories
directories:
	@if not exist $(OUTPUT_DIR) mkdir $(OUTPUT_DIR))

# Derleme hedefi (Sizin istediðiniz tek satýrlýk yapýyý korur)
.PHONY: compile
compile: directories
	@echo "--- FreeRTOS Projesi Derleniyor ---"
	gcc -I $(INCLUDE_DIR) \
        -I $(FREERTOS_DIR)/include \
        -I $(FREERTOS_PORTABLE) \
        -o $(EXECUTABLE) \
        $(SRC_DIR)/main.c \
        $(FREERTOS_FILES)

# Çalýþtýrma hedefi (Sizin istediðiniz Run komutunu aynen korur)
.PHONY: run
run:
	$(EXECUTABLE)
# Temizlik hedefi
.PHONY: clean
clean:
	rm -rf $(OUTPUT_DIR)