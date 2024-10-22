<template>
  <div class="consultas-container">
    <div class="tt-cabecera"></div>
    <div class="tt-imagen-consultas">
      <p class="texto-tt-consultas">CONSULTAR INFORMES</p>
    </div>
    <div class="conten-gris">
      <div class="contenedor-txt-anadir">
        <div class="consulta-estado-informe">
          <div class="tt-estado-informe">
            <h2>Estado del Informe</h2>
          </div>
          <div class="estado-informe">
            <h4>Estado del informe:</h4>
            <select
              class="select-input-estado-informe"
              v-model="selectedEstadoInforme"
              :style="{ color: getColor(selectedEstadoInforme) }"
            >
              <option
                v-for="option3 in optionsEstadoInforme"
                :key="option3.value"
                :value="option3.value"
              >
                {{ option3.text }}
              </option>
            </select>
          </div>
        </div>
      </div>

      <div class="contenedor-txt-editar">
        <div class="cod-fecha-user">
          <div class="codigo">
            <p>Código:</p>
            <input type="text" class="textfield-input" />
          </div>
          <div class="fecha">
            <p>Fecha:</p>
          </div>
          <div class="calendar">
            <input type="date" class="date-input" v-model="selectedDate" onkeydown="return false" />
          </div>
          <div class="usuario">
            <p>Usuario:</p>
            <input type="text" class="txtUsuario-input" />
          </div>
        </div>

        <div class="img-placa"></div>
      </div>
      <div class="contenedor-txt-consulta">
        
        <div class="consultar-muestra">
          <div class="editar-muestra">
            <div class="muestra">
              <h4 class="nat">Naturaleza de la muestra</h4>
              <select class="select-input" v-model="selectedOption1">
                <option disabled value="" selected>Tipo</option>
                <option
                  v-for="option1 in optionsNaturaleza"
                  :key="option1.value"
                  :value="option1.value"
                  v-bind:style="{
                    'font-weight':
                      option1.value === '1' || option1.value === '2' ? 'bold' : 'normal',
                    color: option1.value === '1' || option1.value === '2' ? '#004676' : '#004676'
                  }"
                >
                  {{ option1.text }}
                </option>
              </select>
            </div>

            <div class="muestra">
              <h4>Centro de estudios</h4>
              <select class="select-input-sede" v-model="selectedSede">
                <option v-for="sede in sede" :key="sede.value" :value="sede.value">
                  {{ sede.text }}
                </option>
              </select>
            </div>
            <!--
            <div class="tipo-muestra">
              <h4>Tipo de estudio</h4>
              <select class="select-input" v-model="selectedOption6">
                <option v-for="option6 in tipoEstudio" :key="option6.value" :value="option6.value">
                  {{ option6.text }}
                </option>
              </select>
            </div>
-->
            <div class="muestra">
              <h4>Conservación de la Muestra</h4>
              <select class="select-input" v-model="selectedOption3">
                <option disabled value="" selected>Formato</option>
                <option
                  v-for="interp1 in optionsConservacion"
                  :key="interp1.value"
                  :value="interp1.value"
                >
                  {{ interp1.text }}
                </option>
              </select>
            </div>
          </div>

          <div class="tipo-muestra-tt-descrip">
            <div class="muestra-organo">
              <div class="tip-org" v-if="(selectedOption1 === '1' || selectedOption1 === '2') && showOrgansType">
                <h4>Tipo de Órganos</h4>
              </div>
              <select
                class="select-input-organo"
                v-model="selectedOption2"
                v-if="selectedOption1 === '1' || selectedOption1 === '2'"
              >
                <option v-for="option2 in tipoOrgano" :key="option2.value" :value="option2.value">
                  {{ option2.text }}
                </option>
              </select>
            </div>
          </div>
          <div class="texto-descrip">
            <h3>Descripción citológica o tisular de la muestra</h3>
          </div>
          <p class="linea">_________________________________________________________________</p>
          <div class="editar-muestra-vert">
            <div class="muestra-calidad">
              <h4>Calidad</h4>
              <select class="select-input-calidad" v-model="selectedOption4">
                <option v-for="option4 in options4" :key="option4.value" :value="option4.value">
                  {{ option4.text }}
                </option>
              </select>
            </div>
            <p class="caja-txt" v-ref="cajaTxt">
               “Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
              incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
              exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
              dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
              Excepteur sint occaecat cupidataptate velit esse cillum
              dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt
              in culpa qui officia deserunt mollit anim id est laborum”
            </p>
            <!--
            <h4>Interpretación</h4>
            
    <div class="muestra">
              <multiselect
                class="select-input-interpBuscar"
                v-model="selectedOptions"
                :options="options5"
                multiple
                label="text"
                track-by="value"
                placeholder="Escribe o Selecciona las opciones..."
                @select="onSelect"
              >
              </multiselect>

              <input type="text" :value="selectedOptionsText" readonly />
            </div>



   
            -->
            <div class="contenedor-interpretaciones">
              <div class="muestra-interp1">
                <h4>Interpretación 1</h4>
                <select class="select-input" v-model="selectedInterpretacion1">
                  <option disabled value="" selected>Interpretación</option>
                  <option v-for="interp1 in interp1" :key="interp1.value" :value="interp1.text">
                    {{ interp1.text }}
                  </option>
                </select>
                <p class="filter-text">Filtrar por: {{ selectedInterpretacion1Short }}</p>
              </div>
              <div class="muestra">
                <h4 class="int2">Interpretación 2</h4>
                <select
                  class="select-input-interp2"
                  v-model="selectedInterpretacion2"
                  @click="checkInterpretacion1"
                >
                  <option disabled value="" selected>Interpretación</option>
                  <option v-for="interp1 in interp1" :key="interp1.value" :value="interp1.text">
                    {{ interp1.text }}
                  </option>
                </select>
                <p class="filter-text">Filtrar por: {{ selectedInterpretacion2Short }}</p>
              </div>

              <div class="muestra-interp3">
                <h4>Interpretación 3</h4>
                <select
                  class="select-input"
                  v-model="selectedInterpretacion3"
                  @click="checkInterpretacion1"
                >
                  <option disabled value="" selected>Interpretación</option>
                  <option v-for="interp1 in interp1" :key="interp1.value" :value="interp1.text">
                    {{ interp1.text }}
                  </option>
                </select>
                <p class="filter-text">Filtrar por: {{ selectedInterpretacion3Short }}</p>
              </div>
            </div>
            <div class="page">
            <p class="caja-txt2">
            “Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
              incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
              exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
              dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
              Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
              mollit anim id est laborum. R proident, sunt in culpa qui officia deserunt mollit anim
              id est laborum. Terit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
              Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt
              mollit anim id est laborum. Herit in voluptate velit esse cillum dolore eu fugiat
              nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
              officia deser” 
            </p>
          </div>
          </div>
          <div class="btn-consul-edita">
            <div class="btn-consul-edita">
              <div class="btn-consulta">
                <button class="btn-consultar" @click="checkSelection">Buscar</button>
              </div>
              <!--
            <div class="btn-edita">
              <button class="btn-editar">Editar</button>
              
            </div>-->
            </div>
            <div class="btn-consul-edita">
              <div class="btn-siguiente">
                <modal v-if="showModal">
                  <p>HOFSA</p>
                </modal>
                <button class="btn-siguientes" @click="checkSelection2(), checkCajaTxtBeforeNext()">
                  Siguiente
                </button>
              </div>
              
            </div>
          </div>
        </div>
        <div class="profesor-imag-V">
          <div class="profesor">
            <p class="prof">Profesor:</p>
            <input type="text" class="txtProfesor-input" />
          </div>
          
          <div class="imagenes-de-la-muestra-V">
            <div class="imagenes-de-la-muestra">
              <h4>Imágenes de la muestra</h4>
            </div>
            <div class="container">
              <div class="image-container" v-for="(image, index) in images" :key="index">
                <img :src="image.src" :alt="image.alt" />
                <p>{{ image.description }}</p>
              </div>
              
              
            </div>
          </div>
          <button class="imprimir" @click="print">Imprimir</button>
        </div>
        
      </div>
    </div>
  </div>
  
</template>

<script lang="ts">
import { defineComponent, ref, computed } from 'vue'
//import Multiselect from 'vue-multiselect'

export default defineComponent({
  name: 'ConsultaAnatomiaP',
  // components: { Multiselect },
  props: {
    msg: String
  },

  setup() {
    const showOrgansType = ref(false); 
    const print = () => {
      window.print()
    }
    const cajaTxt = ref<HTMLElement | null>(null)
    const checkCajaTxtBeforeNext = () => {
      if (!cajaTxt.value?.textContent?.trim()) {
        showModal.value = true
      }
    }
    const showModal = ref(false)
    const selectedOptionsText = computed(() => {
      return selectedOptions.value.map((option) => option.text).join(', ')
    })

    const checkInterpretacion1 = () => {
      if (!selectedInterpretacion1.value) {
        showModal.value = true
      }
    }
    const checkSelection = () => {
      if (
        !selectedOption1.value ||
        selectedOption1.value === '0' ||
        selectedOption1.value === null
      ) {
        alert('Por favor, selecciona una tipo de naturaleza de la muestra .')
      }
    }
    const checkSelection2 = () => {
      if (
        !selectedInterpretacion2.value ||
        selectedInterpretacion2.value === '0' ||
        selectedInterpretacion2.value === null
      ) {
        alert('No existen mas interpretaciones para esta muestra.')
      }
    }

    const selectedInterpretacion1 = ref('')
    const selectedInterpretacion2 = ref('')
    const selectedInterpretacion3 = ref('')
    const showSubmenu = ref(false)
    const selectedOption1 = ref('')
    const selectedOption2 = ref(null)
    const selectedOption3 = ref('')
    const selectedOption4 = ref('Calidad')
    const selectedOption5 = ref('Interpretación')
    //const selectedOption6 = ref(null)
    const selectedSede = ref('')
    const showDatePicker = ref(false)
    const selectedDate = ref(null)
    const selectedEstadoInforme = ref('string')
    const getColor = (value: string) => {
      if (value === null) {
        return 'black'
      }
      switch (value) {
        case '1':
          return 'red'
        case '2':
          return 'green'
        case '3':
          return 'blue'
        // Agrega más casos según sea necesario
        default:
          return 'black'
      }
    }
    const interp1 = ref([
      { text: '1.1. - Predominio de células epiteliales escamosas superficiales.', value: '1' },
      { text: '1.2. - Predominio de células epiteliales escamosas intermedias', value: '2' },
      { text: '1.3. - Predominio de células epiteliales escamosas parabasales', value: '3' },
      { text: '1.4. - Polinucleares neutrófilos.', value: '4' },
      { text: '1.5. - Hematíes.', value: '5' },
      { text: '1.6. - Células endocervicales en exocervix.', value: '6' },
      { text: '1.7. - Células metaplásicas en exocervix.', value: '7' },
      { text: '1.8. - Células metaplásicas inmaduras.', value: '8' },
      { text: '1.9. - Células reactivas.', value: '9' },
      { text: '1.10. - Células endometriales en mujer >= 40 años.', value: '10' },
      { text: '1.11. - Alteraciones celulares sugerentes con HPV.', value: '11' },
      { text: '1.12. - Aleraciones celulares sugerentes de Herpes.', value: '12' },
      { text: '1.13. - Células neoplásicas.', value: '13' },
      { text: '1.14. - Células superficiales e intermedias con cambios atípicos.', value: '14' },
      {
        text: '1.15. - Células intermedias y parabasales con algunos cambios atípicos.',
        value: '15'
      },
      { text: '1.16. - Células parabasales con algunos cambios atípicos.', value: '16' },
      { text: '1.17. - Células escamosas de significado incierto.', value: '17' },
      { text: '1.18. - Células epiteliales glandulares de significado incierto.', value: '18' },
      { text: '1.19. - Estructuras micóticas correspondientes a Candida albicans.', value: '19' },
      { text: '1.20. - Estructuras micóticas correspondientes a Candida glabrata.', value: '20' },
      {
        text: '1.21. - Estructuras bacterianas con disposición caracteristica de actimomycos.',
        value: '21'
      },
      {
        text: '1.22. - Estructuras bacterianas correspondiente de Gardmorella vaginalis.',
        value: '22'
      },
      { text: '1.23. - EStructuras bacterianas de naturaleza cocácea.', value: '23' },
      { text: '1.24. - Estructuras bacterianas sugerentes de Leptothrix.', value: '24' },
      { text: '1.25. - Estructuras corresponideintes a Trichomonas vaginalis.', value: '25' },
      { text: '1.26. - Células histiocitarias multinucleadas.', value: '26' },
      { text: '1.27. - Células histiocitarias multinucleadas.', value: '27' },
      { text: '1.28. - Presencia de epitelio endometrial sin cambios atípicos.', value: '28' },
      {
        text: '1.29. - Células epiteliales de apariencia glandular con núcleos amplios e irregulares.',
        value: '29'
      },
      { text: '2.1. - Predominio de eritrocitos normocíticos normocrómicos.', value: '1' },
      { text: '2.2. - Predominio de eritrocitos microcíticos hipocrómicos.', value: '2' },
      { text: '2.3. - Presencia de esferocitos.', value: '3' },
      { text: '2.4. - Presencia de dianocitos (células en forma de lágrima).', value: '4' },
      { text: '2.5. - Leucocitos con predominio de neutrófilos', value: '5' },
      { text: '2.6. - Leucocitos con predominio de linfocitos.', value: '6' },
      { text: '2.7. - Presencia de células blásticas.', value: '7' },
      { text: '2.8. - Presencia de eosinófilos aumentados.', value: '8' },
      { text: '2.9. - Presencia de basófilos aumentados.', value: '9' },
      { text: '2.10. - Trombocitosis (aumento de plaquetas).', value: '10' },
      { text: '2.11. - Trombocitopenia (disminución de plaquetas).', value: '11' },
      { text: '2.12. - Anomalías en la morfología plaquetaria.', value: '12' },
      { text: '2.13. - Presencia de células atípicas sugestivas de neoplasia', value: '13' },
      { text: '2.14. - Presencia de células inmaduras del linaje mieloide.', value: '14' },
      {
        text: '2.15. - Presencia de células inmaduras del linaje linfático.',
        value: '15'
      },
      { text: '2.16. - Anisocitosis (variabilidad en el tamaño de los eritrocitos)', value: '16' },
      {
        text: '2.17. - Poiquilocitosis (variabilidad en la forma de los eritrocitos).',
        value: '17'
      },
      { text: '2.18. - Presencia de cuerpos de Howell-Jolly', value: '18' },
      { text: '2.19. - Células con inclusiones de hierro (cuerpos de Pappenheimer).', value: '19' },
      { text: '2.20. - Presencia de parásitos intraeritrocitarios.', value: '20' },
      { text: '3.1. - pH normal.', value: '21' },
      { text: '3.2. - pH elevado.', value: '22' },
      { text: '3.3. - pH reducido.', value: '23' },
      { text: '3.4. - Presencia de proteínas.', value: '24' },
      { text: '3.5. - Negativo para proteínas.', value: '25' },
      { text: '3.6. - Glucosa presente.', value: '26' },
      { text: '3.7. - Negativo para la glucosa.', value: '27' },
      { text: '3.8. - Cetonas detectadas.', value: '28' },
      { text: '3.9. - Negativo para cetonas.', value: '29' },
      { text: '3.10.- Hemoglobina presente.', value: '30' },
      { text: '3.11.- Negativo para hemoglobina.', value: '' },
      { text: '3.12.- Bilirrubina detectada.', value: '31' },
      { text: '3.13.- Negativo para bilirrubina.', value: '32' },
      { text: '3.14.- Urobilinógeno normal.', value: '33' },
      { text: '3.15.- Urobilinógeno elevado.', value: '34' },
      { text: '3.16.- Presencia de nitritos.', value: '35' },
      { text: '3.17.- Negativo para nitritos.', value: '36' },
      { text: '3.18.- Presencia de leucocitos.', value: '37' },
      { text: '3.19.- Ausencia de leucocitos.', value: '38' },
      { text: '3.20.- Presencia de eritrocitos.', value: '39' },
      { text: '3.21.- Ausencia de eritrocitos.', value: '40' },
      { text: '3.22.- Células epiteliales.', value: '41' },
      { text: '3.23.- Cilindros hialinos.', value: '42' },
      { text: '3.24.- Cilindros granulosos.', value: '43' },
      { text: '3.25.- Cristales (oxalato de calcio, ácido úrico, etc.).', value: '44' },
      { text: '3.26.- Bacterias.', value: '45' },
      { text: '3.27.- Levaduras.', value: '46' },
      { text: '3.28.- Parásitos.', value: '47' },
      { text: '4.1. - Presencia de células epiteliales escamosas.', value: '48' },
      { text: '4.2. - Presencia de células epiteliales columnares.', value: '49' },
      {
        text: '4.3. - Presencia de células inflamatorias (neutrófilos, linfocitos, eosinófilos, macrófagos).',
        value: '50'
      },
      { text: '4.4. - Presencia de células metaplásicas.', value: '51' },
      { text: '4.5. - Presencia de células malignas.', value: '52' },
      { text: '4.6. - Presencia de células atípicas sugestivas de neoplasia.', value: '53' },
      {
        text: '4.7. - Presencia de microorganismos (bacterias, hongos, micobacterias).',
        value: '54'
      },
      { text: '4.8. - Presencia de células sanguíneas (eritrocitos, plaquetas).', value: '55' },
      { text: '4.9. - Presencia de material mucoso o mucopurulento.', value: '56' },
      { text: '4.10. - Presencia de cristales (de colesterol, calcio, etc.).', value: '57' },
      { text: '4.11. - Ausencia de células significativas para el análisis.', value: '58' },
      { text: '5.1. - Presencia de células epiteliales escamosas.', value: '59' },
      { text: '5.2. - Presencia de células epiteliales cilíndricas.', value: '60' },
      {
        text: '5.3. - Presencia de células inflamatorias (neutrófilos, linfocitos, macrófagos).',
        value: '61'
      },
      { text: '5.4. - Presencia de células glandulares.', value: '62' },
      { text: '5.5. - Presencia de células metaplásicas.', value: '63' },
      { text: '5.6. - Presencia de células atípicas sugestivas de neoplasia.', value: '64' },
      { text: '5.7. - Presencia de microorganismos (bacterias, hongos, levaduras).', value: '65' },
      { text: '5.8. - Presencia de células anormales con cambios citológicos.', value: '66' },
      { text: '5.9. - Ausencia de células significativas para el análisis.', value: '67' }
    ])

    const images = ref([
      { src: '/x4.jpeg', alt: 'Descripción de la imagen 1', description: 'x4' },
      { src: '/x10.png', alt: 'Descripción de la imagen 2', description: 'x10' },
      { src: '/x40.png', alt: 'Descripción de la imagen 3', description: 'x40' },
      { src: '/x100.png', alt: 'Descripción de la imagen 4', description: 'x100' },
      { src: '/x4.jpeg', alt: 'Descripción de la imagen 1', description: 'x4' },
      { src: '/x10.png', alt: 'Descripción de la imagen 2', description: 'x10' },
      { src: '/x40.png', alt: 'Descripción de la imagen 3', description: 'x40' },
      { src: '/x100.png', alt: 'Descripción de la imagen 4', description: 'x100' }
      // Agrega más objetos para más imágenes
    ])

    const optionsNaturaleza = ref([
      { text: '', value: '0' },
      { text: 'Biopsias', value: '1' },
      { text: 'Biopsias veterinarias', value: '2' },
      { text: 'Cavidad bucal', value: '3' },
      { text: 'Citología vaginal', value: '4' },
      { text: 'Extensión sanguínea', value: '5' },
      { text: 'Orinas', value: '6' },
      { text: 'Esputos', value: '7' },
      { text: 'Semen', value: '8' },
      { text: 'Improntas', value: '9' },
      { text: 'Frotis', value: '10' }
    ])
    const tipoOrgano = ref([
      { text: ' ', value: '0' },
      { text: 'Corazón', value: '1' },
      { text: 'Hígado', value: '2' },
      { text: 'Riñón', value: '3' },
      { text: 'Pancreas', value: '4' }
    ])
    const optionsConservacion = ref([
      { text: '', value: '0' },
      { text: 'Formol', value: '1' },
      { text: 'Fresco', value: '2' },
      { text: 'Etanol 70%', value: '3' }
    ])

    const optionsEstadoInforme = ref([
      { text: '', value: '0' },
      { text: 'Pendiente de revisar', value: '1' },
      { text: 'Revisado OK', value: '2' },
      { text: 'Revisado con errores', value: '3' }
    ])

    const options4 = ref([
      { text: 'C.1. -Toma válida para examen.', value: '1' },
      {
        text: 'C.2. -Toma válida para examen aunque limitada por ausencia de células endocervicales / zona de transición',
        value: '2'
      },
      { text: 'C.3. -Toma válida para examen aunque limitada por hemorragia.', value: '3' },
      { text: 'C.4. -Toma válida para examen aunque limitada por escasez de células', value: '4' },
      { text: 'C.5. -Toma válida para examen aunque limitada por intensa citolisis', value: '5' },
      { text: 'C.6. -Toma válida para examen aunque limitada por...', value: '6' },
      { text: 'C.7. -Toma no valorable por desecación.', value: '7' },
      { text: 'C.8. -Toma no valorable por ausencia de células.', value: '8' },
      { text: 'C.9. -Toma no valorable', value: '9' }
    ])
    const options5 = ref([
      { text: '1.1. - Predominio de células epiteliales escamosas superficiales.', value: '1' },
      { text: '1.2. - Predominio de células epiteliales escamosas intermedias', value: '2' },
      { text: '1.3. - Predominio de células epiteliales escamosas parabasales', value: '3' },
      { text: '1.4. - Polinucleares neutrófilos.', value: '4' },
      { text: '1.5. - Hematíes.', value: '5' },
      { text: '1.6. - Células endocervicales en exocervix.', value: '6' },
      { text: '1.7. - Células metaplásicas en exocervix.', value: '7' },
      { text: '1.8. - Células metaplásicas inmaduras.', value: '8' },
      { text: '1.9. - Células reactivas.', value: '9' },
      { text: '1.10. - Células endometriales en mujer >= 40 años.', value: '10' },
      { text: '1.11. - Alteraciones celulares sugerentes con HPV.', value: '11' },
      { text: '1.12. - Aleraciones celulares sugerentes de Herpes.', value: '12' },
      { text: '1.13. - Células neoplásicas.', value: '13' },
      { text: '1.14. - Células superficiales e intermedias con cambios atípicos.', value: '14' },
      {
        text: '1.15. - Células intermedias y parabasales con algunos cambios atípicos.',
        value: '15'
      },
      { text: '1.16. - Células parabasales con algunos cambios atípicos.', value: '16' },
      { text: '1.17. - Células escamosas de significado incierto.', value: '17' },
      { text: '1.18. - Células epiteliales glandulares de significado incierto.', value: '18' },
      { text: '1.19. - Estructuras micóticas correspondientes a Candida albicans.', value: '19' },
      { text: '1.20. - Estructuras micóticas correspondientes a Candida glabrata.', value: '20' },
      {
        text: '1.21. - Estructuras bacterianas con disposición caracteristica de actimomycos.',
        value: '21'
      },
      {
        text: '1.22. - Estructuras bacterianas correspondiente de Gardmorella vaginalis.',
        value: '22'
      },
      { text: '1.23. - EStructuras bacterianas de naturaleza cocácea.', value: '23' },
      { text: '1.24. - Estructuras bacterianas sugerentes de Leptothrix.', value: '24' },
      { text: '1.25. - Estructuras corresponideintes a Trichomonas vaginalis.', value: '25' },
      { text: '1.26. - Células histiocitarias multinucleadas.', value: '26' },
      { text: '1.27. - Células histiocitarias multinucleadas.', value: '27' },
      { text: '1.28. - Presencia de epitelio endometrial sin cambios atípicos.', value: '28' },
      {
        text: '1.29. - Células epiteliales de apariencia glandular con núcleos amplios e irregulares.',
        value: '29'
      },
      { text: '2.1. - Predominio de eritrocitos normocíticos normocrómicos.', value: '1' },
      { text: '2.2. - Predominio de eritrocitos microcíticos hipocrómicos.', value: '2' },
      { text: '2.3. - Presencia de esferocitos.', value: '3' },
      { text: '2.4. - Presencia de dianocitos (células en forma de lágrima).', value: '4' },
      { text: '2.5. - Leucocitos con predominio de neutrófilos', value: '5' },
      { text: '2.6. - Leucocitos con predominio de linfocitos.', value: '6' },
      { text: '2.7. - Presencia de células blásticas.', value: '7' },
      { text: '2.8. - Presencia de eosinófilos aumentados.', value: '8' },
      { text: '2.9. - Presencia de basófilos aumentados.', value: '9' },
      { text: '2.10. - Trombocitosis (aumento de plaquetas).', value: '10' },
      { text: '2.11. - Trombocitopenia (disminución de plaquetas).', value: '11' },
      { text: '2.12. - Anomalías en la morfología plaquetaria.', value: '12' },
      { text: '2.13. - Presencia de células atípicas sugestivas de neoplasia', value: '13' },
      { text: '2.14. - Presencia de células inmaduras del linaje mieloide.', value: '14' },
      {
        text: '2.15. - Presencia de células inmaduras del linaje linfático.',
        value: '15'
      },
      { text: '2.16. - Anisocitosis (variabilidad en el tamaño de los eritrocitos)', value: '16' },
      {
        text: '2.17. - Poiquilocitosis (variabilidad en la forma de los eritrocitos).',
        value: '17'
      },
      { text: '2.18. - Presencia de cuerpos de Howell-Jolly', value: '18' },
      { text: '2.19. - Células con inclusiones de hierro (cuerpos de Pappenheimer).', value: '19' },
      { text: '2.20. - Presencia de parásitos intraeritrocitarios.', value: '20' },
      { text: '3.1. - pH normal.', value: '21' },
      { text: '3.2. - pH elevado.', value: '22' },
      { text: '3.3. - pH reducido.', value: '23' },
      { text: '3.4. - Presencia de proteínas.', value: '24' },
      { text: '3.5. - Negativo para proteínas.', value: '25' },
      { text: '3.6. - Glucosa presente.', value: '26' },
      { text: '3.7. - Negativo para la glucosa.', value: '27' },
      { text: '3.8. - Cetonas detectadas.', value: '28' },
      { text: '3.9. - Negativo para cetonas.', value: '29' },
      { text: '3.10.- Hemoglobina presente.', value: '30' },
      { text: '3.11.- Negativo para hemoglobina.', value: '' },
      { text: '3.12.- Bilirrubina detectada.', value: '31' },
      { text: '3.13.- Negativo para bilirrubina.', value: '32' },
      { text: '3.14.- Urobilinógeno normal.', value: '33' },
      { text: '3.15.- Urobilinógeno elevado.', value: '34' },
      { text: '3.16.- Presencia de nitritos.', value: '35' },
      { text: '3.17.- Negativo para nitritos.', value: '36' },
      { text: '3.18.- Presencia de leucocitos.', value: '37' },
      { text: '3.19.- Ausencia de leucocitos.', value: '38' },
      { text: '3.20.- Presencia de eritrocitos.', value: '39' },
      { text: '3.21.- Ausencia de eritrocitos.', value: '40' },
      { text: '3.22.- Células epiteliales.', value: '41' },
      { text: '3.23.- Cilindros hialinos.', value: '42' },
      { text: '3.24.- Cilindros granulosos.', value: '43' },
      { text: '3.25.- Cristales (oxalato de calcio, ácido úrico, etc.).', value: '44' },
      { text: '3.26.- Bacterias.', value: '45' },
      { text: '3.27.- Levaduras.', value: '46' },
      { text: '3.28.- Parásitos.', value: '47' },
      { text: '4.1. - Presencia de células epiteliales escamosas.', value: '48' },
      { text: '4.2. - Presencia de células epiteliales columnares.', value: '49' },
      {
        text: '4.3. - Presencia de células inflamatorias (neutrófilos, linfocitos, eosinófilos, macrófagos).',
        value: '50'
      },
      { text: '4.4. - Presencia de células metaplásicas.', value: '51' },
      { text: '4.5. - Presencia de células malignas.', value: '52' },
      { text: '4.6. - Presencia de células atípicas sugestivas de neoplasia.', value: '53' },
      {
        text: '4.7. - Presencia de microorganismos (bacterias, hongos, micobacterias).',
        value: '54'
      },
      { text: '4.8. - Presencia de células sanguíneas (eritrocitos, plaquetas).', value: '55' },
      { text: '4.9. - Presencia de material mucoso o mucopurulento.', value: '56' },
      { text: '4.10. - Presencia de cristales (de colesterol, calcio, etc.).', value: '57' },
      { text: '4.11. - Ausencia de células significativas para el análisis.', value: '58' },
      { text: '5.1. - Presencia de células epiteliales escamosas.', value: '59' },
      { text: '5.2. - Presencia de células epiteliales cilíndricas.', value: '60' },
      {
        text: '5.3. - Presencia de células inflamatorias (neutrófilos, linfocitos, macrófagos).',
        value: '61'
      },
      { text: '5.4. - Presencia de células glandulares.', value: '62' },
      { text: '5.5. - Presencia de células metaplásicas.', value: '63' },
      { text: '5.6. - Presencia de células atípicas sugestivas de neoplasia.', value: '64' },
      { text: '5.7. - Presencia de microorganismos (bacterias, hongos, levaduras).', value: '65' },
      { text: '5.8. - Presencia de células anormales con cambios citológicos.', value: '66' },
      { text: '5.9. - Ausencia de células significativas para el análisis.', value: '67' }
    ])

    const options = ref([
      { text: '2.1. - Predominio de eritrocitos normocíticos normocrómicos.', value: '1' },
      { text: '2.2. - Predominio de eritrocitos microcíticos hipocrómicos.', value: '2' },
      { text: '2.3. - Presencia de esferocitos.', value: '3' },
      { text: '2.4. - Presencia de dianocitos (células en forma de lágrima).', value: '4' },
      { text: '2.5. - Leucocitos con predominio de neutrófilos', value: '5' },
      { text: '2.6. - Leucocitos con predominio de linfocitos.', value: '6' },
      { text: '2.7. - Presencia de células blásticas.', value: '7' },
      { text: '2.8. - Presencia de eosinófilos aumentados.', value: '8' },
      { text: '2.9. - Presencia de basófilos aumentados.', value: '9' },
      { text: '2.10. - Trombocitosis (aumento de plaquetas).', value: '10' },
      { text: '2.11. - Trombocitopenia (disminución de plaquetas).', value: '11' },
      { text: '2.12. - Anomalías en la morfología plaquetaria.', value: '12' },
      { text: '2.13. - Presencia de células atípicas sugestivas de neoplasia', value: '13' },
      { text: '2.14. - Presencia de células inmaduras del linaje mieloide.', value: '14' },
      {
        text: '2.15. - Presencia de células inmaduras del linaje linfático.',
        value: '15'
      },
      { text: '2.16. - Anisocitosis (variabilidad en el tamaño de los eritrocitos)', value: '16' },
      {
        text: '2.17. - Poiquilocitosis (variabilidad en la forma de los eritrocitos).',
        value: '17'
      },
      { text: '2.18. - Presencia de cuerpos de Howell-Jolly', value: '18' },
      { text: '2.19. - Células con inclusiones de hierro (cuerpos de Pappenheimer).', value: '19' },
      { text: '2.20. - Presencia de parásitos intraeritrocitarios.', value: '20' }
    ])
    /*
    const tipoEstudio = ref([
      { text: '', value: '0' },
      { text: 'Citológico cérvico-vaginal.', value: '1' },
      { text: 'Hematológico completo', value: '2' },
      { text: 'Microscópico y químico de orina', value: '3' },
      { text: 'Citológico de esputo', value: '4' },
      { text: 'Citológico bucal', value: '5' }
    ])
*/

    const sede = ref([
      { text: '', value: '0' },
      { text: 'Albacete', value: '1' },
      { text: 'Alicante', value: '2' },
      { text: 'Alicante II', value: '3' },
      { text: 'Almería', value: '4' },
      { text: 'Cordoba', value: '5' }
    ])

    const selectedOptions = ref([{ text: '->', value: '0' }])

    const onSelect = () => {
      selectedOptions.value = selectedOptions.value.map((option) => {
        return { ...option, text: option.text.substring(0, 4) + ' ' }
      })
    }

    const selectedInterpretacion1Short = computed(() => {
      return String(selectedInterpretacion1.value).substring(0, 4)
    })
    const selectedInterpretacion2Short = computed(() => {
      return String(selectedInterpretacion2.value).substring(0, 4)
    })
    const selectedInterpretacion3Short = computed(() => {
      return String(selectedInterpretacion3.value).substring(0, 4)
    })

    return {
      images,
      options,
      selectedOptions,
      onSelect,
      showSubmenu,
      selectedOption1,
      selectedOption2,
      selectedOption3,
      selectedOption4,
      selectedOption5,
      //   selectedOption6,
      selectedSede,
      showDatePicker,
      selectedDate,
      optionsNaturaleza,
      tipoOrgano,
      optionsConservacion,
      options4,
      options5,
      //  tipoEstudio,
      selectedEstadoInforme,
      optionsEstadoInforme,
      getColor,
      sede,
      selectedOptionsText,
      selectedInterpretacion1,
      interp1,
      selectedInterpretacion1Short,
      selectedInterpretacion2,
      selectedInterpretacion2Short,
      selectedInterpretacion3,
      selectedInterpretacion3Short,
      checkSelection,
      checkSelection2,
      showModal,
      checkInterpretacion1,
      cajaTxt,
      checkCajaTxtBeforeNext,
      print,
      showOrgansType
    }
  }
})
</script>

