from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import  CalidadViewSet, InterpretacionViewSet,TipoViewSet, SedeViewSet, NaturalezaViewSet, FormatoViewSet, EstadoViewSet, OrganoViewSet, CodificacionInterpretacionViewsSet, AumentoViewSet, ImagenViewSet, AuthUserViewSet,RegisterView,RolViewSet,MuestraViewSet, CreateMuestraView#,MuestraDeleteView,TestViewSet
router=DefaultRouter()
router.register(r'tipos',TipoViewSet)
router.register(r'sedes',SedeViewSet)
router.register(r'naturalezas',NaturalezaViewSet)
router.register(r'formatos',FormatoViewSet)
router.register(r'estados',EstadoViewSet)
router.register(r'organos',OrganoViewSet)
router.register(r'codificacion_interpretacion',CodificacionInterpretacionViewsSet)
router.register(r'muestras',MuestraViewSet)
router.register(r'aumentos',AumentoViewSet)
router.register(r'imagenes',ImagenViewSet)
router.register(r'usuarios',AuthUserViewSet)
router.register(r'calidades',CalidadViewSet)
router.register(r'interpretaciones',InterpretacionViewSet)
router.register(r'roles',RolViewSet)
#router.register(r'tests', TestViewSet)
urlpatterns = [
    path('api-auth/',include('rest_framework.urls'),name='rest_framework'),
    path('',include(router.urls)),
    path('muestra/create/', CreateMuestraView.as_view(), name='muestra-create'),
    path('registro/',RegisterView.as_view(), name='registro'),
]
