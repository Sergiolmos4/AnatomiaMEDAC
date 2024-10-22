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
              <label for="code">Usuario de la muestra</label>
              <input class="input-muestras" type="text" :value="username" placeholder="Usuario" readonly />
            </div>
          </div>
          <div>
            <div>
              <label for="nature">Naturaleza de la muestra</label>
              <div>
                <select class="input-muestras" v-model="naturaleza" required>
                  <option name="nature" v-for="nat in naturalezas" :key="nat.naturaleza" :value="nat.naturaleza">{{nat.naturaleza}}</option>
                </select>
              </div>
            </div>
            <div>
              <label for="sede">Centro de procedencia</label>
              <div>
                <input class="input-muestras" type="text" :value="sedeUsuario" readonly />
              </div>
            </div>
            <div>
              <label for="conservation">Conservación de muestra</label>
              <div>
                <select class="input-muestras" v-model="formato" required>
                  <option name="conservation" v-for="form in formatos" :key="form.formato" :value="form.formato">{{ form.formato }}</option>
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
                  <option name="biopsy" v-for="org in organos" :key="org.organo" :value="org.organo">{{org.organo}}</option>
                </select>
              </div>
            </div>
          </div>
        </div>
        <div class="container-textarea-muestras">
          <div>
            <label for="calidad">Calidad de la muestra</label>
            <select class="input-muestras" v-model="calidad" required>
              <option name="calidad" v-for="cal in calidades" :key="cal.codigo" :value="cal.codigo" selected>{{cal.codigo}}</option>
            </select>
          </div>
          <div>
            <label for="desc">Descripción calidad</label>
            <textarea class="input-muestras" name="desccalidad" v-model="desccalidad" rows="15" placeholder="Introduce una descripción sobre calidad..."></textarea>
          </div>
        </div>
        <div class="container-textarea-muestras">
          <div>
            <label for="interpretacion">Interpretación de la muestra</label>
            <select class="input-muestras" v-model="interpretacion" required>
              <option name="interpretacion" v-for="interp in interpretaciones" :key="interp.codigo" :value="interp.codigo" selected>{{interp.codigo}}</option>
            </select>
          </div>
          <div>
            <label for="desc">Descripción interpretación</label>
            <textarea class="input-muestras" name="desc" v-model="desc" rows="15" placeholder="Introduce una descripción sobre interpretación..."></textarea>
          </div>
        </div>
        <button class="btn-muestras" type="submit" @click="register">Insertar</button>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue';
import { useRouter } from 'vue-router';
//import { useCounterStore } from '../stores/counter.js';
import axios from 'axios';
import { username as authUsername } from '@/auth.js'; // Asegúrate de que esta importación sea correcta

// Variables reactivas
const codigo = ref('');
const naturaleza = ref('');
const fecha_recepcion = ref('');
const formato = ref('');
const organo = ref('');
//const imagenes = ref([]);
const naturalezas = ref([]);
const organos = ref([]);
const formatos = ref([]);
const username = ref(authUsername.value.username); // Obtener username de auth.js
const calidad = ref('');
const desccalidad = ref('');
const calidades = ref([]);
const interpretacion = ref('');
const usuarios = ref([]);
const desc = ref('');
const interpretaciones = ref([]);
const router = useRouter();
//const counterStore = useCounterStore();
const usuarioAutenticado = ref(null);
const sedeUsuario = ref('');
const aumentos = ref([]);


onMounted(async () => {
  try {
    const [natResp, organosResp, formatosResp, calidadResp, interpretacionResp, usuarioResp, aumentoResp] = await Promise.all([
      axios.get('http://localhost:8000/api/naturalezas/'),
      axios.get('http://localhost:8000/api/organos/'),
      axios.get('http://localhost:8000/api/formatos/'),
      axios.get('http://localhost:8000/api/calidades/'),
      axios.get('http://localhost:8000/api/interpretaciones/'),
      axios.get('http://localhost:8000/api/usuarios/'),
      axios.get('http://localhost:8000/api/aumentos'),
    ]);
    naturalezas.value = natResp.data;
    organos.value = organosResp.data;
    formatos.value = formatosResp.data;
    /*sedes.value = sedeResp.data;*/
    calidades.value = calidadResp.data;
    interpretaciones.value = interpretacionResp.data;
    usuarios.value = usuarioResp.data;
    aumentos.value = aumentoResp.data;


    // Encuentra el usuario autenticado
    usuarioAutenticado.value = usuarios.value.find(user => user.username === username.value);
    if(usuarioAutenticado.value){
      sedeUsuario.value = usuarioAutenticado.value.sede;
    }
    console.log('Usuario autenticado:', usuarioAutenticado.value);
  } catch (error) {
    console.error('Error al cargar datos:', error);
  }
});

watch(calidad, (newVal) => {
  const selected = calidades.value.find(item => item.codigo === newVal);
  desccalidad.value = selected ? selected.descripcion : '';
});

watch(interpretacion, (newVal) => {
  const selected = interpretaciones.value.find(item => item.codigo === newVal);
  desc.value = selected ? selected.descripcion : '';
});

const register = async () => {
    
    try {
      await axios.post('http://127.0.0.1:8000/api/muestra/create/', {
        codigo: codigo.value,
        fecha_recepcion: fecha_recepcion.value,
        naturaleza: naturaleza.value,
        sede: sedeUsuario.value,
        username: usuarioAutenticado.value ? usuarioAutenticado.value.username : '', 
        organo: organo.value,
        formato: formato.value,
        calidad: calidad.value,
        interpretacion: interpretacion.value,
        descripcionCal: desccalidad.value,
        descripcionInt: desc.value,
        //zoom: aumentos.value,
        //imagenes: JSON.stringify(imagenes.value.map(img => ({
          //name: img.name,
          //dataUrl: img.dataUrl*/
        })
        //imagenes: imagenes.value,
      
      router.push('/muestrasmenu');
    } catch (error) {
      console.error(error);
    }
};


  /*function onFileChange(e) {
  const files = e.target.files;
  if (!imagenes.value.name) {
    imagenes.value.name = []; // Inicializa el arreglo si aún no existe
  }
  for (const file of files) {
    const reader = new FileReader();
    reader.onload = (/*event) => {
      imagenes.value.name.push(file.name); // Añade solo el nombre del archivo al arreglo
    };
    reader.readAsDataURL(file); // Si todavía necesitas la data URL por alguna otra razón
  }
}*/
/*function onFileChange(e) {
  const files = e.target.files;
  imagenes.value.name = []; 
  for (const file of files) {
    const reader = new FileReader();
    reader.onload = (event) => {
      // Almacena los datos de la imagen (data URL) en lugar del nombre del archivo
      imagenes.value.push({
        name: file.name,
        dataUrl: event.target.result
      });
      counterStore.addImage(event.target.result); // Opcional: Si quieres mantener esta función
    };
    reader.readAsDataURL(file);
  }
}*/

/*function onFileChange(e) {
  const files = e.target.files;
  for (const file of files) {
    const reader = new FileReader();
    reader.onload = (event) => {
      counterStore.addImage(event.target.result);
    };
    reader.readAsDataURL(file);
    imagenes.value.push(file.name);
  }
  console.log(imagenes.value);
}*/
</script>

<style src="../assets/css/muestras.css"></style>
