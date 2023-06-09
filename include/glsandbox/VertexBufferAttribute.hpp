#ifndef VERTEXBUFFERATTRIBUTE_HPP_
#define VERTEXBUFFERATTRIBUTE_HPP_

#include <cstddef>
#include <cstdint>

struct VertexBufferAttribute
{
    const uint32_t type;
    const uint32_t count;
    const std::size_t size;
    const bool isNormalized;

    VertexBufferAttribute(uint32_t _type, uint32_t _count, std::size_t _size,
                          bool _isNormalized)
        : type(_type), count(_count), size(_size), isNormalized(_isNormalized)
    {
    }
};

#endif // VERTEXBUFFERATTRIBUTE_HPP_
