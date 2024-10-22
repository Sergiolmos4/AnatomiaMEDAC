from django.db.models import Model, CharField,ForeignKey,RESTRICT,CASCADE,TextField,DateField,ImageField,JSONField,OneToOneField
from django.contrib.auth.models import User
#from django.core.exceptions import ValidationError
"""def validate_zoom(value):
    valid_zooms = ['x4', 'x10', 'x40', 'x100']
    if value not in valid_zooms:
        raise ValidationError(f"Zoom debe ser uno de los siguientes valores: {valid_zooms}")"""

class Organo (Model):
    organo=CharField(verbose_name='Órgano', max_length=30, unique=True)
    codigo=CharField(verbose_name='Código', max_length=3, unique=True)
    class Meta:
        verbose_name='Órgano'
        verbose_name_plural="Órganos"
    def __str__(self) -> str:
        return f"{self.organo}"
class Sede (Model):
    sede=CharField(verbose_name='Sede', max_length=11, unique=True)
    codigo=CharField(verbose_name='Código', max_length=4, unique=True)
    def __str__(self) -> str:
        return f"{self.sede}"
class Naturaleza(Model):
    codigo=CharField(verbose_name='Código', max_length=2, unique=True)
    naturaleza=CharField(verbose_name='Naturaleza', max_length=50, unique=True)
    def __str__(self) -> str:
        return f"{self.naturaleza}"
class Tipo(Model):
    tipo=CharField(verbose_name='Tipo', max_length=14, unique=True)
    def __str__(self) -> str:
        return f"{self.tipo}"
class CodificacionInterpretacion(Model):
    organo=ForeignKey(Organo,on_delete=RESTRICT, verbose_name='Órgano', db_column='organo', to_field='organo', default='Corazón')
    naturaleza=ForeignKey(Naturaleza, on_delete=RESTRICT, verbose_name='Naturaleza', db_column='naturaleza', to_field='naturaleza', default='Biopsia')
    tipo=ForeignKey(Tipo, on_delete=RESTRICT, db_column='tipo', to_field='tipo', verbose_name='Tipo', default='Calidad')
    codigo=CharField(unique=True, verbose_name='Código', max_length=7)
    descripcion=TextField(verbose_name='Descripción')
    class Meta:
        verbose_name='Codificación de Interpretación'
        verbose_name_plural='Codificaciones de Interpretación'
    def __str__(self) -> str:
        return f"{self.codigo}"
class Formato (Model):
    formato=CharField(verbose_name='Formato', max_length=20, unique=True)
    def __str__(self) -> str:
        return f"{self.formato}"
class Estado(Model):
    estado=CharField(unique=True, verbose_name='Estado', max_length=20)
    comentario=TextField(verbose_name='Comentario', null=True, blank=True)
    def __str__(self) -> str:
        return f"{self.estado}"
class Aumento(Model):
    zoom=CharField(verbose_name="Aumento", max_length=4, unique=True, default="x4")
    def __str__(self):
        return f"{self.zoom}"
class Calidad(Model):
    #tipo=CharField(max_length=30)
    codigo=CharField(max_length=7, unique=True, verbose_name='Código')
    descripcion=TextField(verbose_name='Descripción', blank=True)
    class Meta:
        verbose_name='Calidad'
        verbose_name_plural='Calidades'
    def __str__(self):
        return f"{self.codigo}"

class Interpretacion(Model):
    #tipo=CharField(max_length=30)
    codigo=CharField(max_length=7, unique=True, verbose_name='Código')
    descripcion=TextField(verbose_name='Descripción', blank=True)
    class Meta:
        verbose_name='Interpretación'
        verbose_name_plural='Interpretaciones'
    def __str__(self):
        return f"{self.codigo}"
class Imagen(Model):
    imagen=ImageField(upload_to='img', default="camera.png", verbose_name='Imagen', unique=True)
    zoom=ForeignKey(Aumento,on_delete=RESTRICT,db_column='zoom', to_field='zoom', default='x4')
    #muestra=ForeignKey(Muestra,on_delete=RESTRICT,verbose_name='imágenes', related_name='imagenes')
    class Meta:
        verbose_name='Imagen'
        verbose_name_plural='Imágenes'
    def __str__(self):
        return f"{self.imagen}"
class Rol(Model):
    rol=CharField(verbose_name='Rol', max_length=15, unique=True)
    class Meta:
        verbose_name='Rol'
        verbose_name_plural='Roles'
        #db_table="api_rol"
    def __str__(self) -> str:
        return f"{self.rol}"
class Usuario(Model):
    username= OneToOneField(User, on_delete=CASCADE, db_column="username", to_field="username", default="admin")
    sede = ForeignKey(Sede, on_delete=RESTRICT, db_column='sede', to_field='sede', verbose_name='Sede', default='Córdoba')
    rol= ForeignKey(Rol, on_delete=RESTRICT, db_column='rol', to_field='rol', verbose_name='Rol', default='Estudiante')
    def __str__(self):
        return f"{self.username.username}"
class Muestra(Model):
    codigo=CharField(max_length=20,verbose_name="Código", unique=True)
    fecha_recepcion=DateField()
    naturaleza=ForeignKey(Naturaleza, verbose_name='Naturaleza', on_delete=RESTRICT, db_column='naturaleza', to_field='naturaleza', default='Semen')
    formato=ForeignKey(Formato, on_delete=RESTRICT,verbose_name='Formato', db_column='formato', to_field='formato', default='Fresco')
    organo=ForeignKey(Organo, verbose_name='Órgano', on_delete=RESTRICT, db_column='organo', to_field='organo', default='Riñón')
    sede=ForeignKey(Sede,verbose_name='Sede', on_delete=RESTRICT, db_column='sede', to_field='sede', default='C')
    usuario=ForeignKey(Usuario, verbose_name='Usuario', on_delete=RESTRICT, db_column="username",to_field='username',default='admin')
    calidad=ForeignKey(Calidad, verbose_name='Calidad', on_delete=RESTRICT, db_column="calidad", to_field="codigo", default="Nulo")
    interpretacion=JSONField(default=dict, blank=True)
    imagenes=JSONField(default=dict, blank=True)
    zoom=JSONField(default=dict, blank=True)
    descripcionCal=TextField(verbose_name='Descripción Calidad',  null=True, blank=True)
    descripcionInt=TextField(verbose_name='Descripción Interpretación', null=True, blank=True)
    def __str__(self):
        return f"{self.codigo}"

"""class Test(Model):
    test=CharField(verbose_name='test', max_length=4, unique=True)"""