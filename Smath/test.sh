#!/bin/bash

JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"

JAVA_FILE="Calc.java"
JAVA_SRC="Calc"
JAVA_CLASS_PATH="./java/com/example/jni"

CPP_FILE="Calc.cpp"
CPP_OBJ="Calc.o"

LIB_DIR="./cpp"
LIB_NAME="Calc"
LIB_FILE="lib${LIB_NAME}.so"

# Step 1
javac -h ${LIB_DIR}/include ${JAVA_CLASS_PATH}/${JAVA_FILE}
# Step 2
g++ -c -fPIC -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux ${LIB_DIR}/src/${CPP_FILE} -o ${LIB_DIR}/src/${CPP_OBJ}
g++ -shared -fPIC -o ${LIB_DIR}/lib/${LIB_FILE} ${LIB_DIR}/src/${CPP_OBJ} -lc
# Step 3
java --class-path ${JAVA_CLASS_PATH} -Djava.library.path=${LIB_DIR}/lib ${JAVA_SRC}
