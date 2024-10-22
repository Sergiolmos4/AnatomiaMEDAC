import { ref, computed } from 'vue'
import { defineStore } from 'pinia'

export const useCounterStore = defineStore('counter', () => {
  const count = ref(0)
  const doubleCount = computed(() => count.value * 2)
  const img = ref(null) // almacenar url
  const images = ref([]) // almacena imgs
  const formData = ref({}) //  info de formData 

  function increment() {
    count.value++
  }

  function setFormData(data) {
    formData.value = data
  }

  function addImage(image) {
    images.value.push(image)
  }

  return { count, doubleCount, increment, img, formData, setFormData, images, addImage }
})