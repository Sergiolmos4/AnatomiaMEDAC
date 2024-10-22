import { createRouter, createWebHistory } from 'vue-router';
const routes = [
  //{ path: '/', redirect: '/login' },
  //{ path: '/login', component: LoginForm },
  { path: '/registro', component: ()=>import('@/views/SignUpView.vue') },
  {
    path:'/organos',
    name:'organos',
    component: ()=>import('@/views/OrganoView.vue')
  },
  {
    path:'/naturalezas',
    name: 'naturalezas',
    component: ()=>import('@/views/NaturalezaView.vue')
  },
  {
    path:'/sedes',
    name: 'sedes',
    component: ()=>import('@/views/SedeView.vue')
  },
  {
    path:'/formatos',
    name: 'formatos',
    component: ()=>import('@/views/FormatoView.vue')
  },
  {
    path:'/login',
    name:'login',
    component: ()=>import('@/views/LoginView.vue')
  },
  {
    path: '/muestrasmenu',
    name: 'muestrasmenu',
    component: ()=> import('@/views/MenuMuestraView.vue')
  },
  {
    path: '/muestras',
    name: 'muestras',
    component: ()=> import('@/views/MuestraView.vue')
  },
  {
    path: '/informe/:codigo/:fecha_recepcion/:naturaleza/:formato/:organo/:sede/:usuario/:calidad/:interpretacion/:descripcionCal/:descripcionInt',
    name: 'informe',
    component: ()=> import('@/components/InformeComponent.vue'),
    props: true
  },
  {
    path: '/muestras2/:codigo/:naturaleza/:fecha_recepcion/:formato/:organo/:sede/:imgUrls',
    name: 'ViewMuestras2',
    component: ()=> import('@/views/Muestra2View.vue'),
    props: true
  },
  {
    path: '/revisar/:codigo/:naturaleza/:fecha_recepcion/:formato/:organo/:sede/:imgUrls/:calidad/:desccalidad/:interpretacion/:desc',
    name: 'ViewRevisar',
    component: ()=> import('@/views/RevisionView.vue'),
    props: true
  },
  {
    path: '/home',
    name: 'inicio',
    component: ()=> import('@/views/HomeView.vue')
  },
  {
    path: '/consultas',
    name: 'consultas',
    component: ()=> import('@/views/ConsultaView.vue')
  },
  /*{
    path:'/muestra/nueva',
    name: 'muestra-nueva',
    component: ()=>import('@/views/MuestraNuevaView.vue')
  },*/
  //{ path: '/restore-password', component: RestorePassword },
  //{ path: '/new-password', component: NewPassword },
  //{ path: '/technical-support', component: TecnicalSuport },
  //{ path: '/muestras', component: Muestras },
  /*{
    path: '/viewrevisar/:code/:nature/:dateColected/:conservation/:biopsy/:sede/:quality/:descQuality/:interpretation/:desc', 
    name: 'ViewRevisar',
    component: ViewRevisar,
    props: true
  },*/

];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
