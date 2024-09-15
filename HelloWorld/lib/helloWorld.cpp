#include "HelloWorld.h"

#include <iostream>

JNIEXPORT void JNICALL Java_HelloWorld_message
  (JNIEnv *env, jobject obj, jstring text)
{
  std::string msg = "Null";
  if (text) {
    const char *value = env->GetStringUTFChars(text, nullptr);
    msg = value;
    if (msg.empty()) {
      msg = "Empty";
    }
    env->ReleaseStringUTFChars(text, value); 
  }
  
  std::cout << "Message: " << msg << '\n';
}