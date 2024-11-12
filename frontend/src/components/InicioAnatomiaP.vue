<script setup>
/*import { defineComponent, ref } from 'vue'
import NavbarComponent from '@/components/NavbarComponent.vue'
export default defineComponent({
  name: 'PaginaContacto',
  props: {
    msg: String
  },
  setup() {
    const showSubmenu = ref(false)
    return { showSubmenu }
  }
})*/
//import { ref } from 'vue';
//const showSubmenu = ref(false);
</script>
<template>
  <navbar-component />
  <div class="inicio-container">
    <div class="tt-imagen">
      <p class="texto-tt-imagen">FUNDACIÓN MEDAC</p>
      <img src="@/assets/img/inicio.png" alt="Imagen de inicio" class="imagen-inicio" />
      <h1>¡Bienvenido a la Fundación MEDAC!</h1>
      <h3>
        Aquí podrás añadir y encontrar información sobre las áreas de citodiagnóstico y anatomía
        patológica.
      </h3>
    </div>
    <div class="texto-inicio"></div>
  </div>

<!-- Div para el banner de publicidad -->
<footer class="footer-banner">
    <a href="https://www.amnesty.org/es/" target="_blank" rel="noopener noreferrer">
      <img src="@/assets/img/amnesty.png" alt="Imagen de publicidad" class="footer-image"/>
    </a>
  </footer>
</template>

<style scoped>
.inicio-container {
  margin-top: 150px;
  width: 100%;
  height: 80%;
  text-align: center;
  padding: 25px;
}

.tt-imagen {
  max-width: 800px;
  background-color: #f5f5f5;
  text-align: center;
  margin: 0 auto;
  padding: 10px;
  border: 1px solid #004676;
  border-radius: 20px;
  font-weight: bold;
  font-size: 2.1rem;
}

.texto-tt-imagen {
  font-weight: bold;
  color: #004676;
  margin-bottom: 5px; /* Reduce el espacio debajo del título */
}

.imagen-inicio {
  height: 40%;
  width: 54%;
  margin: 10px 20px; /* Reduce el margen superior e inferior */
  background-color: #f5f5f5;
  border-radius: 20px;
}

h1 {
  font-weight: 500;
  font-size: 1.7rem;
  text-align: center;
  color: #004676;
  margin: 10px 0; /* Reduce el margen superior e inferior */
}

h3 {
  font-size: 0.9rem;
  margin-top: 5px; /* Reduce el espacio superior */
}

.footer-banner { 
  width: 100%;
  background-color: #f5f5f5;
  display: flex;
  justify-content: center;
  align-items: center; /* Centra verticalmente el contenido */
  padding: 10px 0;
  position: fixed;
  bottom: 0; /* Fija el footer al borde inferior */
  left: 0; /* Alinea el footer al borde izquierdo */
  z-index: 1000; /* Asegura que el footer esté encima de otros elementos si es necesario */
}

.footer-image {
  max-height: 100px;
  margin: 0; /* Elimina cualquier margen */
}

@media (min-width: 1024px) {
  .greetings h1,
  .greetings h3 {
    text-align: left;
  }
}

</style>
