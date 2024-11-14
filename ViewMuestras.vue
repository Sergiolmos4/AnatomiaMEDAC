<script setup>
import { ref, onMounted } from "vue";
import { useRouter } from "vue-router";
import axios from "axios";
import { username as authUsername } from "@/auth.js";

const imageUrls = ref([]);
const codigo = ref("");
const naturaleza = ref("");
const fecha_recepcion = ref("");
const formato = ref("");
const organo = ref("");
const imagenes = ref([]); // Aquí almacenaremos los archivos de imagen
const naturalezas = ref([]);
const organos = ref([]);
const formatos = ref([]);
const username = ref(authUsername.value.username);
const calidad = ref("");
const desccalidad = ref("");
const calidades = ref([]);
const interpretacion = ref("");
const usuarios = ref([]);
const desc = ref("");
const interpretaciones = ref([]);
const router = useRouter();
const usuarioAutenticado = ref(null);
const sedeUsuario = ref("");
const aumentos = ref([]);

// Función para cargar los datos iniciales
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
    calidades.value = calidadResp.data;
    interpretaciones.value = interpretacionResp.data;
    usuarios.value = usuarioResp.data;
    aumentos.value = aumentoResp.data;

    usuarioAutenticado.value = usuarios.value.find(
      (user) => user.username === username.value
    );
    if (usuarioAutenticado.value) {
      sedeUsuario.value = usuarioAutenticado.value.sede;
    }
  } catch (error) {
    console.error("Error al cargar datos:", error);
  }
});

// Función para manejar el cambio de archivos de imagen
const onImageChange = (event) => {
  const files = event.target.files;
  if (files) {
    for (let i = 0; i < files.length; i++) {
      const file = files[i];
      imageUrls.value.push({
        url: URL.createObjectURL(file),
        zoom: null,
      });
      imagenes.value.push(file); // Guarda el archivo en el arreglo de imágenes
    }
  }
};

