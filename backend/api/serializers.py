from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404
from rest_framework.serializers import ModelSerializer#, ImageField, ListField
from django_filters.rest_framework import FilterSet
from .models import Usuario,Tipo,Sede,Naturaleza,Formato,Estado,Organo,CodificacionInterpretacion,Aumento,Imagen,Calidad,Interpretacion,Rol,Muestra#,Test
class UserSerializer (ModelSerializer):
    class Meta:
        model=User
        fields=['email', 'password']
class TipoSerializer(ModelSerializer):
    class Meta:
        model=Tipo
        fields=['tipo']
class SedeSerializer (ModelSerializer):
    class Meta:
        model=Sede
        fields=["sede","codigo"]
class NaturalezaSerializer (ModelSerializer):
    class Meta:
        model=Naturaleza
        fields=["codigo","naturaleza"]
class FormatoSerializer (ModelSerializer):
    class Meta:
        model=Formato
        fields=["formato"]
class EstadoSerializer (ModelSerializer):
    class Meta:
        model=Estado
        fields=["estado","comentario"]
class OrganoSerializer (ModelSerializer):
    class Meta:
        model=Organo
        fields=["organo","codigo"]
class CodificacionInterpretacionFliter (FilterSet):
    class Meta:
        model=CodificacionInterpretacion
        fields={"organo":["exact"],"naturaleza":["exact"],"tipo":["exact"],"codigo":["exact"]}
class CodificacionInterpretacionSerializer (ModelSerializer):
    class Meta:
        model=CodificacionInterpretacion
        fields=["organo","naturaleza","tipo","codigo","descripcion"]
class MuestraFilter(FilterSet):
    class Meta:
        model=Muestra
        fields={"codigo":["exact"],"fecha_recepcion":["exact"],"naturaleza":["exact"],"formato":["exact"],"sede":["exact"],"organo":["exact"],"usuario":["exact"],"calidad": ["exact"]}
class AumentoSerializer (ModelSerializer):
    class Meta:
        model=Aumento
        fields=["zoom"]
class ImagenFilter (FilterSet):
    class Meta:
        model=Imagen
        fields={"zoom":["exact"]}
class ImagenSerializer (ModelSerializer):
    class Meta:
        model=Imagen
        fields=["imagen","zoom"]
class AuthUsuarioSerializer (ModelSerializer):
    class Meta:
        model=Usuario
        fields=["username","sede", "rol"]
    def to_representation(self, instance):
        representation = super().to_representation(instance)
        representation['username'] = instance.username.username  # Acceder al campo de User
        return representation
class CalidadSerializer (ModelSerializer):
    class Meta:
        model=Calidad
        fields=["codigo","descripcion"]
class InterpretacionSerializer (ModelSerializer):
    class Meta:
        model=Interpretacion
        fields=["codigo","descripcion"]
class MuestraSerializer(ModelSerializer):
    #imagenes = ImagenSerializer(many=True, read_only=True)
    usuario=AuthUsuarioSerializer()
    class Meta:
        model = Muestra
        fields = [
            'codigo', 'fecha_recepcion', 'naturaleza', 'formato', 'organo', 
            'sede','usuario', 'calidad', 'interpretacion', 
            'imagenes', 'zoom', 'descripcionCal', 'descripcionInt'
        ]
    def create(self, validated_data):
        usuario_data = validated_data.pop('username')
        user = get_object_or_404(User, username=usuario_data)
        usuario = get_object_or_404(Usuario, username=user)
        muestra = Muestra.objects.create(usuario=usuario, **validated_data)
        return muestra
class RolSerializer (ModelSerializer):
    class Meta:
        model=Rol
        fields=["rol"]

"""class TestSerializer (ModelSerializer):
    class Meta:
        model=Test
        fileds=['test']"""