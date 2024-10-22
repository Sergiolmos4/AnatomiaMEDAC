<template>
  <div class="container-all-muestras" style="margin-top: 120px;">
    <div class="muestras-h2">
      <h2>Nuevo Informe</h2>
    </div>

    <div class="container-form-muestras">
      <form class="form-muestras" @submit.prevent="submitForm">
        <div class="container-textarea-muestras">
          <div>
            <label for="calidad">Calidad de la muestra</label>
            <select class="input-muestras" v-model="calidad" required>
              <option name="calidad" v-for="calidad in calidades" :key="calidad.codigo" :value="calidad.codigo" selected>{{calidad.codigo}}</option>
            </select>
          </div>

          <div>
            <label for="desc">Descripción calidad</label>
            <textarea class="input-muestras" name="desccalidad" v-model="desccalidad" rows="15"
              placeholder="Introduce una descripción sobre interpretación..."></textarea>
          </div>
        </div>

        <div class="container-textarea-muestras">
          <div>
            <label for="interpretacion">Interpretación de la muestra</label>
            <select class="input-muestras" v-model="interpretacion" required>
              <option name="interpretacion" v-for="interpretacion in interpretaciones" :key="interpretacion.codigo" :value="interpretacion.codigo" selected>{{interpretacion.codigo}}</option>
            </select>
          </div>

          <div>
            <label for="desc">Descripción interpretación</label>
            <textarea class="input-muestras" name="desc" v-model="desc" rows="15"
              placeholder="Introduce una descripción sobre interpretación..."></textarea>
          </div>
        </div>

        <button class="btn-muestras" type="submit">Siguiente</button>
        <button type="button" class="btn-muestras" @click="other">Agregar otra interpretación</button>
      </form>
    </div>


  </div>
</template>

<script>
import axios from 'axios';
export default {
  props: ['codigo', 'naturaleza', 'fecha_recepcion', 'formato', 'organo', 'sede', 'imgUrls'],
  data() {
    return {
      calidad: '',
      desccalidad:'',
      calidades: [],
      interpretacion: '',
      desc: '',
      interpretaciones: [] ,
    };
  },
  created() {
    this.fetchCalidades();
    this.fetchInterpretaciones();
  },
  methods: {
    fetchCalidades() {
      axios.get('http://localhost:8000/api/calidades/')
        .then(response => {
          this.calidades = response.data;
        })
        .catch(error => {
          console.error("Error fetching calidades:", error);
        });
    },
    fetchInterpretaciones() {
      axios.get('http://localhost:8000/api/interpretaciones/')
        .then(response => {
          this.interpretaciones = response.data;
        })
        .catch(error => {
          console.error("Error fetching interpretaciones:", error);
        });
    },
    submitForm() {
      

      this.$router.push({
        name: 'ViewRevisar',
        params: {
          codigo: this.codigo,
          naturaleza: this.naturaleza,
          fecha_recepcion: this.fecha_recepcion,
          formato: this.formato,
          organo: this.organo,
          sede: this.sede,
          imgUrls: this.imgUrls,
          calidad: this.calidad,
          desccalidad: this.desccalidad,
          interpretacion: this.interpretacion, 
          desc: this.desc
        }
      });
    },
    any(){
      this.calidades.push({
        calidad: this.calidad,
        desccalidad: this.desccalidad
      });
      this.desccalidad='';
    },
    other() {
      this.interpretaciones.push({
        interpretacion: this.interpretacion,
        desc: this.desc
      });
      
      this.desc = '';
      
    },
  },
  watch: {
    calidad(newVal){
      const selected = this.calidades.find(item => item.codigo === newVal);
      this.desccalidad = selected ? selected.descripcion : '';
    },
    interpretacion(newVal) {
      const selected = this.interpretaciones.find(item => item.codigo === newVal);
      this.desc = selected ? selected.descripcion : '';
    }
  },
  name: 'ViewMuestras2'
};
</script>




<style src="../assets/css/muestras.css"></style>