#include "../include/Calc.h"
#include "../include/smath.h"

JNIEXPORT jstring JNICALL Java_Calc_info
  (JNIEnv *env, jobject obj)
{
    return env->NewStringUTF(SMath::info().c_str());
}

JNIEXPORT jdouble JNICALL Java_Calc_add
  (JNIEnv *env, jobject obj, jdouble first, jdouble second)
{
    return SMath::add<double>(first, second);
}  

JNIEXPORT jdouble JNICALL Java_Calc_subtract
  (JNIEnv *env, jobject obj, jdouble first, jdouble second)
{
    return SMath::subtract<double>(first, second);
}  

JNIEXPORT jdouble JNICALL Java_Calc_multiply
  (JNIEnv *env, jobject obj, jdouble first, jdouble second)
{
    return SMath::multiply<double>(first, second);
}  

JNIEXPORT jdouble JNICALL Java_Calc_divide
  (JNIEnv *env, jobject obj, jdouble first, jdouble second)
{
    return SMath::divide<double>(first, second);
}