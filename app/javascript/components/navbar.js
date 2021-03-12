import Typed from 'typed.js';

const loadDynamicNavbarText = () => {
  new Typed('#navbar-typed-text', {
    strings: ["Selamat Datang", "Silahkan memilih barang yang ada"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicNavbarText };