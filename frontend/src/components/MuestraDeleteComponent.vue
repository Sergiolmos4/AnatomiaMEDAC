<template>
  <div class="mb-3" v-if="searchTextRule">
  <h3>Servicios con el texto <strong>{{ searchTextRule }}</strong></h3>
  <button class="btn btn-lg btn-warning" @click="resetFilter">Mostrar todos los servicios</button>
<div class="alert alert-warning" role="alert" v-if="filteredmuestradeletes.length===0">De <strong>{{searchTextRule}}</strong> me quedao a cero pisha</div>
</div>
<div class="mb-3" v-if="codigoReceived">
  <h3>Productos de <strong>{{ codigoReceived }}</strong></h3>
  <button class="btn btn-lg btn-warning" @click="resetFilter">Mostrar todos los servicios</button>
<div class="alert alert-warning" role="alert" v-if="filteredmuestradeletes.length===0">De <strong>{{codigoReceived}}</strong> me quedao a cero pisha</div>
</div>
    <div>
    <div class="row row-cols-1 row-cols-md-3 g-4 justify-content-center">
        <div class="col" v-for="muestradelete in filteredmuestradeletes" :key="muestradelete.codigo">
          <div class="card text-center mx-auto">
            <div class="card-body">
              <p class="card-codigo">{{muestradelete.codigo}} - {{muestradelete.muestradelete}}</p>
            </div>
        </div>
      </div>
    </div>
  </div>
  <br><br>
  <p>Para solicitar un servicio, contacta con nosotros: <strong>py@campa.db</strong></p>
  
</template>
<script setup>
import axios from 'axios';

import {ref ,onMounted} from 'vue'
  
const muestradeletes = ref([])
const filteredmuestradeletes=ref([]);
const codigoReceived=ref(null);
const searchTextRule=ref(null)



const resetFilter = () => {
codigoReceived.value =null
searchTextRule.value=null
filteredmuestradeletes.value=muestradeletes.value
}
onMounted (()=>{
  axios.get('http://127.0.0.1:8000/api/muestradeletes/').then(
    response => {
          muestradeletes.value=response.data
          filteredmuestradeletes.value=muestradeletes.value
        }
      ).catch(e => {console.log(e)})
    })
    </script>

