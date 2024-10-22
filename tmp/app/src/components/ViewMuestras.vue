<template>
  <div class="container-all-muestras" style="margin-top: 120px;">
    <div class="muestras-h2">
      <h2>Nuevo Informe</h2>
    </div>

    <div class="container-form-muestras">
      <form class="form-muestras" @submit.prevent="goToNextPart">
        <div style="display: flex; justify-content: space-between;">
          <div>
            <div>
              <label for="code">Código de la muestra</label>
              <input class="input-muestras" type="text" v-model="codigo" name="code" placeholder="Código" />
            </div>
            <div>
              <label for="nature">Naturaleza de la muestra</label>
              <div>
                <select class="input-muestras" v-model="naturaleza" required>
                  <option name="nature" v-for="naturaleza in naturalezas" :key="naturaleza.naturaleza" selected>{{naturaleza.naturaleza}}</option>
                </select>
              </div>
            </div>
            <div>
              <label for="conservation">Conservación de muestra</label>
              <div>
                <select class="input-muestras" v-model="formato" required>
                  <option name="conservation" v-for="formato in formatos" :key="formato.formato" selected> {{ formato.formato }} </option>
                </select>
              </div>
            </div>
          </div>
          <div>
            <div>
              <label for="dateColected">Fecha de recolección</label>
              <input class="input-muestras" type="date" v-model="fecha_recepcion" name="dateColected" />
            </div>
            <div>
              <label for="biopsy">Opciones órganos</label>
              <div>
                <select class="input-muestras" v-model="organo" required>
                  <option name="biopsy" v-for="organo in organos" :key="organo.organo" selected>{{organo.organo}}</option>
                </select>
              </div>
            </div>
            <div>
              <label for="sede">Centro de procedencia</label>
              <div>
                <select class="input-muestras" v-model="sede" required>
                  <option name="sede" v-for="sede in sedes" :key="sede.sede">{{sede.sede}}</option>
                </select>
              </div>
            </div>
          </div>
          <div>

            <div>
              <label for="img">Imágenes de la muestra</label>
              <input class="input-muestras" type="file" @change="onFileChange" multiple />
              <img v-if="imgUrl" :src="imgUrl" alt="Vista previa de la imagen" />
              
            </div>
          </div>
        </div>


        <button class="btn-muestras" type="submit">Siguiente</button>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { useCounterStore } from '../stores/counter.js';
import axios from 'axios';

// Variables reactivas
const codigo = ref('');
const naturaleza = ref('');
const fecha_recepcion = ref('');
const formato = ref('');
const organo = ref('');
const sede = ref('');
const imgUrls = ref([]);
const naturalezas = ref([]); // Lista para naturalezas de muestra
const organos = ref([]); // Lista para conservación
const formatos = ref([]); // Lista para formatos
const sedes = ref([]); // Lista para sedes

const router = useRouter();
const counterStore = useCounterStore();

onMounted(async () => {
  try {
    const [natResp, organosResp, formatosResp, sedeResp] = await Promise.all([
      axios.get('http://localhost:8000/api/naturalezas'),
      axios.get('http://localhost:8000/api/organos'),
      axios.get('http://localhost:8000/api/formatos'),
      axios.get('http://localhost:8000/api/sedes')
    ]);
    naturalezas.value = natResp.data;
    organos.value = organosResp.data;
    formatos.value = formatosResp.data;
    sedes.value = sedeResp.data;
  } catch (error) {
    console.error('Error al cargar datos:', error);
  }
});

function goToNextPart() {
  router.push({
    name: 'ViewMuestras2',
    params: {
      codigo: codigo.value,
      naturaleza: naturaleza.value,
      fecha_recepcion: fecha_recepcion.value,
      formato: formato.value,
      organo: organo.value,
      sede: sede.value,
      imgUrls: JSON.stringify(imgUrls.value)
    }
  });
}

function onFileChange(e) {
  const files = e.target.files;
  for (const file of files) {
    const reader = new FileReader();
    reader.onload = (event) => {
      counterStore.addImage(event.target.result);
    };
    reader.readAsDataURL(file);
    imgUrls.value.push(file.name);
  }
  console.log(imgUrls.value);
}
</script>



<style src="../assets/css/muestras.css"></style>