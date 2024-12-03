<template>
    <div v-show="visible" class="app">
      <div class="content">
        <h1>{{ message }}</h1>
        <div class="buttons">
          <button @click="closeUI">Close UI</button>
          <button @click="exitGame">Exit Game</button>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted, onUnmounted } from 'vue'
  import { useNuiEvent } from './composables/useNuiEvent'
  
  const message = ref('FiveM Vue Template')
  const visible = ref(false)

  useNuiEvent('ui', (data) => {
    visible.value = data.status
  })
  
  const closeUI = () => {
    fetch(`https://${GetParentResourceName()}/closeUI`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({})
    })
  }
  
  const exitGame = () => {
    fetch(`https://${GetParentResourceName()}/exitGame`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({})
    })
  }
  
  // Key binding for escape key
  const handleKeyup = (e) => {
    if (e.key === 'Escape') {
      closeUI()
    }
  }
  
  onMounted(() => {
    window.addEventListener('keyup', handleKeyup)
  })
  
  onUnmounted(() => {
    window.removeEventListener('keyup', handleKeyup)
  })
  </script>
  
  <style lang="scss">
  $primary-color: #3498db;
  $background-color: rgba(0, 0, 0, 0.8);
  $text-color: #ffffff;
  
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
  }
  
  .app {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: $background-color;
    font-family: Arial, sans-serif;
  
    .content {
      background-color: rgba(255, 255, 255, 0.1);
      padding: 2rem;
      border-radius: 8px;
      text-align: center;
  
      h1 {
        color: $text-color;
        margin-bottom: 1.5rem;
      }
  
      .buttons {
        display: flex;
        gap: 1rem;
        justify-content: center;
  
        button {
          padding: 0.5rem 1rem;
          background-color: $primary-color;
          border: none;
          border-radius: 4px;
          color: white;
          cursor: pointer;
          transition: opacity 0.2s;
  
          &:hover {
            opacity: 0.8;
          }
        }
      }
    }
  }
  </style>