<style>
.select-input-interp2 {
  width: 200px;
  padding: 4px;
  border: 1px solid #004676;
  background-color: #dee5ed;
  color: #004676;
  font-weight: bold;
  font-size: 14px;
}

.select-input {
  width: 200px;
  padding: 4px;
  border: 1px solid #004676;
  background-color: #dee5ed;
  color: #004676;
  font-weight: bold;
  font-size: 14px;
}
.select-input-estado-informe{
  width: 200px;
  padding: 4px;
  border: 1px solid #004676;
  background-color: #dee5ed;
  color: #004676;
  font-weight: bold;
  font-size: 14px;
}

.select-input-sede {
  width: 200px;
  height: 26px;

  background-color: #dee5ed;
  color: #004676;
  font-weight: bold;
}

.select-input-sede:hover {
  background-color: #f5f5f5;
}

.select-input-sede .option--highlight {
  background-color: #004676 !important;
  color: #ffffff !important;
}

@media print {
  body .select-input {
    width: 650px;
  }
  .filter-text,
  .muestra,
  .muestra-interp3,
  .select-input-interp2,
  .int2,
  .muestra-organo,  
  .tipo-muestra-tt-descrip {
    display: none !important;
  }  
  
  .select-input {
  position: relative;
  width: auto !important;
  }

 
  .page {
    page-break-inside: avoid;
    margin-bottom: 50px;
    height: 10cm;
  }
  .main-container {
    visibility: hidden;
    position: relative;
  }
 
  .imprimir {
    display: none !important;
  }
  .elemento-con-scrollbar {
    overflow: hidden !important;
  }

  .caja-txt2{
    position: relative;
    top: -200px;
    height: 310px !important;
    max-height: none !important;
  }
  .conten-gris {
    position: relative;
    top: -150px; /* Ajusta este valor según tus necesidades */
    left: -50px;
    height: 2000px;
  }
  .conten-gris * {
    visibility: visible;    
  }
  .profesor-imag-V {
    position: relative;
    padding-top: 100px;
    top: -200px; /* Ajusta este valor según tus necesidades */   
    left: 100px;
    height: 700px;
  }
  .imagenes-de-la-muestra {
    position: relative;
    top: 100px; /* Ajusta este valor según tus necesidades */
    left: 0px;
    height: 20px;
  }
  .profesor{
    position: relative;
    top: 100px; /* Ajusta este valor según tus necesidades */
    left: 50px;
    height: 700px;
  }
  .container {
    position:relative;
    top: 100px; /* Ajusta este valor según tus necesidades */
    left: 0px;
    height: 800px;
    max-height: none !important;
    overflow: hidden !important;
  }
  .tipo-muestra-tt-descrip {
    position: relative;
    top: 100px; /* Ajusta este valor según tus necesidades */
    left: 170px;
    height: 40px;
    max-height: none !important;
    overflow: hidden !important;
  }


body .contenedor-txt-consulta .muestra{
    display: block !important;
    width: 50%;
    position: relative;
  }
  .muestra{
  width: 60px;
  position: relative;
}

.nat{
  width:  200px;
  height: 20px;
  margin-top: 0px;
  margin-bottom: 6px;


}


}

