#!/bin/bash

JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"

JAVA_FILE="HelloWorld.java"
JAVA_SRC="HelloWorld"
JAVA_CLASS_PATH="./src"

CPP_FILE="helloWorld.cpp"
CPP_OBJ="helloWorld.o"

LIB_DIR="./lib"
LIB_NAME="native"
LIB_FILE="lib${LIB_NAME}.so"

if [[ -f ${LIB_DIR}/${CPP_FILE} ]]; then
  g++ -c -fPIC -I${JAVA_HOME}/include -I${JAVA_HOME}/include/linux ${LIB_DIR}/${CPP_FILE} -o ${LIB_DIR}/${CPP_OBJ}
else
  echo "Error: '${CPP_FILE}' not found in ${LIB_DIR}!"
  exit 1
fi

if [[ -f  ${LIB_DIR}/${CPP_OBJ} ]]; then
  g++ -shared -fPIC -o ${LIB_DIR}/${LIB_FILE} ${LIB_DIR}/${CPP_OBJ} -lc
else
  echo "Error: '${CPP_OBJ}' not found in ${LIB_DIR}!"
  exit 1
fi

if [[ -f  ${JAVA_CLASS_PATH}/${JAVA_FILE} ]]; then
  javac -h ${LIB_DIR} ${JAVA_CLASS_PATH}/${JAVA_FILE}
  java --class-path ${JAVA_CLASS_PATH} -Djava.library.path=${LIB_DIR} ${JAVA_SRC}
else
  echo "Error: '${JAVA_FILE}' not found in ${JAVA_CLASS_PATH}!"
  exit 1
fi