#version 330 core

out vec4 FragColor;

struct World {
    float time;
};

struct Material {
    sampler2D diffuse;
    sampler2D specular;
    sampler2D emission;
    float shininess;
};

struct Light {
    vec3 direction;

    vec3 ambient;
    vec3 diffuse;
    vec3 specular;
};

struct Camera {
    vec3 position;
};

in vec2 o_TexCoords;
in vec3 o_Normal;
in vec3 o_FragPosition;

uniform World world;
uniform Material material;
uniform Light light;
uniform Camera camera;

void main()
{
    // Ambient
    vec3 ambientLight = light.ambient * vec3(texture(material.diffuse, o_TexCoords));

    // Diffuse
    vec3 normalVector = normalize(o_Normal);
    vec3 lightDirection = normalize(-light.direction);
    float diffuse = max(dot(normalVector, lightDirection), 0);
    vec3 diffuseLight = light.diffuse * (diffuse * vec3(texture(material.diffuse, o_TexCoords)));

    // Specular
    vec3 cameraDirection = normalize(camera.position - o_FragPosition);
    vec3 reflectionDirection = reflect(-lightDirection, normalVector);
    float specular = pow(max(dot(cameraDirection, reflectionDirection), 0.0), material.shininess);
    vec3 specularFrag = texture(material.specular, o_TexCoords).rgb;
    vec3 specularLight = light.specular * (specular * specularFrag);

    vec3 emission = vec3(0.0f);
    if (specularFrag == vec3(0.0f))
    {
        emission = texture(material.emission, o_TexCoords + (vec2(0.0f, 1.0f) * world.time)).rgb;
        emission *= diffuse;
        emission *= 1 - ambientLight;
    }

    FragColor = vec4(ambientLight + diffuseLight + specularLight + emission, 1.0f);
};

