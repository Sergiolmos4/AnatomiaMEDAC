// src/auth.js
import { ref } from 'vue';

const isAuthenticated = ref(false);
const username = ref({});

const login = (user) => {
  isAuthenticated.value = true;
  username.value = user;
};

const logout = () => {
  isAuthenticated.value = false;
  username.value = '';
  localStorage.removeItem('access_token');
  localStorage.removeItem('refresh_token');
};

export { isAuthenticated, username, login, logout };