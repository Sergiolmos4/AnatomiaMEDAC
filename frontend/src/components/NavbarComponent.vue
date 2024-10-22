<template lang="">
    <div class="header-top-bar">
        <span>Anatomía patológica</span>
      </div>
      <nav class="navbar-user">
        <div class="navbar-content-user">
          <div class="navbar-left">
            <img src="../assets/img/logoMedac.png" width="100" class="logo-header" />
          </div>
          <div class="navbar-center">
            <router-link v-if="!isAuthenticated" to="/registro"> Regístrate </router-link>
            <router-link v-if="!isAuthenticated" to="/login"> Iniciar Sesión </router-link>
            <router-link v-if="isAuthenticated" to="/home">Inicio</router-link>
            <router-link v-if="isAuthenticated" to="/muestrasmenu"> Muestras </router-link>
            <router-link to="/about"> Contacto </router-link>
            <router-link v-if="isAuthenticated" to="/login" @click="handleLogout">Cerrar Sesión</router-link>
          </div>
        <div class="navbar-right">
            <div class="user-info">{{username.username}}</div>
          </div>
        </div>
      </nav>
</template>
<script setup>
import { isAuthenticated, username, logout } from '@/auth';
const handleLogout = () => {
      logout();
      window.location.href = '/login';
    };

</script>
<style src="@/assets/css/headerUser.css">
</style>
