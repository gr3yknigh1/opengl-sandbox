#ifndef MEM_HPP_
#define MEM_HPP_

#include <memory>

// NOTE: Stoled from Hazel Engine (under Apache License 2.0)
// <https://github.com/TheCherno/Hazel/blob/master/Hazel/src/Hazel/Core/Base.h>


template <typename T> using Scope = std::unique_ptr<T>;
template <typename T, typename... Args>
constexpr Scope<T> MakeScope(Args &&...args)
{
    return std::make_unique<T>(std::forward<Args>(args)...);
}

template <typename T> using Ref = std::shared_ptr<T>;
template <typename T, typename... Args>
constexpr Ref<T> MakeRef(Args &&...args)
{
    return std::make_shared<T>(std::forward<Args>(args)...);
}

#endif // MEM_HPP_
