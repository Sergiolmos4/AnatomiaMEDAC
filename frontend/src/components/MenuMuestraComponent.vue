<script setup>
import { useRouter } from "vue-router";
const router = useRouter();
const changeWindow = () => {
  router.push("/muestras");
};
const searchQuery = () => {
  router.push("/consultas");
};
</script>

<template>
  <div id="padre">
    <div id="app">
      <div class="todo">
        <div class="container1">
          <div class="bloq">
            <div class="titulo">Añadir muestra</div>
            <div class="botones">
              <button class="btn1" @click="changeWindow">Comenzar</button>
            </div>
          </div>
          <div class="img">
            <img
              class="img"
              width="200px"
              height="115px"
              src="@/assets/img/tubos.png"
              alt="muestras en tubo de ensayo"
            />
          </div>
        </div>

        <div class="container1">
          <div class="bloq">
            <div class="titulo">Editar muestra</div>
            <div class="botones">
              <button class="btn1" @click="searchQuery">Comenzar</button>
            </div>
          </div>
          <div class="img">
            <img
              class="img"
              width="200px"
              height="115px"
              src="@/assets/img/variostubos.png"
              alt="muestras en tubo de ensayo"
            />
          </div>
        </div>

        <div class="container1">
          <div class="bloq">
            <div class="titulo">Consultar muestra</div>
            <div class="botones">
              <button class="btn1" @click="searchQuery">Comenzar</button>
            </div>
          </div>
          <div class="img">
            <img
              class="img"
              width="200px"
              height="115px"
              src="@/assets/img/microscopios.jpg"
              alt="técnicos analizan muestras al microscopio"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
/* Estilo principal de la aplicación */

#padre {
  display: flex;
  justify-content: center; /* Alinea los elementos horizontalmente en el centro */
  align-items: center; /* Alinea los elementos verticalmente en el centro */
  width: 100vw; /* Ancho del contenedor padre */
  height: 100vh; /* Alto del contenedor padre */
  background-color: white;
}

#app {
  margin: 100px 0;
}

/* Estilo para cada contenedor de sección */
.container1 {
  display: grid;
  grid-template-columns: 1fr 1fr; /* Dos columnas: una para el contenido y otra para la imagen */
  background-color: white;
  color: rgb(0, 70, 118);
  padding: 4%;
  border-radius: 20px;
  height: 160px;
  width: 100%;
  max-width: 1200px; /* Ajusta el tamaño máximo del contenedor */
  grid-template-rows: repeat(3, auto); /* Tres filas para cada sección */
  gap: 20px; /* Espaciado entre filas */
  justify-items: center; /* Centrar las secciones horizontalmente */
}

/* Estilo para la columna de contenido */
.bloq {
  display: grid;
  grid-template-rows: auto auto; /* Dos filas: una para el título y otra para el botón */
  justify-content: center; /* Centrar contenido dentro de la columna */
}

/* Estilos para el título, texto y botones */
.titulo {
  font-size: 2.5vh;
  font-weight: bold;
  margin-top: 15px;
}

.botones {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

.btn1 {
  width: 8vw;
  height: 5vh;
  background-color: rgb(0, 70, 118);
  color: rgb(245, 245, 245);
  border-radius: 8px;
  font-size: 13px;
}

.btn1:hover {
  background-color: rgb(0, 50, 88);
  cursor: pointer;
}

/* Estilo para la imagen */
.img {
  border-radius: 10px;
  height: 100%;
  align-self: center; /* Centrar la imagen verticalmente en su celda */
}
</style>
