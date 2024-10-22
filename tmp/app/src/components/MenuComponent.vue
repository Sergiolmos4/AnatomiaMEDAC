<template>
  <h1>MUESTRAS</h1>
  <nav class="navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="collapse-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
              <router-link class="nav-link active" aria-current="page" to="/registro" style="margin-right: 15px;height: 15px;"> Registro </router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link active" aria-current="page" to="/organos" style="margin-right: 15px;height: 15px;"> Organo </router-link>
          </li>
          <li class="nav-item">
              <router-link class="nav-link active" aria-current="page" to="/naturalezas" style="margin-right: 15px;height: 15px;"> Naturaleza </router-link>
          </li>
          <li class="nav-item">
              <router-link class="nav-link active" aria-current="page" to="/sedes" style="margin-right: 15px;height: 15px;"> Sede </router-link>
          </li>
          <li class="nav-item">
              <router-link class="nav-link active" aria-current="page" to="/estados" style="margin-right: 15px;height: 15px;"> Estado </router-link>
          </li>
          <li class="nav-item">
              <router-link class="nav-link active" aria-current="page" to="/formatos" style="margin-right: 15px;height: 15px;"> Formato </router-link>
          </li>
          <li class="nav-item">
            <router-link class="nav-link" to="/tipos"> Acerca de nosotros  </router-link>
          </li>
        </ul>
      </div>  
    </div>
  </nav>
</template>
<script setup>
  /*import {ref,defineEmits,computed} from 'vue';
  import { isAuthenticated, username, logout } from '@/auth';
 const searchText=ref('')
 const searchService=ref('')
 const emitSearch = defineEmits(['getSearchText', 'getSearchService','getSearchAssets'])
 const getSearch = ()=>{
  if (window.location.pathname==='/products'){
    emitSearch('getSearchText', searchText.value)
  } else if (window.location.pathname==='/services'){
    emitSearch('getSearchService', searchText.value)
  } else if (window.location.pathname==='/assets'){
    emitSearch('getSearchAssets', searchText.value)
  }
  
 }
 const getSearchService = ()=>{
  emitSearch('getSearchService', searchService.value)
 }
 const getSearchAssets = ()=>{
  emitSearch('getSerachAssets', searchAsset.value)
 }
 const handleLogout = () => {
    logout();  // Llamar a la función logout
    // Redirigir a la página de inicio de sesión después de cerrar sesión
     window.location.href = '/login';
  };
  const authenticated=computed(()=>isAuthenticated.value);
  const user=computed(()=>username.value);*/
</script>
<style scoped>
.auth-actions {
display: flex;
align-items: center;
}
</style>