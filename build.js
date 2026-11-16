// Menyalin pustaka ke www/vendor agar aplikasi tidak bergantung pada CDN (bisa dipakai offline di APK)
const fs = require('fs');
fs.mkdirSync('www/vendor', { recursive: true });
fs.copyFileSync('node_modules/@supabase/supabase-js/dist/umd/supabase.js', 'www/vendor/supabase.min.js');
fs.copyFileSync('node_modules/html2pdf.js/dist/html2pdf.bundle.min.js', 'www/vendor/html2pdf.bundle.min.js');
console.log('vendor siap');
