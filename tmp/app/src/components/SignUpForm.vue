<template>
    <div>
        <div class="container">
          <div class="title">
            Registro de usuario
          </div>

          <!--<img src="../assets/logoMedac.png" width="300" alt="">-->
          <h3>Regístrate para iniciar sesión</h3>
          <form @submit.prevent="register">
            <div>
              <input type="text" v-model="username" placeholder="Nombre" required>
            </div>
            <div>
              <input type="password" v-model="password" placeholder="Contraseña" required>
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
  import { ref } from 'vue';
  import { useRouter } from 'vue-router';
  import axios from 'axios';

  const router = useRouter();
  const username = ref('');
  const password = ref('');

  const register = async () => {
    try {
      await axios.post('http://127.0.0.1:8000/api/registro/', {
        username: username.value,
        password: password.value,
      });
      router.push('/login');
    } catch (error) {
      console.error(error);
    }
  };
  </script>
<style></style>