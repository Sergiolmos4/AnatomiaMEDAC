from django.contrib.admin import site;from .models import Usuario,Calidad,Interpretacion,Estado,Sede,Tipo,CodificacionInterpretacion,Organo,Naturaleza,Formato,Imagen, Aumento,Muestra
site.register(Estado)
site.register(Sede)
site.register(Tipo)
site.register(Muestra)
site.register(CodificacionInterpretacion)
site.register(Organo)
site.register(Naturaleza)
site.register(Formato)
site.register(Aumento)
site.register(Imagen)
site.register(Calidad)
site.register(Interpretacion)
site.register(Usuario)