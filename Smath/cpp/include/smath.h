#ifndef SMATH_H
#define SMATH_H

#include <string>

class SMath {

public:

    template<typename T>
    static auto add(T first, T second) -> T
    {
        return first + second;
    }

    template<typename T>
    static auto subtract(T first, T second) -> T
    {
        return first - second;
    }

    template<typename T>
    static auto multiply(T first, T second) -> T
    {
        return first * second;
    }

    template<typename T>
    static auto divide(T first, T second) -> T
    {
        return first / (second == 0 ? 1 : second);
    }

    static auto info() -> std::string
    {
        return "SMath library!";
    }
};

#endif // SMATH_H
