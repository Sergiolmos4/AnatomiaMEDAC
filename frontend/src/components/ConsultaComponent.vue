<script setup>
import { ref, onMounted, watch } from "vue";
import axios from "axios";

const codigo = ref("");
const naturaleza = ref("");
const organos = ref([]);
const naturalezas = ref([]);
const formatos = ref([]);
const sedes = ref([]);
const formato = ref("");
const fecha_recepcion = ref("");
const organo = ref("");
const sede = ref("");
const usuarios = ref([]);
const usuario = ref("");
const calidades = ref([]);
const calidad = ref("");
const interpretaciones = ref([]);
const interpretacion = ref("");
const muestras = ref([]);
const filteredmuestras = ref([]);
const muestrasAsString = ref("");
const isBiopsySelected = ref(false);

onMounted(() => {
  axios
    .all([
      axios.get("http://localhost:8000/api/muestras/"),
      axios.get("http://localhost:8000/api/organos/"),
      axios.get("http://localhost:8000/api/naturalezas/"),
      axios.get("http://localhost:8000/api/formatos/"),
      axios.get("http://localhost:8000/api/sedes/"),
      axios.get("http://localhost:8000/api/usuarios/"),
      axios.get("http://localhost:8000/api/calidades/"),
      axios.get("http://localhost:8000/api/interpretaciones/"),
    ])
    .then(
      axios.spread(
        (
          muestrasResp,
          organosResp,
          naturalezasResp,
          formatosResp,
          sedesResp,
          usuariosResp,
          calidadesResp,
          interpretacionesResp
        ) => {
          muestras.value = muestrasResp.data;
          filteredmuestras.value = muestras.value; // Inicializa con todas las muestras

          // Convertir a cadena JSON
          muestrasAsString.value = JSON.stringify(muestras.value, null, 2); // 'null' y '2' para formato bonito
          organos.value = organosResp.data;
          naturalezas.value = naturalezasResp.data;
          formatos.value = formatosResp.data;
          sedes.value = sedesResp.data;
          usuarios.value = usuariosResp.data;
          calidades.value = calidadesResp.data;
          interpretaciones.value = interpretacionesResp.data;
        }
      )
    )
    .catch((e) => {
      console.log(e);
    });
});

const searchMuestras = () => {
  filteredmuestras.value = muestras.value.filter((muestra) => {
    return (
      (!codigo.value ||
        muestra.codigo.toString() === codigo.value.toString()) &&
      (!naturaleza.value || muestra.naturaleza === naturaleza.value) &&
      (!formato.value || muestra.formato === formato.value) &&
      (!fecha_recepcion.value ||
        muestra.fecha_recepcion === fecha_recepcion.value) &&
      (!organo.value || muestra.organo === organo.value) &&
      (!sede.value || muestra.sede === sede.value) &&
      (!usuario.value || muestra.usuario === usuario.value) &&
      (!calidad.value || muestra.calidad === calidad.value) &&
      (!interpretacion.value || muestra.interpretacion === interpretacion.value)
    );
  });
};

const showMuestras = ref(false); // Declare and initialize the showMuestras variable

const toggleMuestras = () => {
  showMuestras.value = !showMuestras.value;
};

// Watch for changes in naturaleza and update isBiopsySelected
watch(naturaleza, (newValue) => {
  console.log("Naturaleza seleccionada:", newValue); // Debug: Print the new value
  isBiopsySelected.value = newValue.toLowerCase() === "biopsia";
  console.log("Biopsia seleccionada:", isBiopsySelected.value); // Debug: Print the updated status
});
</script>

<template>
  <div class="container-all-muestras" style="margin-top: 120px">
    <div class="muestras-h2">
      <h2>Buscar muestra por:</h2>
    </div>

    <div class="container-form-muestras">
      <form class="form-muestras" @submit.prevent="searchMuestras">
        <div class="form-section">
          <div class="form-column">
            <div class="form-group">
              <label for="codigo">Código de la muestra</label>
              <input
                type="text"
                class="input-muestras"
                name="code"
                v-model="codigo"
                placeholder="Introduzca el código asociado"
                required
              />
            </div>
            <div class="form-group">
              <label for="fecha_recepcion">Fecha Recepción</label>
              <input
                class="input-muestras"
                type="date"
                v-model="fecha_recepcion"
                name="dateColected"
                required
              />
            </div>
          </div>
          <div class="form-column">
            <div class="form-group">
              <label for="nature">Naturaleza de la muestra</label>
              <select class="input-muestras" v-model="naturaleza">
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
              <label for="conservation">Estado de la muestra</label>
              <select class="input-muestras" v-model="formato">
                <option
                  v-for="formato in formatos"
                  :key="formato.formato"
                  :value="formato.formato"
                >
                  {{ formato.formato }}
                </option>
              </select>
            </div>
          </div>
          <div class="form-column">
            <div class="form-group">
              <label for="biopsy">Opciones biopsia</label>
              <select class="input-muestras" v-model="organo">
                <option
                  v-for="org in organos"
                  :key="org.organo"
                  :value="org.organo"
                >
                  {{ org.organo }}
                </option>
              </select>
            </div>
            <div class="form-group">
              <label for="sede">Centro</label>
              <select class="input-muestras" v-model="sede">
                <option
                  v-for="sede in sedes"
                  :key="sede.sede"
                  :value="sede.sede"
                >
                  {{ sede.sede }}
                </option>
              </select>
            </div>
          </div>
        </div>
        <button class="btn-muestras" type="submit" @click="searchMuestras">
          Buscar
        </button>
        <button class="btn-muestras2" @click="toggleMuestras">
          {{ showMuestras ? "Ocultar muestras" : "Ver todas las muestras" }}
        </button>
      </form>
    </div>

    <div class="results-container">
      <ul>
        <li v-for="m in filteredmuestras" :key="m.codigo">
          <router-link
            :to="`/informe/${m.codigo}/${m.fecha_recepcion}/${m.naturaleza}/${m.formato}/${m.organo}/${m.sede}/${m.usuario.username}/${m.calidad}/${m.interpretacion}/${m.descripcionCal}/${m.descripcionInt}`"
            >{{ m.codigo }} - {{ m.naturaleza }} - {{ m.formato }} -
            {{ m.sede }} - {{ m.usuario }} - {{ m.calidad }} -
            {{ m.interpretacion }}</router-link
          >
        </li>
      </ul>
    </div>
  </div>
</template>

<style>
.container-all-muestras {
  padding: 20px;
  font-family: Arial, sans-serif;
  background-color: #f8f8f8;
}

.muestras-h2 {
  text-align: center;
  margin-bottom: 20px;
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

label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
  color: #004676;
}

.input-muestras {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

.input-muestras:focus {
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
}
.btn-muestras2 {
  background-color: #004676;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  transition: background-color 0.3s;
  margin-left: 5px;
}

.btn-muestras:hover {
  background-color: #0056b3;
}
.btn-muestras2:hover {
  background-color: #0056b3;
}
.results-container {
  margin-top: 20px;
}

.results-container ul {
  list-style: none;
  padding: 0;
}

.results-container li {
  margin-bottom: 10px;
}

.results-container a {
  text-decoration: none;
  color: #007bff;
  transition: color 0.3s;
}

.results-container a:hover {
  color: #0056b3;
}
</style>
