<template>
  <div class="container-all-muestras" style="margin-top: 120px;">
    <div class="muestras-h2">
      <h2>Buscar muestra por:</h2>
    </div>

    <div class="container-form-muestras">
      <form class="form-muestras" @submit.prevent="searchMuestras">
        <div style="display: flex; justify-content: space-between;">
          <!-- Más campos aquí... -->
          <div>
            <div>
              <label for="codigo">Código de la muestra</label>
              <input type="text" class="input-muestras" name="code" v-model="codigo"/>
            </div>
            <div>
              <label for="fecha_recepcion">Fecha Recepción</label>
              <input class="input-muestras" type="date" v-model="fecha_recepcion" name="dateColected" />
            </div>
          </div>
          <div>
            <div>
              <label for="nature">Naturaleza de la muestra</label>
              <select class="input-muestras" v-model="naturaleza">
                <option v-for="nat in naturalezas" :key="nat.naturaleza" :value="nat.naturaleza">{{ nat.naturaleza }}</option>
              </select>
            </div>
            <div>
              <label for="conservation">Conservación de muestra</label>
              <select class="input-muestras" v-model="formato">
                <option v-for="formato in formatos" :key="formato.formato" :value="formato.formato">{{ formato.formato }}</option>
              </select>
            </div>
          </div>
          <div>
            <div>
              <label for="biopsy">Opciones biopsia</label>
              <select class="input-muestras" v-model="organo">
                <option v-for="org in organos" :key="org.organo" :value="org.organo">{{ org.organo }}</option>
              </select>
            </div>
            <div>
              <label for="sede">Centro de procedencia</label>
              <select class="input-muestras" v-model="sede">
                <option v-for="sede in sedes" :key="sede.sede" :value="sede.sede">{{ sede.sede }}</option>
              </select>
            </div>
          </div>
        </div>

        <button class="btn-muestras" type="submit" @click="searchMuestras">Buscar</button>
      </form>
    </div>

    <div>
      <ul v-for="m in filteredmuestras" :key="m.codigo">
        <li><router-link :to="`/informe/${m.codigo}/${m.fecha_recepcion}/${m.naturaleza}/${m.formato}/${m.organo}/${m.sede}/${m.usuario.username}/${m.calidad}/${m.interpretacion}/${m.descripcionCal}/${m.descripcionInt}`">{{ m.codigo }} - {{ m.naturaleza }} - {{ m.formato }} - {{m.sede}} - {{m.usuario}} - {{m.calidad}} - {{m.interpretacion}}</router-link></li>
      </ul>
    </div>
    
  </div>
</template>
<script setup>
import { ref, onMounted } from 'vue';
import axios from 'axios';

const codigo = ref('');
const naturaleza = ref('');
const organos = ref([]);
const naturalezas = ref([]);
const formatos = ref([]);
const sedes = ref([]);
const formato = ref('');
const fecha_recepcion = ref('');
const organo = ref('');
const sede = ref('');
const usuarios = ref([]);
const usuario = ref('');
const calidades = ref([]);
const calidad = ref('');
const interpretaciones = ref([]);
const interpretacion = ref('');
const muestras = ref([]);
const filteredmuestras = ref([]);

onMounted(() => {
  axios.all([
    axios.get('http://localhost:8000/api/muestras/'),
    axios.get('http://localhost:8000/api/organos/'),
    axios.get('http://localhost:8000/api/naturalezas/'),
    axios.get('http://localhost:8000/api/formatos/'),
    axios.get('http://localhost:8000/api/sedes/'),
    axios.get('http://localhost:8000/api/usuarios/'),
    axios.get('http://localhost:8000/api/calidades/'),
    axios.get('http://localhost:8000/api/interpretaciones/'),
  ]).then(axios.spread((muestrasResp, organosResp, naturalezasResp, formatosResp, sedesResp, usuariosResp, calidadesResp, interpretacionesResp) => {
    muestras.value = muestrasResp.data;
    filteredmuestras.value = muestras.value; // Inicializa con todas las muestras
    organos.value = organosResp.data;
    naturalezas.value = naturalezasResp.data;
    formatos.value = formatosResp.data;
    sedes.value = sedesResp.data;
    usuarios.value = usuariosResp.data;
    calidades.value = calidadesResp.data;
    interpretaciones.value = interpretacionesResp.data;

  })).catch(e => { console.log(e) })
});

const searchMuestras = () => {
  filteredmuestras.value = muestras.value.filter(muestra => {
    return (!codigo.value || muestra.codigo.toString() === codigo.value.toString()) &&
           (!naturaleza.value || muestra.naturaleza === naturaleza.value) &&
           (!formato.value || muestra.formato === formato.value) &&
           (!fecha_recepcion.value || muestra.fecha_recepcion === fecha_recepcion.value) &&
           (!organo.value || muestra.organo === organo.value) &&
           (!sede.value || muestra.sede === sede.value) &&
           (!usuario.value || muestra.usuario === usuario.value) &&
           (!calidad.value || muestra.calidad === calidad.value) &&
           (!interpretacion.value || muestra.interpretacion === interpretacion.value)
           
  });
};
</script>
<style src="../assets/css/muestras.css"></style>