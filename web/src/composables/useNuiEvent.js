import { onMounted, onUnmounted } from 'vue'

export const useNuiEvent = (action, handler) => {
  const eventListener = (event) => {
    const { data } = event
    if (data.type === action) {
      handler(data)
    }
  }

  onMounted(() => window.addEventListener('message', eventListener))
  onUnmounted(() => window.removeEventListener('message', eventListener))

  return eventListener
}