.imprimir {
  width: 150px;
  height: 32px;
  background-color: #004676;
  color: #ffffff;
  border: 0px;
  border-radius: 6px;
  margin-top: 20px;
  margin-left: 20px;
  margin-right: 20px;
  margin-bottom: 10px;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.6);
}

.caja-txt2 {
  width: 100%;
  height: 260px;
  margin-top: 20px;
  margin-bottom: 30px;
  border: 1px solid #004676;
  background-color: #dee5ed;
  max-height: 156px;
  overflow-y: auto;
  scrollbar-color: #406985 #f1f1f1;
}

.select-input-organo {
  width: 200px;
  height: 26px;
  border: 1px solid #004676;
  background-color: #dee5ed;
  color: #004676;
  font-weight: bold;
}


.select-input-organo:hover {
  background-color: #f5f5f5;
}

.select-input-organo .option--highlight {
  background-color: #004676 !important;
  color: #ffffff !important;
}

.tip-org {
  width: 165px;
}

.btn-siguiente {
  display: flex;
  justify-content: center;
  margin-top: -20px;
  margin-left: 20px;
  margin-right: 20px;
  margin-bottom: 20px;
}
.btn-siguientes {
  width: 175px;
  height: 32px;
  background-color: #004676;
  color: #ffffff;
  border: 0px;
  border-radius: 6px;
  margin-top: 20px;
  margin-left: 20px;
  margin-right: 20px;
  margin-bottom: 10px;
  box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.6);
}


