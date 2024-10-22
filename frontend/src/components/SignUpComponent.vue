<template>
    <div>
        <div class="container">
          <div class="title">
            Registro de usuario
          </div>

          <img src="@/assets/img/logoMedac.png" width="300" alt="">
          <h3>Regístrate para iniciar sesión</h3>
          <form @submit.prevent="register">
            <div>
              <input type="text" id="username" v-model="email" placeholder="Email" required>
            </div>
            <div>
              <input type="password" id="password" v-model="password" placeholder="Contraseña" required>
            </div>
            <div>
              <select v-model="sede" placeholder="Sede" required>
                <option v-for="s in sedes" :key="s.sede" :value="s.sede">{{s.sede}}</option>
              </select>
            </div>
           <!-- <div>
                <select v-model="sede" required>
                  <option value="" disabled selected>Sede</option>
                  <option value="Albacete">Albacete</option>
                  <option value="Alicante">Alicante</option>
                  <option value="Alicante II">Alicante II</option>
                  <option value="Almeria">Almería</option>
                  <option value="Cordoba">Córdoba</option>
                  <option value="Granada">Granada</option>
                  <option value="Huelva">Huelva</option>
                  <option value="Jerez">Jerez</option>
                  <option value="Madrid">Madrid</option>
                  <option value="Madrid II">Madrid II</option>
                  <option value="Malaga">Málaga</option>
                  <option value="Murcia">Murcia</option>
                  <option value="Sevilla">Sevilla</option>
                  <option value="Valencia">Valencia</option>
                  <option value="Zaragoza">Zaragoza</option>
                </select>
              </div>-->

            <router-link to="/login">¿Ya tienes cuenta? Inicia sesión</router-link>
            <button style="margin-bottom: 70px;" type="submit">Registrarse</button>
          </form>
        </div>
      </div>
  </template>

<script setup>
  import { ref, onMounted } from 'vue';
  import { useRouter } from 'vue-router';
  import axios from 'axios';
  const router = useRouter();
  const email = ref('');
  const password = ref('');
  const sedes = ref([]);
  const sede = ref('');
  onMounted(async () => {
    try {
      const response = await axios.get('http://127.0.0.1:8000/api/sedes/');
      sedes.value = response.data;
    } catch (error) {
      console.error(error);
    }
  });
  const register = async () => {
    try {
      await axios.post('http://127.0.0.1:8000/api/registro/', {
        email: email.value,
        password: password.value,
        sede: sede.value
      });
      router.push('/login');
    } catch (error) {
      console.error(error);
    }
  };
  </script>
<style src="../assets/css/auth.css"></style>