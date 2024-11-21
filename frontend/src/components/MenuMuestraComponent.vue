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
  <div id="app">
      <div class="todo">
  <div class="container0">
  <div>
    <!--<div class="centro"></div>-->
      <div class="container1">
        <div class="bloq">
          <div class="titulo">Añadir nueva muestra</div>
            <div class="texto">Lorem ipsum 
            </div>
              <div class="botones">
              <button class="btn1" @click="changeWindow">Comenzar →</button>
              <!--<button class="btn2">Saber más...</button>-->
              </div>
        </div>
        <div class="img"><img  class="img" width="200px" height="115px" src="@/assets/img/tubos.png" alt="muestras en tubo de ensayo"></div>
        </div>
      </div>
  
      <div class="container1">
        <div class="bloq">
          <div class="titulo">Editar muestra</div>
            <div class="texto">Lorem ipsum 
            </div>
              <div class="botones">
              <button class="btn1">Comenzar →</button>
              <!--<button class="btn2">Saber más...</button>-->
              </div>
        </div>
        <div class="img"><img width="200px" height="115px" class="img" src="@/assets/img/variostubos.png" alt="muestras en tubo de ensayo"></div>
        </div>
      </div>
  
  
    <div class="container1">
        <div class="bloq">
          <div class="titulo">Consultar muestra</div>
          <div class="texto">Lorem ipsum </div>
          <div class="botones">
            <button class="btn1" @click="searchQuery">Comenzar →</button>
            <!--<button class="btn2">Saber más...</button>-->
          </div>
        </div>
        <div class="img"><img class="img" width="200px" height="115px" src="@/assets/img/microscopios.jpg" alt="técnicos analizan muestras al microscopio"></div>
        </div>
    </div>
    </div>
  </template>
  
  <script setup>
    import { useRouter } from 'vue-router';
    const router = useRouter();
    const changeWindow = ()=>{
        router.push('/muestras')
    }
    const searchQuery = ()=>{
      router.push('/consultas')
    }
</script>
  
  <style scoped>
  #app {
    background-color: rgb(245, 245, 245);
    margin-top:100px;
  }
  .body {
    background-color: rgb(245, 245, 245);
    color: rgb(0, 70, 118);
    font-family: inter;
  }
  
  .centro {
    display: block;
    position: webkit-sticky;
    margin: auto;
    width: 80vw;
    height: 60vh;
    margin-top: 0.5vh;
    background-color: rgb(245, 245, 245);
    z-index: -1;
    border-radius: 0px 0px 20px 20px;
  }
  
    .container1 {
    display: flex;
    align-items: center; /* Alinea los elementos verticalmente en el centro */
    text-align: center;
    justify-content: space-between; /* Distribuye el espacio de manera uniforme */
    gap: 10px; /* Espacio entre el texto y la imagen */
    margin: auto;
    background-color: white;
    color: rgb(0, 70, 118);
    margin-top: 2vh;
    padding: 1%;
    border-radius: 20px;
    width: 35vw; /* Reduce el ancho */
    max-height: 18vh; /* Limita la altura si es necesario */
  }

  .bloq {
    display: flex;
    flex-direction: column;
    flex-grow: 1;
    text-align: center;
  }

    .img {
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 10px;
    margin: auto; /* Centra la imagen */
  }
  
  .container2 {
    display: flex;
    margin: auto;
    z-index: +1;
    background-color: white;
    color: rgb(0, 70, 118);
    margin-top: 2vh;
    padding: 1%;
    border-radius: 20px;
    height: 18vh;
    width: 80vw;
    align-content: center;
    flex-flow: column;
    flex-wrap: wrap;
  }
  
  .container3 {
    display: flex;
    margin: auto;
    z-index: +1;
    background-color: white;
    color: rgb(0, 70, 118);
    margin-top: 2vh;
    padding: 1%;
    border-radius: 20px;
    height: 18vh;
    width: 80vw;
    align-content: center;
    flex-flow: column;
    flex-wrap: wrap;
  }
  
  .izqda {
    display: flex;
    vertical-align: 70%;
    margin: auto;
    bottom: 10%;
    flex-direction: column;
    text-align: left;
    margin-top: 5vh;
    padding-left: 1vw;
    padding-right: 1vw;
    margin-right: 20vw;
  }
  
  .titulo {
    display: flex;
    text-align: left;
    margin: 0px;
    font-size: 4vh;
    font-weight: bold;
  }
  
  .textoizq {
    display: flex;
    width: 30vw;
    text-align: justify;
    margin: 0vh;
    margin-top: 0vh;
    font-size: 2.5vh;
    place-content: center;
    align-content: flex-start;
  }
  
    .botones {
    display: flex;
    justify-content: center; /* Centra el botón horizontalmente */
    margin-top: 0.5vh;
  }
  
  .btn1 {
    width: 10vw;
    height: 7vh;
    background-color: rgb(0, 70, 118);
    color: rgb(245, 245, 245);
    margin: 0.2vh;
    border-radius: 8px;
  }
  
  /*.btn2 {
    width: 10vw;
    height: 7vh;
    background-color: rgb(224, 224, 224);
    color: rgb(118, 118, 118);
    margin: 0.2vh;
    border-radius: 8px;
  }
  */
  .imgdcha {
    display: flex;
    border-radius: 10px;
    vertical-align: middle;
    margin: auto;
    flex-direction: row;
    text-align: left;
    place-content: left;
    align-self: center;
    flex-flow: row wrap;
  }
  
  .dcha {
    display: flex;
    vertical-align: 70%;
    margin: auto;
    bottom: 10%;
    flex-direction: column;
    text-align: left;
    margin-top: 5vh;
    text-align: right;
    padding-left: 1vw;
    padding-right: 1vw;
    margin-left: 20vw;
  }
  
  .titulodcha {
    display: flex;
    text-align: left;
    margin: 0px;
    font-size: 4vh;
    font-weight: bold;
  }
  
  .textodcha {
    display: flex;
    width: 30vw;
    text-align: justify;
    margin: 0vh;
    margin-top: 0vh;
    font-size: 2.5vh;
    place-content: center;
    align-content: flex-start;
  }
  
  .imgizqda {
    display: flex;
    border-radius: 10px;
    vertical-align: middle;
    margin: auto;
    flex-direction: row;
    text-align: left;
    place-content: left;
    align-self: center;
    flex-flow: row wrap;
    margin-left: 2vw;
  }
  </style>