.btn-siguientes:hover {
  background-color: #165c8c; /* Cambia el color de fondo al pasar el cursor por encima */
}

.btn-siguientes:active {
  background-color: #002244; /* Cambia el color de fondo al hacer clic */
}


.editar-muestra {
  display: flex;
  justify-content: space-between;
  margin-bottom: 50px;
  padding-bottom: 100px;
}
.muestra-organo {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 50px;
  padding-bottom: 100px;
}
.texto-descrip {
  margin-top: 20px;
  padding-left: 16px;
}
.linea {
  display: flex;
  justify-content: center; /* Alinea los elementos horizontalmente en el centro */
  align-items: center; /* Alinea los elementos verticalmente en el centro */
  margin-top: -20px;
  margin-bottom: 30px;
}
.select-input-interpBuscar {
  width: 450px;
  border: 1px solid #004676;
  background-color: #dee5ed;
  color: #004676;
  max-height: 300px;
  overflow-y: auto;
  position: fixed;
  z-index: 1;
}
.contenedor-interpretaciones {
  display: flex;
  justify-content: left;
  height: 70px;
}
.muestra-interp1 {
  display: flex;
  flex-direction: column;
  align-items: left;
  justify-content: space-between;
  margin-right: 50px;
  height: 50px;
}
.muestra-interp3 {
  display: flex;
  flex-direction: column;
  align-items: left;
  justify-content: space-between;
  margin-left: 50px;
  height: 50px;
}

</style>