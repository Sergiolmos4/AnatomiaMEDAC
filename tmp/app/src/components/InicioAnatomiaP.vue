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

    <div class="texto-inicio">
      
    </div>
  </div>
</template>
<style scoped>
.inicio-container {
  margin-top:150px;
  border: 1px solid #c10202;
  width: 100%;
  height: 914px;
  border: 0px;
  text-align: center;
}

.texto-inicio {
  width: 1170px;
  height: 40px;
  border: 0px;
  text-align: center;
}

h1 {
  font-weight: 500;
  font-size: 1.7rem;
  text-align: center;
  top: -10px;
  color: #004676;
}

h3 {
  font-size: 0.9rem;
}

.greetings h1,
.greetings h3 {
  text-align: center;
}

.tt-imagen {
  max-width: 800px;
  background-color: #f5f5f5;
  text-align: center;
  margin: 0 auto;
  margin-top: 0px;
  padding: 10px;
  border: 1px solid #004676;
  border-radius: 20px;
  /*border-top-right-radius: 20px;*/
  font-weight: bold;
  font-size:2.1rem;
}

.texto-tt-imagen {
  font-weight: bold;
  color: #004676;
}

.imagen-inicio {
  height:40%;
  width:54%;
  margin-left: 20px;
  margin-right: 20px;
  margin-bottom: 0px;
  margin-top: 0px;
  background-color: #f5f5f5;

  /*border-top: 20px solid #f5f5f5; /* Añade un borde superior */
  /*border-bottom: 50px solid #f5f5f5; /* Añade un borde inferior */
  border-radius: 20px;
}

@media (min-width: 1024px) {
  .greetings h1,
  .greetings h3 {
    text-align: left;
  }
}
</style>