// Función para registrar los datos del formulario y las imágenes en el backend
const register = async () => {
  try {
    const formData = new FormData();
    formData.append("codigo", codigo.value);
    formData.append("fecha_recepcion", fecha_recepcion.value);
    formData.append("naturaleza", naturaleza.value);
    formData.append("sede", sedeUsuario.value);
    formData.append("username", usuarioAutenticado.value?.username || "");
    formData.append("organo", organo.value);
    formData.append("formato", formato.value);
    formData.append("calidad", calidad.value);
    formData.append("interpretacion", interpretacion.value);
    formData.append("descripcionCal", desccalidad.value);
    formData.append("descripcionInt", desc.value);

    // Añadir cada archivo de imagen al FormData
    imagenes.value.forEach((file) => {
      formData.append("imagenes[]", file); // Usa 'imagenes[]' para múltiples archivos
    });

    await axios.post("http://127.0.0.1:8000/api/muestra/create/", formData, {
      headers: {
        "Content-Type": "multipart/form-data",
      },
    });

    router.push("/muestrasmenu");
  } catch (error) {
    console.error("Error al registrar la muestra:", error);
  }
};
</script>
<template>
  <div class="container-all-muestras">
    <h2>Nuevo Informe</h2>
    <div class="content-grid">
      <!-- Formulario Principal -->
      <form class="form-muestras" @submit.prevent="register">
        <!-- Primera Fila -->
        <div class="form-section">
          <div class="form-group">
            <label for="code">Código de la muestra</label>
            <input
              class="input-muestras"
              type="text"
              v-model="codigo"
              name="code"
              placeholder="Código"
            />
          </div>
          <div class="form-group">
            <label for="nature">Naturaleza de la muestra</label>
            <select class="input-muestras" v-model="naturaleza" required>
              <option
                v-for="nat in naturalezas"
                :key="nat.naturaleza"
                :value="nat.naturaleza"
              >
                {{ nat.naturaleza }}
              </option>
            </select>
          </div>
          <div class="form-group">
            <label for="dateColected">Fecha de recolección</label>
            <input
              class="input-muestras"
              type="date"
              v-model="fecha_recepcion"
              name="dateColected"
            />
          </div>
        </div>

        <!-- Segunda Fila -->
        <div class="form-section">
          <div class="form-group">
            <label for="user">Usuario de la muestra</label>
            <input
              class="input-muestras"
              type="text"
              :value="username"
              placeholder="Usuario"
              readonly
            />
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
            <label for="biopsy">Opciones órganos</label>
            <select class="input-muestras" v-model="organo" required>
              <option
                v-for="org in organos"
                :key="org.organo"
                :value="org.organo"
              >
                {{ org.organo }}
              </option>
            </select>
          </div>
        </div>

        <!-- Tercera Fila -->
        <div class="form-section fila-3">
          <div class="form-group full-width">
            <label for="conservation">Conservación de muestra</label>
            <select class="input-muestras" v-model="formato" required>
              <option
                v-for="form in formatos"
                :key="form.formato"
                :value="form.formato"
              >
                {{ form.formato }}
              </option>
            </select>
          </div>
        </div>

        <div style="margin-bottom: 60px"></div>
        <!--Espacio de separación adiccional-->

        <!-- Cuarta Fila -->
        <div class="form-section same-style-row">
          <div class="form-group">
            <label for="calidad">Calidad de la muestra</label>
            <select class="input-muestras" v-model="calidad" required>
              <option
                v-for="cal in calidades"
                :key="cal.codigo"
                :value="cal.codigo"
              >
                {{ cal.codigo }}
              </option>
            </select>
          </div>
        </div>

        <!-- Quinta fila-->
        <div class="form-section same-style-row">
          <div class="form-group">
            <label for="descCalidad">Descripción calidad</label>
            <textarea
              class="input-muestras"
              name="descCalidad"
              v-model="desccalidad"
              rows="3"
              placeholder="Introduce una descripción sobre calidad..."
            ></textarea>
          </div>
        </div>

        <!-- Sexta Fila -->
        <div class="form-section same-style-row">
          <div class="form-group">
            <label for="interpretacion">Interpretación de la muestra</label>
            <select
              class="input-muestras"
              v-model="interpretacion"
              required
              multiple
            >
              <!-- varias interpretaciones-->
              <option
                v-for="interp in interpretaciones"
                :key="interp.codigo"
                :value="interp.codigo"
              >
                {{ interp.codigo }}
              </option>
            </select>
          </div>
        </div>

        <!-- Séptima fila -->

        <div class="form-section same-style-row">
          <div class="form-group">
            <label for="descInterpretacion">Descripción interpretación</label>
            <textarea
              class="input-muestras"
              name="descInterpretacion"
              v-model="desc"
              rows="3"
              placeholder="Introduce una descripción sobre interpretación..."
            ></textarea>
          </div>
        </div>

        <!-- Botón de envío -->
        <button class="btn-muestras" type="submit">Crear Informe</button>
      </form>

      <!-- Espacio para almacenamiento de imagenes -->
      <div class="form-section imagenes">
        <label for="imageUpload">Añadir imagen</label>
        <input
          type="file"
          id="imageUpload"
          @change="onImageChange"
          accept="image/*"
          multiple
        />

        <!-- Vista previa de la imagen -->
        <div v-if="imageUrls.length > 0" class="image-preview">
          <div
            v-for="(image, index) in imageUrls"
            :key="index"
            class="preview-image"
          >
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

<style scoped>
.container-all-muestras {
  margin: 2%;
  margin-top: 120px;
  padding: 3%;
  background-color: rgb(241, 238, 238);
  min-height: 100vh;
  border-radius: 10px;
}

.content-grid {
  display: grid;
  grid-template-columns: 1fr 50%; /* Dos columnas: formulario y espacio para imágenes */
  gap: 10px; /* Espacio entre columnas */
}

.form-muestras {
  margin-top: 10px;
  background-color: #fff;
  border-radius: 10px;
  padding: 50px;
}

