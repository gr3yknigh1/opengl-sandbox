#version 330 core

layout (location = 0) in vec3 l_Position;

uniform mat4 u_Transform;

void main()
{
    gl_Position = u_Transform * vec4(l_Position, 1.0);
}
