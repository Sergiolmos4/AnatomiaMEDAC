<template>
  <div class="container-all-muestras" style="margin-top: 120px;">
    <div class="muestras-h2">
      <h2>Nuevo Informe</h2>
    </div>
    <div class="data-container">
      <div class="container-form-muestras">
        <form @submit.prevent="submitForm">
          <div class="container-revisar form-muestras">
            <div class="container-row1-revisar">
              <p><strong>Código:</strong> {{ codigo }}</p>
              <p><strong>Fecha muestra:</strong> {{ fecha_recepcion }}</p>
              <p>correo@medac.es</p>
            </div>
            <div class="container-data-img-revisar">
              <div class="data-container">
                <div class="container-row2-revisar">
                  <div>
                    <strong>Naturaleza de la muestra</strong>
                    <input type="text" :value="naturaleza" readonly />
                  </div>
                  <div class="div2">
                    <strong>Conservación de muestra</strong>
                    <input type="text" :value="formato" readonly />
                  </div>
                </div>
                <strong>Descripción citológica o tisular de la muestra</strong>
                <p class="p-revisar">{{ calidad }}</p>
                <textarea class="textarea-revisar" rows="13"></textarea>
                <br>
                <strong>Descripciones</strong>
                <div v-for="(interpretation, index) in interpretaciones" :key="index">
                  <p class="p-revisar">{{ interpretation.desc }}</p>
                  <textarea class="textarea-revisar" v-model="interpretation.desc" rows="10"></textarea>
                  <br>
                </div>
              </div>
              <div class="container-img-revisar">
                <div v-for="(img, index) in images" :key="index">
                  <img :src="img" alt="Vista previa de la imagen" />
                  <select v-model="imageAumentos[index]" required>
                    <option value="null" selected>Tipo de aumento</option>
                    <option value="x4">x4</option>
                    <option value="x10">x10</option>
                    <option value="x40">x40</option>
                    <option value="x100">x100</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="buttons-revisar">
              <button class="enviar-revisar" type="submit">Confirmar</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { useCounterStore } from '../stores/counter.js';

export default {
  props: [
    'codigo', 'naturaleza', 'fecha_recepcion', 'formato', 'organo', 'sede',
    'calidad', 'desccalidad', 'interpretaciones', 'imgUrls'
  ],
  data() {
    return {
      //interpretaciones: this.interpretaciones || [],
      //desccalidad: this.desccalidad || '',
      images: [],
      imageAumentos: []
    };
  },
  mounted() {
    const counterStore = useCounterStore();
    this.images = counterStore.images;
    this.imageAumentos = new Array(this.images.length).fill(null);
    console.log('Props from ViewMuestras:', this.codigo, this.naturaleza, this.fecha_recepcion, this.formato, this.organo, this.sede);
    console.log('Props from ViewMuestras2:', this.calidad, this.desccalidad, this.interpretaciones, this.imgUrls);
  },
  methods: {
    submitForm() {
      // Aquí puedes añadir la lógica para enviar los datos si es necesario.
      console.log('Formulario enviado', this.$props);
    }
  },
  name: 'ViewRevisar'
};
</script>

<style src="../assets/css/revisar.css"></style>