.form-section {
  display: grid;
  grid-template-columns: repeat(
    3,
    1fr
  ); /* Tres columnas en las secciones de campo */
  gap: 30px; /* Espacio entre campos */
  margin-bottom: 40px; /* Espacio entre cada fila de inputs */
}

.form-group {
  display: flex;
  flex-direction: column; /* Asegura que las etiquetas y inputs estén alineados verticalmente */
}

.imagenes {
  padding: 0px;
  background-color: #fff;
  margin-top: 10px;
  margin-bottom: 0;
  width: 100%;
  display: flex;
  flex-direction: column;
}

.image-preview {
  width: 100%;
  display: grid; /* Usamos Grid para la disposición */
  grid-template-columns: repeat(2, 1fr); /* Dos columnas de igual tamaño */
  column-gap: 10px; /* Espacio entre las columnas (ajustado según lo que necesites) */
  row-gap: 100px; /* Espacio entre las filas */
  margin-top: 20px;
}

.image-preview img {
  width: 80%; /* Espacio que ocupan las imágenes */
  height: 250px; /* Establecemos una altura fija para que todas las imágenes tengan el mismo tamaño */
  object-fit: cover; /* Las imágenes se recortan proporcionalmente */
  border: 2px solid #ddd;
  border-radius: 5px;
}

.imagenes label {
  margin-top: 20px;
  font-size: 1.1rem;
  font-weight: bold;
}

.imagenes input[type="file"] {
  margin-left: 50px;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 8px 15px;
  cursor: pointer;
}

.zoom-options label {
  font-size: 12px; /* Tamaño más pequeño para la etiqueta */
}

/*Filas muestras*/

.fila-3 {
  width: 33.33%; /* Ajusta el ancho al contenedor */
  margin-left: auto; /* Centrar el contenedor */
  margin-right: auto; /* Centrar el contenedor */
}

/*Ajuste de filas individuales*/
.same-style-row {
  display: grid;
  grid-template-columns: 1fr;
  margin-bottom: 20px;
}

/* Estilos de etiquetas */
.form-muestras label,
.imagenes label {
  color: #004676;
  margin-bottom: 5px;
  font-weight: bold;
}

/* Estilos para los inputs y selects */
.input-muestras {
  border-radius: 5px;
  width: 100%;
  padding: 10px;
  box-sizing: border-box;
  margin-top: 10px; /* Agregar margen superior e inferior */
  border: solid 1px #ccc;
  font-size: 1rem;
}

input[type="file"] {
  border: none !important;
}

h2 {
  background-color: #fff;
  color: #004676;
  padding: 20px;
  border-radius: 20px;
  margin-bottom: 30px;
  text-align: left;
}

.full-width {
  grid-column: span 3; /* Elementos que ocupan toda la fila */
}

/* Botón de envío */
.btn-muestras {
  grid-column: span 3; /* Ocupa toda la fila */
  margin: 20px auto 0 auto;
  padding: 10px 20px;
  background-color: #004676;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 1rem;
}

.btn-muestras:hover {
  background-color: #00334a;
}

/* Media Query para dispositivos pequeños */
@media (max-width: 768px) {
  .form-muestras {
    grid-template-columns: 1fr; /* Colapsa a una columna en pantallas pequeñas */
  }

  .form-section {
    grid-template-columns: 1fr; /* Colapsa a una columna en pantallas pequeñas */
  }

  .btn-muestras {
    grid-column: span 1;
    width: 100%;
    margin: 20px 0 0 0;
  }
}

/* Estilos para impresión */
@media print {
  .btn-muestras {
    display: none; /* Oculta los botones en la impresión */
  }

  body {
    font-size: 12pt;
    margin-top: 0;
  }

  .container-all-muestras {
    width: 100%;
    margin: 0;
    padding: 0;
    background-color: white;
  }

  header,
  footer,
  nav,
  aside {
    display: none; /* Oculta otros elementos de la interfaz */
  }
}
</style>
