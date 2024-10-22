<template>
  <navbar-component />
    <div class="container-all-muestras">
      <div class="muestras-h2">
        <h2>Informe Nº: {{ props.codigo }}</h2>
        <h2>Usuario: {{props.usuario}}</h2>
      </div>
      <div class="container-form-muestras">
        <form class="form-muestras" @submit.prevent="volver">
          <div style="display: flex; justify-content: space-between;">
            <div>
              <label for="codigo">Código de la muestra</label>
              <input type="text" class="input-muestras" :value="props.codigo" readonly/>
              <label for="fecha_recepcion">Fecha Recepción</label>
              <input class="input-muestras" type="date" :value="props.fecha_recepcion" readonly />
            </div>
            <div>
              <label for="nature">Naturaleza de la muestra</label>
              <input type="text" class="input-muestras" :value="props.naturaleza" readonly />
              <label for="conservation">Conservación de muestra</label>
              <input type="text" class="input-muestras" :value="props.formato" readonly />
            </div>
            <div>
              <label for="biopsy">Organo</label>
              <input type="text" class="input-muestras" :value="props.organo" readonly />
              <label for="sede">Centro de procedencia</label>
              <input type="text" class="input-muestras" :value="props.sede" readonly />
            </div>
          </div>
          <div>
            <label>Descripciones</label>
            <textarea v-model="textoArea" class="pitufo">
            </textarea>
          </div>
          <button class="btn-muestras" type="button" @click="printPage">Imprimir Informe</button>
          <button class="btn-muestras" type="submit">Volver</button>
        </form>
      </div>
    </div>
    
  </template>
  
  <script setup>
  import { ref, onMounted,defineProps, computed } from 'vue';
  import axios from 'axios';
  import { useRouter } from 'vue-router';
  import NavbarComponent from './NavbarComponent.vue';
  //import { jsPDF } from 'jspdf';
  const router = useRouter();
  const props = defineProps({
    codigo: {
      type: String,
      required: true
    },
    fecha_recepcion: {
      type: String,
      required: true
    },
    naturaleza: {
      type: String,
      required: true
    },
    formato: {
      type: String,
      required: true
    },
    organo: {
      type: String,
      required: true
    },
    sede: {
      type: String,
      required: true
    },
    usuario: {
        type: String,
        required: true
    },
    calidad: {
      type: String,
      required: true
    },
    interpretacion: {
      type: String,
      required: true
    },
    descripcionCal: {
      type: String,
      required: true
    },
    descripcionInt: {
      type: String,
      required: true
    },
  });
  const muestra = ref({});
  const textoArea = computed(() => {
  return `${props.calidad} - ${props.descripcionCal}\n\n ${props.interpretacion} - ${props.descripcionInt}`;
    });
  onMounted(async () => {
    try {
      const response = await axios.get(`http://localhost:8000/api/muestras/?codigo=${props.codigo}`);
      muestra.value = response.data;
    } catch (e) {
      console.error('Error al cargar datos:', e);
    }
  });
  
  const volver = () => {
    router.push('/consultas');
  };

  const printPage = () => {
  window.print();
}
  /*const printPDF = () => {
  const content = document.getElementById('pdfContent');

  html2craft.takeSnapshot(content, {
    onrendered: function(canvas) {
      const imgData = clearSnapshot.toDataURL('image/png');
      const pdf = new jsPDF({
        orientation: 'portrait',
        unit: 'px',
        flipHorizontal: 1
      });

      pdf.addImage(imgData, 'PNG', 0, 0);
      round.save('download.pdf');
    }
  });
};*/
  </script>
  
  <style src="../assets/css/muestras.css">
</style>
  