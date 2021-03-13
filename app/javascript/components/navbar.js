import Typed from 'typed.js';

const loadDynamicNavbarText = () => {
  new Typed('#navbar-typed-text', {
    strings: ["Selamat Datang", "Silahkan memilih item yang tersedia"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicNavbarText };