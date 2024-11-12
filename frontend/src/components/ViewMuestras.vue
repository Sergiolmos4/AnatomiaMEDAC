<template>
  <div class="container-all-muestras ">
    <h2>Nuevo Informe</h2>
    <div class="content-grid">
      <!-- Formulario Principal -->
      <form class="form-muestras" @submit.prevent="register">
        
        <!-- Primera Fila -->
        <div class="form-section">
          <div class="form-group">
            <label for="code">Código de la muestra</label>
            <input class="input-muestras" type="text" v-model="codigo" name="code" placeholder="Código" />
          </div>
          <div class="form-group">
            <label for="nature">Naturaleza de la muestra</label>
            <select class="input-muestras" v-model="naturaleza" required>
              <option v-for="nat in naturalezas" :key="nat.naturaleza" :value="nat.naturaleza">{{ nat.naturaleza }}</option>
            </select>
          </div>
          <div class="form-group">
            <label for="dateColected">Fecha de recolección</label>
            <input class="input-muestras" type="date" v-model="fecha_recepcion" name="dateColected" />
          </div>
        </div>

        <!-- Segunda Fila -->
        <div class="form-section">
          <div class="form-group">
            <label for="user">Usuario de la muestra</label>
            <input class="input-muestras" type="text" :value="username" placeholder="Usuario" readonly />
          </div>
          <div class="form-group">
            <label for="sede">Centro de procedencia</label>
            <input class="input-muestras" type="text" :value="sedeUsuario" readonly />
          </div>
          <div class="form-group">
            <label for="biopsy">Opciones órganos</label>
            <select class="input-muestras" v-model="organo" required>
              <option v-for="org in organos" :key="org.organo" :value="org.organo">{{ org.organo }}</option>
            </select>
          </div>
        </div>

        <!-- Tercera Fila -->
        <div class="form-section fila-3">
          <div class="form-group full-width">
            <label for="conservation">Conservación de muestra</label>
            <select class="input-muestras" v-model="formato" required>
              <option v-for="form in formatos" :key="form.formato" :value="form.formato">{{ form.formato }}</option>
            </select>
          </div>
        </div>
        
        <div style="margin-bottom: 60px;"></div> <!--Espacio de separación adiccional-->
        
        <!-- Cuarta Fila -->
        <div class="form-section same-style-row">
          <div class="form-group">
            <label for="calidad">Calidad de la muestra</label>
            <select class="input-muestras" v-model="calidad" required>
              <option v-for="cal in calidades" :key="cal.codigo" :value="cal.codigo">{{ cal.codigo }}</option>
            </select>
          </div>
        </div>
        
        <!-- Quinta fila-->
        <div class="form-section same-style-row">
          <div class="form-group">
            <label for="descCalidad">Descripción calidad</label>
            <textarea class="input-muestras" name="descCalidad" v-model="desccalidad" rows="3" placeholder="Introduce una descripción sobre calidad..."></textarea>
          </div>
        </div>

        <!-- Sexta Fila -->
        <div class="form-section same-style-row">
          <div class="form-group">
            <label for="interpretacion">Interpretación de la muestra</label>
            <select class="input-muestras" v-model="interpretacion" required multiple> <!-- varias interpretaciones-->
              <option v-for="interp in interpretaciones" :key="interp.codigo" :value="interp.codigo">{{ interp.codigo }}</option>
            </select>
          </div>
        </div>

        <!-- Séptima fila -->

        <div class="form-section same-style-row">
          <div class="form-group">
            <label for="descInterpretacion">Descripción interpretación</label>
            <textarea class="input-muestras" name="descInterpretacion" v-model="desc" rows="3" placeholder="Introduce una descripción sobre interpretación..."></textarea>
          </div>
        </div>

        <!-- Botón de envío -->
        <button class="btn-muestras" type="submit">Insertar</button>
      </form>

       <!-- Espacio para almacenamiento de imagenes -->
      <div class="form-section imagenes">
        <label for="imageUpload">Añadir imagen</label>
        <input type="file" id="imageUpload" @change="onImageChange" accept="image/*" multiple />

         
    
        <!-- Vista previa de la imagen -->
        <div v-if="imageUrls.length > 0" class="image-preview">
          <div v-for="(image, index) in imageUrls" :key="index" class="preview-image">
           <img :src="image.url" alt="Vista previa de imagen" />

           <!-- Menú desplegable para seleccionar el tipo de aumento -->
          <div class="zoom-options">
          <label for="zoomSelect">Tipo de aumento:</label>
          <select v-model="image.zoom" id="zoomSelect">
            <option value="x4">x4</option>
            <option value="x10">x10</option>
            <option value="x40">x40</option>
            <option value="x100">x100</option>
          </select>
          </div>
        </div> 
      </div>
    </div>
  </div>
</div>
</template>



<script setup>
import { ref, onMounted, watch } from 'vue';
import { useRouter } from 'vue-router';
//import { useCounterStore } from '../stores/counter.js';
import axios from 'axios';
import { username as authUsername } from '@/auth.js'; // Asegúrate de que esta importación sea correcta

// Declaración de la variable reactiva para almacenar las URLs de las imágenes
const imageUrls = ref([]);

// Función que maneja el cambio de imagen
const onImageChange = (event) => {
  const files = event.target.files; // Obtenemos los archivos seleccionados
  if (files) {
    for (let i = 0; i < files.length; i++) {
      const file = files[i]; // Accedemos a cada archivo
      imageUrls.value.push({
        url: URL.createObjectURL(file), // Creamos la URL de la imagen
        zoom: null // Valor por defecto para el aumento
      });
    }
  }
};

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
const interpretacion = ref([]); //Permite alamacenar varias interpretaciones
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
