<script setup>
import { ref, onMounted, watch } from "vue";
import { useRouter } from "vue-router";
//import { useCounterStore } from '../stores/counter.js';
import axios from "axios";
import { username as authUsername } from "@/auth.js"; // Asegúrate de que esta importación sea correcta

const imageUrl = ref(null); // Almacena la URL de la imagen cargada

const onImageChange = (event) => {
  const file = event.target.files[0];
  if (file) {
    imageUrl.value = URL.createObjectURL(file); // Crea una URL para mostrar la imagen
  }
};
// Variables reactivas
const codigo = ref("");
const naturaleza = ref("");
const fecha_recepcion = ref("");
const formato = ref("");
const organo = ref("");
//const imagenes = ref([]);
const naturalezas = ref([]);
const organos = ref([]);
const formatos = ref([]);
const username = ref(authUsername.value.username); // Obtener username de auth.js
const calidad = ref("");
const desccalidad = ref("");
const calidades = ref([]);
const interpretacion = ref("");
const usuarios = ref([]);
const desc = ref("");
const interpretaciones = ref([]);
const router = useRouter();
//const counterStore = useCounterStore();
const usuarioAutenticado = ref(null);
const sedeUsuario = ref("");
const aumentos = ref([]);

onMounted(async () => {
  try {
    const [
      natResp,
      organosResp,
      formatosResp,
      calidadResp,
      interpretacionResp,
      usuarioResp,
      aumentoResp,
    ] = await Promise.all([
      axios.get("http://localhost:8000/api/naturalezas/"),
      axios.get("http://localhost:8000/api/organos/"),
      axios.get("http://localhost:8000/api/formatos/"),
      axios.get("http://localhost:8000/api/calidades/"),
      axios.get("http://localhost:8000/api/interpretaciones/"),
      axios.get("http://localhost:8000/api/usuarios/"),
      axios.get("http://localhost:8000/api/aumentos"),
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
    usuarioAutenticado.value = usuarios.value.find(
      (user) => user.username === username.value
    );
    if (usuarioAutenticado.value) {
      sedeUsuario.value = usuarioAutenticado.value.sede;
    }
    console.log("Usuario autenticado:", usuarioAutenticado.value);
  } catch (error) {
    console.error("Error al cargar datos:", error);
  }
});

watch(calidad, (newVal) => {
  const selected = calidades.value.find((item) => item.codigo === newVal);
  desccalidad.value = selected ? selected.descripcion : "";
});

watch(interpretacion, (newVal) => {
  const selected = interpretaciones.value.find(
    (item) => item.codigo === newVal
  );
  desc.value = selected ? selected.descripcion : "";
});

const register = async () => {
  try {
    await axios.post("http://127.0.0.1:8000/api/muestra/create/", {
      codigo: codigo.value,
      fecha_recepcion: fecha_recepcion.value,
      naturaleza: naturaleza.value,
      sede: sedeUsuario.value,
      username: usuarioAutenticado.value
        ? usuarioAutenticado.value.username
        : "",
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
    });
    //imagenes: imagenes.value,

    router.push("/muestrasmenu");
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
<template>
  <div class="container-all-muestras">
    <div class="muestras-h2">
      <h2>Nuevo Informe</h2>
    </div>

    <div class="container-form-muestras">
      <form class="form-muestras" @submit.prevent="goToNextPart">
        <div class="form-section">
          <div class="form-column">
            <div class="form-group">
              <label for="code">Código de la muestra</label>
              <input
                class="input-muestras"
                type="text"
                v-model="codigo"
                name="code"
                placeholder="Introduzca el código asociado"
                required
              />
            </div>
            <div class="form-group">
              <label for="username">Usuario de la muestra</label>
              <input
                class="input-muestras"
                type="text"
                :value="username"
                placeholder="Usuario"
                readonly
              />
            </div>
          </div>
          <div class="form-column">
            <div class="form-group">
              <label for="nature">Naturaleza de la muestra</label>
              <select class="input-muestras" v-model="naturaleza" required>
                <option
                  name="nature"
                  v-for="nat in naturalezas"
                  :key="nat.naturaleza"
                  :value="nat.naturaleza"
                >
                  {{ nat.naturaleza }}
                </option>
              </select>
            </div>
            <div class="form-group">
              <label for="sede">Centro de procedencia</label>
              <input
                class="input-muestras"
                type="text"
                :value="sedeUsuario"
                readonly
              />
            </div>
            <div class="form-group">
              <label for="conservation">Conservación de muestra</label>
              <select class="input-muestras" v-model="formato" required>
                <option
                  name="conservation"
                  v-for="form in formatos"
                  :key="form.formato"
                  :value="form.formato"
                >
                  {{ form.formato }}
                </option>
              </select>
            </div>
          </div>
          <div class="form-column">
            <div class="form-group">
              <label for="dateColected">Fecha de recolección</label>
              <input
                class="input-muestras"
                type="date"
                v-model="fecha_recepcion"
                name="dateColected"
                required
              />
            </div>
            <div class="form-group">
              <label for="biopsy">Opciones órganos</label>
              <select class="input-muestras" v-model="organo" required>
                <option
                  name="biopsy"
                  v-for="org in organos"
                  :key="org.organo"
                  :value="org.organo"
                >
                  {{ org.organo }}
                </option>
              </select>
            </div>
          </div>
        </div>

        <div class="container-textarea-muestras">
          <div class="form-group2">
            <label for="calidad">Calidad de la muestra</label>
            <select class="input-muestras2" v-model="calidad" required>
              <option
                name="calidad"
                v-for="cal in calidades"
                :key="cal.codigo"
                :value="cal.codigo"
                selected
              >
                {{ cal.codigo }}
              </option>
            </select>
          </div>
          <div class="form-group2">
            <label for="desc">Descripción calidad</label>
            <textarea
              class="input-muestras3"
              name="desccalidad"
              v-model="desccalidad"
              rows="5"
              placeholder="Introduce una descripción sobre calidad..."
            ></textarea>
          </div>
        </div>

        <div class="container-textarea-muestras">
          <div class="form-group2">
            <label for="interpretacion">Interpretación de la muestra</label>
            <select class="input-muestras2" v-model="interpretacion" required>
              <option
                name="interpretacion"
                v-for="interp in interpretaciones"
                :key="interp.codigo"
                :value="interp.codigo"
                selected
              >
                {{ interp.codigo }}
              </option>
            </select>
          </div>
          <div class="form-group2">
            <label for="desc">Descripción interpretación</label>
            <textarea
              class="input-muestras3"
              name="desc"
              v-model="desc"
              rows="5"
              placeholder="Introduce una descripción sobre interpretación..."
            ></textarea>

            <div class="form-group2">
              <label for="interpretacion">Segunda interpretación</label>
              <select class="input-muestras2" v-model="interpretacion" required>
                <option
                  name="interpretacion"
                  v-for="interp in interpretaciones"
                  :key="interp.codigo"
                  :value="interp.codigo"
                  selected
                >
                  {{ interp.codigo }}
                </option>
              </select>
            </div>
            <label for="desc">Descripción segunda interpretación</label>
            <textarea
              class="input-muestras3"
              name="desc"
              v-model="desc"
              rows="5"
              placeholder="Introduce una descripción sobre interpretación..."
            ></textarea>
          </div>
        </div>
        <div class="image-uploader">
          <input type="file" @change="onImageChange" accept="image/*" />
        </div>

        <div v-if="imageUrl" class="image-preview">
          <img :src="imageUrl" alt="Vista previa de imagen" />
        </div>

        <button class="btn-muestras" type="submit" @click="register">
          Crear informe
        </button>
      </form>
    </div>
  </div>
</template>

<style scoped>
.container-all-muestras {
  padding: 20px;
  font-family: Arial, sans-serif;
  background-color: #f8f8f8;
}

.muestras-h2 {
  text-align: center;
  margin-bottom: 25px;
  margin-top: 40px;
  color: #004676;
}
.container-form-muestras {
  background-color: #ffffff;
  border-radius: 8px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  padding: 20px;
}

.form-section {
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
}

.form-column {
  flex: 1;
  margin-right: 10px;
}

.form-column:last-child {
  margin-right: 0;
}

.form-group {
  margin-bottom: 15px;
}
.form-group2 {
  margin-bottom: 15px;
  margin-left: 0%;
}

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
  color: #004676;
  font-size: small;
}

.input-muestras {
  width: 60%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
.input-muestras2 {
  width: 20%; /* Ajusta el ancho al 50% o el valor que prefieras */
  padding: 10px; /* Reduce el padding a 5px */
  border: 1px solid #ccc;
  border-radius: 4px;
}
.input-muestras3 {
  width: 30%; /* Ajusta el ancho al 50% o el valor que prefieras */
  padding: 1px; /* Reduce el padding a 5px */
  border: 1px solid #ccc;
  border-radius: 4px;
}

.input-muestras:focus {
  border-color: #004676;
  outline: none;
}
.input-muestras2:focus {
  border-color: #004676;
  outline: none;
}
.input-muestras3:focus {
  border-color: #004676;
  outline: none;
}

.btn-muestras {
  background-color: #004676;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s;
  margin-top: 20px;
}

.btn-muestras:hover {
  background-color: #004676;
}

.image-uploader {
  margin-top: 20px;
  background-color: #f9f9f9;
  border: 2px dashed #ccc;
  border-radius: 8px;
  padding: 20px;
  text-align: center;
  transition: border-color 0.3s, background-color 0.3s;
}
.image-uploader:hover {
  border-color: #004676;
  background-color: #f0f4ff;
}
.image-preview {
  margin-top: 10px;
  text-align: center;
}

.image-preview img {
  max-width: 60%;
  height: auto;
  border: 1px solid #004676;
  border-radius: 4px;
}

.container-textarea-muestras {
  margin-bottom: 20px;
}
</style>
